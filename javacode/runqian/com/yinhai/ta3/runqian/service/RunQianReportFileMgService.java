package com.yinhai.ta3.runqian.service;

import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.service.Service;

public interface RunQianReportFileMgService extends Service {

	public abstract String insertBB(Map paramMap, ParamDTO paramParamDTO) throws Exception;

	public abstract String updateBB(Map paramMap, ParamDTO paramParamDTO) throws Exception;

	public abstract String deleteBB(ParamDTO paramParamDTO) throws Exception;

	public abstract List queryBB(ParamDTO paramParamDTO);

	public abstract List getRaqFile(String paramString);
}
