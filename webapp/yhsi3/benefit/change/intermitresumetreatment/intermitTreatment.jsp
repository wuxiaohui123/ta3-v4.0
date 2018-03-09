<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>IntermitTreatment</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇停发[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="transProcess();" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="ctrl+R" key="重置[R]" type="resetPage" asToolBarItem="true" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" disabled="true" display="false" />
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
			<ta:date id="aae041" key="停发年月" labelWidth="130" showSelectPanel="true" required="true" issue="true" />
			<ta:selectInput id="aae160" key="停发原因" span="2" collection="AAE160" required="true" labelWidth="130" />
			<ta:textarea id="aae013_1" key="备注" span="3" labelWidth="130" height="50" />
		</ta:panel>
		<ta:panel id="dqdyxx" key="当前待遇信息" fit="true">
			<ta:datagrid id="dqdylist" fit="true" forceFitColumns="true">
				<%@ include file="/yhsi3/benefit/common/treatmentDetailInfo.jsp"%>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//回调函数
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset,aaa121,aae140", "intermitTreatmentAction!queryPersonInfo.do", null, null, null, null);
		}
	}

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset,aaa121,aae140", "intermitTreatmentAction!queryPersonInfo.do", null, null, null, null);
		}, true);
	}

	//流程流转
	function transProcess() {
		Base.submit("form1", "intermitTreatmentAction!transProcess.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
