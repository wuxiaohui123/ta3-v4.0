package com.yinhai.sysframework.cache.ehcache.service;

import javax.jws.WebService;

@WebService
public interface CacheRMIService {

	public abstract boolean removeElement(String paramString1, String paramString2);
}
