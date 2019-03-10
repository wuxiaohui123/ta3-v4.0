package com.yinhai.sysframework.cache.ehcache.domain;

import java.util.HashMap;
import java.util.Map;

import com.yinhai.sysframework.app.domain.BaseDomain;
import com.yinhai.sysframework.app.domain.DomainMeta;
import com.yinhai.sysframework.app.domain.Key;
import com.yinhai.sysframework.cache.ehcache.ServerAddress;

public class ServeraddressDomain extends BaseDomain implements ServerAddress {

	private String address;
	private String canuse;

	public ServeraddressDomain() {
	}

	public ServeraddressDomain(String address) {
		this.address = address;
	}

	public Key getPK() {
		Key key = new Key();
		if (getAddress() == null) {
			throw new IllegalArgumentException("主键不能为空！");
		}
		key.put("address", getAddress());
		return key;
	}

	public ServeraddressDomain(String address, String canuse) {
		this.address = address;
		this.canuse = canuse;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setCanuse(String canuse) {
		this.canuse = canuse;
	}

	public String getCanuse() {
		return canuse;
	}

	public Map toMap() {
		Map map = new HashMap();
		map.put("address", getAddress());
		map.put("canuse", getCanuse());

		return map;
	}

	public DomainMeta getMetadata() {
		DomainMeta domainMeta = new DomainMeta("ServeraddressDomain", "serveraddress", "集群各个server的应用地址",
				"serveraddress", "javacode/sysapp/com/yinhai/ta3/sysapp/serveraddress/domain/Serveraddress.xml");

		domainMeta.appendField("address", "address", "应用地址ַ", "String", "VARCHAR(200)", 200, true, true, false);

		domainMeta.appendField("canuse", "canuse", "是否启用", "String", "VARCHAR(1)", 1, false, true, false);

		return domainMeta;
	}

}
