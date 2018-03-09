<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位RPC</title>
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
			<ta:text id="aab001" key="单位ID" maxLength="20" labelWidth="120" />
			<ta:text id="aab999" key="单位管理码" maxLength="20" labelWidth="120" />
			<ta:text id="aae044" key="单位名称" maxLength="30" labelWidth="120" />
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true">
			<ta:datagrid id="dg1" onRowDBClick="fn_setData" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="aab999" key="单位管理码" align="center" dataAlign="center" />
				<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="center" />
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="center" />
				<ta:datagridItem id="aaa103" key="参保所在地" align="center" dataAlign="center" />
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
		if (Base.getValue('aab001') == '' && Base.getValue('aab999') == '' && Base.getValue('aae044') == '') {
			Base.msgTopTip('需最少输入一个查询条件');
			return;
		}
		Base.submit("form1", myPath() + "/process/synthesis/suggestFrameworkAction!getAb01List_q.do");
	}
	//关闭前对父界面需要的数据进行设值
	function fn_setData(e, rowdata) {
		parent.Base.setValue('aab999', rowdata.aab999);
		parent.Base.setValue('aab001', rowdata.aab001);
		parent.Base.setValue('aab001_s', rowdata.aab001);
		parent.Base.setValue('aae044', rowdata.aae044);
		parent.Base.setValue('aae040', rowdata.aae044);
		parent.Base.setValue('aab004', rowdata.aae044);
		parent.Base.setValue('aae044_s', rowdata.aae044);
		parent.Base.setValue('aaa103', rowdata.aaa103);
		parent.Base.closeWindow("newRPCWindow");
	}
	function fn_close() {
		parent.Base.closeWindow("newRPCWindow");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>