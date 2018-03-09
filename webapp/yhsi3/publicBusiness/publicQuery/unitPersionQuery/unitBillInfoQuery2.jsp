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
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid1');" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" cssClass="no-padding" fit="true" cssStyle="padding-top:0px">
		<ta:panel id="fset1" key="查询条件" cols="3" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" labelWidth="140" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aab004" key="单位名称" labelWidth="140" span="2" readOnly="true" />
			<ta:selectInput id="aab019" key="单位类型" labelWidth="140" collection="AAB019" maxVisibleRows="10" />
			<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="140" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
			<ta:selectInput id="aae140" key="险种类型" labelWidth="140" collection="AAE140" />
			<ta:selectInput id="jfzt" key="缴费状态" labelWidth="140" data="[{'id':'1','name':'实缴'},{'id':'2','name':'欠缴'}]" />
			<ta:date id="aae041" key="开始费款所属期" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:date id="aae042" key="结束费款所属期" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:selectInput id="aaa115" key="应缴类型" labelWidth="140" collection="AAA115" />
			<ta:date id="aae002_b" key="开始做账期号" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:date id="aae002_e" key="结束做账期号" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:selectInput id="aab033" key="缴费类型" labelWidth="140" collection="AAB033" />
			<ta:selectInput id="yac084" key="离退休标志" labelWidth="140" collection="YAC084" />
			<ta:selectInput id="yab003" key="经办机构" labelWidth="140" collection="YAB003" />
			<ta:selectInput id="lxqbz" key="是否显示龙圩区" labelWidth="140" data="[{'id':'0','name':'显示'},{'id':'1','name':'不显示'},{'id':'2','name':'只显示'}]" value="0" />
		</ta:panel>
		<ta:panel id="pan1" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="datagrid1" fit="true" onRowDBClick="fnDBClick" haveSn="true">
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10" sortable="true" />
				<ta:datagridItem id="aaa115" key="应缴类型" collection="AAA115" showDetailed="true" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="6" sortable="true" />
				<ta:datagridItem id="jf" key="缴费状态" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="jfzt" key="缴费标志" align="center" dataAlign="left" maxChart="4" sortable="true" hiddenColumn="true" />
				<ta:datagridItem id="aae002" key="做账期号" align="center" maxChart="4" sortable="true" dataAlign="center" />
				<ta:datagridItem id="aab119" key="人次" align="center" maxChart="2" dataAlign="left" sortable="true" totals="sum" tatalsTextShow="false" />
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
				<ta:datagridItem id="aab019" key="单位类型" align="center" maxChart="4" collection="AAB019" />
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
		Base.submit("fset1", "unitBillInfoQuery2Action!toQuery.do");
	}
	function fnDBClick(e, rowdata) {
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		var aab033 = Base.getValue("aab033");
		var lxqbz = Base.getValue("lxqbz");
		Base.openWindow("modifyWin", "详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitBillInfoQuery2Action!modifyWin.do", {
			"dto['aab001']" : rowdata.aab001,
			"dto['aae002']" : rowdata.aae002,
			"dto['aae140']" : rowdata.aae140,
			"dto['aaa115']" : rowdata.aaa115,
			"dto['aae041']" : aae041,
			"dto['aae042']" : aae042,
			"dto['aab033']" : aab033,
			"dto['lxqbz']" : lxqbz,
			"dto['jfzt']" : rowdata.jfzt
		}, "95%", "90%", null, null, true);
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

	/***单位RPC***/
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