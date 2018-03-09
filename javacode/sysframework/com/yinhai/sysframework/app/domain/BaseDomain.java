package com.yinhai.sysframework.app.domain;

import java.util.HashMap;
import java.util.Map;

public class BaseDomain extends AbstractDomainObject {

	public boolean equals(Object o) {
		if (null == o)
			return false;
		if (this == o) {
			return true;
		}
		if (o.getClass().toString().equals(getClass().toString())) {
			BaseDomain od = (BaseDomain) o;
			if (getPK().equals(od.getPK())) {
				return true;
			}
		}
		return false;
	}

	public int hashCode() {
		return getKey().getSortedId().hashCode();
	}

	public Map toMap() {
		return null;
	}

	public String toJson() {
		return super.toJson();
	}

	public Key getPK() {
		return null;
	}

	public static void main(String[] args) {
		Map map = new HashMap();
		map.put("aac001", "11");
		map.put("aac003", "22");
		Map map2 = new HashMap();
		map2.put("aac003", "22");
		map2.put("aac001", Integer.valueOf(11));
	}
}
