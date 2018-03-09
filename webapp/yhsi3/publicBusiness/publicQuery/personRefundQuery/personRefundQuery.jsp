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
		<ta:button key="查询统计[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryTJ()" asToolBarItem="true" />
		<ta:button key="打印统计[P]" hotKey="P" icon="xui-icon-print" onClick="fnPrintTJ()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="个人退款退账信息条件" cols="3" id="fltQuery" expanded="false" scalable="false">
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" maxLength="20" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" maxLength="20" readOnly="true" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" />
			<ta:selectInput id="aae140" key="险种类型" collection="aae140" />
			<ta:selectInput id="aaa115" key="退收类型" collection="AAA115" />
			<ta:selectInput id="aae078" collection="aae078" key="是否到帐" />
			<ta:date id="aae041" key="做账开始时间" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae041')" />
			<ta:date id="aae042" key="做账结束时间" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae042')" />
			<ta:text id="aae140list" display="false" />
			<ta:text id="yab139" display="false" />
		</ta:panel>
		<ta:tabs id="query_tab" fit="true">
			<ta:tab key="个人补退信息列表" id="tab1">
				<ta:datagrid id="hdGrid" fit="true" haveSn="true" columnFilter="true" forceFitColumns="true">
					<ta:datagridItem id="aae140" key="险种类型" width="120" align="center" collection="AAE140" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aac002" key="身份证号码" maxChart="7" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" maxChart="3" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aab001" key="单位编号" maxChart="7" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" maxChart="7" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aae003" key="对应费款所属期" maxChart="7" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aae041" key="开始年月" maxChart="5" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aae042" key="结束年月" maxChart="5" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aae201" key="缴费月数" maxChart="5" align="center" dataAlign="center" sortable="true" tatalsTextShow="false" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="aac040" key="缴费工资" maxChart="6" align="center" dataAlign="right" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yad001" key="补退金额" maxChart="6" align="center" dataAlign="right" sortable="true" tatalsTextShow="false" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="aae341" key="筹资项目" maxChart="8" align="center" dataAlign="right" collection="AAE341"></ta:datagridItem>
					<ta:datagridItem id="aaa115" key="退收类型" dataAlign="center" align="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="blzt" key="办理状态" maxChart="6" dataAlign="center" align="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yae518" key="yae518" width="100" align="center" dataAlign="right" sortable="true" hiddenColumn="true"></ta:datagridItem>
					<ta:datagridItem id="yae567" key="yae567" width="100" align="center" dataAlign="right" sortable="true" hiddenColumn="true"></ta:datagridItem>
					<ta:datagridItem id="aaz083" key="aaz083" width="100" align="center" dataAlign="right" sortable="true" hiddenColumn="true"></ta:datagridItem>
					<ta:datagridItem id="aae078" key="是否已到账" maxChart="6" align="center" dataAlign="center" sortable="true" collection="AAE078"></ta:datagridItem>
					<ta:datagridItem id="aae079" key="到账时间" maxChart="6" align="center" dataAlign="center" sortable="true" collection="AAE078" dataType="date"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="个人补退信息列表(统计)" id="tab2">
				<ta:datagrid id="tkTj" fit="true" haveSn="true" forceFitColumns="true" groupingBy="aae078">
					<ta:datagridItem id="aae002" key="做账日期" maxChart="7" align="center" dataAlign="center" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yad001" key="补退金额" maxChart="6" align="center" dataAlign="right" sortable="true" tatalsTextShow="false" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="aae078" key="是否已到账" maxChart="6" align="center" dataAlign="center" sortable="true" collection="AAE078"></ta:datagridItem>
					<ta:datagridItem id="ykc005" key="人员类型" maxChart="6" align="center" dataAlign="center" sortable="true" collection="YKC005"></ta:datagridItem>
					<ta:datagridItem id="ykc006" key="人员类别" maxChart="6" align="center" dataAlign="center" sortable="true" collection="YKC006"></ta:datagridItem>
					<ta:datagridItem id="renshu" key="退款人数" maxChart="6" align="center" dataAlign="center" sortable="true" tatalsTextShow="false" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="aaa115" key="退款类型" maxChart="6" align="center" dataAlign="center" sortable="true" collection="AAA115"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fnQuery2, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnQuery1, 0, false);
	});

	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001_c', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		Base.submit(null, "personRefundQueryAction!toQueryInsuInfo.do", {
			"dto['aac001']" : g_Suggest[2]
		}, function() {
			return true;
		}, false, function() {
			if (Base.getValue("aae140list") != "") {
				Base.setSelectInputDataWidthJson("aae140", Base.getValue("aae140list"));
			}
		});
	}

	function callDwRPC() {
		sfwQueryUtil(2, 'getAab001_q', Base.getValue('aab001'));
	}
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, fn_setDwData, true);
	}
	function fn_setDwData() {
		Base.setValue("aab001", parent.getValue("aab001"));
	}

	function fnQuery() {
		if (Base.validateForm("form1")) {
			Base.submit("form1", "personRefundQueryAction!toQuery.do");
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
		Base.submit(null, "personRefundQueryAction!toQueryInsuInfo.do", {
			"dto['aac001']" : g_Suggest[2]
		}, function() {
			return true;
		}, false, function() {
			if (Base.getValue("aae140list") != "") {
				Base.setSelectInputDataWidthJson("aae140", Base.getValue("aae140list"));
			}
		});
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
	//双击查看详情
	function showallInfo(e, rowdata) {
		Base.openWindow("userwin", rowdata.aac003 + rowdata.aaa115 + rowdata.blzt + "详细信息", "process/publicBusiness/publicQuery/personRefundQuery/refundWindowAction.do", {
			"dto['aac001']" : Base.getValue("aac001"),
			"dto['yae518']" : rowdata.yae518,
			"dto['yae567']" : rowdata.yae567,
			"dto['aaz083']" : rowdata.aaz083,
			"dto['aac002']" : rowdata.aac002,
			"dto['aab001']" : rowdata.aab001,
			"dto['blzt']" : rowdata.blzt,
			"dto['aaa115']" : rowdata.aaa115,
			"dto['aae140']" : rowdata.aae140,
			"dto['aae003']" : rowdata.aae003,
			"dto['aac040']" : rowdata.aac040,
			"dto['yad001']" : rowdata.yad001
		}, "95%", "90%", null, null, true);

	}
	function queryData() {
	}

	function fnReset() {
		Base.resetForm("form1");
		Base.clearGridData("dataGrid");
		Base.focus("aab999");
	}
	//统计查询
	function fnQueryTJ() {
		Base.submit("fltQuery", "personRefundQueryAction!toQueryTJ.do");
	}
	//打印统计信息，主要是为了养老方面的军转干和参战人员退款

	function fnPrintTJ() {
		var prm_aac001 = Base.getValue('aac001');
		var prm_aab001 = Base.getValue('aab001');
		var prm_aae140 = Base.getValue('aae140');
		var prm_aaa115 = Base.getValue('aaa115');
		var prm_aae078 = Base.getValue('aae078');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_yab139 = Base.getValue('yab139');
		var fileName = "tktjPrint.raq";
		var prm = "prm_aac001=" + prm_aac001 + ";prm_aab001=" + prm_aab001 + ";prm_aae078=" + prm_aae078 + ";prm_aaa115=" + prm_aaa115 + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab139=" + prm_yab139 + ";prm_aae140=" + prm_aae140;
		fnPrintComm(fileName, prm);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>