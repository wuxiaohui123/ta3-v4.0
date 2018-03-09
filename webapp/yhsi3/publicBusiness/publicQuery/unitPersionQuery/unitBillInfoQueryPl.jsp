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
			<ta:selectInput id="aae140" key="险种类型" value="110" labelWidth="140" collection="AAE140" required="true" />
			<ta:selectInput id="aab019" key="单位类型" labelWidth="140" collection="AAB019" maxVisibleRows="10" />
			<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="140" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
			<ta:selectInput id="jfzt" key="缴费状态" labelWidth="140" data="[{'id':'1','name':'实缴'},{'id':'2','name':'欠缴'}]" />
			<ta:date id="aae041" key="开始费款所属期" labelWidth="140" showSelectPanel="true" issue="true" onChange="fnKsfk()" />
			<ta:date id="aae042" key="结束费款所属期" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:selectInput id="aaa115" key="应缴类型" labelWidth="140" collection="AAA115" />
			<ta:date id="aae002_b" key="开始做账期号" labelWidth="140" showSelectPanel="true" issue="true" onChange="fnKszz()" />
			<ta:date id="aae002_e" key="结束做账期号" labelWidth="140" showSelectPanel="true" issue="true" />
			<ta:selectInput id="aab033" key="缴费类型" labelWidth="140" collection="AAB033" />
			<ta:selectInput id="yac084" key="离退休标志" labelWidth="140" collection="YAC084" />
			<ta:selectInput id="lxbs" key="龙圩区标识" data="[{'id':'1','name':'是'},{'id':'0','name':'否'}]" labelWidth="140" value="0" />
			<ta:text id="yab003" key="经办机构" labelWidth="140" display="false" />
		</ta:panel>
		<ta:panel id="pan1" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="datagrid1" fit="true" onRowDBClick="fnDBClick" groupingBy="jf" haveSn="true" snWidth="60">
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
		//Base.setValue("aae041", newDate);

		Base.setRequired("aae140,aae041,aae042,aae002_b,aae002_e");
	});
	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aab004", g_Suggest[2]);

		}
	}

	//开始费款所属期不为空时,开始做账期号和结束做账期号无需输入
	function fnKsfk() {
		Base.setDisRequired("aae002_b,aae002_e");
	}

	//开始做账期号不为空时,开始费款所属期和结束费款所属期无需输入
	function fnKszz() {
		Base.setDisRequired("aae041,aae042");
	}

	function fnQueryInfo() {
		var aae140 = Base.getValue("aae140");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		var aae002_b = Base.getValue("aae002_b");
		var aae002_e = Base.getValue("aae002_e");
		if (aae140 == "" || aae140 == null) {
			Base.alert("险种类型不可为空！", "warn");
			return false;
		}

		if (((aae041 == "" || aae041 == null) || (aae042 == "" || aae042 == null)) && ((aae002_b == "" || aae002_b == null) || (aae002_e == "" || aae002_e == null))) {
			Base.alert("【费款所属期起始日期】与【做账期号起始日期】至少选其一填写完整！");
			Base.setRequired("aae041,aae042,aae002_b,aae002_e");
			return false;
		}

		if (aae041 > aae042) {
			Base.alert("开始费款所属期不能大于结束费款所属期！", "warn");
			return false;
		} else if ((aae042 - aae041) > 12) {
			Base.alert("费款所属期起止日期不能大于12个月！", "warn");
			return false;
		}

		if ((aae002_e - aae002_b) > 12) {
			Base.alert("做账期号起止日期不能大于12个月！", "warn");
			return false;
		} else if (aae002_b > aae002_e) {
			Base.alert("开始做账期号不能大于结束做账期号！", "warn");
			return false;
		}
		Base.clearGridData('datagrid1');
		Base.submit("fset1", "unitBillInfoQueryPlAction!toQuery.do");
	}
	function fnDBClick(e, rowdata) {
		Base.openWindow("modifyWin", "详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitBillInfoQueryPlAction!modifyWin.do", {
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
</script>
<%@ include file="/ta/incfooter.jsp"%>