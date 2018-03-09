package com.yinhai.ta3.runqian.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.runqian.report4.cache.CacheManager;
import com.runqian.report4.cache.ReportCache;
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.IReport;
import com.runqian.report4.view.ParamsPool;
import com.yinhai.sysframework.util.StringUtil;
import com.yinhai.sysframework.util.ValidateUtil;
import com.yinhai.sysframework.util.WebUtil;
import com.yinhai.ta3.runqian.service.QueryReportService;
import com.yinhai.ta3.runqian.util.RunqianReportUtil;
import com.yinhai.webframework.BaseAction;

public class QueryReportAction extends BaseAction {

	public QueryReportService queryReportService = (QueryReportService) getService("queryReportService");
	private List mraqs;
	private List praqs;
	private List zraqs;

	public String execute() throws Exception {
		String yab109 = getDto().getUserInfo().getDepartId();
		String user = getDto().getUserInfo().getName();
		String yab109_arg = request.getParameter("departmentId");

		String raqParam = request.getParameter("raqParam");
		if ((null != raqParam) && (raqParam.length() > 0)) {
			raqParam = new String(raqParam.getBytes("iso-8859-1"), "UTF-8");
		}
		String userId = request.getParameter("userId");
		if ((null != yab109_arg) && (yab109_arg.length() > 0)) {
			yab109 = yab109_arg;
		}
		if ((null != userId) && (userId.length() > 0)) {
			user = userId;
		}
		Timestamp currTime = queryReportService.getSysTimestamp();
		StringBuffer param_action = new StringBuffer();
		param_action.append("departmentId").append("=").append(yab109).append(";").append("userId").append("=").append(user).append(";")
				.append("currentTime").append("=").append(currTime).append(";");

		String reportParamsId = request.getParameter("reportParamsId");

		Hashtable params = null;

		if ((!"".equals(reportParamsId)) && (reportParamsId != null)) {
			params = ParamsPool.get(reportParamsId);
			if (params != null) {
				Iterator it = params.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry entry = (Map.Entry) it.next();
					String key = (String) entry.getKey();
					String value = (String) entry.getValue();
					if ((value != null) && (param_action.indexOf(key) < 0)) {
						param_action.append(key).append("=").append(value).append(";");
					}
				}
			}
		}

		if ((!"".equals(raqParam)) && (raqParam != null)) {
			Map paramMap = new HashMap();
			String[] param = raqParam.split(";");
			String paramName = "";
			String paramValue = "";
			for (int j = 0; j < param.length; j++) {
				int dIndex = param[j].lastIndexOf("=");
				paramName = param[j].substring(0, dIndex);
				paramValue = param[j].substring(dIndex + 1);
				if ((paramValue != null) && (param_action.indexOf(paramName) < 0)) {
					param_action.append(paramName).append("=").append(paramValue).append(";");
				}
			}
		}

		request.setAttribute("param_action", param_action);
		String reportRaq = request.getParameter("raq");
		String raq = "";
		Map<String, Object> winInfo = new HashMap<String, Object>();

		Long currentMenu = WebUtil.getCurrentMenu(request).getMenuid();
		String cm = null == currentMenu ? "" : currentMenu.toString();
		String menuId = null;
		if (StringUtil.isNotEmpty(reportRaq)) {
			menuId = "";
			if (reportRaq.indexOf(".raq") > -1) {
				reportRaq = reportRaq.substring(0, reportRaq.lastIndexOf(".raq"));
			}
			raq = reportRaq;
		} else {
			menuId = currentMenu.toString();
			raq = queryReportService.getMenuRaqs(menuId);
		}
		String sessionId = request.getSession().getId();
		winInfo.put("yab109", yab109);
		String[] raqfilenames = raq.split(",");
		if (raqfilenames.length > 0) {
			Map<String, List> report = queryReportService.queryRaqDatas(raqfilenames, menuId, winInfo);
			if (report == null) {
				setSuccess(false);
				setMsg("无此报表");
			} else {
				List mraqData = (List) report.get("1");
				Map raqMap = new HashMap();
				if ((mraqData != null) && (mraqData.size() > 0)) {
					List<Map<String, Object>> raqs = new ArrayList<Map<String, Object>>();
					raqMap = (Map) mraqData.get(0);
					for (int i = 1; i < mraqData.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						Map raqDomain = (Map) mraqData.get(i);
						StringBuffer reportInfo = new StringBuffer();
						reportInfo.append(raqDomain.get("raqfilename")).append("`").append(raqDomain.get("raqname")).append("`")
								.append(raqDomain.get("raqfilename") + "_" + sessionId + "_" + cm).append("`")
								.append(raqDomain.get("needsaveasexcel")).append("`").append(raqDomain.get("needsaveaspdf")).append("`")
								.append(raqDomain.get("needsaveasword")).append("`").append(raqDomain.get("needsaveastext")).append("`")
								.append(raqDomain.get("needprint")).append("`").append(raqDomain.get("scaleexp")).append("`");
						m.put("tabid", raqDomain.get("raqfilename"));
						m.put("tabname", raqDomain.get("raqname"));
						m.put("json", reportInfo.toString());
						raqs.add(m);
					}
					setMraqs(raqs);
				}
				List praqData = (List) report.get("0");
				if ((praqData != null) && (praqData.size() > 0)) {
					Map raqDomain = (Map) praqData.get(0);
					request.setAttribute((String) raqDomain.get("raqfilename"), raqDomain.get("raqfile"));
				}

				request.setAttribute("mraqs", getMraqs());
				request.setAttribute("praqs", praqData);

				ReportDefine rd = RunqianReportUtil.getReportDefineWithChild(raqMap.get("raqfilename").toString());
				CacheManager cacheManager = CacheManager.getInstance();
				String rdname = raqMap.get("raqfilename").toString() + "_" + sessionId + "_" + cm;
				boolean flag = cacheManager.hasReportEntry(rdname);
				if (flag == true) {
					cacheManager.deleteReportEntry(rdname);
				}
				request.setAttribute(rdname, rd);
				request.setAttribute("name", rdname);
				request.setAttribute("raqname", raqMap.get("raqname"));
				request.setAttribute("needsaveasexcel", raqMap.get("needsaveasexcel"));
				request.setAttribute("needsaveasword", raqMap.get("needsaveasword"));
				request.setAttribute("needsaveaspdf", raqMap.get("needsaveaspdf"));
				request.setAttribute("needsaveastext", raqMap.get("needsaveastext"));
				request.setAttribute("needprint", raqMap.get("needprint"));
				request.setAttribute("scaleexp", raqMap.get("scaleexp"));
				request.setAttribute("raqfilename", raqMap.get("raqfilename"));
			}
		}
		return "success";
	}

	public String printReport() throws Exception {
		String action = request.getParameter("action");
		String raqs = request.getParameter("raq");
		String paramString = request.getParameter("paramString");

		String saveAsName = request.getParameter("saveAsName");

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("params", paramString);
		Map<String, Object> report = queryReportService.queryPrintDatas(raqs, dataMap);

		if (ValidateUtil.isEmpty(report)) {
			setMsg("输入的报表不存在，请重新输入!", "error");
			setSuccess(false);
		} else {
			Long currentMenu = WebUtil.getCurrentMenu(request).getMenuid();
			String menuId = null;
			if (null == currentMenu) {
				menuId = "";
			} else {
				menuId = currentMenu.toString();
			}
			String sessionId = request.getSession().getId();
			String raqfilename = (String) report.get("raqfilename") + "_" + sessionId + "_" + menuId;

			CacheManager cacheManager = CacheManager.getInstance();
			boolean flag = cacheManager.hasReportEntry(raqfilename);
			if (flag == true) {
				cacheManager.deleteReportEntry(raqfilename);
			}
			request.setAttribute("saveAsName", saveAsName);
			request.setAttribute("action", action);
			request.setAttribute(raqfilename, report.get("raqfile"));
			request.setAttribute("raqfilename", raqfilename);
		}
		return "servletPrint";
	}

	public String flashPrint() throws Exception {
		String raqs = request.getParameter("raq");
		String paramString = request.getParameter("paramString");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("params", paramString);
		Map<String, Object> report = queryReportService.queryPrintDatas(raqs, dataMap);

		if (ValidateUtil.isEmpty(report)) {
			setMsg("输入的报表不存在，请重新输入!", "error");
			setSuccess(false);
		} else {
			IReport ir = (IReport) report.get("raqfile");
			CacheManager cacheManager = CacheManager.getInstance();
			ReportCache cache = cacheManager.cacheReport(report.get("raqfilename").toString(), ir);
			String cacheId = cache.getId();
			setData("cacheId", cacheId);
		}
		return "tojson";
	}

	public List getMraqs() {
		return mraqs;
	}

	public void setMraqs(List mraqs) {
		this.mraqs = mraqs;
	}

	public List getPraqs() {
		return praqs;
	}

	public void setPraqs(List praqs) {
		this.praqs = praqs;
	}

	public List getZraqs() {
		return zraqs;
	}

	public void setZraqs(List zraqs) {
		this.zraqs = zraqs;
	}

	public String printCallBack() throws Exception {
		String report = request.getParameter("report");
		CacheManager.getInstance().deleteReportEntry(report);
		return null;
	}

	public String getClientIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Real-IP");
		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getHeader("X-Forwarded-For");
		}
		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getHeader("X-Real-IP");
		}
		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getRemoteAddr();
		}
		if ((!StringUtils.isBlank(ip)) && (!"unknown".equalsIgnoreCase(ip))) {
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			}
			return ip;
		}

		return ip;
	}
}
