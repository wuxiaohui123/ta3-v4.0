<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保人员一次性补缴基本医疗明细表</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="icon-print" onClick="printPage()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('mxGrid');" asToolBarItem="true" />
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
			<ta:text id="aae044" key="单位名称" readOnly="true" span="2" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" maxLength="20" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" maxLength="20" readOnly="true" />
		</ta:panel>
		<ta:panel key="一次性缴费明细信息" fit="true">
			<ta:datagrid id="mxGrid" haveSn="true" fit="true" onRowDBClick="fnDBClick" selectType="checkbox">
				<ta:datagridItem id="yae583" key="补退核定事件ID" align="center" dataAlign="left" maxChart="6" />
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" maxChart="6" />
				<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8" />
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="4" />
				<ta:datagridItem id="aic162" key="退休时间" align="center" dataAlign="right" maxChart="6" />
				<%--
			            <ta:datagridItem id="aic162_310" key="办理退休时间" align="center" dataAlign="right" maxChart="6"/>
			             --%>
				<ta:datagridItem id="aac007" key="参加工作时间" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="yae826" key="养老金金额（月）" align="center" dataAlign="right" maxChart="7" />
				<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" maxChart="4" />
				<ta:datagridItem id="jsstsj" key="计算视同时间" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="aae202" key="视同缴费月数" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="aae201" key="实际缴费月数（内）" align="center" dataAlign="right" maxChart="8" />
				<ta:datagridItem id="yae827" key="实际缴费月数（外）" align="center" dataAlign="right" maxChart="8" />
				<ta:datagridItem id="jfnx" key="已缴年限" align="center" dataAlign="right" maxChart="4" />
				<ta:datagridItem id="yae828" key="应该趸交月数" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="right" maxChart="4" />
				<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="right" maxChart="4" />
				<ta:datagridItem id="jfl" key="缴费率" align="center" dataAlign="right" maxChart="3" />
				<ta:datagridItem id="aaa042" key="单位缴费比例" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="aaa041" key="个人缴费比例" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="yae810" key="单位缴费部分" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="yae811" key="个人缴费部分" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="jf" key="应补缴金额" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="akc022" key="医疗建账类型" align="center" dataAlign="right" collection="AKC022" maxChart="6" />
				<ta:datagridItem id="yae829" key="统帐退休补缴月数" align="center" dataAlign="right" maxChart="8" />
				<ta:datagridItem id="yae828" key="统帐缴费金额" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="yab139" key="经办机构" align="center" maxChart="10" collection="YAB003" />
				<ta:datagridItem id="aae078" key="备注" align="center" dataAlign="right" maxChart="5" collection="AAE078" />
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
		var aab001 = Base.getValue("aab001");
		var aac001 = Base.getValue("aac001");
		if (aab001 == '' && aac001 == '') {
			alert("请至少填写一个查询条件");
			return;
		}
		Base.submit("fltQuery", "wholesalePayQueryAction!toQuery.do");
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
	function fnDBClick(e, rowdata) {
		var aac001 = rowdata.aac001;
		var yae583 = rowdata.yae583;
		var fileName = "GeRenYiciBuJiaoMingXiTable.raq";
		var prm = "yae583=" + yae583;
		//需要在打印记录表中记录打印数据的信息
		Base.submit(null, "wholesalePayQueryAction!toSavePrint.do", {
			"dto['aac001']" : aac001,
			"dto['yae583']" : yae583
		}, null, null, function fnSuccess() {
			$("#report1_printIFrame").attr("src", myPath() + "/reportServlet?action=2&name=report1&reportFileName=" + fileName + "&" + "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" + "serverPagedPrint=no&mirror=no&" + "paramString=" + prm);
		}, function fnFail() {
			Base.alert("打印有误，请联系管理员");
		});
	}
	//打印个人账户明细
	function printPage() {
		var rowdata = Base.getGridSelectedRows("mxGrid");
		if (rowdata.length == 0) {
			alert("请勾选需要打印的信息！");
			return;
		}
		var param = {};
		param.gridList = Ta.util.obj2string(rowdata);
		var fileName = "CBRYYCXBJ310MXTable.raq";
		Base.submit("form1", "wholesalePayQueryAction!toSavePrintPL.do", param, null, null, function fnSuccess() {
			var reportVals = new Array();
			for (var i = 0; i < rowdata.length; i++) {
				reportVals.push(rowdata[i].yae583);
			}
			var prm = "yae583=" + reportVals;
			fnPrintComm(fileName, prm);
		}, function fnFail() {
			Base.alert("打印有误，请联系管理员");
		});
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