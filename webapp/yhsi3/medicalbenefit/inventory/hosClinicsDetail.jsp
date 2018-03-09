<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>本次申请包含的三目对码信息</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:toolbar id="ButtonLayout1">
			<ta:toolbarItem key="关闭[C]" hotKey="c" icon="icon-cancel" onClick="parent.Base.closeWindow('userwin')" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="ypdmGridPnl" key="三目对码详细信息" fit="true">
			<ta:datagrid id="smdmxx" forceFitColumns="true" fit="true">
				<ta:datagridItem id="ake001" key="社保三大目录编码" width="150" hiddenColumn="true" align="center" />
				<ta:datagridItem id="ake003" key="三大目录类别" collection="AKE003" width="80" align="center" />
				<ta:datagridItem id="ake002" key="社保三大目录名称" showDetailed="true" width="150" align="center" />
				<ta:datagridItem id="ake005" key="医疗机构三大目录编码" width="150" hiddenColumn="true" />
				<ta:datagridItem id="ake006" key="医疗机构药品目录名称" showDetailed="true" width="150" align="center" />
				<ta:datagridItem id="ykf012" key="医院价格"  width="50" align="center" dataAlign="right" />
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
