<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保人员核定明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:datagrid id="dg_HDInfo" haveSn="true" fit="true">
			<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" width="80" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" width="100"></ta:datagridItem>
			<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" width="150"></ta:datagridItem>
			<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="left" width="50" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="aac008" key="参保状态" collection="AAC008" align="center" dataAlign="left" width="80" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="160"></ta:datagridItem>
			<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" width="100" sortable="true"></ta:datagridItem>
			<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" width="100" sortable="true"></ta:datagridItem>
			<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" width="100" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" dataType="Number" width="100" totals="sum"></ta:datagridItem>
			<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" dataType="Number" width="100" totals="sum"></ta:datagridItem>
			<ta:datagridItem id="yad001" key="核定金额" align="center" dataAlign="right" dataType="Number" width="100" totals="sum"></ta:datagridItem>
			<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" width="100"></ta:datagridItem>
			<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" width="100"></ta:datagridItem>
			<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" width="100"></ta:datagridItem>
			<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" width="100"></ta:datagridItem>
			<ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" align="center" dataAlign="left" width="100"></ta:datagridItem>
		</ta:datagrid>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>