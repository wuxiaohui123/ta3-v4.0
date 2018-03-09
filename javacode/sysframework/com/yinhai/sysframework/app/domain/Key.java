package com.yinhai.sysframework.app.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.yinhai.sysframework.dto.BaseDTO;
import com.yinhai.sysframework.dto.DTO;
import com.yinhai.sysframework.util.ValidateUtil;

public class Key<K, V> extends BaseDTO {

	public Key() {
	}

	public Key(String key1, Object val1) {
		put(key1, val1);
	}

	public Key(String key1, Object val1, String key2, Object val2) {
		put(key1, val1);
		put(key2, val2);
	}

	public Key(String key1, Object val1, String key2, Object val2, String key3, Object val3) {
		put(key1, val1);
		put(key2, val2);
		put(key3, val3);
	}

	public Key(String key1, Object val1, String key2, Object val2, String key3, Object val3, String key4, Object val4) {
		put(key1, val1);
		put(key2, val2);
		put(key3, val3);
		put(key4, val4);
	}

	public Key(DTO dto) {
		putAll(dto);
	}

	public Key(String[] keys, Object[] values) {
		for (int i = 0; i < keys.length; i++) {
			put(keys[i], values[i]);
		}
	}

	public Key(Map p1) {
		super(p1);
	}

	public Key(String id) {
		makeKey(id);
	}

	public String getId() {
		StringBuffer sb = new StringBuffer("");
		Map.Entry entry = null;
		for (Iterator iterator = entrySet().iterator(); iterator.hasNext();) {
			entry = (Map.Entry) iterator.next();
			sb.append(entry.getKey().toString() + "`"
					+ (ValidateUtil.isEmpty(entry.getValue()) ? "" : entry.getValue().toString())
					+ (iterator.hasNext() ? "^" : ""));
		}

		return sb.toString();
	}

	public String getSortedId() {
		StringBuffer sb = new StringBuffer("");
		List keys = new ArrayList(keySet());
		Collections.sort(keys);
		Object entry = null;
		for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
			entry = iterator.next();
			sb.append(entry.toString() + "`" + (ValidateUtil.isEmpty(get(entry)) ? "" : get(entry).toString())
					+ (iterator.hasNext() ? "^" : ""));
		}

		return sb.toString();
	}

	public Map getKeyMap() {
		return this;
	}

	public void makeKey(String id) {
		StringTokenizer entrys = new StringTokenizer(id, "^");
		while (entrys.hasMoreTokens()) {
			StringTokenizer items = new StringTokenizer(entrys.nextToken(), "`");

			put(items.nextToken(), items.hasMoreTokens() ? items.nextToken() : null);
		}
	}

	public Object value(String key) {
		return get(key);
	}

	public void checkKeyNotNull() {
		if (size() < 1) {
			throw new IllegalArgumentException("Key�����������һ���ֶΣ�");
		}
		Iterator iterator = values().iterator();
		for (Object o = iterator.next(); iterator.hasNext(); o = iterator.next()) {
			if (o == null) {
				throw new IllegalArgumentException("Key�಻���п��ֶΣ�");
			}
		}
	}

	public void checkSingleKey() {
		if (size() != 1) {
			throw new IllegalStateException("Cannot take value on composite key");
		}
	}
}
