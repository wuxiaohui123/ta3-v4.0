<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pausePayEmp</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="查询条件" cols="3" id="fltQuery" expanded="false" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae040" key="单位名称" readOnly="true" span="2" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" maxLength="20" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" maxLength="20" readOnly="true" />
			<ta:number id="ys" key="月数" max="999" min="0" required="true" />
			<ta:text id="yab139" display="false" />
		</ta:panel>
		<ta:panel id="pel1" key="将缴满人员信息" fit="true">
			<ta:datagrid id="hdGrid" fit="true" haveSn="true" columnFilter="true" forceFitColumns="true" onRowDBClick="dbClick">
				<ta:datagridItem id="aac001" key="个人编号" maxChart="5" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aac002" key="身份证号码" maxChart="9" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aac003" key="姓名" maxChart="3" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aac004" key="性别" maxChart="2" align="center" dataAlign="center" sortable="true" collection="AAC004" />
				<ta:datagridItem id="aac006" key="出生日期" maxChart="6" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="ytxrq" key="预退休日期" maxChart="6" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aab001" key="单位编号" maxChart="4" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae044" key="单位名称" maxChart="8" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="zys" key="总缴费月数" maxChart="5" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae201" key="实缴月数" maxChart="4" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="qfys" key="欠费月数" maxChart="4" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="sjsqys" key="实缴所欠月数" maxChart="6" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae200" key="视同缴费月数" maxChart="6" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="zrys" key="转入月数" maxChart="4" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="txsqys" key="退休所欠月数" maxChart="6" align="center" dataAlign="center" sortable="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ac01', 'aac001', 950, 200, 9, fnQuery2, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnQuery1, 0, false);
	});

	function fnQuery() {
		Base.submit("form1", "willPayFullQueryAction!toQuery.do");
	}

	function fnQuery1() {
		Base.setValue("aab001", g_Suggest[1]);
		Base.setValue("aae040", g_Suggest[2]);
		Base.submit("aab001", "willPayFullQueryAction!toQueryAB01.do");
	}

	function fnQuery2() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac002", g_Suggest[0]);
		Base.setValue("aac003", g_Suggest[1]);
	}

	function dbClick(e, data) {
		Base.openWindow('userwin', "人员缴费明细", myPath() + "/process/publicBusiness/publicQuery/willPayFullQuery/willPayFullQueryAction!toQueryJFinfo.do", {
			"dto['aac001']" : data.aac001
		}, "95%", "90%", null, null, true);
	}

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, function() {
			Base.submit("aab001", "willPayFullQueryAction!toQueryAB01.do");
		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(2, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
	/********个人RPC*******/
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>