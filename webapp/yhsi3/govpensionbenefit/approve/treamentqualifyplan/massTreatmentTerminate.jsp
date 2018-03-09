<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MassTreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="fn_query();" asToolBarItem="true" />
		<ta:button id="saveBtn" key="待遇批量停发[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="检索条件" cols="3">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="130" required="true" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC();" columnWidth="0.9" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:text id="aae140" key="险种" display="false" />
		</ta:panel>
		<ta:tabs height="350">
			<ta:tab key="认证不通过人员信息" id="ac90Tab">
				<ta:datagrid id="ac90List" fit="true" haveSn="true" selectType="checkbox">
					<ta:datagridItem id="aac002" key="身份证号" width="130" align="center" />
					<ta:datagridItem id="aac003" key="姓名" width="80" align="center" />
					<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" />
					<ta:datagridItem id="aae044" key="单位名称" width="180" align="center" />
					<ta:datagridItem id="aac063" key="供养亲属标志" collection="AAC063" width="100" align="center" />
					<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="80" align="center" />
					<ta:datagridItem id="aic162" key="离退休日期" dataType="date" width="100" align="center" />
					<ta:datagridItem id="aae210" key="待遇开始年月" dataAlign="right" width="90" />
					<ta:datagridItem id="yac001" key="个人最大发放期号" dataAlign="right" width="120" />
					<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" width="100" align="center" />
					<ta:datagridItem id="aae001" key="认证年度" dataAlign="right" width="80" align="center" />
					<ta:datagridItem id="aaa094" key="待遇领取资格认证结果" collection="AAA094" width="150" align="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="停发成功人员信息" id="resultTab">
				<ta:datagrid id="resultList" fit="true" haveSn="true">
					<ta:datagridItem id="aac002" key="身份证号" width="130" align="center" />
					<ta:datagridItem id="aac003" key="姓名" width="80" align="center" />
					<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" />
					<ta:datagridItem id="aae044" key="单位名称" width="180" align="center" />
					<ta:datagridItem id="aac063" key="供养亲属标志" collection="AAC063" width="100" align="center" />
					<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="80" align="center" />
					<ta:datagridItem id="aic162" key="离退休日期" dataType="date" width="100" align="center" />
					<ta:datagridItem id="aae210" key="待遇开始年月" dataAlign="right" width="90" />
					<ta:datagridItem id="yac001" key="个人最大发放期号" dataAlign="right" width="120" />
					<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" width="100" align="center" />
					<ta:datagridItem id="aae001" key="认证年度" dataAlign="right" width="80" align="center" />
					<ta:datagridItem id="aaa094" key="待遇领取资格认证结果" collection="AAA094" width="150" align="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="操作失败人员明细" id="cwTab">
				<ta:datagrid id="errorList" forceFitColumns="true" fit="true" haveSn="true">
					<ta:datagridItem id="aac002" key="身份证号" width="200" />
					<ta:datagridItem id="appCode" key="错误信息" width="200" />
					<ta:datagridItem id="errMsg" key="错误原因" width="550" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, null, "aac001", 500, 200, 4, fn_queryInfo, 2, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)				
		initializeSuggestFramework(2, null, "aab001", 500, 200, 3, fn_ab01Info, 1, false); //查询单位基本信息，fn_ab01Info回调函数返回自己action
	});

	// 打开个人信息查询页面
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}

	// 查询个人信息回调函数
	function fn_setRyData() {
	}

	// 单位RPC
	function callDwRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}

	// 打开单位信息查询页面
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, fn_setDwData, true);
	}

	// 查询单位信息回调函数
	function fn_setDwData() {

	}

	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			Base.setValue("aac002", g_Suggest[0]);
			Base.setValue("aac003", g_Suggest[1]);
			Base.setValue("aac001", g_Suggest[2]);
			Base.setValue("aac004", g_Suggest[3]);
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
	function submitData() {
		Base.submit("form1,ac90List", "massTreatmentTerminateAction!transProcess.do");
	}

	function fn_query() {
		Base.submit("form1", "massTreatmentTerminateAction!queryresult.do");
	}

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
</script>
<%@ include file="/ta/incfooter.jsp"%>
