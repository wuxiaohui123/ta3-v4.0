package com.yinhai.sysframework.log;

import java.sql.Timestamp;
import java.util.List;

import com.yinhai.sysframework.persistence.PageBean;
import com.yinhai.sysframework.service.Service;

public interface ServerExceptionService extends Service {

	public abstract void addServerException(Taserverexceptionlog paramTaserverexceptionlog);

	public abstract List<Taserverexceptionlog> getList(Timestamp paramTimestamp1, Timestamp paramTimestamp2);

	public abstract PageBean getPage(String paramString, Timestamp paramTimestamp1, Timestamp paramTimestamp2,
			int paramInt1, int paramInt2);

	public abstract Taserverexceptionlog getTaserverexceptionlog(String paramString);

	public abstract void delete(String paramString);

	public abstract PageBean getPageByCount(String paramString, Timestamp paramTimestamp1, Timestamp paramTimestamp2,
			int paramInt1, int paramInt2);
}
