package com.yinhai.sysframework.event;

import java.util.EventListener;
import java.util.concurrent.Executor;

public interface TaEventListener extends EventListener {

	public abstract void handleEvent(TaEvent paramTaEvent);

	public abstract String getEventType();

	public abstract void setTaskExecutor(Executor paramExecutor);

	public abstract Executor getTaskExecutor();
}
