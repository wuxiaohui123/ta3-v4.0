package com.yinhai.sysframework.event;

import java.util.EventListener;
import java.util.concurrent.Executor;

public interface TaEventListener extends EventListener {

	 void handleEvent(TaEvent paramTaEvent);

	 String getEventType();

	 void setTaskExecutor(Executor paramExecutor);

	 Executor getTaskExecutor();
}
