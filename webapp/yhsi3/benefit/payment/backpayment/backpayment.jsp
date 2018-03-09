<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>退发收款</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" hotKey="S" key="收款[S]" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="queryResultBtn" icon="xui-icon-query" hotKey="Q" key="查询收款结果[Q]" onClick="queryResult()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="R" key="重置[R]" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="flt_jbxx" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
			<ta:tab id="tab1" key="可参与追回的一次性待遇信息">
				<ta:datagrid id="list1" forceFitColumns="true" fit="true" defaultColumnWidth="300" selectType="checkbox" onRowDBClick="fn_detailsac73view">
					<ta:datagridItem id="aaa076" key="待遇核定类型" collection="AAA076" width="200" align="center" dataAlign="left" />
					<ta:datagridItem id="aae211" key="期号" dataAlign="center" align="center" width="150" />
					<ta:datagridItem id="aae129" key="金额" totals="sum" dataType="Number" tatalsTextShow="true" align="center" dataAlign="right" width="150" />
					<ta:datagridItem id="aaz170" key="核定流水号" hiddenColumn="false" width="150" align="center" dataAlign="left" />
					<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" width="150" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="可参与退发的补扣信息">
				<ta:datagrid id="list2" fit="true" forceFitColumns="true" defaultColumnWidth="300" selectType="checkbox" onRowDBClick="fn_detailsac76view">
					<ta:datagridItem id="aae145" key="发放方式" collection="aae145" width="200" hiddenColumn="false" align="center" dataAlign="left" />
					<ta:datagridItem id="aaa077" key="补扣发类型" collection="aaa077" showDetailed="true" width="180" align="center" dataAlign="left" />
					<ta:datagridItem id="aae041" key="期号" dataAlign="center" align="center" width="150" />
					<ta:datagridItem id="aae058" key="金额" totals="sum" dataType="Number" tatalsTextShow="true" align="center" dataAlign="right" width="150" />
					<ta:datagridItem id="aaz166" key="补扣流水号" hiddenColumn="false" width="150" align="center" dataAlign="left" />
					<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" width="150" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="支付结果" cssStyle="overflow:auto;">
				<ta:datagrid id="list3" fit="true" border="true" forceFitColumns="true" defaultColumnWidth="155" onRowDBClick="showAc83">
					<ta:datagridItem id="aaz031" key="拨付通知ID" width="130" align="center" dataAlign="right" />
					<ta:datagridItem id="aaz085" key="拨付对象当事人ID" align="center" dataAlign="right" />
					<ta:datagridItem id="aab069" key="拨付对象当事人名称" align="center" dataAlign="left" />
					<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" />
					<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" align="center" dataAlign="left" />
					<ta:datagridItem id="aae169" key="金额" totals="sum" dataType="Number" tatalsTextShow="true" align="center" dataAlign="right" />
					<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab4" key="错误信息" cssStyle="overflow:auto;">
				<ta:datagrid id="list4" fit="true" forceFitColumns="true" defaultColumnWidth="155">
					<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="right" />
					<ta:datagridItem id="aae013" key="说明" align="center" dataAlign="left" />
					<ta:datagridItem id="appcode" key="错误编号" align="center" dataAlign="left" />
					<ta:datagridItem id="errormsg" key="错误信息" width="400" align="center" dataAlign="left" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		Base.setDisabled("saveBtn");
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("flt_jbxx", "backpaymentAction!query.do");
		}, true);
	}

	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("flt_jbxx", "backpaymentAction!query.do");
		}
	}

	//查询支付信息
	function query() {
		Base.submit("form1", "backpaymentAction!query.do");
	}

	//查询支付结果
	function queryResult() {
		Base.submit("form1", "backpaymentAction!queryResult.do");
	}

	//支付
	function submitData() {
		var rowdata = Base.getGridSelectedRows("list1");
		var rowdata2 = Base.getGridSelectedRows("list2");
		if ((rowdata == '' || rowdata == null) && (rowdata2 == '' || rowdata2 == null)) {
			Base.alert("请选择需要支付的数据！", "warn");
		} else {
			Base.submit("form1,list1,list2", "backpaymentAction!toSave.do");
		}
	}

	//回退
	function toBack() {
		Base.submit("form1,list2", "backpaymentAction!toBack.do");
	}
	
	function fn_detailsac73view(e,row){
		var toUrl="<%=path%>/process/benefit/payment/backcheckpayment/backCheckPaymentAction!details.do";
		Base.openWindow("userwin","明细信息",toUrl,{"dto['aaz170']":row.aaz170},'55%','60%',null,"",true);
	}
	
	function fn_detailsac76view(e,row){
		var toUrl="<%=path%>/process/benefit/payment/backcheckpayment/backCheckPaymentAction!details.do";
		Base.openWindow("userwin","明细信息",toUrl,{"dto['aaz166']":row.aaz166},'55%','60%',null,"",true);
	}
	
	function showAc83(e, rowdata){
		var toUrl="<%=path%>/process/benefit/payment/backcheckpayment/backCheckPaymentAction!showAc83.do";
		var aac001 = Base.getValue("aac001");
		Base.openWindow('ac83List',"支付明细",toUrl,{"dto['aaz031']":rowdata.aaz031},'70%','55%',null,null,true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>