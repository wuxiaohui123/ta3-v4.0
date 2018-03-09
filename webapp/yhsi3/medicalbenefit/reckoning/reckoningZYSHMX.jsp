<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构审核_病种</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="btnClose"   key="退出"    icon="xui-icon-spotClose"    onClick="parent.Base.closeWindow('detailWin')" />
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlJssj"  key="结算信息" fit="true">
			<ta:datagrid id="dgrdJSLX" fit="true" haveSn="true" forceFitColumns="true">
			  <%@ include file="reckoning_kc24Detail.jsp"%>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>	
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
   });
</script>
<%@ include file="/ta/incfooter.jsp"%>	
		