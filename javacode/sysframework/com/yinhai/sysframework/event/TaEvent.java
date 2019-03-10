package com.yinhai.sysframework.event;

import java.util.EventObject;

public class TaEvent extends EventObject {

	/**
	 * 
	 */
	private static final long serialVersionUID = 957233328147012585L;
	public String eventType;

	public TaEvent(EventSource source, String eventType) {
		super(source);
		this.eventType = eventType;
	}

	public EventSource getSource() {
		return (EventSource) source;
	}

	public interface EVENTTYPE {
		 String user_create = "user_create";
		 String user_update = "user_update";
		 String user_unuse = "user_unuse";
		 String user_use = "user_use";
		 String user_delete = "user_delete";
		 String org_create = "org_create";
		 String org_update = "org_update";
		 String org_unuse = "org_unuse";
		 String org_use = "org_use";
		 String org_delete = "org_delete";
		 String org_changeOrg = "org_changeOrg";
		 String position_create = "position_create";
		 String position_update = "position_update";
		 String position_unuse = "position_unuse";
		 String position_use = "position_use";
		 String position_delete = "position_delete";
		 String grant_permission = "grant_permission";
		 String retrive_permission = "retrive_permission";
		 String permission_change = "permission_change";
		 String session_create = "session_create";
		 String session_destory = "session_destory";
		 String access_log = "access_log";
		 String log_on_off_line = "log_on_off_line";
		 String log_offline = "log_offline";
		 String log_online = "log_online";
		 String position_user = "position_user";
	}
}
