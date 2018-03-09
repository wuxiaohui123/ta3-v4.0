package com.yinhai.ta3.sysapp.syslogmg.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.jws.WebService;

import com.yinhai.sysframework.log.Taserverexceptionlog;
import com.yinhai.sysframework.persistence.PageBean;

@WebService
public interface ServerExceptionLogDao {

	///////////////////////// Oracle/Mysql 数据库/////////////////////////
	public abstract void insert(Taserverexceptionlog taserverexceptionlog);

	public abstract List<Taserverexceptionlog> getList(Timestamp timestamp1, Timestamp timestamp2);

	public abstract Taserverexceptionlog getTaserverexceptionlog(String str);

	public abstract void delete(String str);

	public abstract PageBean getPage(String str, Timestamp timestamp1, Timestamp timestamp2, int int1, int int2);

	public abstract PageBean getPageByCount(String str, Timestamp timestamp1, Timestamp timestamp2, int int1, int int2);
	
	
    ///////////////////////// MongoDb 数据库/////////////////////////
	public abstract void insertMongo(Taserverexceptionlog taserverexceptionlog);

	public abstract List<Taserverexceptionlog> getListByMongo(Timestamp timestamp1, Timestamp timestamp2);

	public abstract Taserverexceptionlog getTaserverexceptionlogByMongo(String str);

	public abstract void deleteByMongo(String str);

	public abstract PageBean getPageByMongo(String str, Timestamp timestamp1, Timestamp timestamp2, int int1, int int2);

	public abstract PageBean getPageByCountByMongo(String str, Timestamp timestamp1, Timestamp timestamp2, int int1, int int2);
}
