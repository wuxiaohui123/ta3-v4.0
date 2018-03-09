package com.yinhai.ta3.sysapp.syslogmg.listener;

import java.util.concurrent.Executor;

import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.event.TaEvent;
import com.yinhai.sysframework.event.TaEventListener;
import com.yinhai.sysframework.iorg.IUser;
import com.yinhai.sysframework.log.IAccessLogService;
import com.yinhai.sysframework.service.BaseService;
import com.yinhai.sysframework.service.ServiceLocator;

public class AccessLogListener extends BaseService implements TaEventListener {

	public void handleEvent(TaEvent ooe) {
		ParamDTO dto = ooe.getSource().getDto();
		IUser user = (IUser) dto.get("user");
		Long menuid = dto.getAsLong("menuId");
		String url = dto.getAsString("url");
		String ispermission = dto.getAsString("ispermission");
		IAccessLogService accessLogService = (IAccessLogService) ServiceLocator.getService("accessLogService");
		accessLogService.saveAccessInfo(user.getUserid(), user.getNowPosition().getPositionid(), menuid, url, ispermission);
	}

	public String getEventType() {
		return "access_log";
	}

	public void setTaskExecutor(Executor taskExecutor) {
	}

	public Executor getTaskExecutor() {
		return null;
	}
}
