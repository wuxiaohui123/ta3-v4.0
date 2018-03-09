package com.yinhai.sysframework.service;

import java.util.Date;

public abstract interface WsService {

	public abstract String getEntityClassName(String paramString);

	public abstract String getSysStrTimestamp();

	public abstract Date getSysDate();

	public abstract String getSysStrDate();

	public abstract String getStringSeq(String paramString);

	public abstract Long getLongSeq(String paramString);

	public abstract String getSequence(String paramString);
}
