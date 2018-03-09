<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%
    
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位人员增减信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center">
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
			<ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="xui-icon-spotPrint" onClick="fnPrint()" asToolBarItem="true" />
			<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid2');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:panel id="p1" key="单位欠费信息" fit="true">
		<ta:panel id="p2" cols="3">
			<ta:text id="jlqf" key="记录欠费余额" readOnly="true" />
			<ta:text id="dwdzj" key="单位待转金余额" readOnly="true" />
			<ta:text id="ljqf" key="累计欠费" readOnly="true" />
			<ta:date id="aae003" key="截止年月" labelWidth="120" showSelectPanel="true" issue="true" display="false" />
			<ta:text id="yab003" key="经办机构" display="false" />
			<ta:text id="aab001" key="单位编号" display="false" />
		</ta:panel>
		<ta:datagrid id="datagrid2" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
			<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="left" maxChart="4" />
			<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="4" />
			<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="15" />
			<ta:datagridItem id="yjje" key="应缴金额" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="yjfje" key="实缴金额" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="qfje" key="欠缴金额" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="dwyjje" key="单位应缴" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="dwyjfje" key="单位实缴" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="dwqfje" key="单位欠缴" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="gryjje" key="个人应缴" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="gryjfje" key="个人实缴" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
			<ta:datagridItem id="grqfje" key="个人欠缴" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
		</ta:datagrid>
	</ta:panel>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	function fnPrint() {
		var yab003 = Base.getValue("yab003");
		var aab001 = Base.getValue("aab001");
		var aae003 = Base.getValue("aae003");
		var aae041 = 190001;
		var aae042 = 999912;
		var sscxbz = '0';
		var fileName = "dwylqfmx.raq";
		var prm = "yab003=" + yab003 + ";aab001=" + aab001 + ";aae003=" + aae003 + ";aae041=" + aae041 + ";aae042=" + aae042 + ";sscxbz=" + sscxbz;
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
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>