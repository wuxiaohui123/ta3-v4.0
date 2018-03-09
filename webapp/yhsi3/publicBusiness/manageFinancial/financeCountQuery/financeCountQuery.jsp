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
			<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]"
				hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]"
				hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fld_emp" cols="3" key="查询条件">
			<ta:date id="aab191_b" key="到账开始日期" showSelectPanel="true" labelWidth="120" required="true"/>
			<ta:date id="aab191_e" key="到账结束日期" showSelectPanel="true" labelWidth="120" required="true"/>
			<ta:selectInput id="aaa121" key="业务类型" labelWidth="120" />
			<ta:text id="yad021" key="数据操作单元号" labelWidth="120"/>
			<ta:text id="ufs004" key="银行账号" labelWidth="120"/>
			<ta:selectInput id="aad016" key="结算方式" labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pel" bodyStyle="margin:0px" fit="true">
			<ta:datagrid id="countList" haveSn="true" fit="true" forceFitColumns="true">
				<ta:datagridItem id="dzbs" key="登帐笔数" align="center" dataAlign="center"/>
				<ta:datagridItem id="ywbs" key="业务单据笔数" align="center" dataAlign="center"/>
				<ta:datagridItem id="aae019" key="单据总金额" align="center" dataAlign="center"/>
				<ta:datagridItem id="hdzbs" key="回单总笔数" align="center" dataAlign="center"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	function queryData() {
		Base.submit("form1", "financeCountQueryAction!toQuery.do", null, null, null,
				function(data) {
				});
	}
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>