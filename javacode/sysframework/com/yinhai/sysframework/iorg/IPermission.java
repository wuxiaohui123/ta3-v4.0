package com.yinhai.sysframework.iorg;

import java.io.Serializable;

public interface IPermission extends Serializable {

	public static final String USEPERMISSION_NO = "0";
	public static final String USEPERMISSION_YES = "1";
	public static final String REAUTHRITY_NO = "0";
	public static final String REAUTHRITY_YES = "1";
	public static final String REPERMISSION_NO = "0";
	public static final String REPERMISSION_YES = "1";
	public static final String USEPERMISSION = "3";
	public static final String REPERMISSION = "4";
	public static final String REAUTHORITY = "5";
	public static final String DELETE_PERMISSION = "6";
	public static final String EFFECTIVETIME = "7";
	public static final String RETRIEVE_PERMISSION = "0";
	public static final String GRANT_PERMISSION = "1";
}
