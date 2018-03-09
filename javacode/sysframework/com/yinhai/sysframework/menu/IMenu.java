package com.yinhai.sysframework.menu;

import java.io.Serializable;

public interface IMenu extends Serializable {

	public static final Long ROOT_ID = Long.valueOf(1L);
	public static final String DISMULTIPOS_YES = "1";
	public static final String DISMULTIPOS_NO = "0";
	public static final String SECURITYPOLICY_DISPLAY_SECURITY = "1";
	public static final String SECURITYPOLICY_NODISPLAY_SECURITY = "2";
	public static final String SECURITYPOLICY_NODISPLAY_NOSECURITY = "3";
	public static final String SECURITYPOLICY_DISPLAY_NOSECURITY = "4";
	public static final String CACHE_YES = "1";
	public static final String CACHE_NO = "0";
	public static final String AUDITE_STATE_YES = "0";
	public static final String AUDITE_STATE_WATE = "1";
	public static final String AUDITE_STATE_PASS = "2";
	public static final String AUDITE_STATE_FAILURE = "3";
	public static final String TYPE_MENU = "01";
	public static final String TYPE_BUTTON = "02";
	public static final String TYPE_FORMREAD = "03";
	public static final String TYPE_FORMWRITE = "04";
	public static final String TYPE_GRIDCOLUMNREAD = "05";
	public static final String TYPE_GRIDCOLUMNEDITOR = "06";
	public static final String MENUTYPE_COMMON = "0";
	public static final String MENUTYPE_SYSMG = "1";
	public static final String MENUTYPE_BUSINESS = "2";
	public static final String MENU_LEAF_NO = "1";
	public static final String MENU_LEAF_YES = "0";

	public abstract Long getMenuid();

	public abstract Long getPmenuid();

	public abstract String getMenuname();

	public abstract String getUrl();

	public abstract String getMenuidpath();

	public abstract String getMenunamepath();

	public abstract String getAccesstimeel();

	public abstract String getIconSkin();

	public abstract String getSelectImage();

	public abstract String getReportid();

	public abstract boolean isDismultipos();

	public abstract boolean effective();

	public abstract String getSecuritypolicy();

	public abstract String getQuickcode();

	public abstract Long getSortno();

	public abstract boolean isParent();
}
