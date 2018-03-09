package com.yinhai.sysframework.config.service;

import java.util.List;

import com.yinhai.sysframework.config.IConfigSyspath;

public interface IConfigService {

	public static final String SERVICEKEY = "configService";

	public abstract List<IConfigSyspath> getConfigSyspaths();

	public abstract IConfigSyspath getConfigSyspath(String paramString);
}
