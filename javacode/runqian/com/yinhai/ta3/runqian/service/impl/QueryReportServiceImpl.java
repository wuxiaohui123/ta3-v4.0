package com.yinhai.ta3.runqian.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.Context;
import com.runqian.report4.usermodel.Engine;
import com.runqian.report4.usermodel.IReport;
import com.runqian.report4.usermodel.PrintSetup;
import com.runqian.report4.usermodel.SubReportConfig;
import com.runqian.report4.usermodel.SubReportMetaData;
import com.yinhai.sysframework.dao.hibernate.SimpleDao;
import com.yinhai.sysframework.service.BaseService;
import com.yinhai.sysframework.util.StringUtil;
import com.yinhai.ta3.runqian.service.QueryReportService;
import com.yinhai.ta3.runqian.service.ReportDefineService;

public class QueryReportServiceImpl extends BaseService implements QueryReportService{

	private ReportDefineService reportDefineService;
	   SimpleDao hibernateDao;
	   
	   public SimpleDao getHibernateDao()
	   {
	     return hibernateDao;
	   }
	   
	   public void setHibernateDao(SimpleDao hibernateDao) {
	     this.hibernateDao = hibernateDao;
	   }
	   
	   public ReportDefineService getReportDefineService() {
	     return reportDefineService;
	   }
	   
	   public void setReportDefineService(ReportDefineService reportDefineService) {
	     this.reportDefineService = reportDefineService;
	   }
	   
	   public Map<String, List> queryRaqDatas(String[] raqfilenames, String menuId, Map winInfo) throws Exception
	   {
	     Map<String, List> raqDatas = new HashMap();
	     
	     List mraqs = new ArrayList();
	     
	     List praqs = new ArrayList();
	     
	     List zraqs = new ArrayList();
	     for (int i = 0; i < raqfilenames.length; i++) {
	       String raqfilename = raqfilenames[i];
	       Map report = new HashMap();
	       Map rr = new HashMap();
	       if (StringUtil.isNotEmpty(menuId)) {
	         String yab109 = winInfo.get("yab109").toString();
	         report = reportDefineService.getMenuReportInfo(raqfilename, menuId, yab109);
	         if (report != null) {
	           String raqtype = (String)report.get("raqtype");
	           ReportDefine rd = (ReportDefine)report.get("rd");
	           if ("1".equals(raqtype)) {
	             List childs = reportDefineService.getChildReportInfo(raqfilename);
	             if ((childs != null) && (childs.size() > 0)) {
	               Map child = null;
	               for (int j = 0; j < childs.size(); j++) {
	                 child = (Map)childs.get(j);
	                 if (child != null) {
	                   ReportDefine rds = (ReportDefine)child.get("rd");
	                   SubReportMetaData srmd = rd.getSubReportMetaData();
	                   SubReportConfig src = srmd.getSubReportConfig(j);
	                   src.setURLType((byte)3);
	                   src.setSubReportDefine(rds);
	                 }
	               }
	             }
	             
	             boolean isView = true;
	             if (report.get("scaleexp") != null) {
	               BigDecimal scale = new BigDecimal(report.get("scaleexp").toString());
	               rr.put("scaleexp", scale.toString());
	               if (scale.doubleValue() == 0.0D)
	               {
	                 isView = false;
	               }
	             } else {
	               BigDecimal scale = new BigDecimal(1);
	               rr.put("scaleexp", scale.toString());
	             }
	             BigDecimal limitedData = (BigDecimal)report.get("limited");
	             String limited = "100";
	             if (limitedData != null) {
	               limited = limitedData.toString();
	               PrintSetup ps = rd.getPrintSetup();
	               ps.setRowNumPerPage(Integer.parseInt(limited));
	             }
	             
	             rr.put("raqfilename", report.get("raqfilename"));
	             rr.put("raqname", report.get("raqname"));
	             rr.put("isgroup", "yes");
	             rr.put("needsaveasexcel", convertAttrVal((String)report.get("needsaveasexcel")));
	             rr.put("needsaveasexcel2007", convertAttrVal((String)report.get("needsaveasexcel2007")));
	             rr.put("needsaveaspdf", convertAttrVal((String)report.get("needsaveaspdf")));
	             rr.put("needsaveasword", convertAttrVal((String)report.get("needsaveasword")));
	             rr.put("needsaveastext", convertAttrVal((String)report.get("needsaveastext")));
	             rr.put("needprint", convertAttrVal((String)report.get("needprint")));
	             
	 
	 
	 
	             rr.put("raqfile", rd);
	             if (isView) {
	               mraqs.add(rr);
	             }
	           } else if ("0".equals(raqtype)) {
	             rr.put("raqfilename", report.get("raqfilename"));
	             rr.put("raqname", report.get("raqname"));
	             rr.put("raqfile", rd);
	             praqs.add(rr);
	           }
	         }
	       }
	       else {
	         report = reportDefineService.getReportInfo(raqfilename);
	         if (report != null) {
	           String raqtype = (String)report.get("raqtype");
	           ReportDefine rd = (ReportDefine)report.get("rd");
	           if ("1".equals(raqtype)) {
	             List childs = reportDefineService.getChildReportInfo(raqfilename);
	             if (childs != null) {
	               Map child = null;
	               for (int j = 0; j < childs.size(); j++) {
	                 child = (Map)childs.get(j);
	                 if (child != null) {
	                   ReportDefine rds = (ReportDefine)child.get("rd");
	                   SubReportMetaData srmd = rd.getSubReportMetaData();
	                   SubReportConfig src = srmd.getSubReportConfig(j);
	                   src.setURLType((byte)3);
	                   src.setSubReportDefine(rds);
	                 }
	               }
	             }
	             boolean isView = true;
	             if (report.get("scaleexp") != null) {
	               BigDecimal scale = new BigDecimal(report.get("scaleexp").toString());
	               rr.put("scaleexp", scale.toString());
	               if (scale.doubleValue() == 0.0D)
	               {
	                 isView = false;
	               }
	             } else {
	               BigDecimal scale = new BigDecimal(1);
	               rr.put("scaleexp", scale.toString());
	             }
	             BigDecimal limitedData = (BigDecimal)report.get("limited");
	             String limited = "100";
	             if (limitedData != null) {
	               limited = limitedData.toString();
	               PrintSetup ps = rd.getPrintSetup();
	               ps.setRowNumPerPage(Integer.parseInt(limited));
	             }
	             
	             rr.put("raqfilename", report.get("raqfilename"));
	             rr.put("raqname", report.get("raqname"));
	             rr.put("isgroup", "yes");
	             rr.put("needsaveasexcel", convertAttrVal("1"));
	             rr.put("needsaveasexcel2007", convertAttrVal("1"));
	             rr.put("needsaveaspdf", convertAttrVal("1"));
	             rr.put("needsaveasword", convertAttrVal("1"));
	             rr.put("needsaveastext", convertAttrVal("1"));
	             rr.put("needprint", convertAttrVal("1"));
	             
	 
	 
	 
	             rr.put("raqfile", rd);
	             if (isView) {
	               mraqs.add(rr);
	             }
	           } else if ("0".equals(raqtype)) {
	             rr.put("raqfilename", report.get("raqfilename"));
	             rr.put("raqname", report.get("raqname"));
	             rr.put("raqfile", rd);
	             praqs.add(rr);
	           }
	         }
	       }
	     }
	     raqDatas.put("1", mraqs);
	     raqDatas.put("0", praqs);
	     raqDatas.put("3", zraqs);
	     return raqDatas;
	   }
	   
	   private String convertAttrVal(String prm) {
	     String result = "";
	     if ("1".equals(prm)) {
	       result = "yes";
	     } else {
	       result = "no";
	     }
	     return result;
	   }
	   
	 
	 
	   public Map<String, Object> queryPrintDatas(String raqfilename, Map dataMap)
	     throws Exception
	   {
	     Map report = reportDefineService.getReportInfo(raqfilename);
	     if (report != null) {
	       String raqtype = (String)report.get("raqtype");
	       ReportDefine rd = (ReportDefine)report.get("rd");
	       Context context = new Context();
	       
	       if ("1".equals(raqtype))
	       {
	         List childs = reportDefineService.getChildReportInfo(raqfilename);
	         if ((childs != null) && (childs.size() > 0)) {
	           Map child = null;
	           for (int j = 0; j < childs.size(); j++) {
	             child = (Map)childs.get(j);
	             if (child != null) {
	               ReportDefine rds = (ReportDefine)child.get("rd");
	               SubReportMetaData srmd = rd.getSubReportMetaData();
	               SubReportConfig src = srmd.getSubReportConfig(j);
	               src.setURLType((byte)3);
	               src.setSubReportDefine(rds);
	             }
	           }
	         }
	         
	         String params = (String)dataMap.get("params");
	         if (StringUtil.isNotEmpty(params)) {
	           Map paramMap = new HashMap();
	           String[] param = params.split(";");
	           String paramName = "";
	           String paramValue = "";
	           for (int j = 0; j < param.length; j++) {
	             int dIndex = param[j].lastIndexOf("=");
	             paramName = param[j].substring(0, dIndex);
	             paramValue = param[j].substring(dIndex + 1);
	             paramMap.put(paramName, paramValue);
	           }
	           context.setParamMap(paramMap);
	         }
	         
	         BigDecimal limitedData = (BigDecimal)report.get("limited");
	         String limited = "100";
	         if (limitedData != null) {
	           limited = limitedData.toString();
	           PrintSetup ps = rd.getPrintSetup();
	           ps.setRowNumPerPage(Integer.parseInt(limited));
	         }
	         Engine e = new Engine(rd, context);
	         IReport ir = null;
	         try {
	           ir = e.calc();
	         } catch (Exception e2) {
	           e2.printStackTrace();
	         }
	         report.put("raqfile", ir);
	       }
	     }
	     return report;
	   }
	   
	   public String getMenuRaqs(String menuId)
	   {
	     List list = hibernateDao.createQuery("select r.reportResource.raqfilename from ReportMenuReference r where r.menuid=?", new Object[] { Long.valueOf(menuId) }).list();
	     String raqfilename = "";
	     for (int i = 0; i < list.size(); i++) {
	       raqfilename = raqfilename + (String)list.get(i) + ",";
	     }
	     return raqfilename;
	   }
}
