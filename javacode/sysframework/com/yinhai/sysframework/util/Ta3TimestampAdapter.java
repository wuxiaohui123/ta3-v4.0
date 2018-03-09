package com.yinhai.sysframework.util;

import java.sql.Timestamp;
import java.util.Date;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class Ta3TimestampAdapter extends XmlAdapter<Date, Timestamp> {

	public Date marshal(Timestamp v) throws Exception {
		return new Date(v.getTime());
	}

	public Timestamp unmarshal(Date v) throws Exception {
		return new Timestamp(v.getTime());
	}
}
