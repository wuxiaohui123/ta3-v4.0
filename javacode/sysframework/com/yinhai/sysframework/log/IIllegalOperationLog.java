package com.yinhai.sysframework.log;

import java.util.Date;
import java.util.List;

import com.yinhai.sysframework.service.Service;
import com.yinhai.ta3.system.org.domain.OrgLogInfoVO;

public interface IIllegalOperationLog  extends Service {

	 public static final String SERVICEKEY = "illegalOperationLog";
	  public static final String ILLEGAL = "1";
	  
	  public abstract void saveIllegalOperationLog(Long paramLong1, Long paramLong2, Long paramLong3, String paramString1, String paramString2, Long paramLong4, String paramString3);
	  
	  public abstract List<OrgLogInfoVO> queryIllegalOperationLog(Date paramDate1, Date paramDate2);
	  
	  public abstract void saveIllegalOperationMenuLog(Long paramLong1, Long paramLong2, Long paramLong3, String paramString1, String paramString2, Long paramLong4, Long paramLong5);
}
