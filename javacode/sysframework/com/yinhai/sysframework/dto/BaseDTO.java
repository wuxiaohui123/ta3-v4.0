package com.yinhai.sysframework.dto;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yinhai.sysframework.app.domain.DomainObject;
import com.yinhai.sysframework.app.domain.VO;
import com.yinhai.sysframework.exception.AppException;
import com.yinhai.sysframework.util.ReflectUtil;
import com.yinhai.sysframework.util.SimpleTypeConvert;
import com.yinhai.sysframework.util.ValidateUtil;

public class BaseDTO extends HashMap implements DTO {

	private static final long serialVersionUID = 1L;
	private transient Log log = LogFactory.getLog(getClass());

	private static final String FIELDS_NOTEMPTY_SELECT = "fields_notempty_select";

	private static final String FIELDS_NOTEMPTY_UPDATE = "fields_notempty_update";

	private static final String FIELDS_NOTEMPTY_INSERT = "fields_notempty_insert";

	private static final String FIELDS_NOTEMPTY_DELETE = "fields_notempty_delete";

	private static final String FIELDS_NOTEMPTY_PRC = "fields_notempty_prc";

	public BaseDTO() {
	}

	public BaseDTO(String xml) {
	}

	public BaseDTO(String key, Object object) {
		super.put(key, object);
	}

	public BaseDTO(String key, List listObject) {
		super.put(key, listObject);
	}

	public BaseDTO(Map map) {
		super.putAll(map);
	}

	public BaseDTO(String key, DomainObject object) {
		super.put(key, object);
	}

	public BaseDTO(DomainObject object) {
		super.putAll(object.toMap());
	}

	public Map getDtoAsMap() {
		return this;
	}

	public DomainObject getAsDomainObject(String key) {
		return (DomainObject) super.get(key);
	}

	public DomainObject toDomainObject(String domainClass) {
		DomainObject domain = null;
		try {
			domain = (DomainObject) ReflectUtil.newInstance(domainClass);
			ReflectUtil.copyMapToObject(this, domain, false);
		} catch (Exception ex) {
			if (log.isDebugEnabled()) {
				ex.printStackTrace();
			}
			throw new AppException("DTO生成DomainObject对象失败，原因是：" + ex.getMessage());
		}
		return domain;
	}

	public DomainObject toDomainObject(Class domainClass) {
		DomainObject domain = null;
		try {
			domain = (DomainObject) ReflectUtil.newInstance(domainClass);
			ReflectUtil.copyMapToObject(this, domain, false);
		} catch (Exception ex) {
			if (log.isDebugEnabled()) {
				ex.printStackTrace();
			}
			throw new AppException("DTO生成DomainObject对象失败，原因是：" + ex.getMessage());
		}
		return domain;
	}

	public VO toVO(String voClass) {
		VO vo = null;
		try {
			vo = (VO) ReflectUtil.newInstance(voClass);
			ReflectUtil.copyMapToObject(this, vo, false);
		} catch (Exception ex) {
			if (log.isDebugEnabled()) {
				ex.printStackTrace();
			}
			throw new AppException("DTO生成VO对象失败，原因是：" + ex.getMessage());
		}
		return vo;
	}

	public VO toVO(Class voClass) {
		VO vo = null;
		try {
			vo = (VO) ReflectUtil.newInstance(voClass);
			ReflectUtil.copyMapToObject(this, vo, false);
		} catch (Exception ex) {
			if (log.isDebugEnabled()) {
				ex.printStackTrace();
			}
			throw new AppException("DTO生成VO对象失败，原因是：" + ex.getMessage());
		}
		return vo;
	}

	public String toString() {
		StringBuffer buffer = new StringBuffer();
		int mapsize = size();
		Iterator keyValuePairs = entrySet().iterator();
		Object key = null;
		Object value = null;
		for (int i = 0; i < mapsize; i++) {
			Map.Entry entry = (Map.Entry) keyValuePairs.next();
			key = entry.getKey();
			value = entry.getValue();
			buffer.append(key).append(":").append(value).append("\n");
		}
		return buffer.toString();
	}

	public String toXML() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<data>");
		Iterator keyValuePairs = entrySet().iterator();
		while (keyValuePairs.hasNext()) {
			Map.Entry entry = (Map.Entry) keyValuePairs.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			buffer.append("<" + key + ">").append(value).append("</" + key + ">").append("\n");
		}
		buffer.append("</data>");
		return buffer.toString();
	}

	public Integer getAsInteger(String key) {
		Object obj = SimpleTypeConvert.convert(get(key), "Integer", null);
		if (obj != null)
			return (Integer) obj;
		return null;
	}

	public Long getAsLong(String key) {
		Object obj = SimpleTypeConvert.convert(get(key), "Long", null);
		if (obj != null)
			return (Long) obj;
		return null;
	}

	public String getAsString(String key) {
		Object obj = SimpleTypeConvert.convert(get(key), "String", null);
		if (obj != null)
			return (String) obj;
		return "";
	}

	public BigDecimal getAsBigDecimal(String key) {
		Object obj = SimpleTypeConvert.convert(get(key), "BigDecimal", null);
		if (obj != null) {
			return (BigDecimal) obj;
		}
		return null;
	}

	public Date getAsDate(String key) {
		Object obj = SimpleTypeConvert.convert(get(key), "Date", "yyyy-MM-dd");
		if (obj != null)
			return (Date) obj;
		return null;
	}

	public Timestamp getAsTimestamp(String key) {
		Object obj = SimpleTypeConvert.convert(get(key), "Timestamp", "yyyy-MM-dd HH:mm:ss");
		if (obj != null)
			return (Timestamp) obj;
		return null;
	}

	public Integer getAsInteger(String key, int defaultValue) {
		Integer obj = getAsInteger(key);
		return obj != null ? obj : Integer.valueOf(defaultValue);
	}

	public Long getAsLong(String key, long defaultValue) {
		Long obj = getAsLong(key);
		return obj != null ? obj : Long.valueOf(defaultValue);
	}

	public BigDecimal getAsBigDecimal(String key, double defaultValue) {
		BigDecimal obj = getAsBigDecimal(key);
		return obj != null ? obj : BigDecimal.valueOf(defaultValue);
	}

	public Date getAsDate(String key, Date defaultValue) {
		Date obj = getAsDate(key);
		return obj != null ? obj : defaultValue;
	}

	public Timestamp getAsTimestamp(String key, Timestamp defaultValue) {
		Timestamp obj = getAsTimestamp(key);
		return obj != null ? obj : defaultValue;
	}

	public String getAsString(String key, String defaultValue) {
		String obj = getAsString(key);
		return obj != null ? obj : defaultValue;
	}

	public String[] getAsStringArray(String key) {
		Object tmp = get(key);
		if (!ValidateUtil.isEmpty(tmp)) {
			if ((tmp instanceof String[])) {
				return (String[]) tmp;
			}
			return new String[] { (String) tmp };
		}

		return new String[0];
	}

	public DTO getSubDto(String fieldNames) {
		DTO dto = new BaseDTO();
		String[] fields = fieldNames.split("\\,");
		for (int i = 0; i < fields.length; i++) {
			dto.put(fields[i].trim(), get(fields[i].trim()));
		}
		return dto;
	}

	public DTO append(String key, Object value) {
		put(key, value);
		return this;
	}

	public DTO checkNotEmptyForDelete(String keys) {
		put("fields_notempty_delete", keys);
		return this;
	}

	public DTO checkNotEmptyForInsert(String keys) {
		put("fields_notempty_insert", keys);
		return this;
	}

	public DTO checkNotEmptyForSelect(String keys) {
		put("fields_notempty_select", keys);
		return this;
	}

	public DTO checkNotEmptyForUpdate(String keys) {
		put("fields_notempty_update", keys);
		return this;
	}

	public DTO checkNotEmptyForPrc(String keys) {
		put("fields_notempty_prc", keys);
		return this;
	}

	public String[] getNotEmptyForDelete() {
		Object keys = get("fields_notempty_delete");
		if ((keys != null) && (keys.toString().trim().length() != 0)) {
			return keys.toString().split("\\,");
		}
		return null;
	}

	public String[] getNotEmptyForInsert() {
		Object keys = get("fields_notempty_insert");
		if ((keys != null) && (keys.toString().trim().length() != 0)) {
			return keys.toString().split("\\,");
		}
		return null;
	}

	public String[] getNotEmptyForSelect() {
		Object keys = get("fields_notempty_select");
		if ((keys != null) && (keys.toString().trim().length() != 0)) {
			return keys.toString().split("\\,");
		}
		return null;
	}

	public String[] getNotEmptyForUpdate() {
		Object keys = get("fields_notempty_update");
		if ((keys != null) && (keys.toString().trim().length() != 0)) {
			return keys.toString().split("\\,");
		}
		return null;
	}

	public String[] getNotEmptyForPrc() {
		Object keys = get("fields_notempty_prc");
		if ((keys != null) && (keys.toString().trim().length() != 0)) {
			return keys.toString().split("\\,");
		}
		return null;
	}

	public boolean isEmpty(String key) {
		return ValidateUtil.isEmpty(get(key));
	}

	public boolean isNotEmpty(String key) {
		return !isEmpty(key);
	}
}
