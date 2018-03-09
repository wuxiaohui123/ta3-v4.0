<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>自定义参数模板</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
	   <ta:pageloading />
	   <table align="left">
           <button onclick="downRaq()">下载模板</button>
       </table>
	     <table align="center">
	        <tr>
	          <td>
	            <report:html name="report1" srcType="file" reportFileName="suoding.raq"
	             funcBarLocation="" exceptionPage="/runqian/reportJsp/myError2.jsp" needScroll="yes" scrollWidth="800px" scrollHeight="500px"/>
	          </td>
	        </tr>
         </table>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
	});
	function downRaq(){
	 	 var raqName="suoding.raq";
	  	 window.open(Base.globvar.contextPath+"/runqian/reportJsp/downRaq.jsp?raqName="+raqName);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
