package com.yinhai.ta3.sysapp.syslogmg.dao.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import org.hibernate.Query;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;

import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.log.Taserverexceptionlog;
import com.yinhai.sysframework.persistence.PageBean;
import com.yinhai.sysframework.util.ValidateUtil;
import com.yinhai.ta3.sysapp.syslogmg.dao.ServerExceptionLogDao;

@WebService
public class ServerExceptionLogDaoImpl implements ServerExceptionLogDao {

	private SimpleDao dao;
	
	private MongoTemplate mongoTemplate;

	@WebMethod(exclude = true)
	public SimpleDao getDao() {
		return dao;
	}

	@WebMethod(exclude = true)
	public void setDao(SimpleDao dao) {
		this.dao = dao;
	}
	
	@WebMethod(exclude = true)
	public MongoTemplate getMongoTemplate() {
		return mongoTemplate;
	}
	
	@WebMethod(exclude = true)
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	public void insert(Taserverexceptionlog log) {
		dao.save(log);
	}

	@WebMethod(exclude = true)
	public List<Taserverexceptionlog> getList(Timestamp begin, Timestamp end) {
		List<Timestamp> params = new LinkedList<Timestamp>();
		StringBuffer hql = new StringBuffer("from Taserverexceptionlog t where 1=1 ");
		if (!ValidateUtil.isEmpty(begin)) {
			hql.append(" and t.time >= ?");
			params.add(begin);
		}
		if (!ValidateUtil.isEmpty(end)) {
			hql.append(" and t.time <= ?");
			params.add(end);
		}
		hql.append(" order by t.time desc");
		Query query = dao.getSession().createQuery(hql.toString());
		if (!ValidateUtil.isEmpty(params)) {
			for (int i = 0; i < params.size(); i++) {
				query.setTimestamp(i, (Date) params.get(i));
			}
		}
		return query.list();
	}

	@WebMethod(exclude = true)
	public PageBean getPage(String gridId, Timestamp begin, Timestamp end, int start, int limit) {
		List<Timestamp> params = new LinkedList<Timestamp>();
		StringBuffer hql = new StringBuffer("from Taserverexceptionlog t where 1=1 ");
		if (!ValidateUtil.isEmpty(begin)) {
			hql.append(" and t.time >= ?");
			params.add(begin);
		}
		if (!ValidateUtil.isEmpty(end)) {
			hql.append(" and t.time <= ?");
			params.add(end);
		}
		hql.append(" order by t.time desc");
		Query query = dao.getSession().createQuery(hql.toString());
		if (!ValidateUtil.isEmpty(params)) {
			for (int i = 0; i < params.size(); i++) {
				query.setTimestamp(i, (Date) params.get(i));
			}
		}

		String countHql = "select count(t.id)" + hql.toString();
		Query countQuery = dao.getSession().createQuery(countHql);
		if (!ValidateUtil.isEmpty(params)) {
			for (int i = 0; i < params.size(); i++) {
				countQuery.setTimestamp(i, (Date) params.get(i));
			}
		}

		query.setFirstResult(start).setMaxResults(limit);
		PageBean pg = new PageBean();
		pg.setGridId(gridId);
		pg.setLimit(Integer.valueOf(limit));
		pg.setStart(Integer.valueOf(start));
		pg.setList(query.list());
		pg.setTotal(Integer.valueOf(((Long) countQuery.uniqueResult()).intValue()));
		return pg;
	}

	@WebMethod(exclude = true)
	public PageBean getPageByCount(String gridId, Timestamp begin, Timestamp end, int start, int limit) {
		List<Timestamp> params = new LinkedList<Timestamp>();
		StringBuffer hql = new StringBuffer("from Taserverexceptionlog t where 1=1 ");
		if (!ValidateUtil.isEmpty(begin)) {
			hql.append(" and t.time >= ?");
			params.add(begin);
		}
		if (!ValidateUtil.isEmpty(end)) {
			hql.append(" and t.time <= ?");
			params.add(end);
		}
		hql.append(" order by t.time desc");
		Query query = dao.getSession().createQuery(hql.toString());
		if (!ValidateUtil.isEmpty(params)) {
			for (int i = 0; i < params.size(); i++) {
				query.setTimestamp(i, (Date) params.get(i));
			}
		}
		query.setFirstResult(start).setMaxResults(limit);
		PageBean pg = new PageBean();
		pg.setGridId(gridId);
		pg.setLimit(Integer.valueOf(limit));
		pg.setStart(Integer.valueOf(start));
		pg.setList(query.list());
		return pg;
	}

	@WebMethod(exclude = true)
	public Taserverexceptionlog getTaserverexceptionlog(String id) {
		String hql = "from Taserverexceptionlog where id = ?";

		return (Taserverexceptionlog) dao.findUnique(hql, new Object[] { id });
	}

	@WebMethod(exclude = true)
	public void delete(String id) {
		dao.delete(getTaserverexceptionlog(id));
	}

	@WebMethod(exclude = true)
	public void insertMongo(Taserverexceptionlog taserverexceptionlog) {
		mongoTemplate.save(taserverexceptionlog);
	}

	@WebMethod(exclude = true)
	public List<Taserverexceptionlog> getListByMongo(Timestamp begin, Timestamp end) {
		org.springframework.data.mongodb.core.query.Query query = new org.springframework.data.mongodb.core.query.Query();
		if (!ValidateUtil.isEmpty(begin)) {
			query.addCriteria(new Criteria("time").gte(begin));
		}
		if (!ValidateUtil.isEmpty(end)) {
			query.addCriteria(new Criteria("time").lte(end));	
		}
		return mongoTemplate.find(query, Taserverexceptionlog.class);
	}

	@WebMethod(exclude = true)
	public Taserverexceptionlog getTaserverexceptionlogByMongo(String id) {
		org.springframework.data.mongodb.core.query.Query query = new org.springframework.data.mongodb.core.query.Query();
		query.addCriteria(new Criteria("id").is(id));
		return mongoTemplate.findOne(query, Taserverexceptionlog.class);
	}

	@WebMethod(exclude = true)
	public void deleteByMongo(String id) {
		mongoTemplate.remove(getTaserverexceptionlogByMongo(id));
	}

	@WebMethod(exclude = true)
	public PageBean getPageByMongo(String gridId, Timestamp begin, Timestamp end, int start, int limit) {
		org.springframework.data.mongodb.core.query.Query query = new org.springframework.data.mongodb.core.query.Query();
		if (!ValidateUtil.isEmpty(begin)) {
			query.addCriteria(new Criteria("time").gte(begin));
		}
		if (!ValidateUtil.isEmpty(end)) {
			query.addCriteria(new Criteria("time").lte(end));	
		}
		query.with(new Sort(Direction.DESC, "time"));
		Long total = mongoTemplate.count(query, Taserverexceptionlog.class);
		query.skip(start).limit(limit);
		PageBean pg = new PageBean();
		pg.setGridId(gridId);
		pg.setLimit(Integer.valueOf(limit));
		pg.setStart(Integer.valueOf(start));
		pg.setList(mongoTemplate.find(query, Taserverexceptionlog.class));
		pg.setTotal(total.intValue());
		return pg;
	}

	@WebMethod(exclude = true)
	public PageBean getPageByCountByMongo(String gridId, Timestamp begin, Timestamp end, int start, int limit) {
		org.springframework.data.mongodb.core.query.Query query = new org.springframework.data.mongodb.core.query.Query();
		if (!ValidateUtil.isEmpty(begin)) {
			query.addCriteria(new Criteria("time").gte(begin));
		}
		if (!ValidateUtil.isEmpty(end)) {
			query.addCriteria(new Criteria("time").lte(end));	
		}
		query.with(new Sort(Direction.DESC, "time"));

		query.skip(start).limit(limit);
		PageBean pg = new PageBean();
		pg.setGridId(gridId);
		pg.setLimit(Integer.valueOf(limit));
		pg.setStart(Integer.valueOf(start));
		pg.setList(mongoTemplate.find(query, Taserverexceptionlog.class));
		return pg;
	}
}
