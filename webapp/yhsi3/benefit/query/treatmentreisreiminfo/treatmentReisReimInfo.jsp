<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WorkinjuryCognizanceQuery</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:selectInput id="aaa077" key="补扣发业务类型" collection="AAA077" />
			<ta:selectInput id="aaa078" key="补扣标志" collection="AAA078" />
			<ta:date id="aae002" key="支付期号" issue="true" showSelectPanel="true" />
			<ta:box cols="2">
				<ta:text id="aac003" key="姓名" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入身份证号、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac002" key="身份证编号" readOnly="true" />
			<ta:text id="aac001" key="个人编号" display="false" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" columnWidth="0.9" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="aae016" key="复核标志" collection="AAE016" value="1" />
			<ta:selectInput id="aae110" key="核定标志" collection="AAE110" />
			<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" />
			<ta:date id="aae036_e" key="经办时间止" showSelectPanel="true" />
		</ta:panel>
		<ta:panel id="Ac75Panel" key="待遇核定信息" fit="true">
			<ta:datagrid id="Ac75Grid" fit="true" columnFilter="true" haveSn="true">
				<ta:datagridItem id="aab001" key="单位编号" width="100px" dataAlign="right"></ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="100px" hiddenColumn="false"></ta:datagridItem>
				<ta:datagridItem id="aac002" key="公民身份号码" width="150px" dataAlign="right"></ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="100px"></ta:datagridItem>
				<ta:datagridItem id="aaa077" key="补扣发业务类型" collection="AAA077" width="150px"></ta:datagridItem>
				<ta:datagridItem id="aaa078" key="补扣发标志" collection="AAA078"></ta:datagridItem>
				<ta:datagridItem id="aae058" key="待遇金额" dataAlign="right" width="100" totals="sum"></ta:datagridItem>
				<ta:datagridItem id="aae110" key="处理标志" collection="AAE110"></ta:datagridItem>
				<ta:datagridItem id="aae161" key="补扣原因" width="150px"></ta:datagridItem>
				<ta:datagridItem id="aae041" key="补扣开始年月" width="100px" dataAlign="center"></ta:datagridItem>
				<ta:datagridItem id="aae042" key="补扣截至年月" width="100px" dataAlign="center"></ta:datagridItem>
				<ta:datagridItem id="aae002" key="支付期号" width="100px" dataAlign="center"></ta:datagridItem>
				<ta:datagridItem id="aae036" key="经办时间" width="100px" dataAlign="center"></ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, "ac01", "aac003", 850, 200, 7, fn_setPersonBaseInfoData, 1, false);
		initializeSuggestFramework(2, null, "aab001", 700, 200, 3, fn_setUnitBaseInfoData, 1, false);
	});

	//个人编号RPC
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001DYString', {
			"dto['inputString']" : Base.getValue("aac003"),
			"dto['aae140']" : Base.getValue("aae140")
		});
	}

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow14.do", null, 1000, 450, null, null, true);
	}

	//单位RPC
	function callDwRPC() {
		sfwQueryUtil_newRPC(2, 'getAb01String', {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}

	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, null, true);
	}

	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", Base.getValue("qxkzAction") + "!query.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>