package com.yinhai.sysframework.cache.ehcache.dao;

import java.util.List;

import com.yinhai.sysframework.cache.ehcache.ServerAddress;
import com.yinhai.sysframework.cache.ehcache.domain.ServeraddressDomain;

public interface ServerAddressDao {

	public abstract List<ServeraddressDomain> getList(ServerAddress paramServerAddress);

	public abstract void insert(ServeraddressDomain paramServeraddressDomain);

	public abstract ServerAddress getServerAddress(String paramString);

	public abstract List<String> getALlUserfullServerAddress();

	public abstract int delete(ServerAddress paramServerAddress);

	public abstract int update(ServerAddress paramServerAddress);
}
