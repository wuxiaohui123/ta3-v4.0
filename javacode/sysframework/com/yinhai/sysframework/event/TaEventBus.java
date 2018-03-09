package com.yinhai.sysframework.event;

import java.util.List;
import java.util.Vector;

public class TaEventBus implements ITaEventBus {

	private List<TaEventListener> listeners = new Vector<TaEventListener>();

	public void addListener(TaEventListener listener) {
		if (listeners == null)
			listeners = new Vector<TaEventListener>();
		listeners.add(listener);
	}

	public List<TaEventListener> getListeners() {
		return listeners;
	}

	public void setListeners(List<TaEventListener> listeners) {
		this.listeners = listeners;
	}
}
