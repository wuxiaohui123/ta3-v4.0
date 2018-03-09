<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
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
			<ta:text id="yac250" key="原参保机构行政区划代码" maxLength="30" labelWidth="150" />
			<ta:text id="yac256" key="原参保地区名称 " maxLength="20" labelWidth="150" />
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true">
			<ta:datagrid id="dg7" onRowDBClick="fn_setData" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="yac250" key="原参保机构行政区划代码" align="center" dataAlign="center" />
				<ta:datagridItem id="yac256" key="原参保地区名称" align="center" dataAlign="center" />
				<ta:datagridItem id="yac251" key="原参保机构名称" align="center" dataAlign="center" />
				<ta:datagridItem id="yac252" key="原参保机构联系电话" align="center" dataAlign="center" />
				<ta:datagridItem id="yac253" key="原参保机构地址" align="center" dataAlign="center" />
				<ta:datagridItem id="yac254" key="原参保机构邮编" align="center" dataAlign="center" />
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
		if (Base.getValue('yac250') == '' && Base.getValue('yac256') == '') {
			Base.msgTopTip('需最少输入一个查询条件');
			return;
		}
		Base.submit("form1", myPath() + "/process/synthesis/suggestFrameworkAction!getYac256List.do");
	}
	//关闭前对父界面需要的数据进行设值
	function fn_setData(e, rowdata) {
		parent.Base.setValue('yac250', rowdata.yac250);
		parent.Base.setValue('yac256', rowdata.yac256);
		parent.Base.setValue('yac251', rowdata.yac251);
		parent.Base.setValue('yac252', rowdata.yac252);
		parent.Base.setValue('yac253', rowdata.yac253);
		parent.Base.setValue('yac254', rowdata.yac254);
		parent.Base.closeWindow("newRPCWindow");
	}
	function fn_close() {
		parent.Base.closeWindow("newRPCWindow");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>