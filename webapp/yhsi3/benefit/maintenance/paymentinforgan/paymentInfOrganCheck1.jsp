<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>paymentInfOrgan</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body cssStyle="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" height="85px">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>

		<ta:panel id="fset1" cols="4" key="组织信息">
			<ta:selectInput id="aae140" key="险种" collection="AAE140" display="false" />
			<ta:selectInput id="aaa033" key="角色类型" collection="aaa033" labelWidth="130" readOnly="true" />
			<ta:text id="aaz001" key="组织编号" labelWidth="130" readOnly="true" />
			<ta:text id="aae044" key="组织名称" labelWidth="130" span="2" readOnly="true" />
			<ta:text id="newBZ" key="新增标志" display="false" />
		</ta:panel>

		<ta:panel id="ffxxlr" key="银行信息录入" cols="3">
			<ta:selectInput id="aae145" key="支付方式" labelWidth="130" collection="AAE145" readOnly="true" />
			<ta:text id="aae136" key="领取人证件号" labelWidth="130" readOnly="true" />
			<ta:text id="aae133" key="领取人姓名" labelWidth="130" readOnly="true" />
			<ta:text id="aae010" key="银行账号" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aaz009" key="代发机构名称" collection="AAZ009" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" readOnly="true" />
			<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="130" readOnly="true" />
			<ta:selectInput id="yaf013" key="开户银行编号" showKey="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" readOnly="true" />
			<ta:text id="yaf001" key="开户银行名称" labelWidth="130" readOnly="true" />
			<ta:selectInput id="yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" readOnly="true" />
			<ta:text id="aae007" key="邮政编码" maxLength="6" labelWidth="130" readOnly="true" />
			<ta:text id="aae006" key="详细地址" span="2" labelWidth="130" readOnly="true" />
		</ta:panel>
		<ta:panel id="ae19a1Panel" key="变更信息" fit="true" heightDiff="20" bodyStyle="margin:0px">
			<ta:datagrid id="ac19a1Grid" fit="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aaz205" key="人员信息变更明细ID" hiddenColumn="false" width="115" />
				<ta:datagridItem id="aaz206" key="人员信息变更事件ID" hiddenColumn="false" width="115" />
				<ta:datagridItem id="aae155" key="变更项目" width="160" />
				<ta:datagridItem id="aae301" key="变更前值描述" width="160" />
				<ta:datagridItem id="aae123" key="变更前信息" width="160" />
				<ta:datagridItem id="aae302" key="变更后值描述" width="160" />
				<ta:datagridItem id="aae124" key="变更后信息" width="160" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="160" />
				<ta:datagridItem id="aae036" key="经办时间" width="160" dataAlign="center" align="center" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		fn_setPaymentInfoReadOnlyPage();
	});
	//保存经办信息
	function submitData() {
		Base.submit("form1", "paymentInfOrganCheck1Action!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
