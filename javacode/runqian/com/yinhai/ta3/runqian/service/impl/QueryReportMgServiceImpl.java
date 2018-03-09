package com.yinhai.ta3.runqian.service.impl;

import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.cache.ehcache.CacheUtil;
import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.service.BaseService;
import com.yinhai.ta3.runqian.domain.ReportMenuReference;
import com.yinhai.ta3.runqian.domain.ReportResource;
import com.yinhai.ta3.runqian.service.QueryReportMgService;
import com.yinhai.ta3.sysapp.menumg.service.IMenuMgService;
import com.yinhai.ta3.system.sysapp.domain.Menu;

public class QueryReportMgServiceImpl extends BaseService implements QueryReportMgService {

	private IMenuMgService menuMgService;
	private SimpleDao hibernateDao;

	public IMenuMgService getMenuMgService() {
		return menuMgService;
	}

	public void setMenuMgService(IMenuMgService menuMgService) {
		this.menuMgService = menuMgService;
	}

	public SimpleDao getHibernateDao() {
		return hibernateDao;
	}

	public void setHibernateDao(SimpleDao hibernateDao) {
		this.hibernateDao = hibernateDao;
	}

	public void insertMenuBB(List bbList, ParamDTO dto) throws Exception {
		dto.put("url", "runqian/queryReportAction.do");
		Menu menu = menuMgService.createMenu(dto);
		for (int i = 0; i < bbList.size(); i++) {
			ReportMenuReference rm = new ReportMenuReference();
			ReportResource rr = new ReportResource();
			Map m = (Map) bbList.get(i);
			rr.setRaqfilename(m.get("raqfilename").toString());
			rm.setReportResource(rr);
			rm.setMenuid(menu.getMenuid());
			if ("1".equals(m.get("raqtype").toString())) {
				String limited = m.get("limited") == null ? "" : m.get("limited").toString();
				String scaleexp = m.get("scaleexp") == null ? "" : m.get("scaleexp").toString();
				if ((null != limited) && (!"".equals(limited))) {
					rm.setLimited(Double.valueOf(Double.parseDouble(limited)));
				}
				if ((null != scaleexp) && (!"".equals(scaleexp))) {
					rm.setScaleexp(Double.valueOf(Double.parseDouble(scaleexp)));
				}
			}
			rm.setNeedprint(m.get("needprint") == null ? "0" : m.get("needprint").toString());
			rm.setNeedsaveasexcel(m.get("needsaveasexcel") == null ? "0" : m.get("needsaveasexcel").toString());
			rm.setNeedsaveasexcel2007(m.get("needsaveasexcel2007") == null ? "0" : m.get("needsaveasexcel2007").toString());
			rm.setNeedsaveaspdf(m.get("needsaveaspdf") == null ? "0" : m.get("needsaveaspdf").toString());
			rm.setNeedsaveastext(m.get("needsaveastext") == null ? "0" : m.get("needsaveastext").toString());
			rm.setNeedsaveasword(m.get("needsaveasword") == null ? "0" : m.get("needsaveasword").toString());
			hibernateDao.save(rm);
		}
	}

	public String updateMenuBB(List bbList, ParamDTO dto) throws Exception {
		menuMgService.updateMenu(dto);
		Long menuId = dto.getAsLong("menuid");
		hibernateDao.createQuery("delete from ReportMenuReference r where r.menuid=?", new Object[] { menuId }).executeUpdate();
		for (int i = 0; i < bbList.size(); i++) {
			ReportMenuReference rm = new ReportMenuReference();
			ReportResource rr = new ReportResource();
			Map m = (Map) bbList.get(i);
			rr.setRaqfilename(m.get("raqfilename").toString());
			rm.setReportResource(rr);
			rm.setMenuid(menuId);
			if ("1".equals(m.get("raqtype").toString())) {
				String limited = m.get("limited") == null ? "" : m.get("limited").toString();
				String scaleexp = m.get("scaleexp") == null ? "" : m.get("scaleexp").toString();
				if ((null != limited) && (!"".equals(limited))) {
					rm.setLimited(Double.valueOf(Double.parseDouble(limited)));
				}
				if ((null != scaleexp) && (!"".equals(scaleexp))) {
					rm.setScaleexp(Double.valueOf(Double.parseDouble(scaleexp)));
				}
			}
			rm.setNeedprint(m.get("needprint") == null ? "0" : m.get("needprint").toString());
			rm.setNeedsaveasexcel(m.get("needsaveasexcel") == null ? "0" : m.get("needsaveasexcel").toString());
			rm.setNeedsaveasexcel2007(m.get("needsaveasexcel2007") == null ? "0" : m.get("needsaveasexcel2007").toString());
			rm.setNeedsaveaspdf(m.get("needsaveaspdf") == null ? "0" : m.get("needsaveaspdf").toString());
			rm.setNeedsaveastext(m.get("needsaveastext") == null ? "0" : m.get("needsaveastext").toString());
			rm.setNeedsaveasword(m.get("needsaveasword") == null ? "0" : m.get("needsaveasword").toString());
			hibernateDao.save(rm);
			List l = hibernateDao.createQuery("select r.reportResource.raqfilename from ReportMenuReference r where r.menuid=?",
					new Object[] { menuId }).list();
			if ((null != l) && (l.size() > 0)) {
				String raqfilename = null;
				for (int j = 0; j < l.size(); j++) {
					raqfilename = l.get(j).toString();
					CacheUtil.cacheElementRemove("menuReportCache", raqfilename + "." + menuId + "." + dto.getAsString("yab109"));
				}
			}
		}
		return null;
	}

	public void delete(String menuId, ParamDTO dto) throws Exception {
		hibernateDao.createQuery("delete from ReportMenuReference r where r.menuid=?", new Object[] { Long.valueOf(menuId) }).executeUpdate();
		menuMgService.removeMenu(Long.valueOf(menuId), dto);
	}

	public List getPReportList() {
		List list = hibernateDao.createQuery("from ReportResource r where r.raqtype='0' order by r.uploadtime desc", new Object[0]).list();
		return list;
	}

	public List getMainReportList() {
		List list = hibernateDao.createQuery("from ReportResource r where r.raqtype='1' or r.raqtype='2' order by r.uploadtime desc", new Object[0])
				.list();
		return list;
	}

	public List getMenuReportList(String menuId) {
		List list = hibernateDao.createQuery(
				"select rm,rr from ReportMenuReference rm,ReportResource rr where rm.reportResource.raqfilename=rr.raqfilename and rm.menuid=?",
				new Object[] { Long.valueOf(menuId) }).list();
		return list;
	}
}
