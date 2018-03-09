<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>工伤待遇重算</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="待遇重算[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
					asToolBarItem="true" display="false" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>	
			</ta:box>

			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
				<ta:selectInput id="aac060" key="生存状态" display="false" collection="AAC060" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			</ta:panel>
			
			<ta:panel id="gsxx" key="本次人员工伤认定信息" height="83px" bodyStyle="margin:0px">
				<ta:datagrid id="gsxxList"  selectType="radio" onSelectChange="fnGsxxSelectChange"  forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aaz151" key="鉴定ID" hiddenColumn="true" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc020" key="工伤发生时间" dataAlign="center" align="center">
					</ta:datagridItem>					
					<ta:datagridItem id="alc027" key="工伤类别" collection="ALC027"  hiddenColumn="true" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc029" key="认定结论" collection="ALC029" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期"  hiddenColumn="true" dataAlign="center" align="center">
					</ta:datagridItem>					
				</ta:datagrid>
			</ta:panel>
			
			 <ta:box cols="2">
				<ta:panel id="dyxx_ls" key="历史待遇信息"  bodyStyle="margin:0px">
					<ta:datagrid id="dyxxList_ls" forceFitColumns="true">
						<ta:datagridItem id="aaa036_ls" key="待遇项目" collection="AAA036" dataAlign="center" align="center">
						</ta:datagridItem>
						<ta:datagridItem id="aae128_ls" key="核发金额" dataAlign="right" align="center">
						</ta:datagridItem>
						<ta:datagridItem id="aae016_ls" key="复核标志" collection="AAE016" dataAlign="center" align="center">
						</ta:datagridItem>
						<ta:datagridItem id="aae036_ls" key="经办时间">
						</ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
				<ta:box fit="true">
				<ta:tabs fit="true">
					<ta:tab key="本次待遇信息" >
						<ta:datagrid id="dyxxList"  forceFitColumns="true" >
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" dataAlign="center" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae128" key="核发金额" dataAlign="right" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" dataAlign="center" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center">
							</ta:datagridItem>
					    </ta:datagrid>
					</ta:tab>
					<ta:tab key="产生待遇补扣信息" >
						<ta:datagrid id="dybkxx" >
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="140px" dataAlign="center" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae129" key="核发金额"  width="140px" dataAlign="right" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aaa078" key="补扣类型"  width="140px" collection="AAA078" dataAlign="center" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae003" key="对应款所属期"  width="140px" dataAlign="center" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016"  width="140px" dataAlign="center" align="center">
							</ta:datagridItem>
					    </ta:datagrid>
					</ta:tab>
				</ta:tabs>
				</ta:box>
			</ta:box>	
			<ta:panel id="recalculateInfo" key="工伤待遇重算信息录入" cols="3" fit="true">				
				<ta:selectInput id="yle002" key="重算类型" data="[{'id':'1','name':'社平工资变更重算'},{'id':'2','name':'伤残鉴定变更重算'}]" labelWidth="130" required="true"/>
				<ta:selectInput id="flag2" key="一次性待遇补扣标志" data="[{'id':'1','name':'产生'},{'id':'2','name':'不产生'}]" labelWidth="180" required="true"/>
				<ta:selectInput id="flag1" key="定期待遇补扣标志"  data="[{'id':'1','name':'产生'},{'id':'2','name':'不产生'}]" labelWidth="130" required="true"/>				
				<ta:selectInput id="flag3" key="是否延用定期待遇支付方式" display="false" data="[{'id':'0','name':'不延用'},{'id':'1','name':'延用'}]" value="1" labelWidth="180" required="true" onSelect="fn_Controll"/>
				<ta:text id="aaz127" key="工伤认定信息ID" readOnly="true" display="false"/>
			</ta:panel>

			<ta:box id="paymentInfo" cssStyle="display:none">
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			</ta:box>
		</ta:form>
	</body>
</html>
<script type="text/javascript">

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","stjfnxrdAction!queryBaseInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	var gs = Base.getGridSelectedRows("gsxxList");
	if(gs.length == 0){
		Base.alert("请选择工伤人员","warn");
		return false;
	}
	
	Base.submit("form1", "reCalculateAction!toSave.do");
}

function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
	Base.setValue("aaz127",rowsData[0].aaz127);
	Base.submit("jbxxfset","reCalculateAction!queryPersonInfo.do");
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
	   fn_setPersonBaseInfoData();
		Base.submit("jbxxfset","reCalculateAction!queryPersonInfo.do");
   }
}
//控制支付方式是否填写
function fn_Controll(){
	var flag3 = Base.getValue("flag3");
	if("1"== flag3){
		Base.hideObj("paymentInfo",false);
	}else if("0"==flag3){	
		Base.showObj("paymentInfo");
	}
}
	
//页面布局控制
$(document).ready(function() {
	$("form").css("overflow","auto");
	fn_FfxxlrInitialization();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
