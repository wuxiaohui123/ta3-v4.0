<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>转入地银行信息RPC</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" icon="xui-icon-query" key="查询" onClick="fn_query()" asToolBarItem="true" />
		<ta:button id="closeBtn" icon="xui-icon-spotClose" key="关闭" onClick="fn_close()" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:fieldset id="f0" cols="3">
			<ta:text id="aae008" key="银行行号" labelWidth="120" />
			<ta:text id="aae010" key="账号" span="2" />
			<ta:text id="aae009" key="开户名" labelWidth="120" />
			<ta:text id="yae597" key="银行名称" span="2" />
			<ta:text id="aae140" display="false" />
			<ta:text id="inputString" display="false" />
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true">
			<ta:datagrid id="dg11" onRowDBClick="fn_setData" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="aae008" key="银行行号" align="center" dataAlign="center" />
				<ta:datagridItem id="aae010" key="账号" align="center" dataAlign="center" />
				<ta:datagridItem id="aae009" key="开户名" align="center" dataAlign="center" />
				<ta:datagridItem id="yae597" key="银行名称" align="center" dataAlign="center" />
				<ta:datagridItem id="aaf002" key="机构编码" align="center" dataAlign="center" hiddenColumn="false" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fn_query(){
		Base.setValue('aae140',parent.Base.getValue('aae140'));
		if (Base.getValue('aae008') == '' && Base.getValue('aae010') == '' && Base.getValue('aae009') == '' && Base.getValue('yae597') == '') {
			Base.msgTopTip('需最少输入一个查询条件');
			return;
		}
		Base.submit("form1", myPath() + "/process/synthesis/suggestFrameworkAction!getBankInByAae140List.do");
	}
	function fn_close(){
		parent.Base.closeWindow("newRPCWindow");
	}
	function fn_setData(e,rowdata){
		parent.Base.setValue('aae008_r', rowdata.aae008);
		parent.Base.setValue('aae010_r', rowdata.aae010);
		parent.Base.setValue('aae009_r', rowdata.aae009);
		parent.Base.setValue('yae597_r', rowdata.yae597);
		parent.Base.setValue('aaf002_r', rowdata.yae597);
		parent.Base.closeWindow("newRPCWindow");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>