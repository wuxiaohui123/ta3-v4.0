package com.yinhai.sysframework.time;

import java.sql.Timestamp;
import java.util.Date;

import javax.jws.WebService;

@WebService
public interface ITimeService {

	public static final String SERVICEKEY = "timeService";

	public abstract Timestamp getSysTimestamp();

	public abstract String getSysStrTimestamp();

	public abstract Date getSysDate();

	public abstract String getSysStrDate();
}
