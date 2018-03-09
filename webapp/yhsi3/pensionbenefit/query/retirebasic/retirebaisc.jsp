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
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" hotKey="ctrl+P" onClick="print()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" columnWidth="0.9" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:box cols="2">
				<ta:text id="aac003" key="姓名" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入身份证号、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="yib301" key="所属城区" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004" />
			<ta:date id="aac006" key="出生日期" showSelectPanel="true" />
			<ta:date id="aae210" key="待遇享受年月" issue="true" isFocusShowPanel="true" showSelectPanel="true" />
			<ta:selectInput id="aac064" key="退役军人类别" collection="AAC064" />
			<ta:selectInput id="aac085" key="原工商业者标志" collection="AAC085" display="false" />
			<ta:selectInput id="aae140" key="保险类型" display="false" />
			<ta:selectInput id="yab003" key="经办机构" display="false" />
			<ta:box span="1" cols="2">
				<ta:date id="aic162_s" key="离退休日期起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aic162_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
		</ta:panel>
		<ta:panel id="ic10Panel" key="离退休人员基本信息" fit="true">
			<ta:datagrid id="ic10Grid" fit="true" columnFilter="true" haveSn="true">
				<ta:datagridItem id="aab001" key="单位编号" width="120" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="120" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aac002" key="公民身份号码" width="150" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="100">
				</ta:datagridItem>
				<ta:datagridItem id="aac006" key="出生日期" dataAlign="center" dataType="date" width="120">
				</ta:datagridItem>
				<ta:datagridItem id="aic162" key="离退休日期" dataAlign="center" dataType="date" width="120">
				</ta:datagridItem>
				<ta:datagridItem id="aae210" key="待遇开始年月" width="120" dataAlign="center">
				</ta:datagridItem>
				<ta:datagridItem id="yac009" key="初次待遇" dataAlign="right" width="120" totals="sum">
				</ta:datagridItem>
				<ta:datagridItem id="dqdy" key="当前待遇" dataAlign="right" width="120" totals="sum">
				</ta:datagridItem>
				<ta:datagridItem id="jfhj" key="缴费年限合计" width="120" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="120">
				</ta:datagridItem>
				<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" width="120">
				</ta:datagridItem>
				<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" width="120">
				</ta:datagridItem>
				<ta:datagridItem id="aaz009" key="代发机构ID" width="120" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aae010" key="银行帐号" width="150" dataAlign="right">
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
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		initializeSuggestFramework(1,"ac01","aac003",700,200,4,'',1,false);
		initializeSuggestFramework(2,null,"aab001",700,200,3,'',1,false);
	});
	
	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {"dto['inputString']" : Base.getValue("aac003"),"dto['aae140']":Base.getValue("aae140")});
	}

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, null, true);
	}
	
	//单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']" : Base.getValue("aab001")});
	}
	
	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, null, true);
	}
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function query(){
		Base.submit("form1", Base.getValue("qxkzAction")+"!query.do");
	}
	
	//打印花名册
	function print(){
		var aab001 = Base.getValue("aab001");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var yib301 = Base.getValue("yib301");
		var aic162 = Base.getValue("aic162_s");
		if(aab001 == '' || aab001 == null){
			Base.alert("请输入单位编号！");
			Base.focus("aab001");
			return;
		}
		if(yib301 == '' || yib301 == null){
			Base.alert("请选择所属城区！");
			return;
		}
		if(aic162 == '' || aic162 == null){
			Base.alert("请选择离退休日期开始");
			return;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=roster.raq&" 
				+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
				+ "serverPagedPrint=no&mirror=no&" + "paramString=aab001=" + aab001 + ";aic162=" + aic162
				+ ";yab003=" + yab003 + ";yib301=" + yib301 + ";aae140=" + aae140);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>