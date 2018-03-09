package com.yinhai.sysframework.app.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.yinhai.sysframework.dto.BaseDTO;
import com.yinhai.sysframework.dto.DTO;
import com.yinhai.sysframework.exception.IllegalInputAppException;
import com.yinhai.sysframework.util.SimpleTypeConvert;
import com.yinhai.sysframework.util.json.JSonFactory;

public class BaseVO implements VO {

	public Map toMap() {
		return null;
	}

	public String toXMLString(String _className) {
		StringBuffer buffer = new StringBuffer();
		String className = getClass().getName();
		if ((_className != null) && (_className.length() > 0))
			className = _className;
		String nodeName = className.substring(className.lastIndexOf(".") + 1);
		nodeName = nodeName.substring(0, 1).toLowerCase() + nodeName.substring(1);
		buffer.append("<" + nodeName + ">\n");
		Iterator keyValuePairs = toMap().entrySet().iterator();
		while (keyValuePairs.hasNext()) {
			Map.Entry entry = (Map.Entry) keyValuePairs.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			buffer.append("<" + key + "><![CDATA[").append(SimpleTypeConvert.convert2String(value, ""))
					.append("]]></" + key + ">").append("\n");
		}
		buffer.append("</" + nodeName + ">");
		return buffer.toString();
	}

	protected String cvtObjToString(Object obj, String type) {
		if (obj == null) {
			return "";
		}
		type = type.toLowerCase();
		if (type.indexOf("date") > -1) {
			return cvtDateToString((Timestamp) obj, "yyyy-MM-dd");
		}
		if (type.indexOf("time") > -1) {
			return cvtDateToString((Timestamp) obj, "yyyy-MM-dd HH:mm:ss");
		}

		return obj.toString();
	}

	protected String cvtDateToString(Date date, String strDateFormat) {
		if (date == null) {
			return null;
		}
		String strDate = "";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		strDate = simpleDateFormat.format(date);
		return strDate;
	}

	public Key getKey() {
		return null;
	}

	public Object[] toArray() {
		return new Object[0];
	}

	public void validateData() throws IllegalInputAppException {
	}

	public String toTabString() {
		return null;
	}

	public DTO toDTO() {
		return new BaseDTO(toMap());
	}

	public String toString() {
		StringBuffer buffer = new StringBuffer();
		DTO dto = toDTO();
		Iterator keyValuePairs = dto.entrySet().iterator();
		while (keyValuePairs.hasNext()) {
			Map.Entry entry = (Map.Entry) keyValuePairs.next();
			DomainMeta meta = getMetadata();
			if (meta != null) {
				buffer.append("值：")
						.append(dto.getAsString((String) entry.getKey(), ""))
						.append(meta.getField((String) entry.getKey()) == null ? "" : meta.getField(
								(String) entry.getKey()).toString());
			}
		}
		return buffer.toString();
	}

	public DomainMeta getMetadata() {
		return null;
	}

	public String toXML() {
		return toXMLString(getClass().getName());
	}

	public String toJson() {
		StringBuilder buffer = new StringBuilder();
		String className = getClass().getName();
		String nodeName = className.substring(className.lastIndexOf(".") + 1);
		nodeName = nodeName.substring(0, 1).toLowerCase() + nodeName.substring(1);
		buffer.append("{");
		Iterator keyValuePairs = toMap().entrySet().iterator();
		boolean notFirst = false;
		while (keyValuePairs.hasNext()) {
			Map.Entry entry = (Map.Entry) keyValuePairs.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			if ((value == null) || ("".equals(value))) {
				if (notFirst) {
					buffer.append(",");
				}
				buffer.append("\"").append(key).append("\":null");
			} else {
				if (notFirst) {
					buffer.append(",");
				}
				buffer.append("\"" + key + "\":");
				if ((value instanceof List)) {
					buffer.append("[");
					List list = (List) value;
					Object tmpObj = null;
					for (int i = 0; i < list.size(); i++) {
						tmpObj = list.get(i);
						if ((tmpObj instanceof BaseVO)) {
							if (i > 0)
								buffer.append(",");
							buffer.append(((BaseVO) tmpObj).toJson());
						} else {
							throw new com.yinhai.sysframework.exception.SysLevelException(
									"toJson生成错误,domain的属性是list类型的，list里面必须是domain");
						}
					}
					buffer.append("]");
				} else if ((value instanceof Object[])) {
					buffer.append("[");
					Object[] list = (Object[]) value;
					Object tmpObj = null;
					for (int i = 0; i < list.length; i++) {
						tmpObj = list[i];
						if (i > 0) {
							buffer.append(",");
						}
						if (tmpObj == null) {
							buffer.append("null");
						} else {
							boolean noy = ((tmpObj instanceof Double)) || ((tmpObj instanceof Long))
									|| ((tmpObj instanceof BigDecimal)) || ((tmpObj instanceof Boolean));
							if ((tmpObj instanceof BaseVO)) {
								buffer.append(((BaseVO) tmpObj).toJson());
							} else if (noy) {
								String valueTmp = SimpleTypeConvert.convert2String(tmpObj, "");
								if (!noy) {
									buffer.append("\"");
								}
								buffer.append(JSonFactory.toJson(valueTmp));

								if (!noy)
									buffer.append("\"");
							} else {
								buffer.append(JSonFactory.bean2json(value));
							}
						}
					}
					buffer.append("]");
				} else {
					boolean noy = ((value instanceof Double)) || ((value instanceof Long))
							|| ((value instanceof BigDecimal)) || ((value instanceof Boolean));
					String valueTmp = SimpleTypeConvert.convert2String(value, "");
					if ((!noy) && (!"".equals(valueTmp)))
						buffer.append("\"");
					buffer.append(JSonFactory.toJson(valueTmp));
					if ((!noy) && (!"".equals(valueTmp))) {
						buffer.append("\"");
					}
				}
			}
			notFirst = true;
		}
		buffer.append("}");
		return buffer.toString();
	}
}
