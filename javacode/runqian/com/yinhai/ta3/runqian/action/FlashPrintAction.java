package com.yinhai.ta3.runqian.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.runqian.report4.cache.CacheManager;
import com.runqian.report4.cache.ReportCache;
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.Context;
import com.runqian.report4.usermodel.Engine;
import com.runqian.report4.usermodel.IReport;
import com.runqian.report4.usermodel.SubReportConfig;
import com.runqian.report4.usermodel.SubReportMetaData;
import com.runqian.report4.util.ReportUtils;
import com.yinhai.sysframework.util.StringUtil;
import com.yinhai.webframework.BaseAction;

@Namespace("/runqian")
@Action(value = "flashPrintAction", results = { @Result(name = "success", location = "/") })
public class FlashPrintAction extends BaseAction {

	public String execute() throws Exception {
		return "success";
	}

	public String flashPrint() throws Exception {
		String reportFile = request.getSession().getServletContext().getRealPath("/runqian/reportFiles") + "/" + request.getParameter("raq") + ".raq";
		String paramString = request.getParameter("paramString");
		ReportDefine rd = (ReportDefine) ReportUtils.read(reportFile);
		Context cxt = new Context();

		if (StringUtil.isNotEmpty(paramString)) {
			Map paramMap = new HashMap();
			String[] param = paramString.split(";");
			String paramName = "";
			String paramValue = "";
			for (int j = 0; j < param.length; j++) {
				int dIndex = param[j].lastIndexOf("=");
				paramName = param[j].substring(0, dIndex);
				paramValue = param[j].substring(dIndex + 1);
				paramMap.put(paramName, paramValue);
			}
			cxt.setParamMap(paramMap);
		}

		Engine engine = new Engine(rd, cxt);
		IReport iReport = engine.calc();
		CacheManager cacheManager = CacheManager.getInstance();
		ReportCache cache = cacheManager.cacheReport(request.getParameter("raq").toString(), iReport);
		String cacheId = cache.getId();
		setData("cacheId", cacheId);
		return "tojson";
	}

	public String flashPrintWithChild() throws Exception {
		String reportFile = request.getSession().getServletContext().getRealPath("/runqian/reportFiles") + "/" + request.getParameter("raq") + ".raq";
		String paramString = request.getParameter("paramString");
		String children = request.getParameter("child");
		ReportDefine rd = (ReportDefine) ReportUtils.read(reportFile);
		Context cxt = new Context();

		String[] childReports = children.split(";");
		for (int i = 0; i < childReports.length; i++) {
			String childReportFile = request.getSession().getServletContext().getRealPath("/runqian/reportFiles") + "/" + childReports[i] + ".raq";
			ReportDefine childRd = (ReportDefine) ReportUtils.read(childReportFile);
			SubReportMetaData srmd = rd.getSubReportMetaData();
			SubReportConfig src = srmd.getSubReportConfig(i);
			src.setURLType((byte) 3);
			src.setSubReportDefine(childRd);
		}

		if (StringUtil.isNotEmpty(paramString)) {
			Map paramMap = new HashMap();
			String[] param = paramString.split(";");
			String paramName = "";
			String paramValue = "";
			for (int j = 0; j < param.length; j++) {
				int dIndex = param[j].lastIndexOf("=");
				paramName = param[j].substring(0, dIndex);
				paramValue = param[j].substring(dIndex + 1);
				paramMap.put(paramName, paramValue);
			}
			cxt.setParamMap(paramMap);
		}

		Engine engine = new Engine(rd, cxt);
		IReport iReport = engine.calc();
		CacheManager cacheManager = CacheManager.getInstance();
		ReportCache cache = cacheManager.cacheReport(request.getParameter("raq").toString(), iReport);
		String cacheId = cache.getId();
		setData("cacheId", cacheId);
		return "tojson";
	}
}
