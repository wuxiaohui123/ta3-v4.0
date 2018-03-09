<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>业务流程详情</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:datagrid id="verityHistorySuggestGrid" haveSn="true" forceFitColumns="true" fit="true">
			<ta:datagridItem id="yaa017" key="业务办理状态" width="90px" collection="YAA017" align="center" />
			<ta:datagridItem id="aae013" key="审核意见" width="280px" align="center" showDetailed="true" />
			<ta:datagridItem id="aae011" key="经办人" collection="YAE092" align="center" />
			<ta:datagridItem id="aae036" key="经办时间" align="center" width="180px" />
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
