package com.yinhai.sysframework.persistence.ibatis;


public interface ICountStatement {

	public abstract long autoGetTotalCount(String paramString, Object paramObject, IDao paramIDao);
}
