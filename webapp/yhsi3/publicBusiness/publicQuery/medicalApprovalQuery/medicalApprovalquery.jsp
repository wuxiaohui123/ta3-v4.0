<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AdministrativeApproval</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" style="padding: 0px; margin: 0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" labelWidth="120" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="120" />
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:date id="aae036_b" key="开始经办时间" showSelectPanel="true" labelWidth="120" />
			<ta:date id="aae036_e" key="结束经办时间" showSelectPanel="true" labelWidth="120" />
		</ta:panel>
		<ta:tabs id="tab_all" fit="true">
			<ta:tab id="tab1" key="退休审批信息">
				<ta:button key="导出退休审批信息" id="btnOut0" icon="icon-output" onClick="fnExpFile('IC08Grid');" />
				<ta:datagrid id="IC08Grid" fit="true" haveSn="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="left" maxChart="4" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10" />
					<ta:datagridItem id="yac084" key="离退休" showDetailed="true" align="center" dataAlign="left" collection="YAC084" maxChart="3" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" dataAlign="left" collection="YKC005" maxChart="5" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" dataAlign="left" collection="YKC006" maxChart="5" />
					<ta:datagridItem id="aic162" key="退休日期" align="center" dataAlign="center" maxChart="5" />
					<ta:datagridItem id="aac040" key="退休工资" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aae200" key="实缴月数" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aae201" key="视同月数" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aaz136" key="基数规则" showDetailed="true" align="center" dataAlign="left" collection="aaz136" maxChart="6" />
					<ta:datagridItem id="yaz289" key="缴费规则" showDetailed="true" align="center" dataAlign="left" collection="yaz289" maxChart="6" />
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="right" maxChart="5" />
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="right" maxChart="3" collection="AAE011" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="right" maxChart="10" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="成功退休信息">
				<ta:button key="导出成功退休信息" id="btnOut1" icon="icon-output" onClick="fnExpFile('txGrid');" />
				<ta:datagrid id="txGrid" fit="true" haveSn="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="left" maxChart="4" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10" />
					<ta:datagridItem id="yac084" key="离退休" showDetailed="true" align="center" dataAlign="left" collection="YAC084" maxChart="3" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" dataAlign="left" collection="YKC005" maxChart="5" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" dataAlign="left" collection="YKC006" maxChart="5" />
					<ta:datagridItem id="aic162" key="退休日期" align="center" dataAlign="center" maxChart="5" />
					<ta:datagridItem id="aac040" key="退休工资" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aae200" key="实缴月数" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aae201" key="视同月数" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aaz136" key="基数规则" showDetailed="true" align="center" dataAlign="left" collection="aaz136" maxChart="6" />
					<ta:datagridItem id="yaz289" key="缴费规则" showDetailed="true" align="center" dataAlign="left" collection="yaz289" maxChart="6" />
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="right" maxChart="5" />
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="right" maxChart="3" collection="AAE011" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="right" maxChart="10" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="还未成功退休信息">
				<ta:button key="导出还未成功退休信息" id="btnOut2" icon="icon-output" onClick="fnExpFile('wtxGrid');" />
				<ta:datagrid id="wtxGrid" fit="true" haveSn="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="left" maxChart="4" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10" />
					<ta:datagridItem id="yac084" key="离退休" showDetailed="true" align="center" dataAlign="left" collection="YAC084" maxChart="3" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" dataAlign="left" collection="YKC005" maxChart="5" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" dataAlign="left" collection="YKC006" maxChart="5" />
					<ta:datagridItem id="aic162" key="退休日期" align="center" dataAlign="center" maxChart="5" />
					<ta:datagridItem id="aac040" key="退休工资" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aae200" key="实缴月数" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aae201" key="视同月数" align="center" dataAlign="center" maxChart="3" />
					<ta:datagridItem id="aaz136" key="基数规则" showDetailed="true" align="center" dataAlign="left" collection="aaz136" maxChart="6" />
					<ta:datagridItem id="yaz289" key="缴费规则" showDetailed="true" align="center" dataAlign="left" collection="yaz289" maxChart="6" />
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="right" maxChart="5" />
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="right" maxChart="3" collection="AAE011" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="right" maxChart="10" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");
		initializeSuggestFramework(1, 'ac01', 'aac001', 920, 200, 9, fn_queryAc01, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});

	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aae044", g_Suggest[2]);
		}
	}
	//回调函数	
	function fn_queryAc01() {
		if (g_Suggest != "") {
			Base.setValue("aac001", g_Suggest[2]);
			Base.setValue("aac002", g_Suggest[0]);
			Base.setValue("aac003", g_Suggest[1]);
		}
	}

	function fnQueryInfo() {
		Base.submit("form1", "medicalApprovalQueryAction!toQuery.do");
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

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, null, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(2, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}

	/***人员rpc***/
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