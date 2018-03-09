<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位人员变更信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid2');" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fset1" key="查询条件" cols="3" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="150" required="true" maxLength="30" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" labelWidth="150" readOnly="true" span="2" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" labelWidth="150" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" labelWidth="150" />
			<ta:selectInput id="aac004" key="性别" labelWidth="150" readOnly="true" collection="AAC004" />
			<ta:selectInput id="aae140" key="险种类型" labelWidth="150" collection="AAE140" />
			<ta:selectInput id="aac050" key="变更类型" collection="AAC050" labelWidth="150" />
			<ta:selectInput id="aae011" key="经办人" labelWidth="150" collection="AAE011" />
			<ta:date id="aae036_start" key="开始时间" showSelectPanel="true" labelWidth="150" />
			<ta:date id="aae036_end" key="结束时间" showSelectPanel="true" labelWidth="150" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="人员基本信息变更">
				<ta:datagrid id="datagrid1" haveSn="true" fit="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="180" />
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="left" width="80" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" width="100" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" width="140" />
					<ta:datagridItem id="yac014" key="变更类型" align="center" dataAlign="left" collection="AAA058" width="140" hiddenColumn="true" />
					<ta:datagridItem id="aae122" key="变更项目" align="center" dataAlign="left" collection="AAE122" width="70" />
					<ta:datagridItem id="aae155" key="变更项中文含义" align="center" dataAlign="left" width="100" />
					<ta:datagridItem id="aae123" key="变更前信息" align="center" dataAlign="left" width="90" />
					<ta:datagridItem id="aae124" key="变更后信息" align="center" dataAlign="left" width="90" />
					<ta:datagridItem id="aae036" key="变更日期" align="center" dataAlign="center" width="80" />
					<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" width="70" collection="AAE016" />
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="aae011" width="100" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="Datetime" width="100" />
					<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" width="100" />
					<ta:dataGridToolPaging url="unitPersonInfoChangeQueryAction!toQuery" pageSize="1000" showExcel="false"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="人员参保信息变更">
				<ta:datagrid id="datagrid2" haveSn="true" fit="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="4" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" />
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" maxChart="6" />
					<ta:datagridItem id="aae005" key="联系电话" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aae006" key="地址" align="center" dataAlign="left" maxChart="16" showDetailed="true" />
					<ta:datagridItem id="aac050" key="变更类型" align="center" dataAlign="left" collection="AAC050" maxChart="5" />
					<ta:datagridItem id="aae160" key="变更原因" align="center" dataAlign="left" collection="AAE160" maxChart="10" />
					<ta:datagridItem id="aae035" key="变更时间" align="center" dataAlign="center" maxChart="5" />
					<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" collection="AAE016" maxChart="3" />
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="aae011" maxChart="3" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="Datetime" maxChart="10" />
					<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" maxChart="9" />
					<ta:dataGridToolPaging url="unitPersonInfoChangeQueryAction!toQuery" pageSize="1000" showExcel="false"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	function fnQueryRY() {
		if (g_Suggest != "") {
			Base.setValue("aac003", g_Suggest[1]);
			Base.setValue("aac001", g_Suggest[2]);
			Base.setValue("aac004", g_Suggest[3]);
			fnQueryInfo();
		}
	}
	function fnQueryDW() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aae044", g_Suggest[2]);
			fnQueryInfo();
		}
	}
	function fnQueryInfo() {
		if (Base.getValue('aab001') == '' && Base.getValue('aac001') == '' && Base.getValue('aae011') == '') {
			alert('单位编号、个人编号、经办人，至少输入一个!');
			return;
		}
		Base.clearGridData("datagrid1,datagrid2");
		Base.submit("fset1", "unitPersonInfoChangeQueryAction!toQuery.do");
	}
	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有错误数据需要导出,请确认!", "warn");
		}
	}
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQueryDW, 0, false);
		initializeSuggestFramework(2, 'ac01', 'aac001', 950, 200, 9, fnQueryRY, 0, false);
	});

	/****单位RPC****/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, function() {
			fnQueryInfo();
		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}

	/***人员rpc***/
	function callRyRPC() {
		sfwQueryUtil_newRPC(2, 'getAc01String', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		fnQueryInfo();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>