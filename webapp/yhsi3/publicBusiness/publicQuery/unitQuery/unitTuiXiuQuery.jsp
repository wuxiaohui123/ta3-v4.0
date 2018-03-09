<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>退休人员信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
		<!-- <ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="icon-print"  onClick="printPage()" asToolBarItem="true"/>
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output"   onClick="fnExpFile('yjGrid');" asToolBarItem="true"/> -->
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="单位个人缴费信息条件" cols="3" id="fltQuery" expanded="false" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" span="2" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" maxLength="20" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" maxLength="20" readOnly="true" />
			<ta:selectInput id="aac082" key="离退休登记类型" collection="aac082" />
			<ta:selectInput id="aic161" key="离退休类别" collection="aic161" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="aae116" />
			<ta:date id="aae041" key="离退休开始日期" showSelectPanel="true" onChange="fn_dateValidate('aae041')" />
			<ta:date id="aae042" key="离退休结束日期" showSelectPanel="true" onChange="fn_dateValidate('aae042')" />
			<ta:text id="yab139" display="false"></ta:text>
		</ta:panel>
		<ta:panel key="退休人员信息" fit="true">
			<ta:datagrid id="yjGrid" haveSn="true" fit="true">
				<ta:datagridItem id="aac001" key="个人编号" maxChart="5" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="center" sortable="true" maxChart="8"></ta:datagridItem>
				<ta:datagridItem id="aac082" key="离退休登记类型" collection="aac082" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
				<ta:datagridItem id="aic161" key="离退休类别" collection="aic161" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="aic162" key="离退休日期" align="center" dataAlign="right" sortable="true" maxChart="5" dataType="date"></ta:datagridItem>
				<ta:datagridItem id="aae210" key="待遇应享受开始年月" align="center" dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
				<ta:datagridItem id="aae116" key="待遇发放状态" align="center" dataAlign="center" collection="aae116" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aae200" key="视同缴费月数" align="center" dataAlign="right" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aae201" key="实际缴费月数" align="center" dataAlign="right" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="yab139" key="经办机构" align="center" maxChart="10" collection="YAB003" />
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
		if (Base.validateForm("form1")) {
			Base.clearGridData('yjGrid');
			Base.submit("fltQuery", "unitTuiXiuQueryAction!toQuery.do");
		}
	}

	function fnQuery1() {
		Base.setValue("aab001", g_Suggest[1]);
		Base.setValue("aae044", g_Suggest[2]);
	}

	function fnQuery2() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac002", g_Suggest[0]);
		Base.setValue("aac003", g_Suggest[1]);
	}

	function fn_dateValidate(id) {
		if (id == "aae041") {
			if (!Base.getValue("aae042") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae041", "");
			}
		}

		if (id == "aae042") {
			if (!Base.getValue("aae041") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae042", "");
			}
		}
	}

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, null, true);
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