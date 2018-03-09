package com.yinhai.sysframework.iorg;

import java.io.Serializable;
import java.util.Date;

public interface IOrg extends Serializable {

	public static final String ORG_TYPE_ORG = "01";
	public static final String ORG_TYPE_DEPART = "02";
	public static final String ORG_TYPE_GROUP = "03";
	public static final String ORG_TYPE_TEAM = "04";
	public static final String ORG_TYPE_SUBORG = "05";
	public static final String ORG_LEAF_YES = "0";
	public static final String ORG_LEAF_NO = "1";
	public static final Long ORG_ROOT_ID = Long.valueOf(1L);

	public abstract Long getOrgid();

	public abstract String getOrgname();

	public abstract Long getPorgid();

	public abstract String getCostomno();

	public abstract String getOrgtype();

	public abstract String getOrgidpath();

	public abstract String getOrgnamepath();

	public abstract String getCostomnopath();

	public abstract String getDimension();

	public abstract Long getCreateuser();

	public abstract Date getCreatetime();

	public abstract Integer getSort();

	public abstract String getYab003();

	public abstract String getYab139();
}
