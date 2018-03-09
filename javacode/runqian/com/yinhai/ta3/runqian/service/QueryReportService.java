package com.yinhai.ta3.runqian.service;

import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.service.Service;

public interface QueryReportService extends Service {

	public abstract Map<String, List> queryRaqDatas(String[] paramArrayOfString, String paramString, Map<String, Object> paramMap) throws Exception;

	public abstract Map<String, Object> queryPrintDatas(String paramString, Map paramMap) throws Exception;

	public abstract String getMenuRaqs(String paramString);
}
