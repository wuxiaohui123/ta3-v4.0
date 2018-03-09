<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>check1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fld_emp" cols="3" key="查询条件" scalable="false">
			<ta:date id="aae036_b" key="经办开始日期" showSelectPanel="true" labelWidth="120" />
			<ta:date id="aae036_e" key="经办结束日期" showSelectPanel="true" labelWidth="120" />
			<ta:selectInput id="yad115" key="银行类别" labelWidth="120" collection="AAF002" />
		</ta:panel>
		<ta:panel id="pel" key="回盘信息" fit="true">
			<ta:datagrid id="list" haveSn="true" fit="true"
				forceFitColumns="true" columnFilter="true">
				<ta:datagridItem id="yad020" key="银行进账流水号" align="center" dataAlign="center"/>
				<ta:datagridItem id="yad115" key="银行类别" align="center" dataAlign="center" collection="AAF002"/>
				<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="center"/>
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center"/>
				<ta:datagridItem id="aae019" key="金额" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="cnt" key="笔数" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function queryData() {
		Base.submit("form1", "bankQueryAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>