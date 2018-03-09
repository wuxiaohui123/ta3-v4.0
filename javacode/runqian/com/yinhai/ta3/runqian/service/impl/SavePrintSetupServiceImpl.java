package com.yinhai.ta3.runqian.service.impl;

import java.util.List;

import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.service.BaseService;
import com.yinhai.ta3.runqian.domain.ReportPrintSetUp;
import com.yinhai.ta3.runqian.service.SavePrintSetupService;

public class SavePrintSetupServiceImpl extends BaseService implements SavePrintSetupService {

	SimpleDao hibernateDao;

	public SimpleDao getHibernateDao() {
		return hibernateDao;
	}

	public void setHibernateDao(SimpleDao hibernateDao) {
		this.hibernateDao = hibernateDao;
	}

	public String getPrintSetup(String id) throws Exception {
		List list = hibernateDao.createQuery("select r.setupvalue from ReportPrintSetUp r where r.setupid=?", new Object[] { id }).list();
		if ((null != list) && (list.size() > 0)) {
			String value = (String) list.get(0);
			return value;
		}
		return null;
	}

	public String savePrintSetup(String id, String value) throws Exception {
		List list = hibernateDao.createQuery("select r.setupvalue from ReportPrintSetUp r where r.setupid=?", new Object[] { id }).list();
		if ((null != list) && (list.size() > 0)) {
			ReportPrintSetUp r = new ReportPrintSetUp();
			r.setSetupid(id);
			r.setSetupvalue(value);
			hibernateDao.update(r);
		} else {
			ReportPrintSetUp r = new ReportPrintSetUp();
			r.setSetupid(id);
			r.setSetupvalue(value);
			hibernateDao.save(r);
		}
		return null;
	}
}
