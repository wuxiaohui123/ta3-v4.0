package com.yinhai.sysframework.util;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.yinhai.sysframework.util.json.JSonFactory;

public abstract class CollectionUtils {

	public static Collection<Object> eliminateRepetition(Collection<Object> c1) {
		List<Object> c2 = new ArrayList<Object>();
		List<Object> c3 = new ArrayList<Object>();
		Object o = null;
		for (Iterator<Object> iter = c1.iterator(); iter.hasNext();) {
			o = iter.next();
			if (c2.contains(o)) {
				c3.add(o);
			} else
				c2.add(o);
		}
		c1.clear();
		c1.addAll(c2);
		return c3;
	}

	public static Collection<Object> union(Collection<?> c1, Collection<?> c2) {
		Collection<Object> c3 = unionAll(c1, c2);
		eliminateRepetition(c3);
		return c3;
	}

	public static Collection<Object> unionAll(Collection<?> c1, Collection<?> c2) {
		List<Object> c3 = new ArrayList<Object>();
		c3.addAll(c1);
		c3.addAll(c2);
		return c3;
	}

	public static Collection<Object> intersect(Collection<?> c1, Collection<?> c2) {
		Collection<Object> c3 = intersectAll(c1, c2);
		eliminateRepetition(c3);
		return c3;
	}

	public static Collection<Object> intersectAll(Collection<?> c1, Collection<?> c2) {
		List<Object> c3 = new ArrayList<Object>(c1);
		List<Object> c4 = new ArrayList<Object>(c2);
		c4.retainAll(c1);
		c3.retainAll(c2);
		c3.addAll(c4);
		return c3;
	}

	public static Collection<Object> minus(Collection<?> c1, Collection<?> c2) {
		Collection<Object> c3 = minusAll(c1, c2);
		eliminateRepetition(c3);
		return c3;
	}

	public static Collection<Object> minusAll(Collection<?> c1, Collection<?> c2) {
		List<Object> c3 = new ArrayList<Object>();
		Object o = null;
		for (Iterator<?> iter = c1.iterator(); iter.hasNext();) {
			o = iter.next();
			if (!c2.contains(o))
				c3.add(o);
		}
		return c3;
	}

	public static boolean equals(Object o1, Object o2, String[] conditionProperties) throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {
		if (((null == o1) && (null != o2)) || ((null != o1) && (null == o2)))
			return false;
		if ((null == o1) && (null == o2))
			return true;
		if ((null != o1) && (null != o2) && ((null == conditionProperties) || (0 == conditionProperties.length))) {
			return o1.equals(o2);
		}
		Object v1 = null;
		Object v2 = null;
		for (int i = 0; i < conditionProperties.length; i++) {
			v1 = BeanUtils.getProperty(o1, conditionProperties[i]);
			v2 = BeanUtils.getProperty(o2, conditionProperties[i]);
			if (((null == v1) && (null != v2)) || ((null != v1) && (null == v2)))
				return false;
			if ((null != v1) && (null != v2) && (!v1.equals(v2))) {
				return false;
			}
		}
		return true;
	}

	public static Map<String, Object> getConditionKeyMap(Object o1, String[] properties) {
		if (null == o1)
			return null;
		Map<String, Object> keyMap = new HashMap<String, Object>();
		if ((null == properties) || (0 == properties.length)) {
			keyMap.put(o1.getClass().getName(), o1);
			return keyMap;
		}
		for (int i = 0; i < properties.length; i++) {
			try {
				keyMap.put(properties[i], BeanUtils.getProperty(o1, properties[i]));
			} catch (Exception e) {
				keyMap.put(properties[i], null);
			}
		}
		return keyMap;
	}

	public static List<Object> getConditionKeyList(Object o1, String[] properties) {
		if (null == o1)
			return null;
		List<Object> keyList = new ArrayList<Object>();
		if ((null == properties) || (0 == properties.length)) {
			keyList.add(o1);
			return keyList;
		}
		for (int i = 0; i < properties.length; i++) {
			try {
				keyList.add(BeanUtils.getProperty(o1, properties[i]));
			} catch (Exception e) {
				keyList.add(null);
			}
		}
		return keyList;
	}

	public static Collection<Object> eliminateRepetition(Collection<Object> c1, String[] conditionProperties) {
		if ((null == conditionProperties) || (0 == conditionProperties.length))
			eliminateRepetition(c1);
		Map<Map<?, ?>, Object> m2 = new HashMap<Map<?, ?>, Object>();
		List<Object> c3 = new ArrayList<Object>();

		Object o = null;
		Map<?, ?> k = null;
		for (Iterator<Object> iter = c1.iterator(); iter.hasNext();) {
			o = iter.next();
			k = getConditionKeyMap(o, conditionProperties);
			if (m2.containsKey(k)) {
				c3.add(o);
			} else
				m2.put(k, o);
		}
		c1.clear();
		c1.addAll(m2.values());
		return c3;
	}

	public static Collection<Object> union(Collection<?> c1, Collection<?> c2, String[] conditionProperties) {
		if ((null == conditionProperties) || (0 == conditionProperties.length))
			union(c1, c2);
		Collection<Object> c3 = unionAll(c1, c2);
		eliminateRepetition(c3, conditionProperties);
		return c3;
	}

	public static Collection intersect(Collection<?> c1, Collection<?> c2, String[] conditionProperties) {
		if ((null == conditionProperties) || (0 == conditionProperties.length)) {
			intersect(c1, c2);
		}
		List c4 = new ArrayList();
		Map key = null;
		for (Iterator iter = c2.iterator(); iter.hasNext();) {
			key = getConditionKeyMap(iter.next(), conditionProperties);
			if (!c4.contains(key)) {
				c4.add(key);
			}
		}
		Map m3 = new HashMap();
		Map key1 = null;
		Object o1 = null;
		for (Iterator iter = c1.iterator(); iter.hasNext();) {
			o1 = iter.next();
			key1 = getConditionKeyMap(o1, conditionProperties);
			if (c4.contains(key1)) {
				m3.put(key1, o1);
			}
		}
		return m3.values();
	}

	public static Collection intersectAll(Collection c1, Collection c2, String[] conditionProperties) {
		if ((null == conditionProperties) || (0 == conditionProperties.length))
			intersectAll(c1, c2);
		Map m1 = new HashMap();
		Object o1 = null;
		Map key = null;
		List values = null;
		for (Iterator iter = c1.iterator(); iter.hasNext();) {
			o1 = iter.next();
			key = getConditionKeyMap(o1, conditionProperties);
			values = (List) m1.get(key);
			if (null == values) {
				values = new ArrayList();
				m1.put(key, values);
			}
			values.add(o1);
		}
		Map m2 = new HashMap();
		List c3 = new ArrayList();
		Object o2 = null;
		Map key2 = null;
		Object value = null;
		for (Iterator iter = c2.iterator(); iter.hasNext();) {
			o2 = iter.next();
			key2 = getConditionKeyMap(o2, conditionProperties);
			value = m1.get(key2);
			if (null != value) {
				c3.add(o2);
				m2.put(key2, value);
			}
		}
		for (Iterator iter = m2.values().iterator(); iter.hasNext();) {
			c3.addAll((List) iter.next());
		}
		return c3;
	}

	public static Collection minus(Collection c1, Collection c2, String[] conditionProperties) {
		if ((null == conditionProperties) || (0 == conditionProperties.length))
			minus(c1, c2);
		List c4 = new ArrayList();
		Map key = null;
		for (Iterator iter = c2.iterator(); iter.hasNext();) {
			key = getConditionKeyMap(iter.next(), conditionProperties);

			c4.add(key);
		}

		Map m3 = new HashMap();
		Object o1 = null;
		Map key1 = null;
		for (Iterator iter = c1.iterator(); iter.hasNext();) {
			o1 = iter.next();
			key1 = getConditionKeyMap(o1, conditionProperties);
			if (!c4.contains(key1)) {
				m3.put(key1, o1);
			}
		}
		return m3.values();
	}

	public static Collection minusAll(Collection c1, Collection c2, String[] conditionProperties) {
		if ((null == conditionProperties) || (0 == conditionProperties.length))
			minusAll(c1, c2);
		List c4 = new ArrayList();
		Map key = null;
		for (Iterator iter = c2.iterator(); iter.hasNext();) {
			key = getConditionKeyMap(iter.next(), conditionProperties);

			c4.add(key);
		}

		List c3 = new ArrayList();
		Object o1 = null;
		for (Iterator iter = c1.iterator(); iter.hasNext();) {
			o1 = iter.next();
			if (!c4.contains(getConditionKeyMap(o1, conditionProperties))) {
				c3.add(o1);
			}
		}
		return c3;
	}

	public static Object findValueOfType(Collection coll, Class type) throws IllegalArgumentException {
		Object value = null;
		Object obj = null;
		for (Iterator it = coll.iterator(); it.hasNext();) {
			obj = it.next();
			if (type.isInstance(obj)) {
				if (value != null) {
					throw new IllegalArgumentException("More than one value of type [" + type.getName() + "] found");
				}
				value = obj;
			}
		}
		return value;
	}

	public static Object findValueOfType(Collection coll, Class[] types) throws IllegalArgumentException {
		Object value = null;
		for (int i = 0; i < types.length; i++) {
			value = findValueOfType(coll, types[i]);
			if (value != null) {
				return value;
			}
		}
		return null;
	}

	public static String mapToJson(Map map) {
		StringBuilder sb = new StringBuilder();
		Iterator<Map.Entry> it = map.entrySet().iterator();
		sb.append("{");
		boolean noFirst = false;
		while (it.hasNext()) {
			Map.Entry next = (Map.Entry) it.next();
			Object value = next.getValue();
			if (noFirst) {
				sb.append(",");
			}
			sb.append("\"").append(next.getKey()).append("\":");

			boolean noy = ((value instanceof Double)) || ((value instanceof Long)) || ((value instanceof BigDecimal))
					|| ((value instanceof Boolean));
			boolean isstring = ((value instanceof String)) || ((value instanceof StringBuilder))
					|| ((value instanceof StringBuffer)) || ((value instanceof java.util.Date))
					|| ((value instanceof java.sql.Date)) || ((value instanceof Timestamp));
			if (value == null) {
				sb.append("null");
			} else if ((isstring) || (noy)) {
				String valueTmp = SimpleTypeConvert.convert2String(value, "");
				if (!noy)
					sb.append("\"");
				sb.append(JSonFactory.toJson(valueTmp));
				if (!noy)
					sb.append("\"");
			} else {
				sb.append(JSonFactory.bean2json(value));
			}
			noFirst = true;
		}
		sb.append("}");
		return sb.toString();
	}
}
