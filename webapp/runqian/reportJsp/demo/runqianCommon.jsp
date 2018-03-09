<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>YOURTITLE</title>
		<%@ include file="/ta/inc.jsp"%>

	</head>
	<body style="margin:0px;padding:1px;">
	<div id='pageloading'></div>
	    <report:html name="report1"
           srcType="reportBean"
           beanName="report"
           exceptionPage="/runqian/reportJsp/myError2.jsp"/>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>
