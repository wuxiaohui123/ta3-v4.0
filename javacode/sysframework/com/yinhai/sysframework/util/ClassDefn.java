package com.yinhai.sysframework.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yinhai.sysframework.exception.SysLevelException;

public class ClassDefn {

	private static Log log = LogFactory.getLog(ClassDefn.class);
	private String name;
	private Class<?> clazz;
	private Map<String, Constructor<?>> constructors = new HashMap<String, Constructor<?>>();
	private Map<Object, Method> methods = new HashMap<Object, Method>();
	private Map<String, PropertyDescriptor> props = new HashMap<String, PropertyDescriptor>();
	private Map<String, Field> fields = new HashMap<String, Field>();

	public ClassDefn(Class<?> clazz) {
		name = clazz.getName();
		this.clazz = clazz;
		loadClassDefn(clazz);
	}

	private void loadClassDefn(Class<?> clazz) {
		log.debug("开始加载类定义：" + clazz.getName());
		Constructor<?>[] constructors = clazz.getConstructors();
		for (int i = 0; i < constructors.length; i++) {
			log.debug("缓存构造方法：" + constructors[i].getName()
					+ ReflectUtil.getParmTypesDesc(constructors[i].getParameterTypes()));
			this.constructors.put(ReflectUtil.getParmTypesDesc(constructors[i].getParameterTypes()), constructors[i]);
		}

		Field[] fileds = clazz.getFields();
		for (int i = 0; i < fileds.length; i++) {
			log.debug("缓存成员变量：" + fileds[i].getName());
			fields.put(fileds[i].getName(), fileds[i]);
		}
		BeanInfo bi;
		try {
			bi = Introspector.getBeanInfo(clazz);
		} catch (IntrospectionException e) {
			throw new SysLevelException(e);
		}
		PropertyDescriptor[] pd = bi.getPropertyDescriptors();
		for (int i = 0; i < pd.length; i++) {
			log.debug("缓存成员属性：" + pd[i].getName());
			props.put(pd[i].getName(), pd[i]);
		}

		Method[] methods = clazz.getMethods();
		for (int i = 0; i < methods.length; i++) {
			log.debug("缓存成员方法：" + methods[i].getName() + ReflectUtil.getParmTypesDesc(methods[i].getParameterTypes()));
			this.methods.put(methods[i].getName() + ReflectUtil.getParmTypesDesc(methods[i].getParameterTypes()),
					methods[i]);
		}
		log.debug("加载类定义：" + clazz.getName() + "成功");
	}

	public Class<?> getClazz() {
		return clazz;
	}

	public Map<String, Constructor<?>> getConstructors() {
		return constructors;
	}

	public Map<String, Field> getFields() {
		return fields;
	}

	public Map<Object, Method> getMethods() {
		return methods;
	}

	public String getName() {
		return name;
	}

	public Map<String, PropertyDescriptor> getProps() {
		return props;
	}
}
