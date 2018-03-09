package com.yinhai.sysframework.iorg;

import java.io.Serializable;
import java.util.Date;

public interface IUser extends Serializable {

	public static final String LOCK = "1";
	public static final String UNLOCK = "0";
	public static final Long ROOT_USERID = Long.valueOf(1L);

	public abstract Long getUserid();

	public abstract String getUserId();

	public abstract String getLoginid();

	public abstract String getLoginId();

	public abstract String getName();

	public abstract IPosition getNowPosition();
	
	public abstract Integer getAge();
	
	public abstract Date getBirth();
	
	public abstract String getJob();
	
	public abstract String getOfficetel();
	
	public abstract String getQq();
	
	public abstract String getEmail();
	
	public abstract String getWeixin();
	
	public abstract String getWeibo();
	
	public abstract String getAddress();

	public abstract void setNowPosition(IPosition paramIPosition);

	public abstract String getYab003();

	public abstract String getOrgId();

	public abstract void setYab003(String paramString);

	public abstract String getDepartId();

	public abstract String getYab139();

	public abstract void setYab139(String paramString);

	public abstract void setDepartId(String paramString);
}
