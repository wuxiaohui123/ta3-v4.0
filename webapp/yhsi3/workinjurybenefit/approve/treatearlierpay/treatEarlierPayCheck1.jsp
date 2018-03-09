<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>先行支付</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body  class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" display="false" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>

			<ta:panel id="jbxxfset" key="人员基本信息" cols="3" cssStyle="margin:5px auto;padding-bottom:10px;padding-right:20px">
				<ta:text id="aac001" key="人员ID" readOnly="true"  labelWidth="130"/>
				<ta:text id="aac003" key="姓 名" readOnly="true"  labelWidth="130"/>
				<ta:text id="aac002" key="身份证号码" readOnly="true"  labelWidth="130"/>
				<ta:text id="aab001" key="单位ID" readOnly="true"  labelWidth="130"/>
				<ta:text id="aae044" key="单位名称" span="2" readOnly="true"  labelWidth="130"/>
				<ta:text id="aab999" key="单位管理码" display="false" />				
			</ta:panel>

			<ta:panel id="thirdPayInfo" key="第三方赔付信息" cols="3">
				<ta:number id="aae019" key="赔偿总额" precision="2" amountPre="￥" alignLeft="true" labelWidth="130"/>
				<ta:number id="yac568" key="第三方已赔偿金额" precision="2" amountPre="￥" alignLeft="true"  labelWidth="130"/>
				<ta:number id="yac576_num" key="先行支付额" precision="2" amountPre="￥" alignLeft="true"  labelWidth="130" required="true" />
			</ta:panel>
		
			<ta:box id="paymentInfo">
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			</ta:box>		

		</ta:form>
	</body>
</html>
<script type="text/javascript">
//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	Base.submit("form1", "treatEarlierPayCheck1Action!toSave.do");
}

//页面布局控制
$(document).ready(function() {
	$("body").taLayout();
	
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
