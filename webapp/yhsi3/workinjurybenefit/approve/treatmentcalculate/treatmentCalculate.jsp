<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>工伤待遇审理</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]"  onClick="print()" hotKey="ctrl+P" asToolBarItem="true" disabled="true"/>
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');"
					asToolBarItem="true" display="false" />
			<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		</ta:toolbar>

		<ta:form id="form1" fit="true" cssStyle="overflow:auto">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>

			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false"/>
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false"/>
			</ta:panel>
			<ta:panel id="gsxx" key="人员工伤信息(双击查看缴费信息)" height="100px">
				<ta:datagrid id="gsxxList" fit="true" selectType="radio" forceFitColumns="true" onSelectChange="fnGsxxSelectChange" onRowDBClick="dbclickFn">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc020" key="工伤时间" dataType="date" align="center" dataAlign="center"/>
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc034" key="鉴定时间" dataType="date" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" align="center" dataAlign="center" />
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060" width="100" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" align="center" dataAlign="center"/>
					<ta:datagridItem id="ala017" key="职业病"  collection="ALA017" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="140" align="center" dataAlign="center"/>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="htxxlr" key="其他信息录入" cols="3" >
				<ta:selectInput id="ylc065" key="解除劳动合同 " labelWidth="130" collection="YLC065" required="true" onSelect="checkIsDismiss" value="0" />
				<ta:date id="ylc043" key="解除劳动合同日期" labelWidth="130" readOnly="true" showSelectPanel="true" />
				<ta:selectInput id="ylc064" key="一次性医疗补助金" labelWidth="130" collection="YLC064" readOnly="true" value="0" />
				<ta:selectInput id="ylc066" key="一次性就业补助金" labelWidth="130" collection="YLC064"  readOnly="true" display="false" />
				<ta:selectInput id="csjdf" key="产生鉴定费" labelWidth="130" collection="SFBZ" value="1" display="false" readOnly="true"/>
				<ta:text id="aaz127" key="工伤认定信息ID" display="false" />
				<ta:selectInput id="alc021" key="伤害程度" collection="ALC021" display="false" />
				<ta:selectInput id="ala040" key="伤残等级" collection="ALA040" display="false" />
			</ta:panel>
			<ta:panel id="paymentInfo" key="" >
				<ta:panel id="ffxxsyqk" key="发放信息" cols="3">
				     <ta:selectInput id="ylc026" key="发放信息使用" labelWidth="130" readOnly="false"  required="true" onSelect="fn_ffxxchang"
				                     data="[{'id':'0','name':'一次性待遇和定期待遇相同'},{'id':'1','name':'一次性待遇和定期待遇不同'}]" />
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfoDQ.jsp"%>
			</ta:panel>

			<ta:box cols="2" fit="true">
				<ta:tabs id="tabs1" height="150">
					<ta:tab key="本次核定信息">
						<ta:datagrid id="dqdyxxList" forceFitColumns="true" fit="true" >
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="80" align="center" dataAlign="center"/>
							<ta:datagridItem id="ala042" key="计算基数" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="ala043" key="计算比例" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="ala044" key="计算月数" align="center" dataAlign="center" totalsAlign="center" width="80" />
							<ta:datagridItem id="aae128" key="核发金额" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="aae129" key="计算金额" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="ylc033" key="第三方赔偿金额" align="center" dataAlign="right" totals="sum" totalsAlign="right" tatalsTextShow="false" width="100"/>
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" width="80" align="center" dataAlign="center" />
							<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="80"/>
						</ta:datagrid>
					</ta:tab>
					<ta:tab key="补发核定信息">
						<ta:datagrid id="dqbfxxList"  fit="true" forceFitColumns="true">
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="130" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae128" key="核发金额" width="130" align="center" dataAlign="right" totals="sum" totalsAlign="right" tatalsTextShow="false"/>
							<ta:datagridItem id="aae016" key="复核标志" width="120" collection="AAE016" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae003" key="对应所属期" width="120" align="center" dataAlign="center"/>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>

				<ta:tabs id="hisdyxx" height="150" >
					<ta:tab key="历史核定信息">
						<ta:datagrid id="hisdyxxList" forceFitColumns="true" fit="true">
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="80" align="center" dataAlign="center"/>
							<ta:datagridItem id="ala042" key="计算基数" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="ala043" key="计算比例" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="ala044" key="计算月数" align="center" dataAlign="center" totalsAlign="center" width="80" />
							<ta:datagridItem id="aae128" key="核发金额" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="aae129" key="计算金额" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
							<ta:datagridItem id="ylc033" key="第三方赔偿金额" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="100" tatalsTextShow="false"/>
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" width="80" align="center" dataAlign="center" />
							<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="80"/>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:box>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	
	var gs = Base.getGridSelectedRows("gsxxList");
	if(gs.length == 0){
		Base.alert("请选择工伤人员","warn");
		return false;
	}
	
	Base.submit("form1", "treatmentCalculateAction!toSave.do",null,null,null,function(){
		Base.setEnable("printBtn");
	});
}

function checkIsDismiss(){
	var ylc065 = Base.getValue("ylc065");
	var dqdyxxList = Base.getGridData("dqdyxxList");
	var hisdyxxList = Base.getGridData("hisdyxxList");
	
	for(var i=0;i<dqdyxxList.length;i++){
		if(dqdyxxList[i].aaa036 == "400070"){
			Base.alert("该待遇已存在，请核查!","warn");
			Base.setValue("ylc065","0");
			return false;
		}
	}
	for(var i=0;i<hisdyxxList.length;i++){
		if(hisdyxxList[i].aaa036 == "400070"){
			Base.alert("该待遇已存在，请核查!","warn");
			Base.setValue("ylc065","0");
			return false;
		}
	}
	
	if(ylc065 == "0"){//不解除
		Base.setDisRequired(["ylc043","ylc064"]);
		Base.setValue("ylc043","");
		Base.setValue("ylc064","");
		Base._setReadOnly(["ylc043","ylc064"],true);
	}
	else if(ylc065 == "1"){
		Base.setRequired(["ylc043","ylc064"]);
		Base.setValue("ylc064","1");
		Base._setReadOnly(["ylc043","ylc064"],false);
	}
}

function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
	//判断是否为老工伤人员
	if(rowsData[0].ylc035 == "2"){
		Base.alert("老工伤人员请在其他模块处理!","warn");
		Base.clearGridDirty("gsxxList");
		return false;
	}
	Base.setValue("aaz127",rowsData[0].aaz127);
	Base.setValue("alc021",rowsData[0].alc021);
	Base.submit("", "treatmentCalculateAction!getBenefitByAaz127.do",{"dto['aaz127']":rowsData[0].aaz127,"dto['aac001']":Base.getValue("aac001")});
	var alc021 = rowsData[0].alc021;
	 	if('1' == alc021||'4' == alc021){
		 	Base.setDisRequired(["ylc065","ylc043","ylc064"]);
		 	Base.hideObj("htxxlr");
	 	}
	var ala040 = rowsData[0].ala040;
	if (ala040 == '01' || ala040 == '02' || ala040 == '03' || ala040 == '04'){
		Base.setValue("ala040",ala040);
		Base.showObj("paymentInfo");
	}else if(ala040 == '11'){
		Base.alert("该人员[伤残等级]未达等级，无法核定待遇!","warn");
		return false;
	}else{
		Base.showObj("paymentInfo");
		Base.hideObj("ffxxsyqk");
		Base.setValue("ylc026","0")
		Base.showObj("ffxxlr");
	}
}

//双击列表数据查询文件内容
function dbclickFn(e, rowdata) {
	var aac001 = Base.getValue("aac001");
	var aab001 = Base.getValue("aab001");
	Base.openWindow("fileInfo", ">>缴费信息","treatmentCalculateAction!toDetail.do", {
				"dto['aac001']" : aac001,
				"dto['aab001']" : aab001,
				"dto['alc020']" : rowdata.alc020
				}, "95%", "90%", null, null, true);
}


//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("jbxxfset","treatmentCalculateAction!queryPersonInfo.do",null,null,fn_check()); 
	}, true);
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
	   fn_setPersonBaseInfoData();
		Base.submit("jbxxfset","treatmentCalculateAction!queryPersonInfo.do",null,null,fn_check());  
   }
}

function fn_check(){
	   var aac002 = Base.getValue("aac002");
	   var aac003 = Base.getValue("aac003");
	   Base.setValue("aae136", aac002);
	   Base.setValue("aae133", aac003);
	   Base.setValue("aae136_dq", aac002);
	   Base.setValue("aae133_dq", aac003);	   
	}

function fn_ffxxchang(){
	var ylc026 = Base.getValue("ylc026");
	if (ylc026 == 0){
		Base.showObj("ffxxlr");
		Base.hideObj("ffxxlr_dq");
		Base.setPanelTitle("ffxxlr", "发放信息录入", true);	
	}else{
		Base.showObj(["ffxxlr_dq","ffxxlr"]);
	}
}

function print(){
	var aaz127 = Base.getValue("aaz127");
	var aaz002 = Base.getValue("aaz002");
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=l_dyhd_gsdyhdb.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aaz127="+aaz127+";aaz002="+aaz002);	
}

//页面布局控制
$(document).ready(function() {
	Base.hideObj(["ffxxlr_dq","ffxxlr","paymentInfo"]);
	Base.setPanelTitle("ffxxlr", "发放信息录入(一次性)", true);
	fn_FfxxlrInitialization();
	//Base.setReadOnly("ylc027");
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
