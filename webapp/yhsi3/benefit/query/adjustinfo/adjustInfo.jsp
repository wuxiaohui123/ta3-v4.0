<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WorkinjuryCognizanceQuery</title>
<%@ include file="/ta/inc.jsp"%>
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
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" columnWidth="0.9" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:date id="aae212" key="增资生效期号" issue="true" showSelectPanel="true" />
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" />
			<ta:selectInput id="aaz095" key="调整文号" collection="AAZ095" />
		</ta:panel>
		<ta:panel id="Ac78Panel" key="待遇核定信息" fit="true">
			<ta:datagrid id="Ac78Grid" fit="true" columnFilter="true" haveSn="true">
				<ta:datagridItem id="aab001" key="单位编号" width="120px" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="120px" hiddenColumn="false">
				</ta:datagridItem>
				<ta:datagridItem id="aac002" key="公民身份号码" width="180px" dataAlign="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="100px">
				</ta:datagridItem>
				<ta:datagridItem id="aae212" key="增资生效期号" width="120px" dataAlign="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae176" key="金额" dataAlign="right" totals="sum" width="100px">
				</ta:datagridItem>
				<ta:datagridItem id="aae188" key="调整差额" dataAlign="right" width="120px">
				</ta:datagridItem>
				<ta:datagridItem id="aae041" key="补发开始期号" width="120px" dataAlign="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae042" key="补发截至期号" width="120px" dataAlign="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae058" key="共调整补发金额" dataAlign="right" totals="sum" width="120px">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, "ac01", "aac001", 700, 200, 7, '', 2, false);
		initializeSuggestFramework(2, null, "aab001", 700, 200, 3, '', 1, false);
	});

	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", Base.getValue("qxkzAction") + "!query.do");
	}

	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001DYString', {
			"dto['inputString']" : Base.getValue("aac001"),
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
</script>
<%@ include file="/ta/incfooter.jsp"%>