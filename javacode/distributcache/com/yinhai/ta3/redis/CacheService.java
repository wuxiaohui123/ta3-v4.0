package com.yinhai.ta3.redis;

public interface CacheService {

	public abstract void set(String key, Object value);

	public abstract Object get(String key);

	public abstract void del(String key);

	public abstract void expire(String key, int paramInt);

	public abstract boolean exists(String key);
}
