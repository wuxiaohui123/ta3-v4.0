<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="/ta/inc.jsp"%>
</head>
<body>
<%
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

%>
   <table width="100%" height="100%">
	<tr>
	<td align="center">
		<report:html name="report1" reportFileName="<%=report%>"
			params="<%=param.toString()%>"
			exceptionPage="/runqian/reportJsp/myError2.jsp"
			appletJarName="runqian/runqianReport4Applet.jar,runqian/dmGraphApplet.jar"
            printerName="Fax"
            needPrintPrompt="yes" 
            needSelectPrinter="yes"
            funcBarLocation="top"
            needPrint="yes"
            needSaveAsExcel="yes"
            needSaveAsExcel2007="yes"
            needSaveAsPdf="yes"
            needSaveAsText="yes"
            needSaveAsWord="yes"
		/>
	</td>
	</tr>
</table>
<script language="javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
</script>
</body>
</html>
