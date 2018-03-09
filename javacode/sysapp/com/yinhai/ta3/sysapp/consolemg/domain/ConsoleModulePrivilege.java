package com.yinhai.ta3.sysapp.consolemg.domain;

import java.io.Serializable;

public class ConsoleModulePrivilege implements Serializable {

	private Long positionid;
	private Long moduleid;

	public Long getPositionid() {
		return positionid;
	}

	public void setPositionid(Long positionid) {
		this.positionid = positionid;
	}

	public Long getModuleid() {
		return moduleid;
	}

	public void setModuleid(Long moduleid) {
		this.moduleid = moduleid;
	}

}
