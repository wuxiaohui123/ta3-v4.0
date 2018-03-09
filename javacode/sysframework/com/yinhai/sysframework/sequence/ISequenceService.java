package com.yinhai.sysframework.sequence;

public interface ISequenceService {

	public static final String SERVICEKEY = "sequenceService";

	public abstract String getStringSeq(String paramString);

	public abstract Long getLongSeq(String paramString);

	public abstract String getStringSeq();

	public abstract Long getLongSeq();

	public abstract String getSequence(String paramString);
}
