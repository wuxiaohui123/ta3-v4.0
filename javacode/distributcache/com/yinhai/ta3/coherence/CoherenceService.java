package com.yinhai.ta3.coherence;

import com.tangosol.net.CacheFactory;
import com.tangosol.net.NamedCache;
import com.yinhai.ta3.redis.CacheService;

public class CoherenceService implements CacheService {
	private NamedCache cache = CacheFactory.getCache("$system$");

	public void del(String key) {
		this.cache.remove(key);
	}

	public boolean exists(String key) {
		return this.cache.containsKey(key);
	}

	public void expire(String key, int paramInt) {
		this.cache.put(key, this.cache.get(key), paramInt);
	}

	public Object get(String key) {
		return this.cache.get(key);
	}

	public void set(String key, Object value) {
		this.cache.put(key, value);
	}
}
