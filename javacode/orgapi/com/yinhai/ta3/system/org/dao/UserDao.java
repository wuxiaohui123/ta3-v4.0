package com.yinhai.ta3.system.org.dao;

import com.yinhai.sysframework.iorg.IUser;

public interface UserDao {

	public abstract IUser getUserByLoginId(String paramString);

	public abstract IUser getUser(Long paramLong);

	public abstract void lockUser(Long paramLong);

	public abstract int updateUserFaultNum(Long paramLong, Integer paramInteger);
}
