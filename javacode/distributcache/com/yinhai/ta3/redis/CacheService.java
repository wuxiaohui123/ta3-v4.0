package com.yinhai.ta3.redis;

import java.util.Map;

public interface CacheService {

	public abstract void set(String key, Object value);

	public abstract void hset(String key, String field, String value);

	public abstract Object get(String key);

	public abstract String hget(String key, String field);

	public abstract Map<String, Object> hash(String key);

	public abstract void hdel(String key,String... field);

	public abstract void del(String key);

	public abstract void expire(String key, int paramInt);

	public abstract boolean exists(String key);
}
