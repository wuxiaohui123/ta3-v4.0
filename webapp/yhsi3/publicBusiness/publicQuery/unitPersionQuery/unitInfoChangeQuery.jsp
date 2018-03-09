<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位变更信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel1" key="查询条件" cols="3" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="150" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="150" />
			<ta:selectInput id="aaa058" key="基本信息变更类型" collection="AAA058" filter="01,02" reverseFilter="true" labelWidth="150" />
			<ta:selectInput id="aab100" key="参保信息变更类型" collection="AAB100" labelWidth="150" />
			<ta:selectInput id="aae122" key="变更项" labelWidth="150" maxVisibleRows="10" />
			<ta:date id="aae036_start" key="开始时间" showSelectPanel="true" labelWidth="150" />
			<ta:date id="aae036_end" key="结束时间" showSelectPanel="true" labelWidth="150" />
			<ta:selectInput id="aae016" key="复核标志" collection="AAE016" labelWidth="150" />
		</ta:panel>
		<ta:panel id="panel2" key=">>查询结果" expanded="false" fit="true">
			<ta:tabs id="tabs" fit="true">
				<ta:tab id="tab1" key="单位基本信息变更">
					<ta:datagrid id="datagrid1" haveSn="true" fit="true">
						<ta:datagridItem id="aaa058" key="变更类型" align="center" dataAlign="left" collection="AAA058" width="120" />
						<ta:datagridItem id="aae122" key="变更项目" align="center" dataAlign="left" collection="AAE122" width="70" />
						<ta:datagridItem id="aae155" key="变更项中文含义" align="center" dataAlign="left" width="100" />
						<ta:datagridItem id="aae123" key="变更前信息" align="center" dataAlign="left" width="90" />
						<ta:datagridItem id="aae124" key="变更后信息" align="center" dataAlign="left" width="90" />
						<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" width="70" collection="AAE016" />
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="aae011" width="100" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="Datetime" width="100" />
						<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" width="100" />
						<ta:dataGridToolPaging url="unitInfoChangeQueryAction!toQuery" pageSize="100" showExcel="false"></ta:dataGridToolPaging>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab2" key="单位参保信息变更">
					<ta:datagrid id="datagrid2" haveSn="true" fit="true">
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" width="120" />
						<ta:datagridItem id="aab100" key="变更类型" align="center" dataAlign="left" collection="AAB100" width="100" />
						<ta:datagridItem id="aae122" key="变更项目" align="center" dataAlign="left" collection="AAE122" width="70" />
						<ta:datagridItem id="aae155" key="变更项中文含义" align="center" dataAlign="left" width="100" />
						<ta:datagridItem id="aae123" key="变更前信息" align="center" dataAlign="left" width="100" />
						<ta:datagridItem id="aae124" key="变更后信息" align="center" dataAlign="left" width="100" />
						<ta:datagridItem id="aae035" key="变更日期" align="center" dataAlign="center" width="80" />
						<ta:datagridItem id="aae160" key="变更原因" align="center" dataAlign="left" width="80" />
						<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" width="70" collection="AAE016" />
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="aae011" width="100" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="Datetime" width="100" />
						<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" width="100" />
						<ta:dataGridToolPaging url="unitInfoChangeQueryAction!toQuery" pageSize="100" showExcel="false"></ta:dataGridToolPaging>
					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
		Base.focus("aab001");
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});
	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aae044", g_Suggest[2]);
			fnQueryInfo();
		}
	}
	function fnQueryInfo() {
		Base.clearGridData("datagrid1,datagrid2");
		Base.submit("panel1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitInfoChangeQueryAction!toQuery.do");
	}

	/***单位RPC***/
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
</script>
<%@ include file="/ta/incfooter.jsp"%>