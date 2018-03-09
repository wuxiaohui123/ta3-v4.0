package com.yinhai.sysframework.event;

import java.util.List;

public interface ITaEventBus {

	public static final String SERVICEKEY = "taEventBus";

	public abstract void setListeners(List<TaEventListener> paramList);

	public abstract List<TaEventListener> getListeners();

	public abstract void addListener(TaEventListener paramTaEventListener);
}
