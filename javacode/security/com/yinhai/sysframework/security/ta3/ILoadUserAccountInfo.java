package com.yinhai.sysframework.security.ta3;

import javax.servlet.http.HttpServletRequest;

public interface ILoadUserAccountInfo {

	public static final String SERVICEKEY = "loadUserAccountInfo";

	public abstract IUserAccountInfo loadUser(String paramString, HttpServletRequest paramHttpServletRequest);
}
