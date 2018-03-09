package com.yinhai.sysframework.app.domain;

import java.util.Map;

public abstract class AbstractDomainObject extends BaseVO implements DomainObject {
	private static final long serialVersionUID = 1L;
	public static final String KEY_VALUE = "`";
	private String objid;
	private transient Key key;

	public AbstractDomainObject() {
	}

	public AbstractDomainObject(Key key) {
		this.key = key;
	}

	public String getObjid() {
		if (objid != null) {
			return objid;
		}
		if (getKey() != null)
			return getKey().getId();
		return null;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public Key getKey() {
		if (key != null)
			return key;
		if (objid != null)
			return new Key("id`" + objid);
		return getPK();
	}

	public void setKey(Key key) {
		this.key = key;
	}

	public void setKey(String id) {
		key = new Key(id);
	}

	public boolean equals(Object object) {
		if (null == object)
			return false;
		if (this == object)
			return true;
		if (!(object instanceof AbstractDomainObject)) {
			return false;
		}
		return getKey().equals(((AbstractDomainObject) object).getKey());
	}

	public int hashCode() {
		return getKey().getSortedId().hashCode();
	}

	public String getDomainObjectName() {
		return getClass().getSimpleName();
	}

	public abstract Map toMap();

	public String toJson() {
		return super.toJson();
	}
}
