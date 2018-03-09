package com.yinhai.sysframework.iorg;

import java.util.List;

import com.yinhai.sysframework.codetable.domain.AppCode;

public interface IDataAccessApi {

	public static final String SERVICEKEY = "dataAccessApi";

	public abstract List<AppCode> query(Long paramLong1, Long paramLong2, String paramString);

	public abstract void clearCache(Long paramLong1, Long paramLong2, String paramString);
}
