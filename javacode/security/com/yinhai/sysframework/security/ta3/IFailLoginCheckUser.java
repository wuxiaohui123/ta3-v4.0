package com.yinhai.sysframework.security.ta3;

public interface IFailLoginCheckUser {

	public abstract void setUserLocked(Long paramLong);

	public abstract void updateUserFaultNum(Long paramLong, int paramInt);
}
