<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
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
	<body class="no-scrollbar">
<%//接收参数代码          
	StringBuffer param=new StringBuffer(); 
	Enumeration paramNames = request.getParameterNames(); 
	if(paramNames!=null){         
	 while(paramNames.hasMoreElements()){                 
	  String paramName = (String) paramNames.nextElement();                  
	  String paramValue=request.getParameter(paramName);                  
	  if(paramValue!=null){//把参数拼成name=value;name2=value2;.....的形式                 
	   param.append(paramName).append("=").append(paramValue).append(";");                  
	  }
	 } 
	}               
%>
	     <form method=post name="form1" id="form1" action="<%=request.getContextPath()%>/runqian/reportJsp/demo/param.jsp">
	      <ta:panel id="f1" key="参数" cols="3">
	         <ta:text id="t1" key="字段1" name="t1"/>
	         <ta:text id="t2" key="字段2" name="t2"/>
	         <ta:text id="t3" key="字段3" name="t3"/>
	      </ta:panel>
	      <ta:buttonLayout>
	          <input type="submit" value="提交" id="sub1"/>
	      </ta:buttonLayout>
	     </form>
	         <center>
	            <report:html name="report1" srcType="file"
	             reportFileName="tc.raq" funcBarLocation=""
	             exceptionPage="/runqian/reportJsp/myError2.jsp"
	             params="<%=param.toString()%>" width="-1" height="-1"/>
	         </center>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>
