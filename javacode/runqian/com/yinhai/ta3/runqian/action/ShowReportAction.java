package com.yinhai.ta3.runqian.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.runqian.report4.cache.CacheManager;
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.SubReportConfig;
import com.runqian.report4.usermodel.SubReportMetaData;
import com.yinhai.ta3.runqian.service.ReportDefineService;
import com.yinhai.webframework.BaseAction;

public class ShowReportAction extends BaseAction {

	public ReportDefineService reportDefineService = (ReportDefineService) getService("reportDefineService");

	public String execute() throws Exception {
		String raqfileName = request.getParameter("raq");
		String param = request.getParameter("param");
		Map m = reportDefineService.getReportInfo(raqfileName);
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
		String raqInfo = request.getParameter("raqInfo");
		String[] reportInfo = raqInfo.split("`");
		Map<String, String> map = new HashMap<String, String>();
		map.put("raqfilename", reportInfo[0]);
		map.put("raqname", reportInfo[1]);
		map.put("rdname", reportInfo[2]);
		map.put("needsaveasexcel", reportInfo[3]);
		map.put("needsaveaspdf", reportInfo[4]);
		map.put("needsaveasword", reportInfo[5]);
		map.put("needsaveastext", reportInfo[6]);
		map.put("needprint", reportInfo[7]);
		map.put("scaleexp", reportInfo[8]);
		map.put("param", param);
		String rdname = reportInfo[2];
		CacheManager cacheManager = CacheManager.getInstance();
		boolean flag = cacheManager.hasReportEntry(rdname);
		if (flag == true) {
			cacheManager.deleteReportEntry(rdname);
		}
		request.setAttribute(rdname, rd);
		request.setAttribute("name", rdname);
		request.setAttribute("reportInfo", map);
		return SUCCESS;
	}
}
