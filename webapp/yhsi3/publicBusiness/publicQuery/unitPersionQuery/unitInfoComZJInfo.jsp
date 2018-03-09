<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位征集详情</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:datagrid id="dg_ZJInfo" haveSn="true" fit="true">
			<ta:datagridItem id="aaz288" key="征集通知ID" align="center" dataAlign="left" width="120" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="yae519" key="当事人核定明细ID" align="center" dataAlign="left" width="140" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="yae518" key="当事人核定ID" align="center" dataAlign="left" width="120" hiddenColumn="true"></ta:datagridItem>
			<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" width="80"></ta:datagridItem>
			<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" width="120" collection="AAE140"></ta:datagridItem>
			<ta:datagridItem id="aae341" key="筹资项目" align="center" dataAlign="left" width="100" collection="AAE341"></ta:datagridItem>
			<ta:datagridItem id="yad001" key="应处理金额" align="center" dataAlign="right" width="100" dataType="Number"></ta:datagridItem>
			<ta:datagridItem id="aaa093" key="承担主体缴费类型" collection="AAA093" align="center" dataAlign="left" width="120"></ta:datagridItem>
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