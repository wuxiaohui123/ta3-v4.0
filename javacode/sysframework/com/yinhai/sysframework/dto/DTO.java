package com.yinhai.sysframework.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Map;

import com.yinhai.sysframework.app.domain.DomainObject;
import com.yinhai.sysframework.app.domain.VO;

public interface DTO extends Map, Serializable {

	public static final String KEY_VALUE = "`";
	  public static final String ENTRY_ENTRY = "^";
	  
	  public abstract boolean isEmpty(String paramString);
	  
	  public abstract boolean isNotEmpty(String paramString);
	  
	  public abstract Integer getAsInteger(String paramString);
	  
	  public abstract Integer getAsInteger(String paramString, int paramInt);
	  
	  public abstract Long getAsLong(String paramString);
	  
	  public abstract Long getAsLong(String paramString, long paramLong);
	  
	  public abstract String getAsString(String paramString);
	  
	  public abstract String getAsString(String paramString1, String paramString2);
	  
	  public abstract BigDecimal getAsBigDecimal(String paramString, double paramDouble);
	  
	  public abstract BigDecimal getAsBigDecimal(String paramString);
	  
	  public abstract Date getAsDate(String paramString);
	  
	  public abstract Date getAsDate(String paramString, Date paramDate);
	  
	  public abstract Timestamp getAsTimestamp(String paramString);
	  
	  public abstract Timestamp getAsTimestamp(String paramString, Timestamp paramTimestamp);
	  
	  public abstract String[] getAsStringArray(String paramString);
	  
	  public abstract Map<?, ?> getDtoAsMap();
	  
	  public abstract DTO getSubDto(String paramString);
	  
	  public abstract DomainObject toDomainObject(String paramString);
	  
	  public abstract DomainObject toDomainObject(Class<?> paramClass);
	  
	  public abstract VO toVO(String paramString);
	  
	  public abstract VO toVO(Class<?> paramClass);
	  
	  public abstract String toXML();
	  
	  public abstract DTO append(String paramString, Object paramObject);
	  
	  public abstract DTO checkNotEmptyForSelect(String paramString);
	  
	  public abstract DTO checkNotEmptyForUpdate(String paramString);
	  
	  public abstract DTO checkNotEmptyForInsert(String paramString);
	  
	  public abstract DTO checkNotEmptyForDelete(String paramString);
	  
	  public abstract DTO checkNotEmptyForPrc(String paramString);
	  
	  public abstract String[] getNotEmptyForSelect();
	  
	  public abstract String[] getNotEmptyForUpdate();
	  
	  public abstract String[] getNotEmptyForInsert();
	  
	  public abstract String[] getNotEmptyForDelete();
	  
	  public abstract String[] getNotEmptyForPrc();
}
