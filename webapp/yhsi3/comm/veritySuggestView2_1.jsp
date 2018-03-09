<%@ page language="java" pageEncoding="UTF-8"%>
<ta:box key="审核信息" cols="4" id="fltjb" cssStyle="display:none;">
	<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" filter="0,3"/>
	<ta:text id="aaa121" key="业务类型编码" display = "false"  />
	<ta:text id="aaz002" key="业务日志ID" display = "false"  />
	<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true"/>
	<ta:text id="aae013" span="2" maxLength="200" key="审核意见" />
	<ta:text id="aae013_last" span="2" key="上次审核意见" readOnly="true" />
	<ta:buttonLayout span="2">
		<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
	</ta:buttonLayout>
	<ta:buttonLayout span="2">
		<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
	</ta:buttonLayout>
</ta:box>