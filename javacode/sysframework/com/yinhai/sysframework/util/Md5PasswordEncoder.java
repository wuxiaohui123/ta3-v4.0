package com.yinhai.sysframework.util;

import org.springframework.dao.DataAccessException;

public interface Md5PasswordEncoder {

	public abstract String encodePassword(String paramString, Object paramObject) throws DataAccessException;

	public abstract boolean isPasswordValid(String paramString1, String paramString2, Object paramObject)
			throws DataAccessException;
}
