<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗欠费特权报销认定复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave"  key="保存[S]" icon="xui-icon-spotSave"   hotKey="S"   onClick="toSave()" />
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
	
		<ta:panel id="fltPersonInfo" key="个人基本信息" cols="3" >
			<ta:text id="aac001" key="个人ID" labelWidth="120" />
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:text id="aab001" key="单位ID" labelWidth="120"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" collection="AAB020" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" collection="AAB021" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" collection="AAB065" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" collection="YAB019" display="false"/>
			<ta:text id="aab999" key="单位管理码" display="false"/>
		</ta:panel>
		<ta:panel  id="fltAffirmInfo"  key="医疗欠费特权报销认定信息"  cols="3" >
		    <ta:selectInput id="ykc239" key="基本医疗享受类别" collection="YKC239"   labelWidth="130" required="true"/>
		    <ta:selectInput id="ykd086" key="大额（大病）享受类别" collection="YKD086"    labelWidth="130" required="true"/>
		    <ta:selectInput id="ykc238" key="公务员补充享受类别" collection="YKC238"    labelWidth="130" required="true"/>
		    <ta:date id="aae030" key="开始日期" labelWidth="130" isFocusShowPanel="true" required="true" showSelectPanel="true"/>
		    <ta:date id="aae031" key="结束日期" labelWidth="130" isFocusShowPanel="true" required="true" showSelectPanel="true"/>
		    <ta:selectInput id="aka130" key="医疗类别" collection="AKA130"    labelWidth="130" required="true"/>
			<ta:text id="aae013" key="备注" span="3" bpopTipMsg="最大能输入字符200" maxLength="200"  required="true" labelWidth="130"/>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("action", '1,2', true);
	});
	
	//保存
	function toSave(){
	    if (!Base.validateForm("form1")) {
		   Base.alert("带红色星号的为必填内容!","warn");
		   return false;
		}
		Base.submit("form1","arrearsClearAuditAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>