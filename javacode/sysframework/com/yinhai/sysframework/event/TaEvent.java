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

	public static abstract interface EVENTTYPE {
		public static final String user_create = "user_create";
		public static final String user_update = "user_update";
		public static final String user_unuse = "user_unuse";
		public static final String user_use = "user_use";
		public static final String user_delete = "user_delete";
		public static final String org_create = "org_create";
		public static final String org_update = "org_update";
		public static final String org_unuse = "org_unuse";
		public static final String org_use = "org_use";
		public static final String org_delete = "org_delete";
		public static final String org_changeOrg = "org_changeOrg";
		public static final String position_create = "position_create";
		public static final String position_update = "position_update";
		public static final String position_unuse = "position_unuse";
		public static final String position_use = "position_use";
		public static final String position_delete = "position_delete";
		public static final String grant_permission = "grant_permission";
		public static final String retrive_permission = "retrive_permission";
		public static final String permission_change = "permission_change";
		public static final String session_create = "session_create";
		public static final String session_destory = "session_destory";
		public static final String access_log = "access_log";
		public static final String log_on_off_line = "log_on_off_line";
		public static final String log_offline = "log_offline";
		public static final String log_online = "log_online";
		public static final String position_user = "position_user";
	}
}
