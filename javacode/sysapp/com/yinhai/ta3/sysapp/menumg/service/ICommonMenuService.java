package com.yinhai.ta3.sysapp.menumg.service;

import java.util.List;

import javax.jws.WebService;

import com.yinhai.sysframework.app.domain.Key;
import com.yinhai.sysframework.service.WsService;
import com.yinhai.ta3.system.sysapp.domain.Menu;

@WebService
public interface ICommonMenuService extends WsService {

	public static final String SERVICEKEY = "commonMenuService";

	public abstract List<Menu> getCommonMenusByUserId(Long paramLong);

	public abstract void saveCommonMenus(Long paramLong, List<Key> paramList);

	public abstract void saveCommonMenu(Long paramLong1, Long paramLong2);

	public abstract void deleteCommonMenus(Long paramLong, List<Key> paramList);

	public abstract void deleteCommonMenu(Long paramLong1, Long paramLong2);
}
