<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>预结算信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	    <ta:toolbar id="btns2">
		   <ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('win_yjs');" />
	    </ta:toolbar>
		<ta:form id="form1" fit="true">
		   <%@ include file="../common/lxbxFee.jsp"%>
		</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		});
</script>
<%@ include file="/ta/incfooter.jsp"%>		