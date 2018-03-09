<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>一次性待遇批量支付</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇支付[S]" icon="xui-icon-spotSave" hotKey="S" onClick="transProcess();" asToolBarItem="true" />
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="BackBtn" key="支付回退[B]" icon="icon-undo" hotKey="B" asToolBarItem="true" onClick="toBack()" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="R" key="重置[R]" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<ta:text id="yab003" key="经办机构" display="false" />
		</ta:panel>

		<ta:panel id="flt_jbxx" cols="1" cssStyle="margin:5px;" key="基本信息">
			<ta:box cols="3">
				<ta:date id="aae002" key="做账期号" issue="true" showSelectPanel="true" required="true" labelWidth="130" />
				<ta:selectInput id="yad169" key="拨付对象" required="true" labelWidth="130" collection="YAD169" filter="11,21,31" span="1" onSelect="fn_bfzt" reverseFilter="true" value="21" readOnly="false" />
				<ta:selectInput id="aaa076" key="核定类型" labelWidth="130" collection="AAA076" span="1" reverseFilter="false" />
			</ta:box>
			<ta:box cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/aidBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<ta:text id="aaz030" key="支付流水号" display="false" labelWidth="130" />
			</ta:box>
		</ta:panel>

		<ta:box id="box0" height="330">
			<ta:tabs id="tabs1" fit="true">
				<ta:tab id="tab1" key="可支付的一次性待遇信息">
					<ta:datagrid id="list1" forceFitColumns="true" fit="true" haveSn="true" columnFilter="true" defaultColumnWidth="300" selectType="checkbox" onRowDBClick="fn_detailsac73view">
						<ta:datagridItem id="aab001" key="单位编号" width="60" align="center" dataAlign="center" />
						<ta:datagridItem id="aae044" key="单位名称" width="170" dataAlign="left" align="center" />
						<ta:datagridItem id="aac002" key="身份证号码" width="100" dataAlign="left" align="center" hiddenColumn="false" />
						<ta:datagridItem id="aac001" key="个人编号" width="60" dataAlign="center" align="center" />
						<ta:datagridItem id="aac003" key="姓名" width="60" dataAlign="left" align="center" />
						<ta:datagridItem id="aaa076" key="待遇核定类型" collection="AAA076" width="120" dataAlign="center" align="center" />
						<ta:datagridItem id="yad169" key="支付对象" collection="yad169" width="80" dataAlign="center" align="center" />
						<ta:datagridItem id="aae145" key="发放方式" collection="aae145" width="80" dataAlign="center" align="center" />
						<ta:datagridItem id="aae129" key="金额" totals="sum" dataType="Number" tatalsTextShow="false" formatter="convertState" totalsFormatter="fn_TotalsFormatter" align="center" dataAlign="right" width="100" />
						<ta:datagridItem id="aaz170" key="核定流水号" hiddenColumn="false" width="150" dataAlign="right" align="center" />
						<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" width="100" showDetailed="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab3" key="支付成功信息(双击查看明细)">
					<ta:datagrid heightDiff="30" id="list3" fit="true" forceFitColumns="true" haveSn="true" columnFilter="true" onRowDBClick="showAc83" selectType="checkbox">
						<ta:datagridItem id="aaz031" key="拨付通知ID" width="130" align="center" dataAlign="center" />
						<ta:datagridItem id="aaz085" key="拨付对象当事人ID" width="180" align="center" dataAlign="center" />
						<ta:datagridItem id="aab069" key="拨付对象当事人名称" width="200" align="center" />
						<ta:datagridItem id="flag" key="是否报盘" collection="sfbz" align="center" dataAlign="center" />
						<ta:datagridItem id="aae117" key="支付标志" collection="AAE117" hiddenColumn="false" align="center" />
						<ta:datagridItem id="aae002" key="做账期号" dataAlign="center" align="center" width="120" />
						<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" width="180" align="center" dataAlign="center" />
						<ta:datagridItem id="aae169" key="金额" totals="sum" dataType="Number" tatalsTextShow="false" formatter="convertState" totalsFormatter="fn_TotalsFormatter" dataAlign="right" align="center" width="120" />
						<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" width="150" align="center" />
					</ta:datagrid>
					<ta:panel height="30">
						<ta:button id="yhdfyljqd" key="打印银行代发清单" icon="xui-icon-spotPrint" onClick="printRaq()" asToolBarItem="false" display="false" />
						<ta:button id="ylbxzfhzspb" key="打印支付汇总通知书" icon="xui-icon-spotPrint" onClick="printRaq2()" asToolBarItem="false" display="false" />
						<ta:button id="fyjstzs" key="清单明细" icon="xui-icon-spotPrint" onClick="printRaq1()" asToolBarItem="false" display="false" />
					</ta:panel>
				</ta:tab>
			</ta:tabs>
		</ta:box>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		Base.setDisRequired([ "aab001", "aac001", "aaz001" ]);
		Base.setDisabled("saveBtn");
		Base.hideObj([ "aaz001", "aae0441", "showZzRPCBtn" ]);
		fn_setAaa076();
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, null, true);
	}

	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			Base.submit("flt_jbxx", "disposablebatchpaymentAction!query.do", null, null, false);
		}, true);
	}

	//组织RPC
	function showZzRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow10.do", null, 1000, 450, null, function() {
			Base.submit("flt_jbxx", "disposablebatchpaymentAction!query.do", null, null, false);
		}, true);
	}

	//查询可参与做账单位
	function fn_ab01Info() {
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
			Base.submit("flt_jbxx", "disposablebatchpaymentAction!query.do", null, null, false);
		}
	}

	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
		}
	}

	function fn_ae10Info() {
		if (g_Suggest != "") {
			fn_setAidBaseInfoData();
			Base.submit("flt_jbxx", "disposablebatchpaymentAction!query.do", null, null, false);
		}
	}

	function query() {
		Base.submit("form1", "disposablebatchpaymentAction!query.do");
	}

	function transProcess() {
		var rowdata = Base.getGridSelectedRows("list1");
		if (rowdata == '' || rowdata == null) {
			Base.alert("请选择需要支付的数据！", "warn");
		} else {
			Base.submit("form1,list1", "disposablebatchpaymentAction!transProcess.do");
		}
	}

	function fn_bfzt() {
		var yad169 = Base.getValue("yad169");
		if (yad169 == '21') {
			Base.showObj([ "aab001", "aae044", "showDwRPCBtn" ]);
			Base.hideObj([ "aaz001", "aae0441", "showZzRPCBtn" ]);
			Base.setValue("aaz001", "");
			Base.setValue("aae0441", "");
		} else if (yad169 == '31') {
			Base.hideObj([ "aab001", "aae044", "showDwRPCBtn" ]);
			Base.showObj([ "aaz001", "aae0441", "showZzRPCBtn" ]);
			Base.setValue("aab001", "");
			Base.setValue("aae044", "");
		}
	}

	function fn_setAaa076() {
		var aae140 = Base.getValue("aae140");
		if (aae140 == "110") {
			Base.filterSelectInput("aaa076", [ "11", "12", "13", "14", "15", "16", "17", "18", "19", "1a", "1b", "1c", "1d", "1f" ], true);
		} else if (aae140 == "210") {
			Base.filterSelectInput("aaa076", [ "21", "22", "23", "24", "25", "26", "27", "28", "29", "2a", "2b", "2c" ], true);
		} else if (aae140 == "410") {
			Base.filterSelectInput("aaa076", [ "45", "47", "49" ], true);
			Base.showObj("fyjstzs");
			Base.showObj("ylbxzfhzspb");
			Base.showObj("yhdfyljqd");
		} else if (aae140 == "510") {
			Base.filterSelectInput("aaa076", [ "51", "52" ], true);
			Base.showObj("fyjstzs");
			Base.showObj("ylbxzfhzspb");
			Base.showObj("yhdfyljqd");
		} else if (aae140 == "120") {
			Base.filterSelectInput("aaa076", [ "61", "62", "63", "64", "65", "66", "67", "68", "69", "6a", "6d" ], true);
		} else if (aae140 == "150") {
			Base.filterSelectInput("aaa076", [ "71" ], true);
		}

	}

	function toBack() {
		var rowdata = Base.getGridSelectedRows("list3");
		var aaz031 = rowdata[0].aaz031; //拨付通知ID
		Base.submit("form1", "disposablebatchpaymentAction!toBack.do", {
			"dto['aaz031']" : aaz031
		});
	}
	
	function printRaq1(){			   
		var rowdata = Base.getGridSelectedRows("list3");
		var selectNum=eval(rowdata).length;
		if(selectNum>1){
			 Base.alert("只能选择一条支付结果数据！","warn");
			 return;
		}
	    if (rowdata == '' || rowdata == null){
	       alert("请选择需要打印的数据！");
	    } else {
	        var aaz031 = rowdata[0].aaz031;
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSyljstzs_BF.raq&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=aaz031="+aaz031);	
		}
	}
	
	
	//打印
	function printRaq(){
		var rowdata=Base.getGridSelectedRows("list3");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
		  	  reportVals.push(rowdata[i].aaz031);
	    }
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=yhdfylj_qd.raq&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=aaz031="+reportVals);
	}
	
	//打印
	function printRaq2(){	   
		var aae002 = Base.getValue("aae002");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var rowdata=Base.getGridSelectedRows("list3");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
		  	  reportVals.push(rowdata[i].aaz031);
	    }
		
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ylbxj_penymetspb.raq&"+
				"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aae002="+aae002+";aae140="+aae140+";yab003="+yab003+";aaz031="+reportVals);	
	}
	
	function fn_detailsac73view(e,row){
		var toUrl="<%=path%>/process/benefit/payment/backcheckpayment/backCheckPaymentAction!details.do";
		Base.openWindow("userwin","明细信息",toUrl,{"dto['aaz170']":row.aaz170},'55%','60%',null,"",true);
	}
	
	function showAc83(e, rowdata){
		var toUrl="<%=path%>/process/benefit/payment/backcheckpayment/backCheckPaymentAction!showAc83.do";
			Base.openWindow('ac83List', "支付明细", toUrl, {"dto['aaz031']" : rowdata.aaz031}, '70%', '55%', null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>