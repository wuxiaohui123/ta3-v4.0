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
		<ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="icon-print" onClick="printPage()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('yjGrid');" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="单位个人缴费信息条件" cols="3" id="fltQuery" expanded="true" scalable="false">
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
			<ta:text id="aac002" key="身份证号码" maxLength="20" readOnly="true" labelWidth="160" />
			<ta:selectInput id="aae140" key="险种类型" collection="aae140" />
			<ta:selectInput id="aae078" collection="aae078" key="是否到帐" filter="2" />
			<ta:selectInput id="yac084" collection="YAC084" key="退休标志" labelWidth="160" />
			<ta:selectInput id="aaa115" collection="AAA115" key="退收类型" />
			<ta:date id="aae041" key="开始费款所属期" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae041')" />
			<ta:date id="aae042" key="结束费款所属期" labelWidth="160" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae042')" />
			<ta:date id="aae002_b" key="开始做账期号" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae002_b')" />
			<ta:date id="aae002_e" key="结束做账期号" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae002_e')" />
			<ta:selectInput id="yac030" key="事业单位在编人员标识" labelWidth="160" collection="yac030" />
		</ta:panel>
		<ta:panel key="缴费信息" fit="true">
			<ta:datagrid id="yjGrid" haveSn="true" fit="true" columnFilter="true">
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="center" sortable="true" maxChart="10" />
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
				<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="yac030" key="是否在编" align="center" collection="YAC030" sortable="true" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
				<ta:datagridItem id="aae003" key="对应费款所属期" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
				<ta:datagridItem id="aac040" key="缴费工资" align="center" dataAlign="right" sortable="true" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" sortable="true" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwjfbl" key="单位缴费比率" align="center" dataAlign="right" sortable="true" maxChart="6" />
				<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grjfbl" key="个人缴费比率" align="center" dataAlign="right" sortable="true" maxChart="6" />
				<ta:datagridItem id="jfhj" key="应缴合计" align="center" dataAlign="right" sortable="true" totals="sum" tatalsTextShow="false" maxChart="6" />
				<ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwhzhbl" key="单位划账户比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
				<ta:datagridItem id="grhzhbl" key="个人划账户比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
				<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="yjlx" key="应缴利息" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwyjlx" key="单位缴利息" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="gryjlx" key="个人缴利息" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="aae078" key="到帐标志" collection="aae078" align="center" sortable="true" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aae079" key="到账时间" align="center" sortable="true" dataType="date" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aaa115" key="退收类型" collection="aaa115" width="100" align="center" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="yac084" key="退休标志" collection="YAC084" width="100" align="center" sortable="true" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="yab003" key="经办机构" align="center" maxChart="10" collection="YAB003" />
			</ta:datagrid>
		</ta:panel>

	</ta:form>
	<ta:text id="yab139" display="false"></ta:text>
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
			Base.clearGridData("yjGrid");
			Base.submit("fltQuery", "unitPayQueryAction!toQuery.do");
		}
	}

	function fnQuery1() {
		Base.setValue("aab001", g_Suggest[1]);
		Base.setValue("aae040", g_Suggest[2]);
	}

	function fnQuery2() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac002", g_Suggest[0]);
		Base.setValue("aac003", g_Suggest[1]);
		Base.submit(null, "unitPayQueryAction!toQueryInsuInfo.do", {
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
			if (!Base.getValue("aae041") == "" && !Base.getValue("aae042") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae041", "");
			}
		}

		if (id == "aae042") {
			if (!Base.getValue("aae041") == "" && !Base.getValue("aae042") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae042", "");
			}
		}

		if (id == "aae002_b") {
			if (!Base.getValue("aae002_b") == "" && !Base.getValue("aae002_e") == "" && Base.getValue("aae002_b") > Base.getValue("aae002_e")) {
				Base.alert("开始做账期号不能大于结束做账期号");
				Base.setValue("aae002_b", "");
			}
		}

		if (id == "aae002_e") {
			if (!Base.getValue("aae002_b") == "" && !Base.getValue("aae002_e") == "" && Base.getValue("aae002_b") > Base.getValue("aae002_e")) {
				Base.alert("结束做账期号不能早于开始做账期号");
				Base.setValue("aae002_e", "");
			}
		}
	}

	function queryData() {
	}

	function fnReset() {
		Base.resetForm("form1");
		Base.clearGridData("dataGrid");
		Base.focus("aab999");
	}
	//打印个人账户明细
	function printPage() {
		var prm_aac001 = Base.getValue('aac001');
		var prm_aab001 = Base.getValue('aab001');
		var prm_aae140 = Base.getValue('aae140');
		var prm_yac084 = Base.getValue('yac084');
		var prm_aae078 = Base.getValue('aae078');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_aae002_b = Base.getValue('aae002_b');
		var prm_aae002_e = Base.getValue('aae002_e');
		var prm_yab139 = "";
		var prm_yac030 = Base.getValue('yac030');
		var prm_aaa115 = Base.getValue('aaa115');
		var fileName = "dwgrjfPrint.raq";
		var prm = "prm_aac001=" + prm_aac001 + ";prm_aab001=" + prm_aab001 + ";prm_aae140=" + prm_aae140 + ";prm_aae078=" + prm_aae078 + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_aae002_b=" + prm_aae002_b + ";prm_aae002_e=" + prm_aae002_e + ";prm_yab139=" + prm_yab139 + ";prm_yac030=" + prm_yac030 + ";prm_yac084=" + prm_yac084 + ";prm_aaa115=" + prm_aaa115;
		fnPrintComm(fileName, prm);
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
	//打开单位RPC弹出窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, function() {
			Base.submit(null, "unitPayQueryAction!toQueryInsuInfo.do", {
				"dto['aac001']" : Base.getValue("aac001")
			}, function() {
				return true;
			}, false, function() {
				if (Base.getValue("aae140list") != "") {
					Base.setSelectInputDataWidthJson("aae140", Base.getValue("aae140list"));
				}
			});
		}, null, true);
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