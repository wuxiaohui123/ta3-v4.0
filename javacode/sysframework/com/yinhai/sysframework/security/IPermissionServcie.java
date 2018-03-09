package com.yinhai.sysframework.security;

import java.util.List;
import java.util.Set;

import com.yinhai.sysframework.iorg.IPosition;
import com.yinhai.sysframework.menu.IMenu;
import com.yinhai.ta3.redis.annotation.LapseMethod;

public interface IPermissionServcie {

	public static final String SERVICEKEY = "permissionServcie";

	public abstract List<IMenu> getUserPermissionMenus(Long paramLong);

	public abstract List<IMenu> getUserPermissionMenus(Long paramLong1, Long paramLong2);

	public abstract Set<String> getUserPermissionUrl(Long paramLong);

	public abstract Set<String> getUserPermissionUrl(Long paramLong1, Long paramLong2);

	public abstract boolean isAdministrator(IPosition paramIPosition);

	public abstract List<IPosition> getPositionsByMenu(Long paramLong1, Long paramLong2);

	public abstract List<IPosition> getUserEffectivePositions(Long paramLong);

	@LapseMethod(name = "getUserPermissionMenus")
	public abstract void clearUserPermissionMenusCache(Long paramLong);

	public abstract void clearUserPermissionMenusCache(Long paramLong1, Long paramLong2);

	public abstract void clearUserPermissionUrlCache(Long paramLong);

	public abstract void clearUserPermissionUrlCache(Long paramLong1, Long paramLong2);

	public abstract void clearPositionsByMenuCache(Long paramLong1, Long paramLong2);

	public abstract void clearUserEffectivePositionsCache(Long paramLong);
}
