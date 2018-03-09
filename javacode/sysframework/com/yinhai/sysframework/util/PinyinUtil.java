package com.yinhai.sysframework.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinyinUtil {

	public static String converterToFirstSpell(String chines, boolean UPPERCASE) {
		String pinyinName = "";
		char[] nameChar = chines.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		if (UPPERCASE) {
			defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
		} else {
			defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		}
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < nameChar.length; i++) {

			try {

				String[] pinyin = PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat);
				if (pinyin != null) {
					pinyinName = pinyinName + pinyin[0].charAt(0);
				} else {
					pinyinName = pinyinName + nameChar[i];
				}
			} catch (BadHanyuPinyinOutputFormatCombination e) {
				e.printStackTrace();
			}
		}
		return pinyinName;
	}

	public static String converterToSpell(String chines, boolean UPPERCASE) {
		String pinyinName = "";
		char[] nameChar = chines.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		if (UPPERCASE) {
			defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
		} else {
			defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		}
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < nameChar.length; i++) {

			try {

				String[] pinyin = PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat);
				if (pinyin != null) {
					pinyinName = pinyinName + pinyin[0];
				} else {
					pinyinName = pinyinName + nameChar[i];
				}
			} catch (BadHanyuPinyinOutputFormatCombination e) {
				e.printStackTrace();
			}
		}

		return pinyinName;
	}
}
