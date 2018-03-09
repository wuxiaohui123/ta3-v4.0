package com.yinhai.ta3.runqian.service;

import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.service.Service;

public interface ReportDefineService extends Service {

	public abstract Map getMenuReportInfo(String paramString1, String paramString2, String paramString3) throws Exception;

	public abstract Map getReportInfo(String paramString) throws Exception;

	public abstract List getChildReportInfo(String paramString) throws Exception;
}
