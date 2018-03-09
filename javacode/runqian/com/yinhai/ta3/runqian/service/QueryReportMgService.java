package com.yinhai.ta3.runqian.service;

import java.util.List;

import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.service.Service;

public interface QueryReportMgService extends Service {

	public abstract void insertMenuBB(List paramList, ParamDTO paramParamDTO) throws Exception;

	public abstract String updateMenuBB(List paramList, ParamDTO paramParamDTO) throws Exception;

	public abstract void delete(String paramString, ParamDTO paramParamDTO) throws Exception;

	public abstract List getPReportList();

	public abstract List getMainReportList();

	public abstract List getMenuReportList(String paramString);
}
