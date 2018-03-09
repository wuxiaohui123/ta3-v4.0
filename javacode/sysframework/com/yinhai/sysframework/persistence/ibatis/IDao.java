package com.yinhai.sysframework.persistence.ibatis;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.event.RowHandler;
import com.yinhai.sysframework.app.domain.BaseDomain;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.dto.PrcDTO;
import com.yinhai.sysframework.exception.PrcException;
import com.yinhai.sysframework.persistence.PageBean;

@SuppressWarnings({"rawtypes","deprecation"})
public interface IDao {

	public abstract int delete(String paramString) throws DataAccessException;

	public abstract int delete(String paramString, Object paramObject) throws DataAccessException;

	public abstract Object insert(String paramString) throws DataAccessException;

	public abstract Object insert(String paramString, Object paramObject) throws DataAccessException;

	public abstract int update(String paramString) throws DataAccessException;

	public abstract int update(String paramString, Object paramObject) throws DataAccessException;

	public abstract Object queryForObject(String paramString) throws DataAccessException;

	public abstract Object queryForObject(String paramString, Object paramObject) throws DataAccessException;

	public abstract List queryForList(String paramString) throws DataAccessException;

	public abstract List queryForList(String paramString, Object paramObject) throws DataAccessException;

	public abstract List queryForPage(String paramString, Object paramObject, int paramInt1, int paramInt2);

	public abstract List queryForPage(String paramString1, String paramString2, ParamDTO paramParamDTO);

	public abstract PageBean queryForPageWithCount(String paramString, Object paramObject, int paramInt1, int paramInt2);

	public abstract PageBean queryForPageWithCount(String paramString1, String paramString2, Object paramObject,
			ParamDTO paramParamDTO);

	public abstract void queryWithRowHandler(String paramString, Object paramObject, RowHandler paramRowHandler);

	public abstract void queryWithRowHandler(String paramString, Object paramObject, RowHandler paramRowHandler,
			int paramInt1, int paramInt2);

	public abstract void callPrc(String paramString, PrcDTO paramPrcDTO) throws PrcException;

	public abstract Connection getConnection() throws SQLException;

	public abstract SqlMapClient getSqlMapClient();

	
	public abstract SqlMapClientTemplate getSqlMapClientTemplate();

	public abstract int saveOldFieldData(ParamDTO paramParamDTO, BaseDomain paramBaseDomain, String paramString1,
			String paramString2);

	public abstract int insertBatch(String paramString, List<?> paramList) throws DataAccessException;
	
	public abstract int updateBatch(String paramString, List<?> paramList) throws DataAccessException;
	
	public abstract int deleteBatch(String paramString, List<?> paramList) throws DataAccessException;
	
	public abstract int executeBatchByJDBC(final String sql,List<?> paramList) throws DataAccessException;
}
