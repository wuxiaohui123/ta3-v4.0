<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>先行支付</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
						asToolBarItem="true" display="false" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>				
			</ta:panel>
			<ta:panel id="thirdPayInfo" key="第三方赔付信息" cols="3">
				<ta:number id="aae019" key="赔偿总额" precision="2" amountPre="￥" alignLeft="true" readOnly="true" labelWidth="130"/>
				<ta:number id="yac568" key="第三方已赔偿金额" precision="2" amountPre="￥" alignLeft="true" readOnly="true"  labelWidth="130"/>
				<ta:number id="yac576_num" key="先行支付额" precision="2" amountPre="￥" alignLeft="true"  labelWidth="130" required="true"  readOnly="true"/>				
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
	Base.submit("form1", "treatEarlierPayAction!toSave.do");
}

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("jbxxfset","treatEarlierPayAction!queryPersonInfo.do");
	}, true);
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
	   fn_setPersonBaseInfoData();
		Base.submit("jbxxfset","treatEarlierPayAction!queryPersonInfo.do");
   }
}
/* //判断填写先行支付额度真确性
function fnChange(){
	var yac576_num = Base.getValue("yac576_num");
	var yac576 = Base.getValue("yac576");	
	if(yac576_num<yac576){
		Base.alert("先行支付金额大于未赔偿金额！","warn");
		Base.setValue("yac576","");
	}
} */
//页面布局控制
$(document).ready(function() {
	
	fn_FfxxlrInitialization();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
