package com.yinhai.ta3.sysapp.syslogmg.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.yinhai.sysframework.config.SysConfig;
import com.yinhai.sysframework.iorg.IUser;
import com.yinhai.sysframework.service.ServiceLocator;
import com.yinhai.sysframework.util.DateUtil;
import com.yinhai.sysframework.util.ValidateUtil;
import com.yinhai.ta3.organization.service.IUserMgService;
import com.yinhai.ta3.sysapp.syslogmg.domain.Taloginhistorylog;
import com.yinhai.ta3.sysapp.syslogmg.domain.Taonlinelog;
import com.yinhai.webframework.BaseAction;

@Namespace("/sysapp")
@AllowedMethods({ "queryTaOnlineLog", "queryTaUserLoginHisLog" })
@Action(value = "userLoginLogAction", results = {
		@Result(name = "success", location = "/sysapp/syslogmg/userLoginLog.jsp") })
@SuppressWarnings("unchecked")
public class UserLoginLogAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -57269194783187552L;
	private IUserMgService userMgService = (IUserMgService) ServiceLocator.getService("userMgService");
	private MongoTemplate mongoTemplate = (MongoTemplate) ServiceLocator.getService("mongoTemplate");

	@Override
	public String execute() throws Exception {
		List<Taonlinelog> list = new ArrayList<Taonlinelog>();
		if (SysConfig.getSysconfigToBoolean("isMongo", true)) {
			list = mongoTemplate.findAll(Taonlinelog.class);
		} else {
			list = getHibernateDao().find("from Taonlinelog");
		}
		for (Taonlinelog taonlinelog : list) {
			IUser user = userMgService.getUser(taonlinelog.getUserid());
			taonlinelog.setName(user.getName());
			taonlinelog.setUsername(user.getLoginid());
			taonlinelog.setTelphone(user.getOfficetel());
		}
		setList("userLoginLogList", list);

		return SUCCESS;
	}

	public String queryTaOnlineLog() throws Exception {
		String name = getDto().getAsString("name");
		String clientip = getDto().getAsString("clientip");
		String serverip = getDto().getAsString("serverip");
		List<Taonlinelog> list = new ArrayList<Taonlinelog>();
		if (SysConfig.getSysconfigToBoolean("isMongo", true)) {
			Query query = new Query();
			query.addCriteria(new Criteria("name").is(name));
			if (ValidateUtil.isNotEmpty(clientip)) {
				query.addCriteria(new Criteria("clientip").is(clientip));
			}
			if (ValidateUtil.isNotEmpty(serverip)) {
				query.addCriteria(new Criteria("serverip").is(serverip));
			}
			list = mongoTemplate.find(query, Taonlinelog.class);
		} else {
			list = getHibernateDao().createQuery("from Taonlinelog where name=? or clientip=? or serverip=?",
					new Object[] { name, clientip, serverip }).list();
		}
		for (Taonlinelog taonlinelog : list) {
			IUser user = userMgService.getUser(taonlinelog.getUserid());
			taonlinelog.setName(user.getName());
			taonlinelog.setUsername(user.getLoginid());
			taonlinelog.setTelphone(user.getOfficetel());
		}
		setList("userLoginLogList", list);
		return JSON;
	}

	public String queryTaUserLoginHisLog() throws Exception {
		String name = getDto().getAsString("q_name");
		String clientip = getDto().getAsString("q_clientip");
		String serverip = getDto().getAsString("q_serverip");

		List<Taloginhistorylog> historylogList = new ArrayList<Taloginhistorylog>();
		if (SysConfig.getSysconfigToBoolean("isMongo", true)) {
			Query query = new Query();
			query.addCriteria(new Criteria("name").is(name));
			if (ValidateUtil.isNotEmpty(clientip)) {
				query.addCriteria(new Criteria("clientip").is(clientip));
			}
			if (ValidateUtil.isNotEmpty(serverip)) {
				query.addCriteria(new Criteria("serverip").is(serverip));
			}
			historylogList = mongoTemplate.find(query, Taloginhistorylog.class);
		} else {
			historylogList = getHibernateDao()
					.createQuery("from Taloginhistorylog where name=? or clientip = ? or serverip = ?",
							new Object[] { name, clientip, serverip })
					.list();
		}
		Long onlinetimeSum = new Long(0);
		for (Taloginhistorylog log : historylogList) {
			IUser user = userMgService.getUser(log.getUserid());
			Long onlinetime = log.getLogouttime().getTime() - log.getLogintime().getTime();
			onlinetimeSum += onlinetime;
			log.setOnlinetime(onlinetime / 1000);
			log.setUsername(user.getLoginid());
			log.setTelphone(user.getOfficetel());
		}
		setList("hisUserLogList", historylogList);
		setData("logoncount", historylogList.size());
		setData("onlinetimeSum", DateUtil.formatTimeToDayHourMinSecond(onlinetimeSum));
		return JSON;
	}
}
