package com.yinhai.sysframework.iorg;

import java.util.List;

public interface IOrganizationService {

	public static final String SERVICEKEY = "organizationService";

	public abstract IPosition getPosition(Long paramLong);

	public abstract IUser getUserByLoginId(String paramString);

	public abstract IPosition getUserMainPosition(Long paramLong);

	public abstract void lockUser(Long paramLong);

	public abstract int updateUserFaultNum(Long paramLong, int paramInt);

	public abstract List<IPosition> getUserPositions(Long paramLong);

	public abstract IOrg getOrg(Long paramLong);
}
