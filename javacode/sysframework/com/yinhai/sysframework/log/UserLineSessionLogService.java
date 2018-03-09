package com.yinhai.sysframework.log;

import javax.jws.WebService;

import com.yinhai.sysframework.dto.BaseDTO;
import com.yinhai.sysframework.service.WsService;

@WebService
public interface UserLineSessionLogService extends WsService {

	public static final String SERVICE_KEY = "userLineSessionLogService";

	public abstract void saveOutLineSessionLog(BaseDTO paramBaseDTO);

	public abstract void saveOutLineSessionLogByParam(String paramString1, Long paramLong, String paramString2,String paramString3);

	public abstract void saveLoginSessionLogByParam(String paramString1, Long paramLong, String paramString2,String paramString3,String paramString4,String paramString5);

	public abstract void saveLoginSessionLog(BaseDTO paramBaseDTO);
}
