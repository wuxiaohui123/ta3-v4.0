<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>大数据分页</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
	   <ta:pageloading />
	     <table align="center">
	        <tr>
	          <td>
	            <report:autoBig name="report1" 
	            reportFileName="testBigNum.raq"
	            dbType="oracle"
	            dsName="ds1"
	            totalCountExp=""
	            cachePageNum="5"
	            useCache="yes"
	            needPrint="yes"/>
	          </td>
	        </tr>
         </table>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>
