package com.yinhai.ta3.organization.service;

import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.app.domain.Key;
import com.yinhai.sysframework.codetable.domain.AppCode;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.iorg.IUser;
import com.yinhai.sysframework.persistence.PageBean;
import com.yinhai.sysframework.service.Service;
import com.yinhai.ta3.system.org.domain.Org;
import com.yinhai.ta3.system.org.domain.Position;
import com.yinhai.ta3.system.org.domain.User;
import com.yinhai.ta3.system.org.domain.UserPerrmissionVO;

public interface IOrgUserMgService extends Service {

	public static final String SERVICEKEY = "orgUserMgService";

	public abstract Org addOrg(ParamDTO paramParamDTO);

	public abstract void editOrg(ParamDTO paramParamDTO);

	public abstract User addUser(ParamDTO paramParamDTO);

	public abstract void editUser(ParamDTO paramParamDTO);

	public abstract void deleteOrg(ParamDTO paramParamDTO);

	public abstract Org queryOrgNode(ParamDTO paramParamDTO);

	public abstract String getMaxCostomNo(Long paramLong);

	public abstract void sortOrg(List<Long> paramList, Long paramLong);

	public abstract PageBean queryUsersInfo(ParamDTO paramParamDTO, String paramString, int paramInt1, int paramInt2);

	public abstract void batchReUser(Long[] paramArrayOfLong, ParamDTO paramParamDTO);

	public abstract void unBatchUseUser(Long[] paramArrayOfLong, ParamDTO paramParamDTO);

	public abstract void unLockUser(Long paramLong, IUser paramIUser);

	public abstract User getUser(Long paramLong);

	public abstract List<Org> queryAffiliatedOrgs(Long paramLong);

	public abstract List<Org> querySubOrgs(Long paramLong, boolean paramBoolean1, boolean paramBoolean2,
			String paramString);

	public abstract List<Long> queryPositionCouldManageOrgIds(Long paramLong);

	public abstract void updateDirectAndAffiliatedOrgs(Long paramLong1, List<Key> paramList, Long paramLong2,
			IUser paramIUser);

	public abstract void resetPassword(ParamDTO paramParamDTO);

	public abstract void deleteUsers(List<Key> paramList, ParamDTO paramParamDTO);

	public abstract List<Position> queryUserPostions(Long paramLong);

	public abstract List<UserPerrmissionVO> queryUserPerrmission(Long paramLong);

	public abstract List<AppCode> queryDataField(Long paramLong1, Long paramLong2);

	public abstract List queryLikeZhengzhi(ParamDTO paramParamDTO);

	public abstract Map getDeputyInfo(Long paramLong);
}
