<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保信息详情</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:toolbarItem id="closeWinBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:datagrid id="dgAc20" fit="true">
		    <%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>	
		</ta:datagrid>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
	});	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow("ourWin");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>