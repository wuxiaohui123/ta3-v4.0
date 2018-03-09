<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TransferInto</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="P" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:text id="sysdate" key="系统时间" display="false" />
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="procInc" key="审核信息">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
			<ta:text id="aaz157" key="参保明细ID" display="false" />
			<ta:text id="aaz159" key="参保关系ID" display="false" />
		</ta:panel>
		<ta:panel id="zrjjxx" key="转入基金信息" bodyStyle="margin:0px">
			<ta:datagrid id="ad12List" height="80px">
				<ta:datagridItem showDetailed="true" id="aac003" key="姓名" dataAlign="center" align="center" width="85px" />
				<ta:datagridItem showDetailed="true" id="aac002" key="身份证号" dataAlign="center" align="center" width="175px" />
				<ta:datagridItem showDetailed="true" id="aae140" key="险种类型" dataAlign="center" align="center" width="195px" collection="AAE140" />
				<ta:datagridItem showDetailed="true" id="yad003" key="<font color='red'>处理金额</font>" dataAlign="right" align="right" width="100px" formatter="convertState" dataType="number" />
				<ta:datagridItem showDetailed="true" id="aae009" key="户名" dataAlign="center" align="center" width="265px" />
				<ta:datagridItem showDetailed="true" id="aae010" key="银行账号" dataAlign="center" align="center" width="205px" />
				<ta:datagridItem showDetailed="true" id="aae013" key="备注" dataAlign="center" align="center" width="215px" />
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="dyxx" key="待遇信息" bodyStyle="margin:0px">
			<ta:datagrid id="ac73List" height="80px">
				<ta:datagridItem showDetailed="true" id="aaa036" key="待遇项目" dataAlign="center" align="center" width="310px" collection="AAA036" />
				<ta:datagridItem showDetailed="true" id="aae041" key="待遇开始年月" dataAlign="center" align="center" width="310px" />
				<ta:datagridItem showDetailed="true" id="aae042" key="待遇结束年月" dataAlign="center" align="center" width="310px" />
				<ta:datagridItem showDetailed="true" id="aae129" key="<font color='red'>待遇金额</font>" dataAlign="right" align="right" width="310px" formatter="convertState" dataType="number" />
			</ta:datagrid>
		</ta:panel>
		<ta:box id="ffxx">
			<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
		</ta:box>
		<ta:selectInput id="aaz009_old" key="代发机构名称" display="false" />
		<ta:selectInput id="yaf012_old" key="开户银行类别" display="false" collection="AAF002" onSelect="getAAE008" />
		<ta:selectInput id="yaf013_old" key="开户银行编号" display="false" />
		<ta:text id="yaf001_old" key="开户银行名称" display="false" />
		<ta:text id="aaz009_o" key="代发机构ID" display="false" />
		<ta:text id="yaf013_o" key="开户银行编号_o" display="false" />
		<ta:text id="fhjc" key="当前复核级次" display="false" />
		<ta:panel key="失业信息" id="bcsyxx" cols="3">
			<ta:text id="yje004" key="失业证号" labelWidth="130" readOnly="true" />
			<ta:selectInput key="是否农民工" readOnly="true" collection="AAC028" id="aac028" labelWidth="130" />
			<ta:selectInput key="有无求职要求" readOnly="true" collection="AJA012" id="aja012" labelWidth="130" />
			<ta:selectInput key="培训意向" readOnly="true" collection="YJC002" id="yjc002" labelWidth="130" />
			<ta:text id="ajc001_n" key="视同缴费月数" readOnly="true" labelWidth="130" />
			<ta:text id="ajc071_n" key="实际缴费月数" readOnly="true" labelWidth="130" />
			<ta:text id="ajc072_n" key="总缴费月数" readOnly="true" labelWidth="130" />
			<ta:text id="ajc058_n" key="本次缴费享受月数" readOnly="true" labelWidth="130" />
			<ta:text id="ajc059_n" key="剩余享受月数" readOnly="true" labelWidth="130" display="false" />
			<ta:text id="ajc097_n" key="享受总月数" readOnly="true" labelWidth="130" />
			<ta:text id="yjc059_n" key="农民工缴费月数" labelWidth="130" readOnly="true" />
			<ta:text id="yjc060_n" key="农民工享受月数" labelWidth="130" readOnly="true" />
			<ta:selectInput key="失业原因" readOnly="true" collection="AJC093" id="ajc093_n" labelWidth="130" />
			<ta:date key="失业时间" id="ajc090_n" readOnly="true" labelWidth="130" />
			<ta:date key="失业登记时间" id="ajc094_n" readOnly="true" labelWidth="130" />
			<ta:date issue="true" key="待遇开始年月" id="aae210_n" readOnly="true" labelWidth="130" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//RPC
	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}

	//保存经办信息
	function submitData() {
		Base.submit("form1", "transferIntoSystemCheck1Action!toSave.do", null, null, null, null);
	}
	$(document).ready(function() {
		var sfbz = Base.getValue("sfbz");
		if (sfbz == '1') {
			Base.showObj("yie014");
			Base.hideObj("zrjjxx");
		} else {
			Base.hideObj("yie014");
			Base.showObj("zrjjxx");
		}
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>