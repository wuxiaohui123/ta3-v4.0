package com.yinhai.sysframework.iorg;

import java.io.Serializable;
import java.util.Date;

public interface IPosition extends Serializable {

	public static final Long ADMIN_POSITIONID = Long.valueOf(1L);
	public static final String POSITION_TYPE_PUBLIC = "1";
	public static final String POSITION_TYPE_PERSON = "2";
	public static final String POSITION_TYPE_DELEGATES = "3";
	public static final String IS_MAIN_POSITION_YES = "1";
	public static final String IS_MAIN_POSITION_NO = "0";
	public static final String IS_CHILDRENPOSITION = "0";
	public static final String IS_CHILDRENORG = "0";
	public static final String IS_ADMIN_YES = "1";
	public static final String IS_ADMIN_NO = "0";
	public static final String IS_SHARE_POSITION_YES = "1";
	public static final String IS_SHARE_POSITION_NO = "0";
	public static final String IS_COPY_POSITION_YES = "1";
	public static final String IS_COPY_POSITION_NO = "0";
	public static final String POSITION_CATEGORY_BUSINESS = "01";
	public static final String POSITION_CATEGORY_JIHE = "02";
	public static final String POSITION_CATEGORY_SHIZHONG = "03";

	public abstract Long getPositionid();

	public abstract Long getOrgid();

	public abstract String getPositionname();

	public abstract String getPositiontype();

	public abstract Long getCreatepositionid();

	public abstract String getOrgidpath();

	public abstract String getOrgnamepath();

	public abstract Date getValidtime();

	public abstract Date getCreatetime();

	public abstract Long getCreateuser();

	public abstract boolean isPerson();

	public abstract boolean isPublicPosition();

	public abstract boolean isDelegatesPosition();
	
}
