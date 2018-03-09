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
	<ta:toolbar id="toolbar1">
		<ta:button key="生成数据[S]" hotKey="S" icon="xui-icon-spotSave" onClick="fnSave()" asToolBarItem="true" />
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid2');" asToolBarItem="true" />
		<ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="xui-icon-spotPrint" onClick="fnPrint()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fset1" key="查询条件" cols="3" scalable="false">
			<ta:date id="aae003" key="截止年月" labelWidth="120" showSelectPanel="true" issue="true" required="true" />
			<ta:selectInput id="ssxt" key="所属系统" />
			<ta:selectInput id="lxqbz" key="是否显示龙圩区" data="[{'id':'0','name':'显示'},{'id':'1','name':'不显示'},{'id':'2','name':'只显示'}]" value="0" />
			<ta:selectInput id="yab003" key="经办机构" display="false" />
		</ta:panel>
		<ta:panel id="p1" key="单位欠费信息" fit="true">
			<ta:datagrid id="datagrid2" haveSn="true" fit="true" columnFilter="true" forceFitColumns="true" onRowDBClick="dbclick">
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="4" />
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" />
				<ta:datagridItem id="aae003" key="截止年月" align="center" dataAlign="left" maxChart="4" />
				<ta:datagridItem id="ljqf" key="总欠费" align="center" dataAlign="left" maxChart="5" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="lnqf" key="历年欠费" align="center" dataAlign="left" maxChart="5" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bnqf" key="本年欠费" align="center" dataAlign="left" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwdzj" key="单位待转金" align="center" dataAlign="left" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="qfrs" key="末月欠费人数" align="center" dataAlign="left" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bnqjys" key="本年欠缴月数" align="center" dataAlign="left" maxChart="6" />
				<ta:datagridItem id="aae004" key="经办人" align="center" dataAlign="left" maxChart="3" />
				<ta:datagridItem id="aae005" key="联系电话" align="center" dataAlign="left" maxChart="6" />
			</ta:datagrid>
		</ta:panel>
		<%@ include file="/yhsi3/comm/print.jsp"%>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	function fnSave() {
		Base.submit("form1", "unitYl110QFQueryAction!toSave.do");
	}
	function fnPrint() {
		var yab003 = Base.getValue("yab003");
		var aae003 = Base.getValue("aae003");
		var lxqbz = Base.getValue("lxqbz");
		var sscxbz = '0';
		var fileName;
		if (lxqbz == '1') {
			fileName = "dwylqf_blx.raq";
		} else if (lxqbz == '2') {
			fileName = "dwylqf_lx.raq";
		} else {
			fileName = "dwylqf.raq";
		}
		var prm = "yab003=" + yab003 + ";aae003=" + aae003 + ";sscxbz=" + sscxbz;
		fnPrintComm(fileName, prm);
	}
	function fnQueryInfo() {
		Base.clearGridData("datagrid1,datagrid2");
		Base.submit("form1", "unitYl110QFQueryAction!toQuery.do");
	}

	function dbclick(e, date) {
		var aab001 = date.aab001;
		var aae003 = date.aae003;
		Base.openWindow('userwin', "单据详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitYl110QFQueryAction!dbClick.do", {
			"dto['aab001']" : aab001,
			"dto['aae003']" : aae003
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
	$(function() {
		$("body").taLayout();
		Base.focus("jzny");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>