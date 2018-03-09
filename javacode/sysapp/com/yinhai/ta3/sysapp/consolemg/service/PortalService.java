package com.yinhai.ta3.sysapp.consolemg.service;

import java.util.List;
import java.util.Set;

import javax.jws.WebService;

import com.yinhai.sysframework.service.WsService;
import com.yinhai.ta3.sysapp.consolemg.domain.ConsoleModule;

@WebService
public abstract interface PortalService extends WsService {

	public abstract List<ConsoleModule> getUserModuleList(Long paramLong, Set<String> paramSet);

	public abstract void saveLocationInfo(String paramString1, String paramString2, Long paramLong);

	public abstract String getLocationInfo(String paramString, Long paramLong);

}
