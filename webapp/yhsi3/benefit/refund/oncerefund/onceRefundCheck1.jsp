<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>一次性特殊补退审核</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:hidden;">
		<ta:panel id="procInc" key="审核信息">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:selectInput id="aae140" key="险种类型" collection="aae140" display="false" />
		<ta:panel id="flt_jbxx" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<ta:selectInput id="aac004" key="性别" readOnly="true" labelWidth="130" collection="AAC004" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="130" />
			<ta:date id="aac007" key="参加工作日期" readOnly="true" labelWidth="130" />
			<ta:text id="aae005" key="联系电话" readOnly="true" labelWidth="130" />
			<ta:text id="aaa076" key="待遇核定类型" display="false" />
			<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:text id="aae037" key="支付人员类别" display="false" />
			<ta:text id="aaz159" key="人员社会保险明细ID" display="false" />
			<ta:text id="aaz157" key="人员参保关系ID" display="false" />
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
		<ta:panel id="ac61ListPanel" key="补退明细信息" bodyStyle="margin:0px" fit="true">
			<ta:datagrid id="ac73ListGrid" forceFitColumns="true" fit="true">
				<ta:datagridItem id="aaa036" key="待遇项目" width="145px" collection="AAA036" />
				<ta:datagridItem id="aae129" key="补退金额" width="95px" totals="sum" align="right" dataAlign="right" formatter="convertState" dataType="number" />
				<ta:datagridItem id="aae036" key="经办时间" width="145px" dataAlign="center" align="center" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="145px" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("form").css("overflow", "auto");
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aae140,aaa121,aaa076", "onceRefundAction!queryBaseInfo.do");
		}, true);
	}

	function toSave() {
		Base.submit("form1", "onceRefundCheck1Action!toSave.do", null, null, null, function() {
		});
	}

	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>