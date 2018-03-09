<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保人员信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="导出EXL[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid1');" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" cssClass="no-padding" fit="true" cssStyle="padding-top:0px">
		<ta:fieldset id="fset1" key="查询条件" cols="3">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" maxLength="30" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aab004" key="单位名称" span="2" readOnly="true" />
			<ta:text id="aab999" key="单位管理码" display="false" />
			<ta:text id="aac001" key="个人编号" display="false" />
			<ta:box cols="2">
				<ta:text id="aac002" key="个人编号" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="aae140" key="险种类型" collection="AAE140" onSelect="getYkc005" />
			<ta:selectInput id="ykc005" key="人员类型" collection="YKC005" display="false" filter="3401,3402,3403" reverseFilter="true" onSelect="getYkc006" />
			<ta:selectInput id="ykc006" key="人员类别" collection="YKC006" display="false" filter="340101,340102,340103,340201,340301,340302,340303" reverseFilter="true" />
			<ta:selectInput id="aac008" key="人员参保状态" collection="AAC008" />
			<ta:selectInput id="aac066" key="参保身份" collection="AAC066" />
			<ta:selectInput id="yac084" key="险种离退休标志" collection="YAC084" />
			<ta:selectInput id="aac031" key="个人缴费状态" collection="AAC031" filter="3" />
			<ta:selectInput id="yac030" key="在编人员标识" collection="yac030" />
		</ta:fieldset>
		<ta:panel id="pan1" key="单位参保人员信息列表" hasBorder="true" fit="true">
			<ta:datagrid id="datagrid1" fit="true" haveSn="true" columnFilter="true">
				<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aae044" key="单位名称" align="center" showDetailed="true" width="200" sortable="true" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="人员编号" align="center" width="80" sortable="true" />
				<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4" sortable="true" />
				<ta:datagridItem id="aac002" key="身份证号码" align="center" width="140" sortable="true" />
				<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" maxChart="5" sortable="true" />
				<ta:datagridItem id="aac008" key="人员参保状态" align="center" collection="AAC008" width="100" sortable="true" />
				<ta:datagridItem id="yac084" key="险种离退休标志" align="center" collection="YAC084" width="120" sortable="true" />
				<ta:datagridItem id="aac040" key="工资" align="center" maxChart="3" dataAlign="right" />
				<ta:datagridItem id="aae180" key="人员缴费基数" align="center" width="100" sortable="true" dataAlign="right" />
				<ta:datagridItem id="aac049" key="首次参保年月" align="center" width="100" sortable="true" dataAlign="center" />
				<ta:datagridItem id="aac030" key="个人参保日期" align="center" width="100" sortable="true" dataAlign="center" dataType="date" />
				<ta:datagridItem id="aae041" key="开始年月" align="center" width="100" sortable="true" dataAlign="center" />
				<ta:datagridItem id="aae042" key="终止年月" align="center" width="100" sortable="true" dataAlign="center" />
				<ta:datagridItem id="jfy" key="缴费月" align="center" width="100" sortable="true" dataAlign="center" />
				<ta:datagridItem id="ykc005" key="参保类型" align="center" width="100" sortable="true" dataAlign="center" collection="YKC005" />
				<ta:datagridItem id="ykc006" key="人员类别" align="center" width="100" sortable="true" dataAlign="center" collection="YKC006" />
				<ta:datagridItem id="yac030" key="在编人员标识" align="center" collection="YAC030" width="100" sortable="true" />
				<ta:datagridItem id="aac066" key="参保身份" align="center" collection="AAC066" width="80" sortable="true" />
				<ta:datagridItem id="aac013" key="用工形式" align="center" collection="AAC013" width="100" sortable="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>

</body>
</html>
<script type="text/javascript">
	function fnQuery() {
		if (Base.getValue("aab001") == "" && Base.getValue("aac002") == "" && Base.getValue("aae140") == "" && Base.getValue("aac008") == "" && Base.getValue("aac066") == "" && Base.getValue("yac084") == "") {
			alert("请至少输入一个查询条件");
			return;
		} else {
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonInfoQueryAction!toQuery.do");
		}
	}
	$(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQueryAb01, 0, false);
		initializeSuggestFramework(2, 'ac01', 'aac002', 950, 200, 9, fnQueryAc01, 0, false);
	});

	function fnQueryAb01() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aab004", g_Suggest[2]);
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonInfoQueryAction!toQuery.do");
		}
	}

	function fnQueryAc01() {
		if (g_Suggest != "") {
			Base.setValue("aac002", g_Suggest[2]);
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonInfoQueryAction!toQuery.do");
		}
	}

	function getYkc005(key, value) {
		if (value == "340") {
			Base.showObj("ykc005");
		}
	}
	function getYkc006(key, value) {
		if (!value == "") {
			Base.showObj("ykc006");
		}
	}

	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有数据需要导出,请确认!", "warn");
		}
	}
	/****单位RPC****/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, function() {
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonInfoQueryAction!toQuery.do");
		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
	/***人员RPC***/
	function callRyRPC() {
		sfwQueryUtil_newRPC(2, 'getAc01String', {
			"dto['inputString']" : Base.getValue('aac002')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonInfoQueryAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>