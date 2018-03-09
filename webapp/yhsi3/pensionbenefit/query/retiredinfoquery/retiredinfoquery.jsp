<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>retireBasicAction</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" hotKey="ctrl+P" asToolBarItem="true" display="false" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="130" required="true" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC();" columnWidth="0.9" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:box cols="2">
				<ta:text id="aac003" key="姓名" labelWidth="130" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="aac004" key="性别" collection="AAC004" />
			<ta:date id="aac006" key="出生日期" showSelectPanel="true" />
			<ta:date id="aae210" key="待遇享受年月" issue="true" isFocusShowPanel="true" showSelectPanel="true" />
			<ta:selectInput id="aic161" key="离退休类别" collection="AIC161" />
			<ta:selectInput id="aac063" key="供养亲属标志" collection="AAC063" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" />
			<ta:box span="1" cols="2">
				<ta:date id="aic162_s" key="离退休日期起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aic162_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
		</ta:panel>
		<ta:panel id="ic10Panel" key="离退休人员基本信息" fit="true">
			<ta:datagrid id="ic10Grid" fit="true" columnFilter="true" haveSn="true">
				<ta:datagridItem id="aab001" key="单位编号" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" width="170" dataAlign="left" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac002" key="公民身份号码" width="150" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="80" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac004" key="性别" width="50" collection="AAC004" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac006" key="出生日期" dataAlign="center" dataType="date" width="110" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aic162" key="离退休日期" dataAlign="center" dataType="date" width="110" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac063" key="供养亲属标志" width="100" collection="AAC063" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae210" key="待遇开始年月" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae235" key="待遇终止年月" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="yac001" key="个人最大发放期号" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae019" key="金额" width="100" totals="sum" dataAlign="right" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" width="80" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae009" key="户名" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae010" key="银行帐号" width="160" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, null, "aac003", 700, 200, 4, '', 1, false);
		initializeSuggestFramework(2, null, "aab001", 700, 200, 3, '', 1, false);
	});
    
	// 单位RPC
	function callDwRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {"dto['inputString']" : Base.getValue("aab001")});
	}

	// 打开单位信息查询页面
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, fn_setDwData, true);
	}

	// 查询单位信息回调函数
	function fn_setDwData() {

	}
    
	// 待遇人员RPC
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, "getAc01String", {"dto['inputString']" : Base.getValue("aac003")});
	}
	
	// 打开个人信息查询页面
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
    
	// 查询个人信息回调函数
	function fn_setRyData(){
		
	}
	
	// 开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", Base.getValue("qxkzAction") + "!query.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>