package com.yinhai.ta3.sysapp.syslogmg.action;

import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.log.IAccessLogService;
import com.yinhai.sysframework.persistence.PageBean;
import com.yinhai.webframework.BaseAction;

public class AccessLogAction extends BaseAction {

	private IAccessLogService accessLogService = (IAccessLogService) super.getService("accessLogService");

	public String execute() throws Exception {
		return super.execute();
	}

	public String queryAccess() throws Exception {
		ParamDTO dto = getDto();
		PageBean pageBean = accessLogService.queryAccessInfo(dto.getAsDate("startDate"), dto.getAsDate("endDate"), dto.getStart("accessGrid"),
				dto.getLimit("accessGrid"), dto.getUserInfo().getUserid(), dto.getUserInfo().getNowPosition().getPositionid());
		setList("accessGrid", pageBean);
		return JSON;
	}
}
