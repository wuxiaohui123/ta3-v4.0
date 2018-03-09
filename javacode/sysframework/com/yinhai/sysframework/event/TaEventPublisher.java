package com.yinhai.sysframework.event;

import java.util.List;

import com.yinhai.sysframework.service.ServiceLocator;

public class TaEventPublisher {

	public static void publishEvent(final EventSource source, final String eventType) {
		if (!ServiceLocator.containsBean("taEventBus")) {
			return;
		}
		if (source == null)
			throw new IllegalArgumentException("null source");
		ITaEventBus taEventBus = (ITaEventBus) ServiceLocator.getService("taEventBus");
		List<TaEventListener> listeners = taEventBus.getListeners();
		if (listeners != null) {
			for (final TaEventListener taListener : listeners) {
				if (eventType.equals(taListener.getEventType())) {
					if (taListener.getTaskExecutor() == null) {
						taListener.handleEvent(new TaEvent(source, eventType));
					} else {
						taListener.getTaskExecutor().execute(new Runnable() {
							public void run() {
								taListener.handleEvent(new TaEvent(source, eventType));
							}
						});
					}
				}
			}
		}
	}
}
