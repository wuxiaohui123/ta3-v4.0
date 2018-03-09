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
		<ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="icon-print" onClick="printPage()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('yjGrid');" asToolBarItem="true" />
		<ta:button key="导出缴费信息统计（分段）[O]" hotKey="O" id="btnOut1" icon="icon-output" onClick="fnExpFile('tjGrid');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="个人缴费信息条件" cols="3" id="fltQuery" expanded="true" scalable="false">
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" maxLength="20" readOnly="true" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" />
			<ta:selectInput id="aae140" key="险种类型" collection="aae140" />
			<ta:text id="aae140list" key="险种类型" display="false" />
			<ta:selectInput id="aae078" collection="aae078" key="是否到帐" filter="2" />
			<ta:selectInput id="aaa115" collection="AAA115" key="应缴类型" />
			<ta:selectInput id="yae589" collection="YAE589" key="冲销标志" value="1" />
			<ta:date id="aae041" key="开始费款所属期" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae041')" />
			<ta:date id="aae042" key="结束费款所属期" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae042')" />
			<ta:selectInput id="ykc005" collection="YKC005" key="参保类型" filter="3101,3102" reverseFilter="true" />
			<ta:date id="aae002_b" key="开始做账期号" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae002_b')" />
			<ta:date id="aae002_e" key="终止做账期号" showSelectPanel="true" issue="true" onChange="fn_dateValidate('aae002_e')" />
			<ta:text id="yab139" display="false"></ta:text>
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="缴费信息（双击显示明细）">
				<ta:datagrid id="yjGrid" haveSn="true" fit="true" onRowDBClick="showJFInfo" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aac002" key="身份证号码" align="center" dataAlign="center" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="yac084" key="离退休标志" align="center" collection="YAC084" sortable="true" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aaa115" key="应缴类型" align="center" collection="AAA115" sortable="true" maxChart="5" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aae078" key="到帐标志" collection="AAE078" align="center" sortable="true" maxChart="4" />
					<%-- formatter="fnFormatterDZBZ" --%>
					<ta:datagridItem id="aae201" key="实缴月数" maxChart="4" align="center" tatalsTextShow="false" totals="sum" formatter="fnFormatterJF"></ta:datagridItem>
					<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="yjhj" key="应缴合计" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="dwjfhj" key="单位缴" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="dwjfbl" key="单位缴费比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="grjfhj" key="个人缴" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="grjfbl" key="个人缴费比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="hjjf_yj" key="已缴合计" align="center" dataAlign="right" sortable="true" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="dwjfhj_yj" key="单位已缴" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="grjfhj_yj" key="个人已缴" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="yjli" key="应缴利息" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="dwyjlx" key="单位利息" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="gryjlx" key="个人利息" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="znj" key="滞纳金" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="znjts" key="计算滞纳金天数" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="hjhzh" key="划账户合计" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="grhzhbl" key="个人划账户比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
					<%-- 
			    	 <ta:datagridItem id="gryjlx" key="个人划账户利息" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"/>
			    	<ta:datagridItem id="dwyjlx" key="单位划账户利息" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"/>
			    	 --%>
					<ta:datagridItem id="dwhzhbl" key="单位划账户比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="hjhzh_yj" key="划账户已缴" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办日期" maxChart="5" align="center" dataType="date"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" maxChart="4" align="center" collection="AAE011"></ta:datagridItem>
					<ta:datagridItem id="aae079" key="到账日期" align="center" sortable="true" maxChart="5" dataType="date"></ta:datagridItem>
					<ta:datagridItem id="yae219" key="登帐日期" align="center" sortable="true" maxChart="5" dataType="date"></ta:datagridItem>
					<ta:datagridItem id="yae218" key="登帐经办人" maxChart="4" align="center" collection="AAE011"></ta:datagridItem>
					<ta:datagridItem id="ykc005" key="参保类型" align="center" collection="YKC005" maxChart="6" />
					<ta:datagridItem id="" key="代扣大额" align="center" dataAlign="right" maxChart="4" />
					<ta:datagridItem id="yae589" key="冲销标志" align="center" collection="YAE589" />
					<ta:datagridItem id="yab139" key="参保所属机构" maxChart="10" align="center" collection="YAB003"></ta:datagridItem>
					<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center"></ta:datagridItem>
					<ta:datagridItem id="aae042" key="结束年月" maxChart="4" align="center"></ta:datagridItem>
					<ta:datagridItem id="yae248" key="数据来源" maxChart="4" align="center" collection="YAE248"></ta:datagridItem>
					<ta:datagridItem id="yae567" key="人员核定事件ID" hiddenColumn="false"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab4" key="异常缴费信息">
				<ta:datagrid id="ycGrid" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="12"></ta:datagridItem>
					<ta:datagridItem id="aae003" key="对应费款所属期" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="aae201" key="缴费月数" maxChart="4" align="center" tatalsTextShow="false" totals="sum" formatter="fnFormatterJF"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="缴费信息统计（分段）">
				<ta:datagrid id="tjGrid" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="12"></ta:datagridItem>
					<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae201" key="缴费月数" maxChart="4" align="center" tatalsTextShow="false" totals="sum" formatter="fnFormatterTJ"></ta:datagridItem>
					<ta:datagridItem id="aae078" key="到帐标志" collection="aae078" align="center" sortable="true" maxChart="4"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="缴费信息(统计)">
				<ta:datagrid id="yjmxGrid" haveSn="true" fit="true" groupingBy="aae078">
					<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="12"></ta:datagridItem>
					<ta:datagridItem id="aae003" key="对应费款所属期" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
					<ta:datagridItem id="aaa093" key="承担缴费主体类型 " align="center" collection="AAA093" dataAlign="right" sortable="true" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="aae341" key="筹资项目 " align="center" collection="AAE341" dataAlign="right" sortable="true" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="yad001" key="应处理金额(合计)" align="center" dataAlign="right" sortable="true" maxChart="9" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="yad003" key="实处理金额(合计)" align="center" dataAlign="right" sortable="true" maxChart="9" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="aae078" key="到帐标志" collection="aae078" align="center" sortable="true" maxChart="4"></ta:datagridItem>
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
		Base.submit(null, "personPayQueryAction!toQueryInsuInfo.do", {
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

	function fnFormatterJF(row, cell, value, columnDef, dataContext) {
		if (dataContext.aae201 == '0') {
			return "<span style='color:red;'>" + dataContext.aae201 + "</span>";
		} else {
			return "<span style='color:blue;'>" + dataContext.aae201 + "</span>";
		}

	}

	function fnFormatterTJ(row, cell, value, columnDef, dataContext) {
		if (dataContext.aae078 == '0') {
			return "<span style='color:red;'>" + dataContext.aae201 + "</span>";
		} else if (dataContext.aae078 == '1') {
			return "<span style='color:green;'>" + dataContext.aae201 + "</span>";
		} else if (dataContext.aae078 == '2') {
			return "<span style='color:blue;'>" + dataContext.aae201 + "</span>";
		}
	}

	function fnFormatterDZBZ(row, cell, value, columnDef, dataContext) {

		if (dataContext.aae078 == '0') {
			return "<span style='color:red;'>" + dataContext.aae078 + "</span>";
		} else if (dataContext.aae078 == '1') {
			return "<span style='color:green;'>" + dataContext.aae078 + "</span>";
		} else if (dataContext.aae078 == '2') {
			return "<span style='color:blue;'>" + dataContext.aae078 + "</span>";
		}
	}

	function fnQuery() {
		if (Base.validateForm("form1")) {
			var aac001 = Base.getValue("aac001");
			var aab001 = Base.getValue("aab001");
			if (aac001 == '' && aab001 == '') {
				alert("请输入单位编号或者个人编号！");
				return;
			}
			Base.clearGridData("yjGrid");
			Base.clearGridData("tjGrid");
			Base.clearGridData("yjmxGrid");
			Base.submit("fltQuery", "personPayQueryAction!toQuery.do");

			Base.setGridColumnFormat("yjGrid", "aae078", function(row, cell, value, columnDef, dataContext) {
				if (value == "0") {
					return "<span style='color:red'>未足额到账</span>";
				} else if (value == "1") {
					return "<span style='color:green'>已足额到账</span>";
				} else if (value == "2") {
					return "<span style='color:green'>中断</span>";
				}
			});
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
		Base.submit(null, "personPayQueryAction!toQueryInsuInfo.do", {
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
			if (!Base.getValue("aae042") == "" && !Base.getValue("aae041") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae041", "");
			}
		}

		if (id == "aae042") {
			if (!Base.getValue("aae042") == "" && !Base.getValue("aae041") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae042", "");
			}
		}

		if (id == "aae002_b") {
			if (!Base.getValue("aae002_e") == "" && !Base.getValue("aae002_b") == "" && Base.getValue("aae002_b") > Base.getValue("aae002_e")) {
				Base.alert("开始做账期号不能大于结束做账期号");
				Base.setValue("aae002_b", "");
			}
		}

		if (id == "aae002_e") {
			if (!Base.getValue("aae002_e") == "" && !Base.getValue("aae002_b") == "" && Base.getValue("aae002_b") > Base.getValue("aae002_e")) {
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
		var prm_aae078 = Base.getValue('aae078');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_aae002_b = Base.getValue('aae002_b');
		var prm_aae002_e = Base.getValue('aae002_e');
		var prm_aaa115 = Base.getValue('aaa115');
		var fileName = "grjfPrint.raq";
		var prm = "prm_aac001=" + prm_aac001 + ";prm_aab001=" + prm_aab001 + ";prm_aae140=" + prm_aae140 + ";prm_aae078=" + prm_aae078 + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_aae002_b=" + prm_aae002_b + ";prm_aae002_e=" + prm_aae002_e + ";prm_aaa115=" + prm_aaa115;
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

	//双击查看明细
	function showJFInfo(e, rowdata) {
		//var aae003 = rowdata.aae003;
		//var aac001 = rowdata.aac001;
		var aae078 = rowdata.aae078;
		var yae567 = rowdata.yae567;
		Base.openWindow("userwin", "缴费明细信息", myPath() + "/process/publicBusiness/publicQuery/personPayQuery/personPayQueryAction!toJFInfo.do", {
			"dto['yae567']" : yae567
		}, "95%", "90%", null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>