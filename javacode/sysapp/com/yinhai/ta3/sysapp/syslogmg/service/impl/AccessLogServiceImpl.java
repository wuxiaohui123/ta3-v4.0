package com.yinhai.ta3.sysapp.syslogmg.service.impl;

import java.util.Date;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import org.hibernate.Query;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;

import com.yinhai.sysframework.config.SysConfig;
import com.yinhai.sysframework.dao.hibernate.Finder;
import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.iorg.IPosition;
import com.yinhai.sysframework.iorg.IUser;
import com.yinhai.sysframework.log.IAccessLogService;
import com.yinhai.sysframework.menu.IMenu;
import com.yinhai.sysframework.persistence.PageBean;
import com.yinhai.sysframework.service.WsBaseService;
import com.yinhai.sysframework.time.ITimeService;
import com.yinhai.sysframework.util.ValidateUtil;
import com.yinhai.ta3.sysapp.syslogmg.domain.AccessLog;
import com.yinhai.ta3.sysapp.syslogmg.domain.AccessLogVO;
import com.yinhai.ta3.system.org.domain.Org;
import com.yinhai.ta3.system.org.domain.Position;
import com.yinhai.ta3.system.org.domain.User;
import com.yinhai.ta3.system.sysapp.dao.MenuDao;
import com.yinhai.ta3.system.sysapp.domain.Menu;

@WebService
public class AccessLogServiceImpl extends WsBaseService implements IAccessLogService {

	private static final String collectionName = "accessLog";

	private SimpleDao hibernateDao;
	private MongoTemplate mongoTemplate;
	private MenuDao menuDao;
	private ITimeService timeService;

	@WebMethod(exclude = true)
	public void setTimeService(ITimeService timeService) {
		this.timeService = timeService;
	}

	@WebMethod(exclude = true)
	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	@WebMethod(exclude = true)
	public void setHibernateDao(SimpleDao hibernateDao) {
		this.hibernateDao = hibernateDao;
	}

	@WebMethod(exclude = true)
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	public void saveAccessInfo(Long userId, Long positionId, Long menuid, String url, String ispermission) {
		if (SysConfig.getSysconfigToBoolean("isMongo", true)) {
			AccessLogVO accessLog = new AccessLogVO();
			accessLog.setUserid(userId);
			String userHql = "from " + super.getEntityClassName(User.class.getName()) + " u where u.userid = ?";
			IUser user = (IUser) hibernateDao.createQuery(userHql, userId).uniqueResult();
			accessLog.setName(user.getName());
			accessLog.setPositionid(positionId);
			String positionHql = "from " + super.getEntityClassName(Position.class.getName())
					+ " p where p.positionid = ?";
			IPosition position = (IPosition) hibernateDao.createQuery(positionHql, positionId).uniqueResult();
			accessLog.setPositionnamepath(position.getOrgnamepath() + "/" + position.getPositionname());
			accessLog.setIspermission(ispermission);
			if (menuid == null) {
				IMenu m = menuDao.getMenuByUrl(url);
				if (ValidateUtil.isEmpty(m)) {
					accessLog.setPermissionid(Long.valueOf(-1L));
					accessLog.setMenunamepath("");
				} else {
					accessLog.setPermissionid(m.getMenuid());
					accessLog.setMenunamepath(m.getMenunamepath());
				}
			} else {
				accessLog.setPermissionid(menuid);
				IMenu m = menuDao.getMenu(menuid);
				accessLog.setMenunamepath(m.getMenunamepath());
			}
			accessLog.setAccesstime(timeService.getSysTimestamp());
			accessLog.setSysflag(SysConfig.getSysConfig("curSyspathId", "sysmg"));
			mongoTemplate.save(accessLog, collectionName);
		} else {
			AccessLog accessLog = new AccessLog();
			accessLog.setUserid(userId);
			accessLog.setPositionid(positionId);
			if (menuid == null) {
				IMenu m = menuDao.getMenuByUrl(url);
				if (ValidateUtil.isEmpty(m)) {
					accessLog.setPermissionid(Long.valueOf(-1L));
				} else {
					accessLog.setPermissionid(m.getMenuid());
				}
			} else {
				accessLog.setPermissionid(menuid);
			}
			accessLog.setUrl(url);
			accessLog.setIspermission(ispermission);
			accessLog.setAccesstime(timeService.getSysTimestamp());
			accessLog.setSysflag(SysConfig.getSysConfig("curSyspathId", "sysmg"));
			hibernateDao.save(accessLog);
		}
	}

	public PageBean queryAccessInfo(Date startDate, Date endDate, Integer start, Integer limit, Long curUser,
			Long positionid) {
		PageBean pb = new PageBean();
		pb.setGridId("accessGrid");
		Integer skipResults = Integer.valueOf(start == null ? 0 : start.intValue());
		Integer maxResults = Integer.valueOf(limit == null ? 0 : limit.intValue());
		pb.setStart(skipResults);
		pb.setLimit(maxResults);
		Query query = null;
		Query queryCount = null;
		StringBuffer hql = new StringBuffer();
		StringBuffer hql1 = new StringBuffer();
		String ispermission = "1";
		hql1.append("select al.logid from AccessLog al,").append(super.getEntityClassName(User.class.getName()))
				.append(" u,").append(super.getEntityClassName(Position.class.getName())).append(" p,")
				.append(super.getEntityClassName(Menu.class.getName())).append(" m");

		if (!IUser.ROOT_USERID.equals(curUser)) {
			hql1.append(" where 1=1 and p.taorg.orgid in(").append("select om.id.orgid from ")
					.append(super.getEntityClassName(Org.class.getName()))
					.append(" o,OrgMg om where om.id.positionid=" + positionid + ")");
		} else {
			hql1.append(" where 1=1");
		}
		hql1.append(" and al.ispermission=" + ispermission
				+ " and al.userid=u.userid and al.positionid=p.positionid and al.permissionid=m.menuid ");
		hql.append(
				"select new com.yinhai.ta3.sysapp.syslogmg.domain.AccessLogVO(u.userid,u.name,p.positionid,p.orgnamepath||'/'||p.positionname,al.permissionid,m.menunamepath,al.ispermission,al.accesstime,al.url,al.sysflag) from AccessLog al,")
				.append(super.getEntityClassName(User.class.getName())).append(" u,")
				.append(super.getEntityClassName(Position.class.getName())).append(" p,")
				.append(super.getEntityClassName(Menu.class.getName())).append(" m");

		if (!IUser.ROOT_USERID.equals(curUser)) {
			hql.append(" where 1=1 and p.taorg.orgid in(").append("select om.id.orgid from ")
					.append(super.getEntityClassName(Org.class.getName()))
					.append(" o,OrgMg om where om.id.positionid=" + positionid + ")");
		} else {
			hql.append(" where 1=1");
		}
		hql.append(" and al.ispermission=" + ispermission
				+ " and al.userid=u.userid and al.positionid=p.positionid and al.permissionid=m.menuid ");
		if (!ValidateUtil.isEmpty(startDate) && !ValidateUtil.isEmpty(endDate)) {
			hql.append(" and al.accesstime between :startDate and :endDate order by al.sysflag,al.userid desc");
			hql1.append(" and al.accesstime between :startDate and :endDate");
			query = hibernateDao.createQuery(hql.toString(), new Object[0]).setFirstResult(skipResults.intValue())
					.setMaxResults(maxResults.intValue());
			Finder finder = Finder.create(hql1.toString());
			String countHql = finder.getRowCountHql();
			queryCount = hibernateDao.createQuery(countHql, new Object[0]);
			query.setDate("startDate", startDate);
			query.setDate("endDate", endDate);
			queryCount.setDate("startDate", startDate);
			queryCount.setDate("endDate", endDate);
			Long total = (Long) queryCount.uniqueResult();
			pb.setTotal(Integer.valueOf(total.intValue()));
			List list = query.list();
			pb.setList(list);
			pb.setStart(skipResults);
			pb.setLimit(maxResults);
			return pb;
		}
		if (ValidateUtil.isEmpty(startDate) && !ValidateUtil.isEmpty(endDate)) {
			hql.append(" and al.accesstime <=:endDate order by al.sysflag,al.userid desc");
			hql1.append(" and al.accesstime <=:endDate");
			query = hibernateDao.createQuery(hql.toString(), new Object[0]).setFirstResult(skipResults.intValue())
					.setMaxResults(maxResults.intValue());
			Finder finder = Finder.create(hql1.toString());
			String countHql = finder.getRowCountHql();
			queryCount = hibernateDao.createQuery(countHql, new Object[0]);
			query.setDate("endDate", endDate);
			queryCount.setDate("endDate", endDate);
			Long total = (Long) queryCount.uniqueResult();
			pb.setTotal(Integer.valueOf(total.intValue()));
			List list = query.list();
			pb.setList(list);
			pb.setStart(skipResults);
			pb.setLimit(maxResults);
			return pb;
		}
		if (!ValidateUtil.isEmpty(startDate) && ValidateUtil.isEmpty(endDate)) {
			hql.append(" and al.accesstime >=:startDate order by al.sysflag,al.userid desc");
			hql1.append(" and al.accesstime >=:startDate");
			query = hibernateDao.createQuery(hql.toString(), new Object[0]).setFirstResult(skipResults.intValue())
					.setMaxResults(maxResults.intValue());
			Finder finder = Finder.create(hql1.toString());
			String countHql = finder.getRowCountHql();
			queryCount = hibernateDao.createQuery(countHql, new Object[0]);
			query.setDate("startDate", startDate);
			queryCount.setDate("startDate", startDate);
			Long total = (Long) queryCount.uniqueResult();
			pb.setTotal(Integer.valueOf(total.intValue()));
			List list = query.list();
			pb.setList(list);
			pb.setStart(skipResults);
			pb.setLimit(maxResults);
			return pb;
		}
		hql.append(" order by al.sysflag,al.userid desc");
		query = hibernateDao.createQuery(hql.toString(), new Object[0]).setFirstResult(skipResults.intValue())
				.setMaxResults(maxResults.intValue());
		Finder finder = Finder.create(hql1.toString());
		String countHql = finder.getRowCountHql();
		queryCount = hibernateDao.createQuery(countHql, new Object[0]);
		Long total = (Long) queryCount.uniqueResult();
		pb.setTotal(Integer.valueOf(total.intValue()));
		List list = query.list();
		pb.setList(list);
		pb.setStart(skipResults);
		pb.setLimit(maxResults);
		return pb;
	}

	public PageBean queryAccessInfoByMongo(Date startDate, Date endDate, Integer start, Integer limit, Long curUser,
			Long positionid) {
		PageBean pb = new PageBean();
		pb.setGridId("accessGrid");
		Integer skipResults = Integer.valueOf(start == null ? 0 : start.intValue());
		Integer maxResults = Integer.valueOf(limit == null ? 0 : limit.intValue());
		pb.setStart(skipResults);
		pb.setLimit(maxResults);
		org.springframework.data.mongodb.core.query.Query query = new org.springframework.data.mongodb.core.query.Query();
		if (!ValidateUtil.isEmpty(startDate) && !ValidateUtil.isEmpty(endDate)) {
			query.addCriteria(new Criteria("accesstime").gte(startDate));
			query.addCriteria(new Criteria("accesstime").lte(endDate));
			Long total = mongoTemplate.count(query, AccessLogVO.class, collectionName);
			query.with(new Sort(Direction.ASC, "sysflag"));
			query.with(new Sort(Direction.DESC, "userid"));
			query.skip(start).limit(limit);
			List<AccessLogVO> list = mongoTemplate.find(query, AccessLogVO.class, collectionName);
			pb.setList(list);
			pb.setStart(skipResults);
			pb.setLimit(maxResults);
			pb.setTotal(total.intValue());
			return pb;
		}
		if (ValidateUtil.isEmpty(startDate) && !ValidateUtil.isEmpty(endDate)) {
			query.addCriteria(new Criteria("accesstime").lte(endDate));
			Long total = mongoTemplate.count(query, AccessLogVO.class, collectionName);
			query.with(new Sort(Direction.ASC, "sysflag"));
			query.with(new Sort(Direction.DESC, "userid"));
			query.skip(start).limit(limit);
			List<AccessLogVO> list = mongoTemplate.find(query, AccessLogVO.class, collectionName);
			pb.setList(list);
			pb.setStart(skipResults);
			pb.setLimit(maxResults);
			pb.setTotal(total.intValue());
			return pb;
		}
		if (!ValidateUtil.isEmpty(startDate) && ValidateUtil.isEmpty(endDate)) {
			query.addCriteria(new Criteria("accesstime").gte(startDate));
			Long total = mongoTemplate.count(query, AccessLogVO.class, collectionName);
			query.with(new Sort(Direction.ASC, "sysflag"));
			query.with(new Sort(Direction.DESC, "userid"));
			query.skip(start).limit(limit);
			List<AccessLogVO> list = mongoTemplate.find(query, AccessLogVO.class, collectionName);
			pb.setList(list);
			pb.setStart(skipResults);
			pb.setLimit(maxResults);
			pb.setTotal(total.intValue());
			return pb;
		}
		query.with(new Sort(Direction.ASC, "sysflag"));
		query.with(new Sort(Direction.DESC, "userid"));
		query.skip(start).limit(limit);
		Long total = mongoTemplate.count(query, AccessLogVO.class, collectionName);
		List<AccessLogVO> list = mongoTemplate.find(query, AccessLogVO.class, collectionName);
		pb.setList(list);
		pb.setTotal(total.intValue());
		return pb;
	}
}
