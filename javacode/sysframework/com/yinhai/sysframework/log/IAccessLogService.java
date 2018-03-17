package com.yinhai.sysframework.log;

import java.util.Date;

import javax.jws.WebService;

import com.yinhai.sysframework.persistence.PageBean;
import com.yinhai.sysframework.service.WsService;

@WebService
public interface IAccessLogService extends WsService {

	public static final String SERVICEKEY = "accessLogService";

	public abstract void saveAccessInfo(Long paramLong1, Long paramLong2, Long paramLong3, String paramString1,
			String paramString2);

	public abstract PageBean queryAccessInfo(Date startDate, Date endDate, Integer start, Integer limit, Long userid,
			Long positionid);
	
	public abstract PageBean queryAccessInfoByMongo(Date startDate, Date endDate, Integer start, Integer limit, Long userid,
			Long positionid);
}
