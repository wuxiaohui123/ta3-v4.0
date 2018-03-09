package com.yinhai.ta3.runqian.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Query;

import com.yinhai.sysframework.cache.ehcache.CacheUtil;
import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.exception.AppException;
import com.yinhai.sysframework.service.BaseService;
import com.yinhai.sysframework.util.StringUtil;
import com.yinhai.sysframework.util.ValidateUtil;
import com.yinhai.ta3.runqian.domain.ReportResource;
import com.yinhai.ta3.runqian.service.RunQianReportFileMgService;

public class RunQianReportFileMgServiceImpl extends BaseService implements RunQianReportFileMgService {

	SimpleDao hibernateDao;

	public SimpleDao getHibernateDao() {
		return hibernateDao;
	}

	public void setHibernateDao(SimpleDao hibernateDao) {
		this.hibernateDao = hibernateDao;
	}

	public static byte[] InputStreamToByte(InputStream is) throws Exception {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int ch;
		while ((ch = is.read()) != -1) {
			baos.write(ch);
		}
		byte[] date = baos.toByteArray();
		baos.close();
		return date;
	}

	public String insertBB(Map map, ParamDTO dto) throws Exception {
		String raqfilename = (String) map.get("filename");
		List raqList = hibernateDao.createQuery("from ReportResource where raqfilename = ?", new Object[] { raqfilename }).list();
		if ((raqList != null) && (raqList.size() > 0)) {
			return "此报表已经存在！";
		}
		String parentraqfilename = dto.getAsString("parentraqfilename");
		String name = dto.getAsString("raqname");
		name = name.replace('-', ' ');
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#�?…�?&*（）—�?+|{}【�?‘；：�?“�?。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(name);
		name = m.replaceAll("").trim();
		name = StringUtil.deleteAny(name, " ");
		String nameHead = name.substring(0, 1);
		if (nameHead.matches("^[0-9]*$")) {
			return "报表名称只能以中文和英文字母开头！";
		}
		ReportResource reportResource = new ReportResource();
		reportResource.setOrgid(map.get("orgId").toString());
		reportResource.setRaqfile(InputStreamToByte((InputStream) map.get("filecontent")));
		reportResource.setRaqfilename(raqfilename);
		reportResource.setRaqname(name);
		if (!ValidateUtil.isEmpty(parentraqfilename)) {
			ReportResource r = new ReportResource();
			r.setRaqfilename(parentraqfilename);
			reportResource.setReportResource(r);
		}
		String rptype = dto.getAsString("raqtype");
		if ("2".equals(rptype)) {
			reportResource.setSubrow(dto.getAsLong("subrow"));
			reportResource.setSubcell(dto.getAsLong("subcell"));
		}
		if ("3".equals(rptype)) {
			reportResource.setRaqdatasource(dto.getAsString("raqdatasource"));
			reportResource.setRaqparam(dto.getAsString("raqparam"));
		}
		reportResource.setRaqtype(rptype);
		reportResource.setUploador((String) map.get("uploador"));
		reportResource.setUploadtime((Timestamp) map.get("uploadTime"));
		hibernateDao.save(reportResource);
		return null;
	}

	public String updateBB(Map map, ParamDTO dto) throws Exception {
		ReportResource reportResource = new ReportResource();
		String raqfilename = null;
		String name = dto.getAsString("raqname");
		name = name.replace('-', ' ');
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#�?…�?&*（）—�?+|{}【�?‘；：�?“�?。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(name);
		name = m.replaceAll("").trim();
		name = StringUtil.deleteAny(name, " ");
		String nameHead = name.substring(0, 1);
		if (nameHead.matches("^[0-9]*$")) {
			return "报表名称只能以中文和英文字母开头！";
		}
		String hql = null;
		if (map != null) {
			raqfilename = (String) map.get("filename");
			if (!dto.getAsString("raqfilename").equals(raqfilename)) {
				return "报表文件名必须和报表标识一样！";
			}
			hql = "update ReportResource rr set rr.raqname = ?,rr.raqfile = ?,rr.uploador = ?,rr.uploadtime = ? where rr.raqfilename = ?";
			hibernateDao.createQuery(
					hql,
					new Object[] { name, InputStreamToByte((InputStream) map.get("filecontent")), map.get("uploador").toString(),
							(Timestamp) map.get("uploadTime"), raqfilename }).executeUpdate();
		} else {
			hql = "update ReportResource rr set rr.raqname = ?,rr.uploador = ?,rr.uploadtime = ? where rr.raqfilename = ?";
			hibernateDao.createQuery(hql,
					new Object[] { name, dto.getAsString("uploador"), (Timestamp) dto.get("uploadTime"), dto.getAsString("raqfilename") })
					.executeUpdate();
		}
		List l = hibernateDao.createQuery("select r.menuid from ReportMenuReference r where r.reportResource.raqfilename=?",
				new Object[] { raqfilename }).list();
		if ((null != l) && (l.size() > 0)) {
			Long menuId = null;
			for (int j = 0; j < l.size(); j++) {
				menuId = (Long) l.get(j);
				CacheUtil.cacheElementRemove("menuReportCache", raqfilename + "." + menuId + "." + dto.getAsString("yab109"));
			}
		}
		CacheUtil.cacheElementRemove("reportCache", raqfilename);
		CacheUtil.cacheElementRemove("childReportCache", raqfilename);
		return null;
	}

	public String deleteBB(ParamDTO dto) throws Exception {
		List rqbbList = (List) dto.get("rqbbList");
		String yab109 = dto.getAsString("yab109");
		for (int i = 0; i < rqbbList.size(); i++) {
			Map m = (Map) rqbbList.get(i);
			String raqfilename = m.get("raqfilename").toString();
			List l = hibernateDao.createQuery("select r.menuid from ReportMenuReference r where r.reportResource.raqfilename=?",
					new Object[] { raqfilename }).list();
			if ((null != l) && (l.size() > 0)) {
				throw new AppException("有报表菜单正在使用" + raqfilename + "这张报表，无法执行删除操作！");
			}
			try {
				hibernateDao.createQuery("delete from ReportResource r where r.raqfilename=?", new Object[] { raqfilename }).executeUpdate();
			} catch (Exception e) {
				throw new AppException("删主报表前请先删除子报表！");
			}
			Long menuId = null;
			for (int j = 0; j < l.size(); j++) {
				menuId = (Long) l.get(j);
				CacheUtil.cacheElementRemove("menuReportCache", raqfilename + "." + menuId + "." + yab109);
			}
			CacheUtil.cacheElementRemove("reportCache", raqfilename);
			CacheUtil.cacheElementRemove("childReportCache", raqfilename);
		}

		return null;
	}

	public List queryBB(ParamDTO dto) {
		String raqfilename = dto.getAsString("raqfilename");
		String raqtype = dto.getAsString("raqtype");
		StringBuilder hql = new StringBuilder();
		List list = new ArrayList();
		if ((!ValidateUtil.isEmpty(raqfilename)) && (!ValidateUtil.isEmpty(raqtype))) {
			hql.append(
					"select new com.yinhai.ta3.runqian.domain.ReportResource(r.raqfilename,r.raqname, r.raqtype, r.uploador, r.uploadtime) from ReportResource r")
					.append(" where r.raqfilename like :raqfilename").append(" and r.raqtype = :raqtype");

			Query q = hibernateDao.createQuery(hql.toString(), new Object[0]);
			q.setString("raqfilename", "%" + raqfilename + "%");
			q.setString("raqtype", raqtype);
			list = q.list();
		} else if ((ValidateUtil.isEmpty(raqfilename)) && (!ValidateUtil.isEmpty(raqtype))) {
			hql.append(
					"select new com.yinhai.ta3.runqian.domain.ReportResource(r.raqfilename,r.raqname, r.raqtype, r.uploador, r.uploadtime) from ReportResource r")
					.append(" where r.raqtype=?");

			list = hibernateDao.createQuery(hql.toString(), new Object[] { raqtype }).list();
		} else if ((!ValidateUtil.isEmpty(raqfilename)) && (ValidateUtil.isEmpty(raqtype))) {
			hql.append(
					"select new com.yinhai.ta3.runqian.domain.ReportResource(r.raqfilename,r.raqname, r.raqtype, r.uploador, r.uploadtime) from ReportResource r")
					.append(" where r.raqfilename like :raqfilename");

			Query q = hibernateDao.createQuery(hql.toString(), new Object[0]);
			q.setString("raqfilename", "%" + raqfilename + "%");
			list = q.list();
		} else {
			hql.append("select new com.yinhai.ta3.runqian.domain.ReportResource(r.raqfilename,r.raqname, r.raqtype, r.uploador, r.uploadtime) from ReportResource r");
			list = hibernateDao.createQuery(hql.toString(), new Object[0]).list();
		}
		return list;
	}

	public List getRaqFile(String raqfilename) {
		return hibernateDao.createQuery("from ReportResource r where r.raqfilename=?", new Object[] { raqfilename }).list();
	}
}
