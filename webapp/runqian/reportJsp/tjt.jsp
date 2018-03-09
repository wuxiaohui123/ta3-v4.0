<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html>
<head>
	<%@ include file="/ta/inc.jsp"%>
	<link type="text/css" href="css/style.css" rel="stylesheet"/>
</head>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<!-- 下载文件 Start -->
<table align="left">
<button onclick="downRaq()">下载模板</button>
</table>
<!-- 下载文件 End -->
<table id="rpt" align="center"><tr><td>
<table align="center" width="100%" height="100%">
	<tr><td>
		<report:html name="report1" reportFileName="chaolianjie.raq"
			funcBarLocation=""
			needPageMark="yes"
			generateParamForm="no"
			exceptionPage="/runqian/reportJsp/myError2.jsp"
			useCache="yes"
			timeout="-1"
		/>
	</td></tr>
</table>
<script language="javascript">
	//下载模板文件
	 function downRaq(){
	 	 var raqName="chaolianjie.raq";
	  	 window.open("downRaq.jsp?raqName="+raqName);
	}
</script>
</body>
</html>
