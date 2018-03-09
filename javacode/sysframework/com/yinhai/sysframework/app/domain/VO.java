package com.yinhai.sysframework.app.domain;

import java.io.Serializable;
import java.util.Map;

import com.yinhai.sysframework.dto.DTO;

public interface VO extends Serializable {

	public abstract String toXMLString(String paramString);
	  
	  public abstract String toXML();
	  
	  public abstract String toJson();
	  
	  public abstract Map toMap();
	  
	  public abstract DTO toDTO();
	  
	  public abstract Key getKey();
	  
	  public abstract DomainMeta getMetadata();
}
