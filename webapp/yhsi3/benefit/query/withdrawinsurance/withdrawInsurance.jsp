<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WithdrawInsuranceQuery</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印待遇核定表" onClick="print()" asToolBarItem="true" display="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:date id="aae210" key="退保年月" issue="true" showSelectPanel="true" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" columnWidth="0.9" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" />
			<ta:selectInput id="aae016" key="复核标志" collection="AAE016" />
			<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" />
			<ta:date id="aae036_e" key="经办时间止" showSelectPanel="true" />
			<ta:selectInput id="aae110" key="核定标志" collection="AAE110" />
		</ta:panel>
		<ta:panel id="Ac71Panel" key="待遇核定信息" fit="true">
			<ta:datagrid id="Ac71Grid" fit="true" columnFilter="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="zgzcs" key="资格证打印次数" width="120px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="nszcs" key="年审证打印次数" width="120px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aab001" key="单位编号" width="100px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" width="180px" dataAlign="left" align="center" sortable="true" showDetailed="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="100px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz170" key="人员待遇核定事件ID" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac002" key="公民身份号码" width="150px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="100px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac004" key="性别" width="80px" dataAlign="center" align="center" collection="AAC004" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="tbyy" key="人员类别" width="100px" dataAlign="center" align="center" sortable="true"></ta:datagridItem>
				<ta:datagridItem id="aae210" key="退保年月" width="120px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae129" key="核发金额" width="120" dataAlign="right" totals="sum" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae133" key="待遇领取人姓名" width="120px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="aae006" key="地址" width="150px" dataAlign="left" align="center" showDetailed="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae005" key="联系电话" width="100px" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae138" key="死亡日期" width="120px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="yac551" key="丧葬类型" width="120px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" width="80px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="aae110" key="处理标志" collection="AAE110" width="80px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="aae002" key="支付期号" width="100px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz002" key="业务日志编码" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz157" key="人员社会保险明细ID" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz159" key="人员参保关系ID" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" maxChart="4" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae036" key="经办时间" width="120px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="yab003" key="经办机构" width="120px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" pageSize="1000" showButton="true"     submitIds="" sqlStatementName=""  resultType="java.util.HashMap" selectExpButtons="1"></ta:dataGridToolPaging>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<br />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, "ac01", "aac001", 850, 200, 7, '', 2, false);
		initializeSuggestFramework(2, null, "aab001", 700, 200, 3, '', 1, false);
	});
	
	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {"dto['inputString']" : Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
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
	function query() {
		Base.submit("form1", "withdrawInsuranceAction!query.do");
	}

	//打印养老待遇
	function print() {
		var key = Base.getValue("aaa076");
		var data = Base.getGridSelectedRows("Ac71Grid");
		if (data == "" || data == null) {
			Base.alert("请选择一条待遇核定信息！");
		}
		var aac001 = data[0].aac001;
		if (aac001 == null || aac001 == "") {
			Base.alert("个人编号为空,不能打印");
			return;
		}
		var aaz170 = data[0].aaz170;
		if (aaz170 == null || aaz170 == "") {
			Base.alert("核定事件ID为空,不能打印");
			return;
		}
		var aaz002 = data[0].aaz002;
		var aaz157 = data[0].aaz157;
		var aaz159 = data[0].aaz159;
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=treatmentLumpsum.raq&" 
				+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
				+ "serverPagedPrint=no&mirror=no&" + "paramString=aac001=" + aac001 + ";aaz002="+ aaz002
				+ ";aaz157=" + aaz157 + ";aaz159=" + aaz159);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>