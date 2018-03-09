package com.yinhai.ta3.sysapp.consolemg.domain;

import java.io.Serializable;

public class ConsoleModuleLocation implements Serializable {

	private String mark;
	private Long positionid;
	private String location;

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Long getPositionid() {
		return positionid;
	}

	public void setPositionid(Long positionid) {
		this.positionid = positionid;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
