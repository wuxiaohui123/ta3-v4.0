package com.yinhai.ta3.sysapp.syslogmg.action;

import java.util.Date;

import com.yinhai.sysframework.config.SysConfig;
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
		Date startDate = dto.getAsDate("startDate");
		Date endDate = dto.getAsDate("endDate");
		Integer start = dto.getStart("accessGrid");
		Integer limit = dto.getLimit("accessGrid");
		Long userid = dto.getUserInfo().getUserid();
		Long positionid = dto.getUserInfo().getNowPosition().getPositionid();
		PageBean pageBean = new PageBean();
		if (SysConfig.getSysconfigToBoolean("isMongo", true)) {
			pageBean = accessLogService.queryAccessInfoByMongo(startDate, endDate, start, limit, userid, positionid);
		} else {
			pageBean = accessLogService.queryAccessInfo(startDate, endDate, start, limit, userid, positionid);
		}
		setList("accessGrid", pageBean);
		return JSON;
	}
}
