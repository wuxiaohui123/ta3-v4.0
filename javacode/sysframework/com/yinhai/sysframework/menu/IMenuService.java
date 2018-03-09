package com.yinhai.sysframework.menu;

import java.util.List;
import java.util.Set;

public interface IMenuService {

	public static final String SERVICEKEY = "menuService";

	public abstract IMenu getMenu(Long paramLong);

	public abstract Set<String> getAllMenusUrl();

	public abstract void clearMenuCach();

	public abstract List<IMenu> getEffectiveMenus(Long paramLong);

	public abstract Set<String> getAllNeedCacheUrl();

	public abstract IMenu getMenuByUrl(String paramString);
}
