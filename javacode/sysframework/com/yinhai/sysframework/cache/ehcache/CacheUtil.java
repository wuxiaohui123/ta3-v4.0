package com.yinhai.sysframework.cache.ehcache;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Ehcache;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.yinhai.sysframework.cache.ehcache.service.ServerAddressService;
import com.yinhai.sysframework.service.ServiceLocator;
import com.yinhai.sysframework.util.ValidateUtil;

public class CacheUtil {

	public static void cacheElementRemove(String cacheName, String key) {
		CacheManager ehCacheManager = (CacheManager) ServiceLocator.getService("ehCacheManager");
		Ehcache cache = ehCacheManager.getEhcache(cacheName);
		if (cache.get(key) != null) {
			cache.remove(key);
		}
	}

	public static boolean cacheSynCodeRemove(Ehcache cache, String key) {
		ServerAddressService service = (ServerAddressService) ServiceLocator.getService("serverAddressService");
		List<String> list = service.getALlUserfullServerAddress();
		if (ValidateUtil.isNotEmpty(list)) {
			for (int i = 0; i < list.size(); i++) {
				myNotify(cache.getName(), key, (String) list.get(i));
			}
		}
		return false;
	}

	private static void myNotify(String cacheName, String key, String address) {
		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();

		CloseableHttpClient closeableHttpClient = httpClientBuilder.build();

		HttpPost httpPost = new HttpPost();
		try {
			httpPost.setURI(new URI(address + (address.endsWith("/") ? "" : "/") + "codetable/synCodeaction.do"));

			List<NameValuePair> formparams = new ArrayList<NameValuePair>();
			formparams.add(new BasicNameValuePair("key", key));
			formparams.add(new BasicNameValuePair("cacheName", cacheName));

			UrlEncodedFormEntity urlEntity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httpPost.setEntity(urlEntity);

			HttpResponse httpResponse = closeableHttpClient.execute(httpPost);

			HttpEntity entity = httpResponse.getEntity();

			httpResponse.getStatusLine();

			if (entity != null) {
				EntityUtils.toString(entity, "UTF-8");
			}
			return;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			try {
				closeableHttpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
