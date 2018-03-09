package com.yinhai.ta3.runqian.domain;

import java.io.Serializable;

public class ReportPrintSetUp implements Serializable {

	private String setupid;
	private String setupvalue;

	public ReportPrintSetUp() {
	}

	public ReportPrintSetUp(String setupvalue) {
		this.setupvalue = setupvalue;
	}

	public String getSetupid() {
		return setupid;
	}

	public void setSetupid(String setupid) {
		this.setupid = setupid;
	}

	public String getSetupvalue() {
		return setupvalue;
	}

	public void setSetupvalue(String setupvalue) {
		this.setupvalue = setupvalue;
	}
}
