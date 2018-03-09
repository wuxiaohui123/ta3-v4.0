package com.yinhai.sysframework.app.domain;

import java.util.Map;

import org.springframework.util.Assert;

import com.yinhai.sysframework.config.SysConfig;
import com.yinhai.sysframework.util.StringUtil;

public abstract class ExtBaseDomain extends BaseDomain {

	public abstract Map toMap();

	public abstract Key getPK();

	public static String getDomainClassName(Class c) {
		Assert.notNull(c);
		String name = c.getName();
		String extClassName = SysConfig.getSysConfig(name);
		if (StringUtil.isNotEmpty(extClassName)) {
			return extClassName;
		}
		return name;
	}
}
