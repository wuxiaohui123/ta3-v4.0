package com.yinhai.ta3.runqian.service;

import com.yinhai.sysframework.service.Service;

public interface SavePrintSetupService extends Service {

	public abstract String getPrintSetup(String paramString) throws Exception;

	public abstract String savePrintSetup(String paramString1, String paramString2) throws Exception;
}
