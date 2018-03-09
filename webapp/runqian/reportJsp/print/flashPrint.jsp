<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="/ta/inc.jsp"%>
	<link type="text/css" href="../css/style.css" rel="stylesheet"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/mis2/gezFlashPrint/js/raqFlashPrint.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/mis2/gezFlashPrint/js/user.js"></script>
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
<jsp:include page="../toolbar.jsp" flush="false" />
<div style="width: 100%;text-align:center;"><button onclick="raqFlashPrint()">Flash打印</button></div>
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
            funcBarLocation=""
		/>
	</td>
	</tr>
</table>
<script language="javascript">
//调用报表flash打印
	function raqFlashPrint(){
		var _ctxPath = '<%=request.getContextPath() %>';// 应用路径
		var _htmlid = 'report1';// 报表id
		var _report = '<%=report %>';// 报表名
		var _direct = 'false';// 直接打印
		var _pop = 'false';// 弹出新页面
		var _bar = 'top';// 工具条
		var _root = '/mis2/';// mis2路径
		var _directPrev = 'false';// 直接进入flash打印
		var _cachedId = _getReportCachedId(_htmlid);// 缓存
		
		if(_cachedId != null){
			runqianFlashPrint(_ctxPath, _htmlid, _report, _direct , _directPrev, _pop, _bar, 'false', _cachedId, _root);
		}
	}
	// 获取报表的缓存ID
	function _getReportCachedId(reportId){
        var rlt = eval(reportId + "_cachedId");
		if(rlt == null){
			try{
				rlt = document.getElementsByName(reportId + "_cachedId")[0].value;
			}catch(e){
				alert("get cachedId error, please check it");
			}
		}
		return rlt;
	}
</script>
</body>
</html>
