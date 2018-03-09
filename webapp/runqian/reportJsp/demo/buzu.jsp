<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>web分页后，最后一页补足空白行</title>
	<%@ include file="/ta/inc.jsp"%>
	<link type="text/css" href="<%=basePath %>/runqian/reportJsp/css/style.css" rel="stylesheet"/>
</head>
<body>
<%
	//request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	
	//保证报表名称的完整性
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".raq")) <= 0 ){
		report = report + ".raq";
		iTmp = 0;
	}
	
	Enumeration paramNames = request.getParameterNames();
	if(paramNames!=null){
		while(paramNames.hasMoreElements()){
			String paramName = (String) paramNames.nextElement();
			String paramValue=request.getParameter(paramName);
			if(paramValue!=null){
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}

	//以下代码是检测这个报表是否有相应的参数模板
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>

<table align="left">
   <button onclick="downRaq()">下载模板</button>
</table>
<ta:box fit="true" cssStyle="overflow:auto">
<table id="rpt" align="left" ><tr><td>
<%	//如果参数模板存在，则显示参数模板
	if( f.exists() ) {
	%>
	<table id="param_tbl" width="100%" height="100%"><tr><td>
		<report:param name="form1" paramFileName="<%=paramFile%>"
			needSubmit="no"
			params="<%=param.toString()%>"
		/>
	</td>
	<td><a href="javascript:_submit( form1 )"><img src="../images/search.gif" border=no style="vertical-align:middle"></a></td>
	</tr></table>
	<% }
%>
<table align="center" width="100%" height="100%" >
	<tr><td>
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation="top"
			needPageMark="yes"
			generateParamForm="no"
			params="<%=param.toString()%>"
			needPivot="yes"
			pivotLabel=""
			exceptionPage="/runqian/reportJsp/myError2.jsp"
			appletJarName="runqian/runqianReport4Applet.jar,runqian/dmGraphApplet.jar"
		/>
	</td></tr>
</table>
</ta:box>
<script language="javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function downRaq(){
	 	 var raqName="<%=report%>";
	  	 window.open(Base.globvar.contextPath+"/runqian/reportJsp/downRaq.jsp?raqName="+raqName);
	}
	//设置分页显示值
	//document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	//document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();
</script>
</body>
</html>
