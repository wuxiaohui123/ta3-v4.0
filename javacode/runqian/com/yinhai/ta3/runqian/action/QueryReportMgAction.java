package com.yinhai.ta3.runqian.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.config.IConfigSyspath;
import com.yinhai.sysframework.config.SysConfig;
import com.yinhai.sysframework.config.service.IConfigService;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.menu.IMenu;
import com.yinhai.sysframework.service.ServiceLocator;
import com.yinhai.sysframework.util.json.JSonFactory;
import com.yinhai.ta3.runqian.domain.ReportMenuReference;
import com.yinhai.ta3.runqian.domain.ReportResource;
import com.yinhai.ta3.runqian.service.QueryReportMgService;
import com.yinhai.ta3.sysapp.menumg.service.IMenuMgService;
import com.yinhai.ta3.system.sysapp.domain.Menu;
import com.yinhai.webframework.BaseAction;

public class QueryReportMgAction extends BaseAction {

	QueryReportMgService queryReportMgService = (QueryReportMgService) getService("queryReportMgService");

	IMenuMgService menuMgService = (IMenuMgService) getService("menuMgService");

	public String execute() throws Exception {
		Menu menu = (Menu) menuMgService.getMenu(IMenu.ROOT_ID);
		menu.setParent(true);
		Map<String, Object> map = menu.toMap();
		map.put("open", "true");
		request.setAttribute("menuTree", JSonFactory.bean2json(map));

		IConfigService configService = (IConfigService) ServiceLocator.getService("configService");
		List<IConfigSyspath> syslist = configService.getConfigSysPaths();
		setData("syspath", syslist);
		setData("syspath", SysConfig.getSysConfig("curSyspathId", "sysmg"));

		List plist = queryReportMgService.getPReportList();
		StringBuffer treedata_0 = new StringBuffer("[");
		for (int i = 0; i < plist.size(); i++) {
			ReportResource report = (ReportResource) plist.get(i);
			treedata_0.append("{id:'").append(report.getRaqfilename()).append("',");
			treedata_0.append("name:'").append(report.getRaqfilename() + "(" + report.getRaqname() + ")").append("',");
			treedata_0.append("type:'").append(report.getRaqtype()).append("',");
			treedata_0.append("pId:'").append("0").append("'}");
			if (i < plist.size() - 1) {
				treedata_0.append(",");
			}
		}
		treedata_0.append("]");
		request.setAttribute("dropdownTree_0", treedata_0);

		List blist = queryReportMgService.getMainReportList();
		StringBuffer treedata_1 = new StringBuffer("[");
		for (int i = 0; i < blist.size(); i++) {
			ReportResource report = (ReportResource) blist.get(i);
			treedata_1.append("{id:'").append(report.getRaqfilename()).append("',");
			treedata_1.append("name:'").append(report.getRaqfilename() + "(" + report.getRaqname() + ")").append("',");
			treedata_1.append("type:'").append(report.getRaqtype()).append("',");
			ReportResource p = report.getReportResource();
			if (p == null) {
				treedata_1.append("pId:'").append("0").append("'}");
			} else {
				treedata_1.append("pId:'").append(p.getRaqfilename()).append("'}");
			}

			if (i < blist.size() - 1) {
				treedata_1.append(",");
			}
		}
		treedata_1.append("]");
		request.setAttribute("dropdownTree_1", treedata_1);
		return "success";
	}

	public String getMenuInfoById() throws Exception {
		String menuid = getDto().getAsString("menuid");
		Menu menu = (Menu) menuMgService.getMenu(Long.valueOf(menuid));
		if (menu != null) {
			String functionUrl = menu.getUrl();
			if ((functionUrl == null) || (functionUrl.indexOf("queryReportAction.do") <= 0)) {
				setSuccess(false);
				return JSON;
			}
			setData(menu.toMap(), true);

			List bbList = queryReportMgService.getMenuReportList(menuid);
			List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
			for (Object object : bbList) {
				if ((object instanceof Object[])) {
					Object[] obs = (Object[]) object;
					Map<String, Object> m = new HashMap<String, Object>();
					for (Object o : obs) {
						if ((o instanceof ReportMenuReference)) {
							ReportMenuReference rm = (ReportMenuReference) o;
							m.put("isgroup", rm.getIsgroup());
							m.put("limited", rm.getLimited());
							m.put("needsaveasexcel", rm.getNeedsaveasexcel());
							m.put("needsaveasexcel2007", rm.getNeedsaveasexcel2007());
							m.put("needsaveaspdf", rm.getNeedsaveaspdf());
							m.put("needsaveasword", rm.getNeedsaveasword());
							m.put("needsaveastext", rm.getNeedsaveastext());
							m.put("needprint", rm.getNeedprint());
							m.put("scaleexp", rm.getScaleexp());
						} else if ((o instanceof ReportResource)) {
							ReportResource rr = (ReportResource) o;
							m.put("raqfilename", rr.getRaqfilename());
							if (null != rr.getReportResource()) {
								m.put("parentraqfilename", rr.getReportResource().getRaqfilename());
							}
							m.put("raqname", rr.getRaqname());
							m.put("raqtype", rr.getRaqtype());
							m.put("raqfilename", rr.getRaqfilename());
							m.put("raqfilename", rr.getRaqfilename());
						}
					}
					l.add(m);
				}
			}
			setList("rqbbGrid", l);
		} else {
			setSuccess(false);
			setMsg("没有查询到该菜单信息！");
		}
		return JSON;
	}

	public String getAsyncData_1() throws Exception {
		List blist = queryReportMgService.getMainReportList();
		StringBuffer treedata_1 = new StringBuffer("[");
		for (int i = 0; i < blist.size(); i++) {
			ReportResource report = (ReportResource) blist.get(i);
			treedata_1.append("{id:'").append(report.getRaqfilename()).append("',");
			treedata_1.append("name:'").append(report.getRaqname()).append("',");
			String p = report.getReportResource().getRaqfilename();
			if (("".equals(p)) || (p == null)) {
				treedata_1.append("pId:'").append("0").append("'}");
			} else {
				treedata_1.append("pId:'").append(p).append("'}");
			}

			if (i < blist.size() - 1) {
				treedata_1.append(",");
			}
		}
		treedata_1.append("]");
		writeJsonToClient(treedata_1);
		return null;
	}

	public String getMenuBBList() throws Exception {
		String menuid = getDto().getAsString("menuid");
		List bbList = queryReportMgService.getMenuReportList(menuid);
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		for (Object object : bbList) {
			if ((object instanceof Object[])) {
				Object[] obs = (Object[]) object;
				Map<String, Object> m = new HashMap<String, Object>();
				for (Object o : obs) {
					if ((o instanceof ReportMenuReference)) {
						ReportMenuReference rm = (ReportMenuReference) o;
						m.put("isgroup", rm.getIsgroup());
						m.put("limited", rm.getLimited());
						m.put("needsaveasexcel", rm.getNeedsaveasexcel());
						m.put("needsaveasexcel2007", rm.getNeedsaveasexcel2007());
						m.put("needsaveaspdf", rm.getNeedsaveaspdf());
						m.put("needsaveasword", rm.getNeedsaveasword());
						m.put("needsaveastext", rm.getNeedsaveastext());
						m.put("needprint", rm.getNeedprint());
						m.put("scaleexp", rm.getScaleexp());
					} else if ((o instanceof ReportResource)) {
						ReportResource rr = (ReportResource) o;
						m.put("raqfilename", rr.getRaqfilename());
						if (null != rr.getReportResource()) {
							m.put("parentraqfilename", rr.getReportResource().getRaqfilename());
						}
						m.put("raqname", rr.getRaqname());
						m.put("raqtype", rr.getRaqtype());
						m.put("raqfilename", rr.getRaqfilename());
						m.put("raqfilename", rr.getRaqfilename());
					}
				}
				l.add(m);
			}
		}
		setList("rqbbGrid", bbList);
		return JSON;
	}

	public String save() throws Exception {
		ParamDTO dto = getDto();
		List bbList = getJsonParamAsList("bbList");
		queryReportMgService.insertMenuBB(bbList, dto);
		return JSON;
	}

	public String update() throws Exception {
		ParamDTO dto = getDto();
		dto.put("yab109", getDto().getUserInfo().getDepartId());
		List bbList = getJsonParamAsList("bbList");
		queryReportMgService.updateMenuBB(bbList, dto);
		setMsg("保存成功！");
		return JSON;
	}

	public String delete() throws Exception {
		String menuId = request.getParameter("menuId");
		if (menuId == null) {
			setSuccess(false);
			setMsg("没有传入要删除的菜单编号！");
		} else {
			queryReportMgService.delete(menuId, getDto());
		}
		return JSON;
	}
}
