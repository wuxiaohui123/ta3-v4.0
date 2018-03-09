package com.yinhai.ta3.runqian.service.impl;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.cache.annotation.Cacheable;

import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.util.ReportUtils;
import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.service.BaseService;
import com.yinhai.ta3.runqian.domain.ReportMenuReference;
import com.yinhai.ta3.runqian.domain.ReportResource;
import com.yinhai.ta3.runqian.service.ReportDefineService;

public class ReportDefineServiceImpl extends BaseService implements ReportDefineService {

	SimpleDao hibernateDao;

	public SimpleDao getHibernateDao() {
		return hibernateDao;
	}

	public void setHibernateDao(SimpleDao hibernateDao) {
		this.hibernateDao = hibernateDao;
	}

	@Cacheable(value = "menuReportCache")
	public Map getMenuReportInfo(String raqfilename, String menuId, String yab109) throws Exception {
		Map m = new HashMap();
		StringBuilder hql = new StringBuilder();
		hql.append(
				"select new com.yinhai.ta3.runqian.domain.ReportResource(r.raqtype,r.raqfile,r.raqname) from ReportResource r,ReportMenuReference rm ")
				.append("where ").append("r.raqfilename=rm.reportResource.raqfilename ").append("and r.raqfilename=? ").append("and r.orgid=? ")
				.append("and rm.menuid=?");

		List list = hibernateDao.createQuery(hql.toString(), new Object[] { raqfilename, yab109, Long.valueOf(menuId) }).list();
		if ((null == list) || (list.size() <= 0)) {
			list = hibernateDao.createQuery(hql.toString(), new Object[] { raqfilename, "com", Long.valueOf(menuId) }).list();
		}
		if ((null != list) && (list.size() > 0)) {
			List l = hibernateDao.createQuery("from ReportMenuReference rm where rm.reportResource.raqfilename=? and rm.menuid=?",
					new Object[] { raqfilename, Long.valueOf(menuId) }).list();
			ReportDefine rd = new ReportDefine();
			ReportResource r = (ReportResource) list.get(0);
			ReportMenuReference rm = (ReportMenuReference) l.get(0);
			String raqtype = r.getRaqtype();
			String raqname = r.getRaqname();
			byte[] b = (byte[]) r.getRaqfile();
			InputStream fin = new ByteArrayInputStream(b);
			rd = (ReportDefine) ReportUtils.read(fin);
			m.put("rd", rd);
			m.put("raqtype", raqtype);
			m.put("raqfilename", raqfilename);
			m.put("raqname", raqname);
			m.put("needsaveasexcel", rm.getNeedsaveasexcel());
			m.put("needsaveasexcel2007", rm.getNeedsaveasexcel2007());
			m.put("needsaveaspdf", rm.getNeedsaveaspdf());
			m.put("needsaveasword", rm.getNeedsaveasword());
			m.put("needsaveastext", rm.getNeedsaveastext());
			m.put("needprint", rm.getNeedprint());
			return m;
		}
		return null;
	}

	@Cacheable(value = "reportCache", keyGenerator = "com.yinhai.sysframework.cache.ehcache.ParamCacheKeyGenerator")
	public Map getReportInfo(String raqfilename) throws Exception {
		Map reportInfo = new HashMap();
		List list = hibernateDao
				.createQuery(
						"select new com.yinhai.ta3.runqian.domain.ReportResource(r.raqfilename,r.raqtype,r.raqfile) from ReportResource r where r.raqfilename=?",
						new Object[] { raqfilename }).list();
		ReportDefine rd = new ReportDefine();
		if ((null != list) && (list.size() > 0)) {
			ReportResource r = (ReportResource) list.get(0);
			byte[] b = (byte[]) r.getRaqfile();
			String raqtype = r.getRaqtype();
			InputStream fis = new ByteArrayInputStream(b);
			rd = (ReportDefine) ReportUtils.read(fis);
			reportInfo.put("raqfilename", raqfilename);
			reportInfo.put("raqname", raqfilename);
			reportInfo.put("raqtype", raqtype);
			reportInfo.put("rd", rd);
			return reportInfo;
		}
		return null;
	}

	@Cacheable(value = "childReportCache", keyGenerator = "com.yinhai.sysframework.cache.ehcache.ParamCacheKeyGenerator")
	public List getChildReportInfo(String raqfilename) throws Exception {
		List list = new ArrayList();
		List childs = hibernateDao.createQuery("select r.raqfile from ReportResource r where r.reportResource.raqfilename=?",
				new Object[] { raqfilename }).list();
		if ((childs != null) && (childs.size() > 0)) {
			for (int i = 0; i < childs.size(); i++) {
				Map child = new HashMap();
				byte[] b = (byte[]) childs.get(i);
				InputStream subFin = new ByteArrayInputStream(b);
				ReportDefine rd = (ReportDefine) ReportUtils.read(subFin);
				child.put("rd", rd);
				list.add(child);
			}
			return list;
		}
		return null;
	}
}
