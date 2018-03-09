package com.yinhai.sysframework.persistence.ibatis;

public interface Dialect {

	public abstract boolean supportsLimit();

	public abstract String getLimitString(String paramString, int paramInt1, int paramInt2);
}
