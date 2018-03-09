package com.yinhai.sysframework.exception;

public class PrcException extends RuntimeException {

	private String appCode;
	private String errorMsg;
	private String shortMsg;

	public PrcException(String prcName, String appCode, String errorMsg) {
		super("���ô洢����[" + prcName + "]�������󣬴������Ϊ��[" + appCode + "]����ԭ��[" + errorMsg + "]");
		this.appCode = appCode;
		this.errorMsg = errorMsg;
	}

	public PrcException(String prcName, String appCode, String errorMsg, String shortMsg) {
		super("���ô洢����[" + prcName + "]�������󣬴������Ϊ��[" + appCode + "]����ԭ��[" + errorMsg + "]");
		this.appCode = appCode;
		this.errorMsg = errorMsg;
		this.shortMsg = shortMsg;
	}

	public String getAppCode() {
		return appCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public String getShortMsg() {
		return shortMsg;
	}
}
