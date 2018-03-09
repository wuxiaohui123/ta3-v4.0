<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>缴费情况统计查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fset1" key="查询条件" cols="3" scalable="false">
			<ta:date id="aad017b" key="到账开始日期" labelWidth="120" showSelectPanel="true" required="true" />
			<ta:date id="aad017e" key="到账结束日期" labelWidth="120" showSelectPanel="true" validNowTime="left" />
			<ta:selectInput id="aae140" key="险种" labelWidth="120" collection="AAE140" />
			<ta:selectInput id="lxqbz" key="是否显示龙圩区" labelWidth="120" data="[{'id':'0','name':'显示'},{'id':'1','name':'不显示'},{'id':'2','name':'只显示'}]" value="0" />
			<ta:selectInput id="yab003" key="经办机构" display="false" />
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab id="tab2" key="缴费情况汇总信息">
				<ta:button key="导出缴费情况汇总信息" id="btnOut2" icon="icon-output" onClick="fnExpFile('datagrid1');" />
				<ta:datagrid id="datagrid1" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aad017" key="到账日期" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aae140" key="险种" align="center" dataAlign="left" maxChart="7" collection="AAE140" />
					<ta:datagridItem id="rs" key="缴费人数" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="yad003" key="缴费金额" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab1" key="缴费情况信息">
				<ta:button key="导出缴费情况信息" id="btnOut1" icon="icon-output" onClick="fnExpFile('datagrid2');" />
				<ta:datagrid id="datagrid2" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aad017" key="到账日期" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aae140" key="险种" align="center" dataAlign="left" maxChart="7" collection="AAE140" />
					<ta:datagridItem id="yae597" key="银行名称" align="center" dataAlign="left" maxChart="10" />
					<ta:datagridItem id="rs" key="缴费人数" align="center" dataAlign="left" maxChart="4" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="yad003" key="缴费金额" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
		<%@ include file="/yhsi3/comm/print.jsp"%>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	function fnQueryInfo() {
		Base.clearGridData("datagrid2");
		Base.submit("form1", "flexibleQueryAction!toQuery.do");
	}

	$(function() {
		$("body").taLayout();
	});

	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有错误数据需要导出,请确认!", "warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>