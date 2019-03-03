package com.yinhai.sysframework.app.domain;

import com.yinhai.sysframework.exception.IllegalInputAppException;

public interface DomainObject extends VO {

	public abstract Key getPK();

	public abstract Key getKey();

	public abstract void setKey(Key key);

	public abstract String getObjid();

	public abstract void setObjid(String str);

	public abstract String getDomainObjectName();

	public abstract Object[] toArray();

	public abstract void validateData() throws IllegalInputAppException;

	public abstract String toTabString();

	public abstract boolean equals(Object object);
}
