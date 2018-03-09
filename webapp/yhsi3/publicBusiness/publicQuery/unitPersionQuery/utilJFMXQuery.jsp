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
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="p1" key="缴费情况信息" fit="true">
			<ta:datagrid id="datagrid2" haveSn="true" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="aab019" key="单位类型" align="center" dataAlign="left" hiddenColumn="true" />
				<ta:datagridItem id="yab019" key="特殊单位管理类型" align="center" dataAlign="left" hiddenColumn="true" />
				<ta:datagridItem id="aab019_1" key="单位类型" align="center" dataAlign="left" maxChart="8" />
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="3" />
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="20" />
				<ta:datagridItem id="aae041" key="做账开始期号" align="center" dataAlign="left" maxChart="5" />
				<ta:datagridItem id="aae042" key="做账结束期号" align="center" dataAlign="left" maxChart="5" />
				<ta:datagridItem id="cbrs" key="参保人数" align="center" dataAlign="center" maxChart="4" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bnjfjs" key="本期缴费基数" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bnjfrs" key="本期缴费人数" align="center" dataAlign="center" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bndwjn" key="本期单位缴纳" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bngrjn" key="本期个人缴纳" align="center" dataAlign="right" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bqxj" key="本期小计" align="center" dataAlign="right" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjjfrs" key="补缴人数" align="center" dataAlign="center" maxChart="4" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjdwjn" key="补缴单位缴纳" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjgrjn" key="补缴个人缴纳" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjxj" key="补缴小计" align="center" dataAlign="right" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yjhj" key="应缴合计" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yjfhj" key="实缴合计" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>