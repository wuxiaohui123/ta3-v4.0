<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>零星支付</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="零星支付[S]" icon="xui-icon-spotSave" hotKey="S" onClick="transProcess();" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="R" key="重置[R]" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="flt_jbxx" cols="3" cssStyle="margin:5px;" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:date id="aae002" key="做账期号" issue="true" required="true" showSelectPanel="true" labelWidth="130" />
			<ta:selectInput id="bgfffs" labelWidth="130" key="变更发放方式" onSelect="fn_fffsbg" data="[{'id':'0','name':'否'},{'id':'1','name':'是'}]" required="true" value="0" />
			<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
			<ta:text id="aaz030" key="支付流水号" display="false" labelWidth="130" />
			<ta:text id="yab003" key="经办机构" display="false" labelWidth="130" />
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
		<ta:box id="box0" height="330">
			<ta:tabs id="tabs1" fit="true">
				<ta:tab id="tab1" key="可支付的一次性待遇信息">
					<ta:datagrid id="list1" forceFitColumns="true" fit="true" defaultColumnWidth="300" selectType="checkbox" onRowDBClick="fn_detailsac73view">
						<ta:datagridItem id="aaa076" key="待遇核定类型" collection="aaa076" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aae145" key="发放方式" collection="aae145" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aae211" key="期号" dataAlign="center" align="center" width="150" />
						<ta:datagridItem id="aae129" key="金额" totals="sum" dataType="Number" tatalsTextShow="false" align="center" dataAlign="right" width="150" />
						<ta:datagridItem id="aaz170" key="核定流水号" hiddenColumn="false" width="150" align="center" dataAlign="right" />
						<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" width="150" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab3" key="支付成功信息(双击查看明细)">
					<ta:datagrid id="list3" heightDiff="30" border="true" fit="true" forceFitColumns="true" onRowDBClick="showAc83" selectType="checkbox">
						<ta:datagridItem id="aaz031" key="拨付通知ID" width="130" align="center" />
						<ta:datagridItem id="aaz085" key="拨付对象当事人ID" width="180" align="center" />
						<ta:datagridItem id="aab069" key="拨付对象当事人名称" width="200" align="center" />
						<ta:datagridItem id="flag" key="是否报盘" collection="sfbz" align="center" dataAlign="center" />
						<ta:datagridItem id="aae117" key="支付标志" collection="AAE117" hiddenColumn="false" align="center" />
						<ta:datagridItem id="aae002" key="做账期号" dataAlign="center" align="center" width="120" />
						<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" width="180" align="center" />
						<ta:datagridItem id="aae169" key="金额" totals="sum" dataType="Number" tatalsTextShow="true" dataAlign="right" align="center" width="120" />
						<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" width="150" align="center" />
					</ta:datagrid>
					<ta:panel height="30">
						<ta:button id="yhdfyljqd" key="打印银行代发清单" icon="xui-icon-spotPrint" onClick="printRaq()" asToolBarItem="false" />
						<ta:button id="ylbxzfhzspb" key="打印支付汇总通知书" icon="xui-icon-spotPrint" onClick="printRaq2()" asToolBarItem="false" />
						<ta:button id="fyjstzs" key="清单明细" icon="xui-icon-spotPrint" onClick="printRaq1()" asToolBarItem="false" />
						<ta:button id="syzgszffxj" key="失业职工丧葬补助金和抚恤金支付单" icon="xui-icon-spotPrint" onClick="printRaqSY()" asToolBarItem="false" display="false" />
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
        Base.hideObj("ffxxlr");
        Base.setDisabled("saveBtn");
        var aae140 = Base.getValue("aae140");
        if(aae140 =="410"){
        	Base.showObj("fyjstzs");
        }
        if(aae140 == "510"){
        	Base.showObj("fyjstzs");
        }
        if(aae140 == "210"){
            Base.showObj("syzgszffxj");
        }        
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("flt_jbxx,procInc", "backCheckPaymentAction!query.do",null,null,false);	
		}, true);
	}
	
	//查询可参与做账单位
	function fn_queryInfo() {
		if (g_Suggest != ""){
			fn_setPersonBaseInfoData();
			Base.submit("flt_jbxx,procInc", "backCheckPaymentAction!query.do",null,null,false);
		   }
		}
	
	function transProcess(){
		var rowdata = Base.getGridSelectedRows("list1");
		if ((rowdata == '' || rowdata == null) && (rowdata2 == '' || rowdata2 == null)){
	        Base.alert("请选择需要支付的数据！","warn");
	    }else{
	        Base.submit("form1,list1", "backCheckPaymentAction!transProcess.do");
	    }
	}
	
	function showAc83(e, rowdata){
		var toUrl = "<%=path%>/process/benefit/payment/backcheckpayment/backCheckPaymentAction!showAc83.do";
		var aac001 = Base.getValue("aac001");
		Base.openWindow('ac83List', "支付明细", toUrl, {
			"dto['aaz031']" : rowdata.aaz031
		}, '70%', '55%', null, null, true);
	}

	function fn_fffsbg() {
		var bgfffs = Base.getValue("bgfffs");
		if (bgfffs == "1") {
			Base.showObj("ffxxlr");
			Base.filterSelectInput("yad169", [ "11", "21" ], true);
		} else {
			Base.hideObj("ffxxlr");
		}
	}

	function fn_detailsac73view(e, row) {
		Base.openWindow("userwin", "明细信息", "backCheckPaymentAction!details.do", {
			"dto['aaz170']" : row.aaz170
		}, '55%', '60%', null, "", true);
	}

	function fn_detailsac76view(e, row) {
		Base.openWindow("userwin", "明细信息", "backCheckPaymentAction!details.do", {
			"dto['aaz166']" : row.aaz166
		}, '55%', '60%', null, "", true);
	}
	
	function print(){			   
		var rowdata = Base.getGridData("list3");
	    if (rowdata == '' || rowdata == null){
	       alert("没有支付成功的数据！");
	    } else {
	        var aaz031 = rowdata[0].aaz031;
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=sporadicpayment.raq&"
					+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}
	}
	
	//职工医疗保险费用结算通知书
	function printRaq1(){	
		var rowdata = Base.getGridSelectedRows("list3");
		var aac001 = Base.getValue("aac001");
	    if (aac001 == '' || aac001 == null){
	       alert("人员id为空,不能打印");
	       return;
	    } 
	    if (rowdata == '' || rowdata == null){
	       alert("请选择一条支付成功的数据！");
	       return;
	    }
	    var aaz031 = rowdata[0].aaz031;
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSyljstzs_BF.raq&"
	    		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
	}
	
	//打印失业死亡职工支付单
	function printRaqSY(){
	    var rowdata = Base.getGridSelectedRows("list3");
	    if (rowdata == '' || rowdata == null){
	       alert("请选择一条支付成功的数据！");
	       return;
	    }
	    var aaz031 = rowdata[0].aaz031;
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=syzgszffxj_SY.raq&"
	    		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
	}
	
	//打印
	function printRaq(){
		var rowdata = Base.getGridSelectedRows("list3");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
		  	  reportVals.push(rowdata[i].aaz031);
	    }
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=yhdfylj_qd.raq&"
				+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+reportVals);
	}
	
	//打印
	function printRaq2(){	   
		var aae002 = Base.getValue("aae002");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var rowdata = Base.getGridSelectedRows("list3");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
		  	  reportVals.push(rowdata[i].aaz031);
	    }
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ylbxj_penymetspb.raq&" 
				+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
				+ "serverPagedPrint=no&mirror=no&" + "paramString=aae002=" + aae002 + ";aae140="
			    + aae140 + ";yab003=" + yab003 + ";aaz031=" + reportVals);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>