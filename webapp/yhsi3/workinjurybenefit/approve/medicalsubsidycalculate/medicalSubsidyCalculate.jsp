<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>MedicalSubsidyCalculate</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="待遇核定[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
						asToolBarItem="true" display="false" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>

			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			</ta:panel>

			<ta:panel id="gsxx" key="人员工伤信息" height="125px">
				<ta:datagrid id="gsxxList" fit="true" selectType="radio" onSelectChange="fnGsxxSelectChange" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false">
					</ta:datagridItem>
					<ta:datagridItem id="alc020" key="工伤时间" dataType="date">
					</ta:datagridItem>
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035">
					</ta:datagridItem>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022">
					</ta:datagridItem>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021">
					</ta:datagridItem>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040">
					</ta:datagridItem>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060">
					</ta:datagridItem>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027">
					</ta:datagridItem>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017">
					</ta:datagridItem>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" dataType="date">
					</ta:datagridItem>
					<ta:datagridItem id="aac002" key="省份证号" hiddenColumn="false" >
					</ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" hiddenColumn="false" >
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="bxxxlr" key="其他信息录入" cols="3">
				<ta:date id="ylc043" key="解除劳动合同日期 " showSelectPanel="true" required="true" labelWidth="130" />
				<ta:text id="aaz127" key="工伤认定信息ID" display="false" />
			</ta:panel>
			<ta:box id="paymentInfo">
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			</ta:box>

			<ta:box cols="2">
				<ta:panel id="dqdyxx" key="当前待遇信息" height="153px"
					bodyStyle="margin:0px">
					<ta:datagrid id="dqdyxxList" forceFitColumns="true">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
						</ta:datagridItem>
						<ta:datagridItem id="ala042" key="计算基数">
						</ta:datagridItem>											
						<ta:datagridItem id="ala044" key="计算月数">
						</ta:datagridItem>												
						<ta:datagridItem id="aae128" key="核发金额">
						</ta:datagridItem>
						<ta:datagridItem id="ylc033" key="第三方赔付金额">
						</ta:datagridItem>
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
						</ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间">
						</ta:datagridItem>
					</ta:datagrid>
				</ta:panel>

				<ta:panel id="hisdyxx" key="历史报销信息" height="153px" bodyStyle="margin:0px">
					<ta:datagrid id="hisdyxxList" forceFitColumns="true">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
						</ta:datagridItem>
						<ta:datagridItem id="aae128" key="核发金额">
						</ta:datagridItem>
						<ta:datagridItem id="ylc033" key="第三方赔付金额">
						</ta:datagridItem>
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
						</ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间">
						</ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:box>
		</ta:form>
	</body>
</html>
<script type="text/javascript">

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","medicalSubsidyCalculateAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	
	var gs = Base.getGridSelectedRows("gsxxList");
	if(gs.length == 0){
		Base.alert("请选择工伤人员!","warn");
		return false;
	}
	
	Base.submit("form1", "medicalSubsidyCalculateAction!toSave.do");
}

function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
		var alc021 = rowsData[0].alc021;
	 	if('1' == alc021||'4' == alc021){
		 	Base.alert("工伤【死亡和失踪】人员不允许办理一次性医疗补助金!","warn");
		 	return  false;
	 	}
	//if(rowsData[0].ala040 == "01" || rowsData[0].ala040 == "02" || rowsData[0].ala040 == "03" || rowsData[0].ala040 == "04"){
	//	Base.alert("1-4级人员不能核定医疗补助金!","warn");
	//}
	
	Base.setValue("aae133",rowsData[0].aac003);
	Base.setValue("aae136",rowsData[0].aac002);
	Base.setValue("aaz127",rowsData[0].aaz127);
	Base.submit("", "medicalSubsidyCalculateAction!getBenefitByAaz127.do",{"dto['aaz127']":rowsData[0].aaz127,"dto['aac001']":Base.getValue("aac001")});
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
	   fn_setPersonBaseInfoData();
		Base.submit("jbxxfset","medicalSubsidyCalculateAction!queryPersonInfo.do");
   }
}

//页面布局控制
$(document).ready(function() {
	$("form").css("overflow","auto");
	fn_FfxxlrInitialization();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
