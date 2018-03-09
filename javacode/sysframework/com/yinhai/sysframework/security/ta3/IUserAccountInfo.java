package com.yinhai.sysframework.security.ta3;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import com.yinhai.sysframework.iorg.IUser;

public interface IUserAccountInfo extends Serializable {

	public abstract Collection<IRoleAuthrity> getRoles();

	public abstract String getPassword();

	public abstract String getLoginId();

	public abstract boolean isAccountNonExpired();

	public abstract boolean isAccountNonLocked();

	public abstract boolean isEnabled();

	public abstract IUser getUser();

	public abstract boolean isAccountFirstLogin();

	public abstract Date lastModifyDate();

	public abstract int getPasswordfaultnum();

	public abstract Date getCreateUserDate();
}
