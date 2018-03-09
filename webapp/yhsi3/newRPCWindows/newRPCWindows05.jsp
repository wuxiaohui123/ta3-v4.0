<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社保机构银行信息RPC</title>
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
			<ta:text id="aaz003" key="当事人银行账号ID" maxLength="20" labelWidth="120" />
			<ta:text id="aaf002" key="金融行业机构编码" maxLength="30" labelWidth="120" />
			<ta:text id="yae597" key="银行简称" maxLength="30" labelWidth="120" />
			<ta:text id="aae010" key="银行账号" maxLength="30" labelWidth="120" />
			<ta:text id="aaz065" key="银行ID" maxLength="30" labelWidth="120" />
			<ta:text id="aae009" key="户名 " maxLength="30" labelWidth="120" />
			<ta:text id="aae140" display="false"/>
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true">
			<ta:datagrid id="dg4" onRowDBClick="fn_setData" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="aaz003" key="当事人银行账号ID" align="center" dataAlign="center" />
				<ta:datagridItem id="aaf002" key="金融行业机构编码" align="center" dataAlign="center" collection="" />
				<ta:datagridItem id="yae597" key="银行简称" align="center" dataAlign="center" />
				<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="center" />
				<ta:datagridItem id="aae009" key="户名 " align="center" dataAlign="center" />
				<ta:datagridItem id="aaz065" key="银行ID" align="center" dataAlign="center" />
				<ta:datagridItem id="aae008" key="银行编号" align="center" dataAlign="center" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fn_query() {
		if (Base.getValue('aaz003') == '' && Base.getValue('aaf002') == '' && Base.getValue('yae597') == '' && Base.getValue('aae010') == '' && Base.getValue('aaz065') == '' && Base.getValue('aae009') == '') {
			Base.msgTopTip('需最少输入一个查询条件');
			return;
		}
		Base.submit("form1", myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbList.do");
	}
	//关闭前对父界面需要的数据进行设值
	function fn_setData(e, rowdata) {
		parent.Base.setValue("sb_"+Base.getValue("aae140")+'_aae010', rowdata.aae010);
		parent.Base.setValue("sb_"+Base.getValue("aae140")+'_aae009', rowdata.aae009);
		parent.Base.setValue(Base.getValue("aae140")+'_aaf002', rowdata.aaf002);
		parent.Base.setValue(Base.getValue("aae140")+'_yaf010', rowdata.aaz003);
		parent.Base.closeWindow("newRPCWindow");
	}
	function fn_close() {
		parent.Base.closeWindow("newRPCWindow");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>