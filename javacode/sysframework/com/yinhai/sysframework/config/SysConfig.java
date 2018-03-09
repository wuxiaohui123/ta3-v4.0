package com.yinhai.sysframework.config;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.io.ClassPathResource;

import com.yinhai.sysframework.util.ValidateUtil;

public class SysConfig {

	private static Log logger = LogFactory.getLog(SysConfig.class);
	private static Map configMap = null;
	private static String fileEncoding="utf8";

	public static void init() {
		try {
			logger.info("============开始加载系统参数！==============");
			initSysconfig();
			logger.info("============系统参数加载完成！==============");
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("系统参数加载失败...", e);
			}
		}
	}

	private static void initSysconfig() {
		configMap = new HashMap();
		Properties props = new Properties();
		BufferedReader bf = null;
		BufferedReader bf_bs = null;
		try {
			ClassPathResource classPathResource = new ClassPathResource("com/yinhai/sysframework/config/config.properties");
			ClassPathResource classPathResource_bs = new ClassPathResource("config.properties");
			bf = new BufferedReader(new InputStreamReader(classPathResource.getInputStream(), fileEncoding));
			bf_bs = new BufferedReader(new InputStreamReader(classPathResource_bs.getInputStream(),fileEncoding));
			props.load(bf);
			Iterator<Map.Entry<Object, Object>> it = props.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry<Object, Object> m = (Map.Entry) it.next();
				configMap.put(m.getKey(), m.getValue());
			}
			props.load(bf_bs);
			Iterator<Map.Entry<Object, Object>> it_bs = props.entrySet().iterator();
			while (it_bs.hasNext()) {
				Map.Entry<Object, Object> m = (Map.Entry) it_bs.next();
				configMap.put(m.getKey(), m.getValue());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error(ex.getMessage());
		} finally {
			if (bf != null) {
				try {
					bf.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (bf_bs != null) {
				try {
					bf_bs.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
	}

	public static Map getConfigs() {
		if (configMap == null)
			return null;
		return configMap;
	}

	public static String getSysConfig(String key) {
		if (configMap == null)
			return null;
		return (String) configMap.get(key);
	}

	public static Integer getSysConfigToInteger(String key) {
		String value = getSysConfig(key);
		Integer configValue = null;
		try {
			configValue = Integer.valueOf(value);
		} catch (NumberFormatException e) {
			configValue = null;
		}
		return configValue;
	}

	public static Integer getSysConfigToInteger(String key, int defaultValue) {
		Integer value = getSysConfigToInteger(key);
		if (value == null) {
			return Integer.valueOf(defaultValue);
		}
		return value;
	}

	public static boolean getSysconfigToBoolean(String key) {
		String bool = getSysConfig(key);
		if ((bool != null) && ((Boolean.parseBoolean(bool)) || ("true".equals(bool))))
			return true;
		return false;
	}

	public static boolean getSysconfigToBoolean(String key, boolean defaultValue) {
		String bool = getSysConfig(key);
		if ((bool == null) || ("".equals(bool)))
			return defaultValue;
		if ((Boolean.parseBoolean(bool)) || ("true".equals(bool))) {
			return true;
		}
		return false;
	}

	public static String getSysConfig(String key, boolean isSuperposition, String... args) {
		String tmp = getSysConfig(key);
		if (isSuperposition) {
			tmp = tmp == null ? "" : tmp;
			for (String arg : args) {
				tmp = tmp + arg;
			}
			return tmp;
		}
		return MessageFormat.format(tmp, args);
	}

	public static String getSysConfig(String key, String defaultValue) {
		String configvalue = getSysConfig(key);
		if (ValidateUtil.isEmpty(configvalue)) {
			return defaultValue;
		}
		return configvalue;
	}

	public static String getSysConfig(String key, String defaultValue, boolean isSuperposition, String... args) {
		String tmp = getSysConfig(key, defaultValue);
		if (isSuperposition) {
			tmp = tmp == null ? "" : tmp;
			for (String arg : args) {
				tmp = tmp + arg;
			}
			return tmp;
		}
		return MessageFormat.format(tmp, args);
	}

	public void destroy() {
		configMap.clear();
		logger.info("系统参数缓存清除");
	}

	public void setFileEncoding(String fileEncoding) {
		this.fileEncoding = fileEncoding;
	}
}
