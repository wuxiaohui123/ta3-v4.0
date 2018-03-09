<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位台帐信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<style>
.slick-column-name {
	color: expression(( .slick-column-name .text = '当事人核定ID')? red: black);
}
</style>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="打印统计[P]" hotKey="P" id="btnPrint" icon="icon-print" onClick="printPage()" asToolBarItem="true" />
		<ta:button key="打印台账信息" hotKey="P" id="btnPrint1" icon="icon-print" onClick="printPageTZ()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid1');" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" cssClass="no-padding" fit="true" cssStyle="padding-top:0px">
		<ta:panel id="fset1" key="查询条件" cols="4" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="140" required="true" maxLength="30" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aab004" key="单位名称" labelWidth="140" span="2" readOnly="true" />
			<ta:selectInput id="yab019" key="单位管理类型" labelWidth="140" collection="YAB019" maxVisibleRows="10" value="01" />
			<%-- 
				<ta:selectInput id="aab019" key="单位类型" labelWidth="140" collection="AAB019" maxVisibleRows="10"/>
				<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="140"  islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065"/>
				<ta:selectInput id="lxbs" key="龙圩区标识" data="[{'id':'1','name':'是'},{'id':'0','name':'否'}]" labelWidth="140" value ="0"/>
				--%>
			<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="140" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
			<ta:selectInput id="aae140" key="险种类型" labelWidth="140" collection="AAE140" />
			<ta:selectInput id="jfzt" key="缴费状态" labelWidth="140" data="[{'id':'1','name':'实缴'},{'id':'2','name':'欠缴'}]" />
			<ta:date id="aae041" key="开始费款所属期" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:date id="aae042" key="结束费款所属期" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:date id="aae002_b" key="开始做账期号" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:date id="aae002_e" key="结束做账期号" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:selectInput id="aaa115" key="应缴类型" labelWidth="140" collection="AAA115" />
			<ta:selectInput id="aab033" key="缴费类型" labelWidth="140" collection="AAB033" />
			<ta:selectInput id="yac084" key="离退休标志" labelWidth="140" collection="YAC084" />
			<ta:selectInput id="zsbz" key="展示数据标识" data="[{'id':'0','name':'展示全部数据'},{'id':'1','name':'展示台账数据'}]" labelWidth="140" value="0" bpopTipMsg="展示台账数据时排除了零星缴费" />
			<ta:selectInput id="aae011" key="经办人" labelWidth="140" collection="AAE011" maxVisibleRows="10" />
			<ta:text id="yab003" key="经办机构" labelWidth="140" display="false" />
		</ta:panel>
		<ta:panel id="pan1" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="datagrid1" fit="true" onRowDBClick="fnDBClick" groupingBy="jf" haveSn="true">
				<ta:datagridItem id="yae518" key="当事人核定ID" maxChart="5" />
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10" sortable="true" />
				<ta:datagridItem id="aaa115" key="应缴类型" collection="AAA115" showDetailed="true" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="6" sortable="true" />
				<ta:datagridItem id="jf" key="缴费状态" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae002" key="做账期号" align="center" maxChart="4" sortable="true" dataAlign="center" />
				<ta:datagridItem id="aae003" key="费款所属期" align="center" maxChart="5" sortable="true" dataAlign="center" />
				<ta:datagridItem id="yac084" key="离退休标志" align="center" maxChart="3" sortable="true" collection="YAC084" dataAlign="center" />
				<ta:datagridItem id="aab119" key="人数" align="center" maxChart="2" dataAlign="left" sortable="true" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="aab120" key="缴费基数" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="jfhj" key="应缴合计" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yjhj" key="已缴合计" formatter="fnFormatterBlue" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="qjhj" key="欠缴合计" formatter="fnFormatterRed" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwjf" key="单位应缴" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwyj" key="单位已缴" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwqj" key="单位欠缴" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="grjf" key="个人应缴" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="gryj" key="个人已缴" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="grqj" key="个人欠缴" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="zhjf" key="账户应缴" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="zhyj" key="账户已缴" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="zhqj" key="账户欠缴" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yjlx" key="应缴利息" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwlx" key="单位利息" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="grlx" key="个人利息" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="znj" key="应缴滞纳金" align="center" maxChart="6" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="aae011" key="经办人" align="center" maxChart="4" collection="aae011" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" maxChart="6" sortable="true" dataAlign="right" />
				<ta:datagridItem id="aab191" key="到账日期" align="center" maxChart="6" />
				<ta:datagridItem id="aae036_dz" key="登帐经办时间" align="center" maxChart="6" />
				<ta:datagridItem id="aab019" key="单位类型" align="center" maxChart="4" collection="AAB019" />
				<ta:datagridItem id="yab139" key="经办机构" align="center" maxChart="10" collection="YAB003" />
				<ta:datagridItem id="aae013" key="备注" align="center" maxChart="10" showDetailed="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);

		var curDate = new Date();
		var year = curDate.getFullYear();
		var month = curDate.getMonth();
		var newDate = "";
		if ((month + 2) < 10) {
			newDate = (year - 1).toString() + "0" + (month + 2).toString();
		} else if ((month + 2) >= 10 && (month + 2) <= 12) {
			newDate = (year - 1).toString() + (month + 2).toString();
		} else {
			newDate = year.toString() + "01";
		}
		Base.setValue("aae041", newDate);
	});
	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aab004", g_Suggest[2]);

		}
	}
	function fnQueryInfo() {
		Base.clearGridData('datagrid1');
		var aab001 = Base.getValue("aab001");
		if (aab001 == null || aab001 == "") {
			Base.alert("单位编号不可为空！", "warn");
		}
		Base.submit("fset1", "unitBillInfoQueryAction!toQuery.do");
	}
	function fnDBClick(e, rowdata) {
		Base.openWindow("modifyWin", "详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitBillInfoQueryAction!modifyWin.do", {
			"dto['aaz083']" : rowdata.aaz083,
			"dto['aab001']" : rowdata.aab001,
			"dto['aae003']" : rowdata.aae003,
			"dto['aae140']" : rowdata.aae140,
			"dto['aae002']" : rowdata.aae002,
			"dto['yae518']" : rowdata.yae518
		}, "95%", "90%", null, null, true);
	}
	//打印单位台账统计信息
	function printPage() {
		var prm_aab001 = Base.getValue('aab001');
		var prm_aae140 = Base.getValue('aae140');
		var prm_aaa115 = Base.getValue('aaa115');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_jfzt = Base.getValue('jfzt');
		if (prm_jfzt == '') {
			Base.alert("统计信息必须输入缴费状态！", "warn");
			Base.focus("jfzt");
			return false;
		}
		var prm_yab003 = Base.getValue('yab003');
		var fileName = "dwtzxxPrint.raq";
		var prm = "prm_aaa115=" + prm_aaa115 + ";prm_aab001=" + prm_aab001 + ";prm_aae140=" + prm_aae140 + ";prm_jfzt=" + prm_jfzt + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab003=" + prm_yab003;
		fnPrintComm(fileName, prm);
	}
	//打印台账信息
	function printPageTZ() {
		var prm_aab001 = Base.getValue('aab001');
		var prm_aae140 = Base.getValue('aae140');
		var prm_aaa115 = Base.getValue('aaa115');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_jfzt = Base.getValue('jfzt');
		var prm_yab003 = Base.getValue('yab003');
		var prm_aae002_b = Base.getValue('aae002_b');
		var prm_aae002_e = Base.getValue('aae002_e');
		var prm_aab065 = Base.getValue('aab065');
		var prm_aab033 = Base.getValue('aab033');
		var fileName = "dwtzxxPrintxx.raq";
		var prm = "prm_aaa115=" + prm_aaa115 + ";prm_aab001=" + prm_aab001 + ";prm_aae140=" + prm_aae140 + ";prm_jfzt=" + prm_jfzt + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab003=" + prm_yab003 + ";prm_aae002_b=" + prm_aae002_b + ";prm_aae002_e=" + prm_aae002_e + ";prm_aab033=" + prm_aab033 + ";prm_aab065=" + prm_aab065;
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

	//已缴金额表格列渲染
	function fnFormatterBlue(row, cell, value, columnDef, dataContext) {
		value = "<span style='color:blue;'>" + value + "</span>";
		columnDef.name = "<span style='color:blue;'>" + columnDef.name + "</span>";
		return value;
	}

	//欠缴金额表格列渲染
	function fnFormatterRed(row, cell, value, columnDef, dataContext) {
		value = "<span style='color:red;'>" + value + "</span>";
		return value;
	}

	/****单位RPC****/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, null, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>