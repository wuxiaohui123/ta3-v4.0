<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位核定明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:panel id="fld3" fit="true">
			<ta:datagrid id="dg_hdxx" enableColumnMove="false" fit="true" snWidth="60" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="yae518" key="核定ID" align="center" dataAlign="left" maxChart="6" hiddenColumn="true" />
				<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6" />
				<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true" />
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="10" showDetailed="true" />
				<ta:datagridItem id="aaa115" key="应缴类型" align="center" dataAlign="left" maxChart="5" collection="AAA115" showDetailed="true" />
				<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4" />
				<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5" />
				<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="center" maxChart="4" />
				<ta:datagridItem id="aab084" key="工资(元)" align="center" dataAlign="right" maxChart="5" formatter="MoneyFormatter" showDetailed="true" />
				<ta:datagridItem id="hj" key="合计缴费" align="center" dataAlign="right" maxChart="5" totals="sum" formatter="MoneyFormatter" showDetailed="true" tatalsTextShow="false" />
				<ta:datagridItem id="dw" key="单位缴费(元)" align="center" dataAlign="right" maxChart="6" totals="sum" formatter="MoneyFormatter" showDetailed="true" tatalsTextShow="false" />
				<ta:datagridItem id="gr" key="个人缴费(元)" align="center" dataAlign="right" maxChart="6" totals="sum" formatter="MoneyFormatter" showDetailed="true" tatalsTextShow="false" />
				<ta:datagridItem id="yac084" key="离退休" align="center" dataAlign="left" maxChart="3" collection="YAC084" />
				<ta:datagridItem id="yae591" key="退收类型" align="center" dataAlign="left" maxChart="4" collection="YAE591" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnClose() {
		parent.Base.closeWindow("dwhdxx");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>