<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WorkinjuryCognizanceQuery</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<ta:text id="yab003" key="经办机构" display="false" />
		</ta:box>
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:date id="aae002" key="做账期号" issue="true" showSelectPanel="true" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" columnWidth="0.9" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" />
			<ta:selectInput id="aae145" key="发放方式" collection="AAE145" onSelect="checkRequired" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" display="false" />
			<ta:selectInput id="yaf012" key="银行类别" collection="AAF002" display="false" />
			<ta:selectInput id="aaz009" key="代发机构" collection="AAZ009" display="false" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" display="true" readOnly="false" />
			<ta:selectInput id="aac004" key="性别" display="true" readOnly="false" collection="AAC004" />
			<ta:selectInput id="yad169" key="发放对象" collection="YAD169" />
			<ta:selectInput id="aaa079" key="拨付方式" collection="AAA079" />
			<ta:selectInput id="aaa088" key="发放类型" collection="AAA088" />
			<ta:selectInput id="aaa036" key="待遇类别" collection="AAA036" onSelect="fnSetAc82Grid" />
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
		</ta:panel>
		<ta:panel id="Ac82Panel" key="待遇支付信息" fit="true">
			<ta:datagrid id="Ac82Grid" fit="true" columnFilter="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aab001" key="单位编号" width="80px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae044" key="单位名称" width="160px" dataAlign="center" align="center" sortable="true" showDetailed="true" />
				<ta:datagridItem id="aae044_y" key="原单位名称" width="160px" dataAlign="center" align="center" sortable="true" showDetailed="true" hiddenColumn="true" />
				<ta:datagridItem id="aab019" key="单位类型" width="160px" dataAlign="right" showDetailed="true" collection="AAB019" />
				<ta:datagridItem id="aaz220" key="应付计划事件ID" hiddenColumn="false" />
				<ta:datagridItem id="aac001" key="个人编号" width="100px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aac003" key="姓名" width="80px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aac004" key="性别" width="50px" dataAlign="center" align="center" sortable="true" collection="AAC004" />
				<ta:datagridItem id="aac002" key="公民身份号码" width="180px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aac003_s" key="死亡人员姓名" width="120px" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aae144" key="供养关系" width="80px" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aae005" key="联系电话" width="100px" dataAlign="center" align="center" />
				<ta:datagridItem id="aae002" key="支付期号" width="80px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae003" key="费款所属期" width="80px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aaa088" key="发放类型" collection="AAA088" width="120px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aaa036" key="待遇类别" collection="AAA036" width="120px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" width="120px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae019" key="待遇金额" width="120" totals="sum" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae117" key="支付标志" collection="AAE117" width="120px" dataAlign="center" align="center" />
				<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" width="170px" dataAlign="center" align="center" />
				<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" width="120px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae010" key="银行账号" width="150" dataAlign="center" align="center" />
				<ta:datagridItem id="aaz031" key="拨付通知ID" width="180px" dataAlign="center" align="center" />
				<ta:datagridItem id="yad019" key="失败原因" collection="AAE357" dataAlign="center" align="center" />
				<ta:datagridItem id="aae011" key="经办人" width="100px" collection="AAE011" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae036" key="经办时间" width="120px" dataAlign="center" align="center" sortable="true" showDetailed="true" />

				<ta:dataGridToolPaging url="paymentInfoAction!query.do" pageSize="1000" showButton="true" expKeyOrName="false" showExcel="true" submitIds="jstj" sqlStatementName="paymentinfo.getPaymentInfo" resultType="java.util.HashMap"></ta:dataGridToolPaging>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,null,"aac001",700,200,5,fn_setData,1,false);
		initializeSuggestFramework(2,null,"aab001",700,200,3,'',1,false);
		var aae140 = Base.getValue("aae140");
		if(aae140 == "210"){
		    Base.setGridColumnShow("Ac82Grid","aae044_y");
		}
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
		Base.submit("form1", Base.getValue("qxkzAction")+"!query.do",null,null,false,function(data){
			Base.setPanelTitle("Ac82Panel","待遇支付信息,合计:总人数："+data.fieldData.zrs+";总金额："+data.fieldData.zje);
		});
	}
	
	function checkRequired(){
		var aae145 = Base.getValue("aae145");
		if(aae145 == "11"){
			Base.hideObj("aaf002");
	   		Base.showObj(["yaf012","aaz009"]); 
		}else if(aae145 == "12"){
			Base.hideObj(["aaf002","yaf012","aaz009"]);
		}else if(aae145 == "14"){
			Base.hideObj(["aaf002","aaz009"]);
	   		Base.showObj("yaf012"); 
		}else if(aae145 == "21"){
			Base.hideObj(["yaf012","aaz009"]);
	   		Base.showObj("aaf002"); 
		}else{
	   		alert("支付方式录入错误！");
	   		return false;
	   	}	
	}
	
	//打印
	function print(){
		var yab003 = Base.getValue("yab003");
		var aac001 = Base.getValue("aac001");//个人编号
		var aab001 = Base.getValue("aab001");//单位编号
		var aae145 = Base.getValue("aae145");//发放方式
		var aae002 = Base.getValue("aae002");//做账期号
		var aaa036 = Base.getValue("aaa036");//待遇类别
		var aaa088 = Base.getValue("aaa088");//发放类型
		var aaa079 = Base.getValue("aaa079");//拨付方式
		var yad169 = Base.getValue("yad169");//发放对象	
		var aae140 = Base.getValue("aae140");//险种类型
		var aae036_s = Base.getValue("aae036_s");
		var aae036_e = Base.getValue("aae036_e");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSyljstzs.raq&" 
				+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
				+ "serverPagedPrint=no&mirror=no&" + "paramString=yab003=" + yab003 + ";aab001=" + aab001+ ";aae145=" + aae145 
			    + ";aae002=" + aae002 + ";aaa036=" + aaa036 + ";aaa088=" + aaa088 + ";aaa079=" + aaa079 + ";yad169=" + yad169
			    + ";aae140=" + aae140 + ";aac001=" + aac001 + ";aae036_s=" + aae036_s + ";aae036_e=" + aae036_e);
	}

	function fn_setData() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac002", g_Suggest[0]);
		Base.setValue("aac003", g_Suggest[1]);
		Base.setValue("aac004", g_Suggest[3]);
	}

	function fnSetAc82Grid(value, key) {
		var aae140 = Base.getValue("aae140");//险种类型
		var aaa036 = Base.getValue("aaa036");
		if (aae140 == "410" && aaa036 == "400100") {
			Base.setGridColumnShow("Ac82Grid", "aac003_s");
			Base.setGridColumnShow("Ac82Grid", "aae144");
		} else {
			Base.setGridColumnHidden("Ac82Grid", "aac003_s");
			Base.setGridColumnHidden("Ac82Grid", "aae144");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>