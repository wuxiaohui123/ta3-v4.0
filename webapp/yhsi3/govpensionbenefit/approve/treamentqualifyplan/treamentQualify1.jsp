<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body onload="setInterval('ReadCard_onclick()',2000)">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="认证保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="transProcess();" asToolBarItem="true" />
		<ta:button id="queryBtn" key="查询待认证的人员[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query();" asToolBarItem="true" />
		<ta:button id="queryresultBtn" key="查询已认证的人员[W]" icon="xui-icon-query" hotKey="ctrl+W" onClick="queryresult();" asToolBarItem="true" />
		<ta:button id="CancelresultBtn" key="认证撤销[D]" icon="xui-icon-delete" hotKey="ctrl+D" onClick="Cancelresult();" asToolBarItem="true" />
		<ta:button id="resetbt" key="重置" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>

	<ta:form id="form1" enctype="multipart/form-data" methord="post">
		<ta:panel cssStyle="margin:5px;" cols="9" key="检索条件">
			<ta:box cssStyle="display:none">
				<object classid="clsid:4B3CB088-9A00-4D24-87AA-F65C58531039" id="SynCardOcx1" codeBase="SynCardOcx.CAB#version=1,0,0,1" width="102" height="126"> </object>
				<object id="AXDemo" classid="clsid:AA5B9FCD-B0BD-43C0-9534-39D9F179A8CE" codebase="./ActiveFormProj1.cab#version=1,0,0,0" style="WIDTH: 0px; HEIGHT: 0px"> </object>
			</ta:box>
			<img id="img" src="" height="126" width="102" />
			<ta:box cols="3" span="8">
				<ta:text id="dk" key="读卡器识别" readOnly="true" labelWidth="130" />
				<ta:number id="aae001" key="认证年度" required="true" labelWidth="130" readOnly="true" />
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
				<ta:box cols="2" >
				<ta:text id="aab001" key="单位编号" labelWidth="130" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC();" columnWidth="0.9"/>
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()"/>
				</ta:buttonLayout>
			    </ta:box>
				<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<ta:text id="aae005" key="联系电话" labelWidth="130" readOnly="true" />
				<ta:text id="aae006" key="地址" labelWidth="130" readOnly="true" />
				<ta:selectInput id="aaa094" key="认证结果" collection="AAA094" filter="9" labelWidth="130" required="true" value="1" readOnly="true" />
				<ta:selectInput id="aaa049" key="认证方式" collection="AAA049" filter="9" labelWidth="130" required="true" value="1" />
				<ta:text id="aae140" key="险种" cssStyle="margin-top:8px" labelWidth="120" display="false" />
			</ta:box>
		</ta:panel>
		<ta:tabs>
			<ta:tab key="待认证人员" id="ac90ListTab" >
				<ta:datagrid id="ac90List" columnFilter="true" haveSn="true" selectType="checkbox">
					<ta:datagridItem id="aac001" key="个人编号" width="130" align="center" />
					<ta:datagridItem id="aac002" key="身份证号" width="130" align="center" />
					<ta:datagridItem id="aac003" key="姓名" width="80" align="center" />
					<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" />
					<ta:datagridItem id="aae044" key="单位名称" width="180" align="center" />
					<ta:datagridItem id="aae013" key="备注" width="180" align="center">
						<ta:datagridEditor type="text" />
					</ta:datagridItem>
					<ta:datagridItem id="aac063" key="供养亲属标志" collection="AAC063" width="100" align="center" />
					<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="80" align="center" />
					<ta:datagridItem id="aic162" key="离退休日期" dataType="date" width="100" align="center" />
					<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" width="100" align="center" />
					<ta:datagridItem id="aae001" key="认证年度" dataAlign="right" width="80" align="center" />
					<ta:datagridItem id="aaa094" key="待遇领取资格认证结果" collection="AAA094" width="150" align="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="已认证人员" id="resultListTab">
				<ta:datagrid id="resultList" columnFilter="true" forceFitColumns="true" haveSn="true" selectType="checkbox">
					<ta:datagridItem id="aac001" key="个人编号" width="130" align="center" />
					<ta:datagridItem id="aac002" key="身份证号" width="130" align="center" />
					<ta:datagridItem id="aac003" key="姓名" width="80" align="center" />
					<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" />
					<ta:datagridItem id="aae044" key="单位名称" width="180" align="center" />
					<ta:datagridItem id="aae013" key="备注" width="180" align="center" />
					<ta:datagridItem id="aac063" key="供养亲属标志" collection="AAC063" width="100" align="center" />
					<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="80" align="center" />
					<ta:datagridItem id="aic162" key="离退休日期" dataType="date" width="100" align="center" />
					<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" width="100" align="center" />
					<ta:datagridItem id="aae001" key="认证年度" dataAlign="right" width="80" align="center" />
					<ta:datagridItem id="aaa094" key="认证结果" collection="AAA094" width="80" align="center" />
					<ta:datagridItem id="aaa049" key="认证方式" collection="AAA049" width="80" align="center" />
					<ta:datagridItem id="aaz103" key="待遇领取资格认证ID" width="80" align="center" hiddenColumn="true" />
					<ta:datagridItem id="aaz257" key="享受定期待遇人员ID" width="80" align="center" hiddenColumn="true" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="错误人员明细" id="cwTab">
				<ta:datagrid id="errorList" fit="true" forceFitColumns="true" haveSn="true">
					<ta:datagridItem id="aac002" key="身份证号" width="250">
					</ta:datagridItem>
					<ta:datagridItem id="appCode" key="错误信息" width="150">
					</ta:datagridItem>
					<ta:datagridItem id="errMsg" key="错误代码" width="750" showDetailed="true">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		initializeSuggestFramework(1, null, "aac001", 500, 200, 4, fn_queryInfo, 2, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)				
		initializeSuggestFramework(2, null, "aab001", 500, 200, 3, fn_ab01Info, 1, false); //查询单位基本信息，fn_ab01Info回调函数返回自己action
	});
	
	// 打开个人信息查询页面
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
    
	// 查询个人信息回调函数
	function fn_setRyData(){
		query();
	}
	
	// 单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,"getAb01String",{"dto['inputString']":Base.getValue("aab001")});
	}
	
	// 打开单位信息查询页面
	function showDwRPC(){
        Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	
	// 查询单位信息回调函数
	function fn_setDwData(){
		
	}
	
	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			Base.setValue("aac002", g_Suggest[0]);
			Base.setValue("aac003", g_Suggest[1]);
			Base.setValue("aac001", g_Suggest[2]);
			Base.setValue("aac004", g_Suggest[3]);
			query();
		}
	}
	
	function fn_ab01Info() {
		if (g_Suggest != "") {
			Base.setValue("aab999", g_Suggest[0]);
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aae044", g_Suggest[2]);
		}
	}
	
	//流程流转	
	function fn_getAe10() {
		//RPC列表取值
		if (g_Suggest != "") {
			var param = {};
			Base.setValue('aab001', g_Suggest[0]);
			Base.setValue('aae044', g_Suggest[1]);
			Base.setValue('aaf030', g_Suggest[2]);
			Base.setValue('mc', g_Suggest[3]);
		}
	}
	
	function transProcess() {
		if (Base.getValue("aaa094") == '') {
			Base.alert("请输入认证结果!");
			return;
		}
		Base.submit("form1,ac90List", "treamentQualifyAction!transProcess.do");
	}
	
	function query() {
		Base.submit("form1", "treamentQualifyAction!query.do", null, null, false, function() {
			document.getElementById("img").src = "treamentQualifyAction!toView.do?aac001=" + Base.getValue("aac001");
		});
	}
	
	function queryresult() {
		Base.submit("form1", "treamentQualifyAction!queryresult.do");
	}

	function Cancelresult() {
		var rowData = Base.getGridSelectedRows("resultList");
		if (rowData == 0) {
			Base.alert("请选择需要撤销的认证记录!", "warn");
			return false;
		}
		var prm = {};
		prm.resultList = Ta.util.obj2string(rowData);
		Base.submit("form1", "treamentQualifyAction!toCancel.do", prm, null, null, function() {
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
