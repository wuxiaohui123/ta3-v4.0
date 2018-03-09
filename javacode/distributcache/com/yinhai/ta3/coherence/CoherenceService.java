package com.yinhai.ta3.coherence;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import com.esotericsoftware.kryo.Kryo;
import com.esotericsoftware.kryo.io.Input;
import com.esotericsoftware.kryo.io.Output;
import com.esotericsoftware.shaded.org.objenesis.strategy.StdInstantiatorStrategy;
import com.tangosol.net.CacheFactory;
import com.tangosol.net.NamedCache;
import com.yinhai.ta3.redis.CacheService;

public class CoherenceService implements CacheService {
	private NamedCache cache = CacheFactory.getCache("$system$");
	private Kryo kryo = new Kryo();
	private Output output = new Output();
	private Input input = new Input();

	public CoherenceService() {
		this.kryo.setReferences(false);
		this.kryo.setRegistrationRequired(false);
		this.kryo.setInstantiatorStrategy(new StdInstantiatorStrategy());
		this.output.setBuffer(new byte['?']);
		this.input.setBuffer(new byte['?']);
	}

	public void del(String paramVarArgs) {
		this.cache.remove(paramVarArgs);
	}

	public boolean exists(String paramString) {
		return this.cache.containsKey(paramString);
	}

	public void expire(String paramString, int paramInt) {
		this.cache.put(paramString, this.cache.get(paramString), paramInt);
	}

	public Object get(String paramString) {
		return this.cache.get(paramString);
	}

	public void set(String paramString, Object paramObject) {
		this.cache.put(paramString, paramObject);
	}

	private Object toObject(byte[] paramArrayOfByte) {
		if (paramArrayOfByte == null) {
			return null;
		}
		this.input.setInputStream(new ByteArrayInputStream(paramArrayOfByte));
		return this.kryo.readClassAndObject(this.input);
	}

	private byte[] toBytes(Object paramObject) {
		ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
		this.output.setOutputStream(localByteArrayOutputStream);
		this.kryo.writeClassAndObject(this.output, paramObject);
		this.output.flush();
		return localByteArrayOutputStream.toByteArray();
	}
}
