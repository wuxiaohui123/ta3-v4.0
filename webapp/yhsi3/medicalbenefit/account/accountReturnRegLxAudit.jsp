<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人账户返还审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz267" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
		<ta:panel key="刘秀人员账户余额支付登记信息" cols="3" id="pnl_person">
	        <ta:date id="aae001" key="年度" dateYear="true" required="true" isFocusShowPanel="true" showSelectPanel="true" readOnly="true"/>				
			<ta:text id="aac001" key="人员ID"    readOnly="true"/>
			<ta:text id="aac003" key="姓名"    readOnly="true"/>
			<ta:text id="aab001" key="单位ID"    readOnly="true"/>	
			<ta:text id="aab003" key="单位名称"     readOnly="true"/>	
			<ta:selectInput id="aae140" key="险种" collection="AAE140" readOnly="true"/>	
			<ta:text id="yke132" key="年度标准"  readOnly="true"/>		
			<ta:text id="yke134" key="已使用金额"  readOnly="true"/>			
			<ta:text id="aae240" key="余额"  readOnly="true"/>		
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
		function() {$("body").taLayout();
		            Base.filterSelectInput("action", '1,2', true);}
		
	);

	//保存
	function toSave() {
	  if(Base.validateForm("form1")){
		 Base.submit("form1","accountReturnRegLxAuditAction!toSave.do");
	  }else{
		 Base.alert("带红星的为必输入项!","warn");
	  }
	}

</script>
<%@ include file="/ta/incfooter.jsp"%>