package com.yinhai.sysframework.dto;

import com.yinhai.sysframework.iorg.IUser;

public class ParamDTO extends BaseDTO {

	private IUser userInfo;
	private BaseDTO gridInfo;
	private BaseDTO ovDto;

	public IUser getUserInfo() {
		return userInfo;
	}

	public Object put(Object key, Object value) {
		if (value instanceof String[]) {
			String[] t = (String[]) value;
			if (value != null && t.length == 1) {
				return super.put(key, t[0]);
			}
		}
		return super.put(key, value);
	}

	public void setUserInfo(IUser userInfo) {
		this.userInfo = userInfo;
	}

	public Integer getStart(String gridId) {
		Integer startInteger = Integer.valueOf(0);
		if ((gridInfo.get(gridId + "_start") instanceof String[])) {
			startInteger = Integer.valueOf(gridInfo.getAsStringArray(gridId + "_start")[0]);
		} else
			startInteger = gridInfo.getAsInteger(gridId + "_start");
		return startInteger;
	}

	public Integer getLimit(String gridId) {
		Integer limiInteger = Integer.valueOf(0);
		if ((gridInfo.get(gridId + "_limit") instanceof String[])) {
			limiInteger = Integer.valueOf(gridInfo.getAsStringArray(gridId + "_limit")[0]);
		} else
			limiInteger = gridInfo.getAsInteger(gridId + "_limit");
		return limiInteger;
	}

	public void setGridInfo(BaseDTO gridInfo) {
		this.gridInfo = gridInfo;
	}

	public BaseDTO getGridInfo() {
		return gridInfo;
	}

	public ParamDTO append(String key, Object value) {
		put(key, value);
		return this;
	}

	public BaseDTO getOvDto() {
		return ovDto;
	}

	public void setOvDto(BaseDTO ovDto) {
		this.ovDto = ovDto;
	}

}
