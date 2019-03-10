package com.yinhai.sysframework.iorg;

import java.io.Serializable;
import java.util.Date;

public interface IUser extends Serializable {

	 String LOCK = "1";
	 String UNLOCK = "0";
	 Long ROOT_USERID = Long.valueOf(1L);

	 Long getUserid();

	 String getUserId();

	 String getLoginid();

	 String getLoginId();

	 String getName();

	 IPosition getNowPosition();
	
	 Integer getAge();
	
	 Date getBirth();
	
	 String getJob();
	
	 String getOfficetel();
	
	 String getQq();
	
	 String getEmail();
	
	 String getWeixin();
	
	 String getWeibo();
	
	 String getAddress();

	 void setNowPosition(IPosition paramIPosition);

	 String getYab003();

	 String getOrgId();

	 void setYab003(String paramString);

	 String getDepartId();

	 String getYab139();

	 void setYab139(String paramString);

	 void setDepartId(String paramString);
}
