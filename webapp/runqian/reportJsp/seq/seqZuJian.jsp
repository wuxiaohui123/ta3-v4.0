<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<head>
<title>报表组内序号</title>
<%@ include file="/ta/inc.jsp"%>
<link href="<%=basePath %>runqian/reportJsp/css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body style="margin:0px;padding:0px;" >
<ta:box fit="true">
	<table align="center" width="100%" height="100%">
		<tr><td>
			<report:html name="report1" reportFileName="seqZJ.raq"
				funcBarLocation="top"
				needPageMark="no"
				needPivot="yes"
				pivotLabel=""
				exceptionPage="/runqian/reportJsp/myError2.jsp"
			/>
		</td></tr>
	</table>
</ta:box>	
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>
