package com.yinhai.sysframework.sequence;

import javax.jws.WebService;

@WebService
public interface IWsSequenceService {

	public static final String SERVICEKEY = "wsSequenceService";

	public abstract String getStringSeq(String paramString);

	public abstract Long getLongSeq(String paramString);

	public abstract String getSequence(String paramString);
}
