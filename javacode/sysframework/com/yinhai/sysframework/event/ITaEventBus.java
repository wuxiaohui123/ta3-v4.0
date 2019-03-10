package com.yinhai.sysframework.event;

import java.util.List;

public interface ITaEventBus {

	String SERVICEKEY = "taEventBus";

	 void setListeners(List<TaEventListener> paramList);

	 List<TaEventListener> getListeners();

	 void addListener(TaEventListener paramTaEventListener);
}
