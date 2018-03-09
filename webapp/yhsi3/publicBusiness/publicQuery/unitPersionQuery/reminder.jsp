<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" >
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>催缴单打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queruBtn" key="查询" onClick="fnQuery()" icon="icon-search" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="flst1" key="单位基本信息" cols="3" expanded="false" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" labelWidth="120" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120" />
			<ta:date id="start" key="开始期号" showSelectPanel="true" issue="true" labelWidth="120" />
			<ta:date id="end" key="结束期号" showSelectPanel="true" issue="true" labelWidth="120" />
			<ta:number id="ys" key="欠费月数" labelWidth="120" min="0" />
			<ta:text id="yab003" key="经办机构" display="false" />
			<ta:text id="userid" key="经办人" display="false" />
		</ta:panel>

		<ta:tabs id="tabs_unit" fit="true">
			<ta:tab id="tabBankColl" key="欠费信息">
				<ta:datagrid id="dg_ad21" haveSn="true" forceFitColumns="true" fit="true" onRowDBClick="fnClick" columnFilter="true" selectType="checkbox">
					<ta:datagridItem id="btnPrint" icon="icon-print" key="点击打印" align="center" click="fnPrint" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aab001" key="当事人ID" align="center"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="13" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae003_min" key="最小年月" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aae003_max" key="最大年月" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="ys" key="总月数" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="je" key="总金额" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>

			<ta:tab id="tabBankMx" key="单位人员欠费明细">
				<ta:fieldset>
					<ta:box columnWidth="0.7" height="26">
						<ta:button id="btnOut" key="导出[O]" hotKey="O" icon="icon-output" onClick="fn_print();" />
						<ta:button id="btnPrint" key="打印[P]" hotKey="P" icon="icon-print" onClick="fnbb_print();" />
					</ta:box>
				</ta:fieldset>
				<ta:datagrid id="dg_ad21_v" haveSn="true" fit="true" columnFilter="true">
					<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="20"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="20"></ta:datagridItem>
					<ta:datagridItem id="dwq" key="单位欠缴" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" maxChart="18"></ta:datagridItem>
					<ta:datagridItem id="grq" key="个人欠缴" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" maxChart="18"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, null, 'aab001', 900, 200, 7, fn_queryEmployeeInfo, 1, false);
	});
	//单位回调
	function fn_queryEmployeeInfo() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aae044", g_Suggest[2]);
		}
	}
	//查询
	function fnQuery() {
		Base.clearGridData("dg_ad21");
		Base.submit("flst1", "reminderAction!toQuery.do");
		var aab001 = Base.getValue("aab001");

		if (aab001 == "" || aab001 == null) {
			Base.setHideObj("tabBankMx");//隐藏Tab
		} else {
			Base.submit("flst1", "reminderAction!toQueryMx.do");
		}

	}
	//单个打印
	function fnPrint(data, e) {
		var prm_aab001 = data.aab001
		var prm_aae003_min = Base.getValue("start");
		var prm_aae003_max = Base.getValue("end");
		var prm_yab003 = Base.getValue("yab003");

		var fileName = "reminder.raq";
		var prm = "prm_aab001=" + prm_aab001 + ";prm_aae003_min=" + prm_aae003_min + ";prm_aae003_max=" + prm_aae003_max + ";prm_yab003=" + prm_yab003;
		//需要在打印记录表中记录打印数据的信息
		Base.submit(null, "reminderAction!toSavePrint.do", {
			"dto['aaz010']" : data.aab001
		}, null, null, function fnSuccess() {
			fnPrintComm(fileName, prm);
		}, function fnFail() {
			Base.alert("打印有误，请联系管理员");
		});
	}

	//批量打印银行托收单
	function fnPLPrint() {
		var rowdata = Base.getGridSelectedRows("dg_ad21");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要打印的信息！");
			return;
		}
		var userid = Base.getValue("userid");
		param.tsdList = Ta.util.obj2string(rowdata);
		var fileName = 'reminder.raq';
		Base.submit(null, "reminderAction!toPLPrint.do", param, null, null, function fnSuccess() {
			var prm_userid = Base.getValue("userid");
			var prm_yab003 = Base.getValue("yab003");
			var reportVals = new Array();
			for (var i = 0; i < rowdata.length; i++) {
				reportVals.push(rowdata[i].aab001);
			}
			var prm = "prm_aab001=" + reportVals + ";prm_userid=" + prm_userid + ";prm_yab003=" + prm_yab003;
			fnPrintComm(fileName, prm);
		}, function fnFail() {
			Base.alert("打印有误，请联系管理员");
		});
	}
	function fnClick(e, rowdata) {
		Base.openWindow('userwin', "欠费详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/reminderAction!toEdit.do", {
			"dto['aab001']" : rowdata.aab001,
			"dto['aae003_min']" : rowdata.aae003_min,
			"dto['aae003_max']" : rowdata.aae003_max
		}, "95%", "90%", null, null, true);
	}

	function fn_print() {
		var list = Base.getGridData("dg_ad21");
		var aae003_min_prm = list[0].aae003_min; //开始期号
		var aae003_max_prm = list[0].aae003_max; //结束期号
		var aab001 = Base.getValue("aab001"); //单位编号
		var yab003 = Base.getValue("yab003"); //参保所属机构
		var ys = Base.getValue("ys"); //欠费月数
		var start = Base.getValue("start"); //开始期号
		var end = Base.getValue("end"); //结束期号
		$("#report1_printIFrame").attr("src", myPath() + "/reportServlet?action=3&file=dwryqjmxPrint.raq&" + "srcType=file&columns=0&excelFormat=2003&" + "paramString=aab001=" + encodeURI(aab001) + ";aae003_min_prm=" + encodeURI(aae003_min_prm) + ";aae003_max_prm=" + encodeURI(aae003_max_prm) + ";yab139=" + encodeURI(yab003) + ";ys=" + encodeURI(ys) + ";start=" + encodeURI(start) + ";end=" + encodeURI(end));
	}

	function fnbb_print() {
		var list = Base.getGridData("dg_ad21");
		var aae003_min_prm = list[0].aae003_min; //开始期号
		var aae003_max_prm = list[0].aae003_max; //结束期号
		var aab001 = Base.getValue("aab001"); //单位编号
		var yab003 = Base.getValue("yab003"); //参保所属机构
		var ys = Base.getValue("ys"); //欠费月数
		var start = Base.getValue("start"); //开始期号
		var end = Base.getValue("end"); //结束期号

		var prm = "aab001=" + aab001 + ";aae003_min_prm=" + aae003_min_prm + ";aae003_max_prm=" + aae003_max_prm + ";yab139=" + yab003 + ";ys=" + ys + ";start=" + start + ";end=" + end;
		var fileName = 'dwryqjmxbbPrint.raq';
		fnPrintComm(fileName, prm);
	}

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, null, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
