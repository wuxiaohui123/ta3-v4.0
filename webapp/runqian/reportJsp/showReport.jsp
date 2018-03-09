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
<%
	request.setCharacterEncoding( "GBK" );
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
<jsp:include page="toolbar.jsp" flush="false" />
<table id="rpt" align="center"><tr><td>
	<table id="param_tbl" width="100%" height="100%"><tr><td>
	</td>
	<td><a href="javascript:_submit( form1 )"><img src="../images/query.jpg" border=no style="vertical-align:middle"></a></td>
	</tr>	
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation="top"
			needPageMark="yes"
			generateParamForm="no"
			params="<%=param.toString()%>"
			exceptionPage="/reportJsp/myError2.jsp"
			appletJarName="runqian/runqianReport4Applet.jar,runqian/dmGraphApplet.jar"
			needSelectPrinter="no"
			needSaveAsExcel="yes"
			needPrint="yes"
		/>
</table>

</body>
</html>
