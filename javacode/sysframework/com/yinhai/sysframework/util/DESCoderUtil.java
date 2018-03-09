package com.yinhai.sysframework.util;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Base64;

public class DESCoderUtil {

	public static final String ALGORITHM = "DES";
	public static final String KEY = "reYj6fIsWGE=";

	private static Key toKey(byte[] key) throws Exception {
		DESKeySpec dks = new DESKeySpec(key);
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey secretKey = keyFactory.generateSecret(dks);
		return secretKey;
	}

	public static byte[] decrypt(byte[] data, String key) throws Exception {
		Key k = toKey(decryptBASE64(key));

		Cipher cipher = Cipher.getInstance("DES");
		cipher.init(2, k);

		return cipher.doFinal(data);
	}

	public static byte[] encrypt(byte[] data, String key) throws Exception {
		Key k = toKey(decryptBASE64(key));
		Cipher cipher = Cipher.getInstance("DES");
		cipher.init(1, k);

		return cipher.doFinal(data);
	}

	public static String initKey() throws Exception {
		return initKey(null);
	}

	public static String initKey(String seed) throws Exception {
		SecureRandom secureRandom = null;

		if (seed != null) {
			secureRandom = new SecureRandom(decryptBASE64(seed));
		} else {
			secureRandom = new SecureRandom();
		}

		KeyGenerator kg = KeyGenerator.getInstance("DES");
		kg.init(secureRandom);

		SecretKey secretKey = kg.generateKey();

		return encryptBASE64(secretKey.getEncoded());
	}

	public static byte[] decryptBASE64(String key) throws Exception {
		return new Base64().decode(key);
	}

	public static String encryptBASE64(byte[] key) throws Exception {
		return new Base64().encodeToString(key);
	}

	public static String encryptBASE64NO(byte[] data) throws Exception {
		return new Base64().encodeToString(data).replace("\r\n", "");
	}
}
