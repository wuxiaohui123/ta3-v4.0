<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentCalculationCheck1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnSave" key="保存[S]" hotKey="S" icon="xui-icon-spotSave" onClick="submitData()" asToolBarItem="true" />
				<ta:button id="closeBtn" key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="closeUnitWin();" asToolBarItem="true" />
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" key="当前复核级次" display="false" />
		<ta:tabs id="tabsPersonWage" height="370">
			<ta:tab id="tabWageInfo" key="工资申报信息">
				<ta:panel id="pnlInfo" key="查询结果(待处理单据)" height="150">
					<ta:datagrid id="danjuGrid" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aaz002" key="业务日志ID" align="center" width="120" />
						<ta:datagridItem id="aaz288" key="支付通知ID" align="center" width="120" />
						<ta:datagridItem id="aaz010" key="当事人ID" align="center" width="80" />
						<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" width="200" />
						<ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" width="130" totals="sum" />
						<ta:datagridItem id="aae011" key="经办人" align="center" width="70" collection="aae011" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="120" />
						<ta:datagridItem id="yab003" key="经办机构" collection="aab301" align="center" width="100" />
						<ta:datagridItem id="aae013" key="备注" align="center" width="160" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
				<ta:text id="aaz010" key="当事人ID" display="false" />
				<ta:panel id="pnlFina" key="登帐信息" cols="2" hasBorder="false">
					<ta:text id="yaf010" key="社保机构银行帐号ID" labelWidth="140" readOnly="true" />
					<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
					<ta:selectInput id="aaf002" key="开户银行名称" display="false" />
					<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" readOnly="true" />
					<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" readOnly="true" />

					<ta:selectInput id="aaa158" key="支付结算类型" labelWidth="140" collection="aaa158" readOnly="true" />
					<ta:date id="aad017" key="支付时间" labelWidth="140" readOnly="true" />
					<ta:number id="yad003" key="支付金额" alignLeft="true" precision="2" labelWidth="140" readOnly="true" />
					<ta:text id="aad009" key="支付票据编号" labelWidth="140" readOnly="true" />
					<ta:number id="aad127" key="附件张数" alignLeft="true" display="false" labelWidth="140" readOnly="true" />
				</ta:panel>
			</ta:tab>
			<ta:tab id="tabCaseRecord" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
	});

	//保存经办信息
	function submitData() {
		Base.submit("form1", "paymentCheckAction!toSave.do", null, null, null, function(data) {
			Base.setDisabled("btnSave");
		});
	}

	//关闭窗口
	function closeUnitWin() {
		parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>