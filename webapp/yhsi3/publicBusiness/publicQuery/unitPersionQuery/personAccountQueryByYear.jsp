<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>年度收入信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:datagrid id="ac55a1Grid" haveSn="true" fit="true">
			<ta:datagridItem key="个人账户ID" id="aaz116" align="center" dataAlign="left" width="200px" />
			<ta:datagridItem key="险种类型" id="aae140" align="center" collection="AAE140" width="150px" dataAlign="left" />
			<ta:datagridItem key="对应费款所属期" id="aae003" align="center" width="150px" dataAlign="center" />
			<ta:datagridItem key="收入日期" id="aae228" align="center" width="150px" dataAlign="center" dataType="date" />
			<ta:datagridItem key="实处理金额" id="yad003" align="center" width="100px" dataAlign="right" />
			<ta:datagridItem key="计息开始时间" id="yae101" align="center" width="150px" dataAlign="center" dataType="date" />
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