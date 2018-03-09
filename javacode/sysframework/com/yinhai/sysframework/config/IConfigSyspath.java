package com.yinhai.sysframework.config;

import java.io.Serializable;

public interface IConfigSyspath extends Serializable {

	public static final String ISCURSYSTEM_YES = "0";
	public static final String ISCURSYSTEM_NO = "1";

	public abstract String getId();

	public abstract String getUrl();

	public abstract String getName();
}
