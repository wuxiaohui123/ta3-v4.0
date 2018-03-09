<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:panel id="fld3" key="单位下参保人员明细" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dg_cbInfo" haveSn="true" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="8"></ta:datagridItem>
				<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8"></ta:datagridItem>
				<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="yac030" key="在编人员标志" collection="YAC030" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aac008" key="参保状态" collection="AAC008" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12"></ta:datagridItem>
				<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" dataType="Number" maxChart="7" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" dataType="Number" maxChart="7" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" align="center" dataAlign="left" maxChart="10"></ta:datagridItem>
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
		parent.Base.closeWindow("CBInfo");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>