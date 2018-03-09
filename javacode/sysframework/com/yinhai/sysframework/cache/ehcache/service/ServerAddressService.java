package com.yinhai.sysframework.cache.ehcache.service;

import java.util.List;

import com.yinhai.sysframework.cache.ehcache.ServerAddress;
import com.yinhai.sysframework.cache.ehcache.domain.ServeraddressDomain;
import com.yinhai.sysframework.dto.ParamDTO;

public interface ServerAddressService {

	public abstract List<String> getALlUserfullServerAddress();

	public abstract List<ServeraddressDomain> query(ParamDTO paramParamDTO);

	public abstract ServerAddress getServerAddress(String paramString);

	public abstract void addServerAddress(ServeraddressDomain paramServeraddressDomain);

	public abstract void updateServerAddress(ServerAddress paramServerAddress);

	public abstract int removeServerAddress(ServerAddress paramServerAddress);
}
