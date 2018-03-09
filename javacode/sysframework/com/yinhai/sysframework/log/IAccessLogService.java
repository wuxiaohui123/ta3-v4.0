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

	public abstract PageBean queryAccessInfo(Date paramDate1, Date paramDate2, Integer paramInteger1,
			Integer paramInteger2, Long paramLong1, Long paramLong2);
}
