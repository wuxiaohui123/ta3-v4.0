package com.yinhai.sysframework.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.dao.DataAccessException;

public class Md5PasswordEncrypter implements Md5PasswordEncoder {

	private static final String SALT = "-a1b2";

	public String encodePassword(String password, Object salt) throws DataAccessException {
		if (password == null) {
			password = "";
		}
		String passwordSaltStr = password + SALT;

		byte[] encryptedPassword = Base64.encodeBase64(DigestUtils.md5(passwordSaltStr));

		return new String(encryptedPassword);
	}

	public boolean isPasswordValid(String encPass, String rawPass, Object salt) throws DataAccessException {
		return encPass.equals(encodePassword(rawPass, salt));
	}

}
