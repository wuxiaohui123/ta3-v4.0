<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>thirdCompensation</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]"  onClick="printRaq()" hotKey="ctrl+P" asToolBarItem="true" disabled="true"/>
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<ta:selectInput id="aae140" key="险种" collection="AAE140" display="false" />
				<ta:text id="aab999" key="单位管理码" display="false" />
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060" labelWidth="120" display="false" />
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称" span="2" labelWidth="130" readOnly="true" />
			</ta:panel>
			<ta:panel id="gsxx" key="人员工伤信息" height="100px">
				<ta:datagrid id="gsxxList" forceFitColumns="true" selectType="radio" onSelectChange="fnGsxxSelectChange">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false" align="center"/>
					<ta:datagridItem id="alc020" key="工伤时间" align="center"/>
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035" align="center"/>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" align="center"/>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" align="center"/>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center"/>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060" align="center"/>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" align="center"/>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017" align="center"/>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="140" align="center" dataType="date"/>
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="ffxxlr" key="赔付信息" cols="3">
				<ta:selectInput id="yac570" key="赔偿方式 " required="true" collection="YAC570" value="2" onSelect="checkYAC570" labelWidth="130" readOnly="true"/>
				<ta:number id="aae019" key="总金额 " required="true" max="99999999999999" onChange="getWpcje()" labelWidth="130" />
				<ta:number id="yac585" key="第三方赔偿比例 " required="true" max="99999999999999" asAamount="true" precision="2" min="0" labelWidth="130" />
				<ta:number id="aae018" key="已赔偿金额" required="true"  asAamount="true" precision="2" min="0" onChange="getWpcje()" max="99999999999999" labelWidth="130" />
				<ta:number id="wpcje" key="未赔偿金额" required="true"  asAamount="true" precision="2" min="0" readOnly="true" max="99999999999999" labelWidth="130" />
				<ta:selectInput id="yac530" key="是否先行性支付 " required="true" collection="YAC530" value="1" labelWidth="130" />
				<ta:text id="aaz127" key="工伤认定信息ID" display="false" labelWidth="130" />
			</ta:panel>
			<ta:box cols="2" id="detailInfo" cssStyle="display:none;">
				<ta:panel id="detailInfoPanel1" key="明细录入" height="120">
					<ta:panel id="detailInfofset" cssStyle="border:none;" cols="2">
						<ta:selectInput key="费用类别" id="aaa036" isAutoExtend="false" 	collection="AAA036" reverseFilter="true" 
						labelWidth="130"	filter="400010,400011,400012,400020,400030,400040,400070,400200,"
							required="true" span="2" onSelect="CheckAae019_mx" value="400010" readOnly="true"/>
						<!-- 	
						<ta:number key="赔偿金额" id="aae019_mx" max="99999999999999" labelWidth="130"
							asAamount="true" precision="2" span="1" required="true" />
					     -->
                        <ta:number key="已赔偿金额" id="aae018_mx" max="99999999999999" labelWidth="130"
							asAamount="true" precision="2" span="1" required="true" />							
						<ta:buttonLayout span="2" cssStyle="padding-top:20px">
							<ta:button key="确定" onClick="manageDetailInfo();" />
							<ta:button key="重置" onClick="resetDetailfset();" />
						</ta:buttonLayout>
					</ta:panel>
				</ta:panel>
				<ta:panel id="detailInfoPanel2" key="明细信息" height="120">
					<ta:datagrid id="detailInfoGrid" forceFitColumns="true" fit="true" >
						<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete"  width="50" align="center" click="manageDetailInfo" />
						<ta:datagridItem key="费用类别" id="aaa036" collection="AAA036"
							showDetailed="true" align="center" width="200" dataAlign="center" />
                        <ta:datagridItem key="已赔偿金额" id="aae018" align="center" width="200" dataAlign="center" totals="sum" />								
					</ta:datagrid>
				</ta:panel>
			</ta:box>

			<ta:box cols="2">
				<ta:panel id="dqdyxx" key="明细赔付信息" height="153px" 	bodyStyle="margin:0px" span="2">
					<ta:datagrid id="dqdyxxList" forceFitColumns="true">
					    <ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center" />
						<ta:datagridItem id="yac585" key="第三方赔偿比例" align="center" dataAlign="right"/>
					    <ta:datagridItem id="yac580" key="已赔偿金额" align="center" dataAlign="right"/>
					    <ta:datagridItem id="sfcyjs" key="是否参与计算" collection="SFBZ" align="center" dataAlign="center" />
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center" dataAlign="center" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center"/>
						<ta:datagridItem id="yac567" key="第三方赔偿明细ID" align="center" dataAlign="center" hiddenColumn="true"/>
						<ta:datagridItem id="aaz170" key="人员待遇核定事件ID" align="center" dataAlign="center" hiddenColumn="true"/>
						<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="center" hiddenColumn="true"/>
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
		Base.submit("","thirdCompensationAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	var gs = Base.getGridSelectedRows("gsxxList");
	if(gs.length == 0){
		Base.alert("请选择工伤人员","warn");
		return false;
	}
	var detailList = Base.getGridData("detailInfoGrid");
	Base.submit("form1", "thirdCompensationAction!toSave.do",{"detailList":Ta.util.obj2string(detailList)},null,null,function(){
		Base.setEnable("printBtn");
	});
}

function checkYAC570(){
	var yac570 = Base.getValue("yac570"); //arguments[0]
	if(yac570 == "1" || yac570 == "3"){ //总额
		Base.hideObj("detailInfo",false);
		Base.showObj("aae019,aae018,wpcje");
		if(yac570 == "3"){
			Base.setDisRequired("aae019,aae018");
			Base._setReadOnly(["aae019,aae018"],false);
		}else{
		   Base.setRequired("aae019,aae018");
			Base._setReadOnly(["aae019,aae018"],false);
		}
	}
	else{			   //明细 2,3
		Base.showObj("detailInfo");
		Base.hideObj("aae019,aae018,wpcje",false);
		Base.showObj("yac585");
	}
}

function manageDetailInfo(data){
	if(undefined == data){
		var aaa036 = Base.getValue("aaa036");
//		var aae019_mx = Base.getValue("aae019_mx");
		var aae018_mx = Base.getValue("aae018_mx");
		var yac585 = Base.getValue("yac585");
		if(aaa036 == ""){
			Base.alert("费用类别不能为空!","warn");
			return false;
		}
//		if(aae019_mx == ""){
//			Base.alert("赔偿总金额不能为空!","warn");
//			return false;
//		}
		if(aae018_mx == ""){
			Base.alert("已赔偿金额不能为空!","warn");
			return false;
		}		
		if(yac585 == ""){
			Base.alert("第三方赔偿比例不能为空!","warn");
			return false;
		}		
		var dyxx = Base.getGridData("detailInfoGrid");
		for(var i=0;i<dyxx.length;i++){
			if(aaa036 == dyxx[i].aaa036){
				Base.alert("类别已存在!","warn");
				return false;
			}
		}
		Base.addGridRow("detailInfoGrid",{"aaa036":aaa036,"aae018":aae018_mx});
	}
	else{
		Base.confirm("确认要删除?",function(btn, callback,options) {
			if (btn) {	
				Base.deleteGridRow("detailInfoGrid",data.row);
				}
			});
	}
}

function resetDetailfset(){
	Base.setValue("aaa036","");
//	Base.setValue("aae019_mx","");
	Base.setValue("aae018_mx","");
}

function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
	
	Base.setValue("aaz127",rowsData[0].aaz127);
	Base.submit("", "thirdCompensationAction!getBenefitByAaz127.do",{"dto['aaz127']":rowsData[0].aaz127,"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
}

function getWpcje(){
	var aae018 = Base.getValue("aae018");
	var aae019 = Base.getValue("aae019");
	var yac585 = Base.getValue("yac585");
	if(aae018 == "" || aae019 == "" || yac585 == ""){
		return false;
	}
	var wpcje = aae019 * yac585 - aae018;
	Base.setValue("wpcje",wpcje);
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
	    fn_setPersonBaseInfoData();
		Base.submit("jbxxfset","thirdCompensationAction!queryPersonInfo.do");
   }
}

function CheckAae019_mx(){
//	Base.setValue("aae019_mx","");
	Base.setValue("aae018_mx","");
}

	//打印
	function printRaq(){
		var data = Base.getGridData("gsxxList");
		var aac001 = Base.getValue("aac001");
		var aaz127 = data[0].aaz127;
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSDSFylflbx_shd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz127="+aaz127);
	}
//页面布局控制
$(document).ready(function() {
	$("form").css("overflow","auto");
	checkYAC570();//梧州只有按明细赔付方式
});

//删除信息
function fnDelRow(data,e){
	if(data.aaz170 != "" && data.aaz170 != null){
		Base.alert("该第三方赔偿信息已参与过计算不能删除，请确认！");
		return false;
	}			
	Base.confirm("确认要删除?",function(btn, callback,options) {
	if (btn) {	
		Base.submit("form1", "thirdCompensationAction!toDelete.do",{"dto['yac567']":data.yac567},null,false,null);
		}
	});
}
</script>
<%@ include file="/ta/incfooter.jsp"%>
