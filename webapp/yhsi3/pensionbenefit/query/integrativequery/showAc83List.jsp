<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>showAc83List</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:datagrid id="ac83List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
			<ta:datagridItem id="aaa036" key="待遇项目" collection="aaa036" sortable="true" width="200" showDetailed="true" />
			<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" />
			<ta:datagridItem id="aae003" key="对应费款所属期" sortable="true" width="110" showDetailed="true" />
			<ta:datagridItem id="aaa088" key="发放类型" sortable="true" collection="aaa088" width="110" showDetailed="true" />
			<ta:datagridItem id="aae019" key="金额" totals="sum" width="140" showDetailed="true" />
			<ta:datagridItem id="aaa085" key="定期待遇标志" sortable="true" collection="aaa085" width="100" showDetailed="true" />
		</ta:datagrid>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>