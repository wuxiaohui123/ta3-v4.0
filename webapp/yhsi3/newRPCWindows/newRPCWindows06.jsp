<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位人员信息RPC</title>
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
			<ta:text id="aac001" key="人员ID" maxLength="20" labelWidth="120" />
			<ta:text id="aac003" key="姓名" maxLength="30" labelWidth="120" />
			<ta:text id="aac002" key="身份证" maxLength="30" labelWidth="120" />
			<ta:text id="aab999" key="单位管理码" maxLength="30" labelWidth="120" />
			<ta:text id="aaz001" key="单位ID" maxLength="30" labelWidth="120" />
			<ta:text id="aae044" key="单位名称 " maxLength="30" labelWidth="120" />
			<ta:text id="aaz067" key="家庭ID " maxLength="30" labelWidth="120" />
			<ta:text id="aab401" key="户口簿编号 " maxLength="30" labelWidth="120" />
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true">
			<ta:datagrid id="dg5" onRowDBClick="fn_setData" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="type" key="当事人类型" align="center" dataAlign="center" />
				<ta:datagridItem id="id" key="当事人ID" align="center" dataAlign="center" collection="" />
				<ta:datagridItem id="name" key="当事人名称" align="center" dataAlign="center" />
				<ta:datagridItem id="biaozhi" key="当事人外部标志" align="center" dataAlign="center" />
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
		if (Base.getValue('aac001') == '' && Base.getValue('aac003') == '' && Base.getValue('aac002') == '' && Base.getValue('aab999') == '' && Base.getValue('aaz001') == '' && Base.getValue('aae044') == ''&& Base.getValue('aaz067') == '' && Base.getValue('aab401') == '') {
			Base.msgTopTip('需最少输入一个查询条件');
			return;
		}
		Base.submit("form1", myPath() + "/process/synthesis/suggestFrameworkAction!getDSRXXList.do");
	}
	//关闭前对父界面需要的数据进行设值
	function fn_setData(e, rowdata) {
		parent.Base.setValue('aaz010', rowdata.id);
		parent.Base.setValue('yae030', rowdata.name);
		parent.Base.setValue('yaa030', rowdata.name);
		parent.Base.setValue('aaz010type', rowdata.type);
		parent.Base.closeWindow("newRPCWindow");
	}
	function fn_close() {
		parent.Base.closeWindow("newRPCWindow");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>