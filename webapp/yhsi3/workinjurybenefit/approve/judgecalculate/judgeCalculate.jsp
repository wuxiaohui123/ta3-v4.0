<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>JudgeCalculate</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]"  onClick="printRaq()" hotKey="ctrl+P" asToolBarItem="true" disabled="true"/>
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
					asToolBarItem="true" display="false" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
				<ta:text id="yab003" display="false" key="经办机构" />
				
			</ta:box>

			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
			</ta:panel>

			<ta:panel id="gsxx" key="人员工伤信息" height="125px" bodyStyle="margin:0px">
				<ta:datagrid id="gsxxList" fit="true" selectType="radio"
					forceFitColumns="true" onSelectChange="fnGsxxSelectChange">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false">
					</ta:datagridItem>
					<ta:datagridItem id="aaz151" key="劳动能力鉴定ID" hiddenColumn="false">
					</ta:datagridItem>
					<ta:datagridItem id="alc020" key="工伤时间">
					</ta:datagridItem>
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035">
					</ta:datagridItem>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022">
					</ta:datagridItem>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021">
					</ta:datagridItem>
					<ta:datagridItem id="ala019" key="鉴定类别" collection="ALA019" />
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040">
					</ta:datagridItem>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060">
					</ta:datagridItem>
					<ta:datagridItem id="aae129" key="鉴定费金额" dataType="number">
					</ta:datagridItem>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027">
					</ta:datagridItem>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017">
					</ta:datagridItem>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="150">
					</ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" hiddenColumn="true">
					</ta:datagridItem>
					<ta:datagridItem id="aac002" key="省份证号" hiddenColumn="true">
					</ta:datagridItem>				
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="bxxxlr" key="其他信息录入" cols="3">
				<ta:number id="aae129" key="鉴定费金额 " labelWidth="130" required="true"  precision="2"  readOnly="true"/>
				<ta:selectInput id="flag" key="根据鉴定发起方报销标志 " required="true" data="[{'id':'0','name':'否'},{'id':'1','name':'是'}]" value="1" labelWidth="160" />						
				<ta:text id="aaz127" key="工伤认定信息ID" display="false" />
				<ta:text id="aaz151" key="劳动能力鉴定ID" display="false" />
			</ta:panel>
			<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			<ta:box cols="2">
				<ta:panel id="dqdyxx" key="当前待遇信息" height="153px" bodyStyle="margin:0px">
					<ta:datagrid id="dqdyxxList" forceFitColumns="true">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
						</ta:datagridItem>
						<ta:datagridItem id="aae128" key="核发金额">
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
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
						</ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间">
						</ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:box>
		</ta:form>
	  <iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","judgeCalculateAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	
	var gs = Base.getGridSelectedRows("gsxxList");
	if(gs.length == 0){
		Base.alert("请选择工伤人员!","warn");
		return false;
	}
	var aaz151 = Base.getValue("aaz151");
	if(aaz151 == ""){
		Base.alert("该人员没有鉴定信息!","warn");
		return false;
	}
	
	Base.submit("form1", "judgeCalculateAction!toSave.do",null,null,null,function(){
		Base.setEnable("printBtn");
	});
}

function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
	Base.setValue("aae133",rowsData[0].aac003);
	Base.setValue("aae136",rowsData[0].aac002);
	Base.setValue("aaz127",rowsData[0].aaz127);
	Base.setValue("aaz151",rowsData[0].aaz151);
	Base.setValue("aae129",rowsData[0].aae129);
//	Base.setValue("aae129",rowsData[0].aae019);		
	Base.submit("", "judgeCalculateAction!getBenefitByAaz127.do",{"dto['aaz127']":rowsData[0].aaz127,"dto['aac001']":Base.getValue("aac001")},null,null,function(){
		var aab001 = Base.getValue("aab001");
		Base.setValue("aaz001",aab001);
	});
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
	   fn_setPersonBaseInfoData();
		Base.submit("jbxxfset","judgeCalculateAction!queryPersonInfo.do");
   }
}

//打印
function printRaq(){
	//var data = Base.getGridData("medicalInfo");
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var yab003 = Base.getValue("yab003");
		var aaz127 = Base.getValue("aaz127");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSldnljdf_jsd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz002="+aaz002+";yab003="+yab003+";aaz127="+aaz127);
}

//当选择支付对象为单位或机构时弹出窗口，在窗口中选择机构或单位   
function fn_privateContorlYaz099(){
	var yaz099 = "";
    var aae140 = Base.getValue("aae140");
    var yad169 = Base.getValue("yad169");	
    var aaz001 = Base.getValue("aab001");
	if(yad169 == "31" || yad169 == "21"){	
       yaz099 = window.showModalDialog("<%=path%>/process/benefit/maintenance/paymentinfomaintenance/paymentInfoMaintenanceAction!selectUnitInfoWindow.do?aae140="+aae140+"&yad169="+yad169+"&aaz001="+aaz001, null, 'dialogWidth:1000px;dialogHeight:500px;help:no;unadorned:no;resizable:no;toolbar=no;menubar=no;resizable=yes;location=no;status=no;scrollbars=no');
	   //for chrome
		if (!yaz099) {
		    yaz099 = window.yaz099;
		}
	}
    return yaz099;
}
//页面布局控制
$(document).ready(function() {
	$("form").css("overflow","auto");
	
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
