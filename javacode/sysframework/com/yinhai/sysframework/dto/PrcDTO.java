package com.yinhai.sysframework.dto;


public class PrcDTO extends BaseDTO {
	public static final String DEFAULT_APPCODE_NAME = "AppCode";
	public static final String DEFAULT_ERRORMSG_NAME = "ErrorMsg";
	public static final String DEFAULT_APPCODE_SUCCESS = "NOERROR";
	public static final String HEAD_APPCODE_SUCESS = "success10000";
	public static final String HEAD_APPCODE_FAIL = "fail10000";
	public static final String DETAILERROR = " ERROR:";

	public PrcDTO() {
		put("AppCode", null);
		put("ErrorMsg", null);
	}

	public String getAppCode() {
		return getAsString("AppCode");
	}

	public String getErrorMsg() {
		return getAsString("ErrorMsg");
	}

	public String getShortMsg() {
		String ret = getAsString("ErrorMsg");
		if (ret != null)
			ret = ret.split(" ERROR:")[0];
		return ret;
	}

}
