package com.yinhai.ta3.runqian.util;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.runqian.report4.cache.CacheManager;
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.SubReportConfig;
import com.runqian.report4.usermodel.SubReportMetaData;
import com.runqian.report4.view.ParamsPool;
import com.yinhai.sysframework.exception.AppException;
import com.yinhai.sysframework.service.ServiceLocator;
import com.yinhai.ta3.runqian.service.ReportDefineService;

public class RunqianReportUtil {

	private static ReportDefineService reportDefineService = (ReportDefineService) ServiceLocator.getService("reportDefineService");

	public static String getParamString(String reportParamsId) {
		StringBuffer param = new StringBuffer();
		Hashtable params = null;
		if ((!"".equals(reportParamsId)) && (reportParamsId != null)) {
			params = ParamsPool.get(reportParamsId);
			if (params != null) {
				Iterator it = params.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry entry = (Map.Entry) it.next();
					String key = (String) entry.getKey();
					String value = (String) entry.getValue();
					if ((value != null) && (param.indexOf(key) < 0)) {
						param.append(key).append("=").append(value).append(";");
					}
				}
			}
		}

		return param.toString();
	}

	public static ReportDefine getReportDefine(String raqfileName) throws Exception {
		Map m = reportDefineService.getReportInfo(raqfileName);
		if ((null == m) || (m.size() <= 0))
			throw new AppException("未找到该报表");
		ReportDefine rd = (ReportDefine) m.get("rd");
		return rd;
	}

	public static ReportDefine getReportDefineWithChild(String raqfileName) throws Exception {
		Map m = reportDefineService.getReportInfo(raqfileName);
		if ((null == m) || (m.size() <= 0))
			throw new AppException("未找到该报表");
		ReportDefine rd = (ReportDefine) m.get("rd");
		List list = reportDefineService.getChildReportInfo(raqfileName);
		if ((null != list) && (list.size() > 0)) {
			Map child = null;
			for (int i = 0; i < list.size(); i++) {
				child = (Map) list.get(i);
				if (child != null) {
					ReportDefine rds = (ReportDefine) child.get("rd");
					SubReportMetaData srmd = rd.getSubReportMetaData();
					SubReportConfig src = srmd.getSubReportConfig(i);
					src.setURLType((byte) 3);
					src.setSubReportDefine(rds);
				}
			}
		}
		return rd;
	}

	public static void clearReportCache(String cacheName) {
		CacheManager cacheManager = CacheManager.getInstance();
		boolean flag = cacheManager.hasReportEntry(cacheName);
		if (flag == true)
			cacheManager.deleteReportEntry(cacheName);
	}
}
