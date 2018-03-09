package com.yinhai.ta3.organization.api;

import java.util.Date;

import com.yinhai.ta3.system.org.domain.PermissionInfoVO;
import com.yinhai.ta3.system.org.domain.UserPositionId;

public interface IGrantService {

	public static final String SERVICEKEY = "grantService";

	public abstract UserPositionId grantPositionToUser(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean retrievePositionFromUser(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean grantUserFunctionUsePermission(Long paramLong1, Long paramLong2, Long paramLong3, Long paramLong4, Date paramDate);

	public abstract boolean retrieveUserFunctionUsePermission(Long paramLong1, Long paramLong2, Long paramLong3, Long paramLong4, Date paramDate);

	public abstract boolean grantUserFunctionAuthrityPermission(Long paramLong1, Long paramLong2, Long paramLong3, boolean paramBoolean,
			Long paramLong4, Date paramDate);

	public abstract boolean retrieveUserFunctionAuthtiryPermission(Long paramLong1, Long paramLong2, Long paramLong3, Long paramLong4, Date paramDate);

	public abstract boolean retrieveUserFunctionReAuthtiryPermission(Long paramLong1, Long paramLong2, Long paramLong3, Long paramLong4,
			Date paramDate);

	public abstract boolean grantPositionFunctionUsePermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean retrievePositionFunctionUsePermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean grantPositionFunctionAuthrityPermission(Long paramLong1, Long paramLong2, boolean paramBoolean, Long paramLong3,
			Date paramDate);

	public abstract boolean retrievePositionFunctionAuthtiryPermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean retrievePositionFunctionReAuthtiryPermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean grantUserFunctionUsePermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean retrieveUserFunctionUsePermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean grantUserFunctionAuthrityPermission(Long paramLong1, Long paramLong2, boolean paramBoolean, Long paramLong3,
			Date paramDate);

	public abstract boolean retrieveUserFunctionAuthtiryPermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean retrieveUserFunctionReAuthtiryPermission(Long paramLong1, Long paramLong2, Long paramLong3, Date paramDate);

	public abstract boolean permissionChangeUniteFunction(PermissionInfoVO paramPermissionInfoVO);
}
