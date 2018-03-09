package com.yinhai.ta3.sysapp.syslogmg.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.yinhai.sysframework.iorg.IUser;
import com.yinhai.sysframework.service.ServiceLocator;
import com.yinhai.sysframework.util.DateUtil;
import com.yinhai.ta3.organization.service.IUserMgService;
import com.yinhai.ta3.sysapp.syslogmg.domain.Taloginhistorylog;
import com.yinhai.ta3.sysapp.syslogmg.domain.Taonlinelog;
import com.yinhai.webframework.BaseAction;

@Namespace("/sysapp")
@AllowedMethods({"queryTaOnlineLog","queryTaUserLoginHisLog"})
@Action(value="userLoginLogAction", results={
		@Result(name="success", location="/sysapp/syslogmg/userLoginLog.jsp")})
@SuppressWarnings("unchecked")
public class UserLoginLogAction extends BaseAction{

	private IUserMgService userMgService = (IUserMgService) ServiceLocator.getService("userMgService");
	
	@Override
	public String execute() throws Exception {
		List<Taonlinelog> list = getHibernateDao().find("from Taonlinelog");
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
		String name =  getDto().getAsString("name");
		String clientip = getDto().getAsString("clientip"); 
		String serverip = getDto().getAsString("serverip");
		List<Taonlinelog> list = getHibernateDao().createQuery(
				"from Taonlinelog where name=? or clientip=? or serverip=?",new Object[]{name, clientip, serverip}).list();
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
		List<Taloginhistorylog> HistorylogList = getHibernateDao().createQuery(
				"from Taloginhistorylog where name=? or clientip = ? or serverip = ?",
				new Object[]{name, clientip, serverip}).list();
		Long onlinetimeSum = new Long(0);
		for (Taloginhistorylog log : HistorylogList) {
			IUser user = userMgService.getUser(log.getUserid());
			Long onlinetime = log.getLogouttime().getTime() - log.getLogintime().getTime();
			onlinetimeSum += onlinetime;
			log.setOnlinetime(onlinetime/1000);
			log.setUsername(user.getLoginid());
			log.setTelphone(user.getOfficetel());
		}
		setList("hisUserLogList", HistorylogList);
		setData("logoncount", HistorylogList.size());
		setData("onlinetimeSum", DateUtil.formatTimeToDayHourMinSecond(onlinetimeSum));
		return JSON;
	}
}
