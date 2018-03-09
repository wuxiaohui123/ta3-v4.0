<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ResumeTreatment</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇续发[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="transProcess();" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="ctrl+R" key="重置[R]" type="resetPage" asToolBarItem="true" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" display="false" disabled="true" />
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentBaseInfo.jsp"%>
		</ta:panel>
		<ta:panel cssStyle="margin:0px;" key="停发信息" cols="3" id="flt_stop">
			<ta:date id="aae041_tf" key="停发年月" showSelectPanel="true" validNowTime="left" labelWidth="130" readOnly="true" issue="true" />
			<ta:selectInput id="aae160_tf" key="停发原因" span="2" collection="AAE160" readOnly="true" labelWidth="130" />
			<ta:textarea id="aae013_1" key="备注" span="3" labelWidth="130" height="50" />
		</ta:panel>
		<ta:panel cssStyle="margin:0px;" key="续发信息" cols="3" id="flt_stop">
			<ta:date id="aae041" key="续发年月" showSelectPanel="true" required="true" issue="true" labelWidth="130" />
			<ta:selectInput id="aae160" key="续发原因" collection="AAE160" required="true" labelWidth="130" />
			<ta:selectInput id="slpt_sign" key="是否补退" labelWidth="130" data="[{'id':'0','name':'否'},{'id':'1','name':'是'}]" value="1" required="true" />
		</ta:panel>
		<ta:tabs id="123" fit="true">
			<ta:tab id="dqdyxx" key="当前待遇信息">
				<ta:datagrid id="dqdylist" fit="true" forceFitColumns="true">
					<%@ include file="/yhsi3/benefit/common/treatmentDetailInfo.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="定期待遇续发补退信息" id="pnl_bkInfo">
				<ta:datagrid id="dg_gsdydqxfbt" fit="true" forceFitColumns="true">
					<ta:datagridItem id="dg_aac003" key="姓名" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="dg_aae044" key="单位名称" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="dg_aaa078" key="补扣发标志" collection="aaa078" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="dg_aaa036" key="待遇项目" collection="aaa036" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="dg_aae003" key="对应费款所属期" sortable="true" dataAlign="center" align="center"></ta:datagridItem>
					<ta:datagridItem id="dg_aae129" key="核发金额" dataAlign="right" align="center" sortable="true" totals="sum"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
		Base.showObj("slpt_sign");
		Base.showObj("pnl_bkInfo", false);
		Base.setRequired("slpt_sign");
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset,aaa121,aae140", "resumeTreatmentAction!queryPersonInfo.do", null, null, null, null);
		}, true);
	}

	//回调函数
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset,aaa121,aae140", "resumeTreatmentAction!queryPersonInfo.do", null, null, null, null);
		}
	}

	//流程流转
	function transProcess() {
		Base.submit("form1", "resumeTreatmentAction!transProcess.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>