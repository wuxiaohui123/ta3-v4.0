<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>JudgeLaboringability</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]"  hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" 	hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
				asToolBarItem="true" display="false" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%-- <%@ include file="/xbpm/common/xbpmInc.jsp"%> --%>
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
				<ta:text id="yab003" display="false" key="经办机构" />
			</ta:box>

			<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
			<ta:panel id="fset1" cols="3" key="人员基本信息">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<ta:text id="aab001" key="单位检索条件" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="工伤单位名称" readOnly="true" labelWidth="130" />
				<ta:selectInput id="aab019" key="单位性类型" collection="AAB019" readOnly="true" labelWidth="130" />
			</ta:panel>

			<!-- 初始化工伤认定信息 -->
			<ta:panel key="工伤认定信息" height="83px" id="lsrdxx"  cssStyle="overflow:auto">
				<ta:datagrid id="gsxxGrid" selectType="radio" onSelectChange="fnGsxxSelectChange" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
					<ta:datagridItem id="aae044" key="单位名称" width="100" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc020" key="工伤发生时间" width="95" align="center"  dataAlign="center" />
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" align="center"  dataAlign="center"/>
					<ta:datagridItem id="ala016" key="认定依据类别" width="95" collection="ALA016" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc011" key="认定书编号" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc017" key="受理日期" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc029" key="工伤认定结论" width="95" collection="ALC029" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc030" key="工伤认定机构" width="95" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc031" key="工伤认定日期" width="95" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" align="center"  dataAlign="center"/>
					<ta:datagridItem id="aab019" key="单位性类型" hiddenColumn="false" />
				</ta:datagrid>
			</ta:panel>

			<!-- 录入劳动能力鉴定登记信息 -->
			<ta:panel key="劳动能力鉴定登记" id="ldnljdxx" cols="3">
				<ta:text id="aaz127" key="认定id" readOnly="true" display="false" />
				<ta:text id="aaz151" key="鉴定id" readOnly="true" display="false" />
				<ta:text id="alc020" key="工伤发生时间" readOnly="true" display="false" />
				<ta:selectInput id="ala019" key="鉴定类别" labelWidth="130" collection="ALA019" value="1" required="true" onSelect="checktimeinterval" />
				<ta:date id="alc017" key="受理日期" labelWidth="130" validNowTime="left" showSelectPanel="true" required="true" onChange="yhjb_gsjdtimepd()" />
				<ta:date id="alc034" key="鉴定结论日期" labelWidth="130" validNowTime="left" showSelectPanel="true" required="true" onChange="yhjb_gsjdtimepd();checktimeinterval();" />
				<ta:text id="alc035" key="鉴定书编号" labelWidth="130" required="true" />
				<ta:selectInput id="ala040" key="伤残等级" labelWidth="130" collection="ALA040" required="true" />
				<ta:selectInput id="alc060" key="护理依赖等级" labelWidth="130" collection="ALC060" value="9" required="true" />
				<ta:date id="ylc044" key="医疗终结期" labelWidth="130" showSelectPanel="true" display="true" />
				<ta:selectInput id="ylc025" key="鉴定发起方" labelWidth="130" required="true" value="2" collection="YLC025" />
				<ta:date id="aae127" key="申请日期" labelWidth="130" validNowTime="left" showSelectPanel="true" />
				<ta:text id="alc152" key="申请人姓名" labelWidth="130" />
				<ta:text id="alc049" key="申请人电话" labelWidth="130" validType="mobile" />				
			</ta:panel>
			<!-- 劳动能力历史鉴定信息列表，可修改或删除选中项 -->
			<ta:panel key="劳动能力鉴定历史信息" cssStyle="overflow:auto" fit="true" >
				<ta:datagrid id="lc03Grid" forceFitColumns="true" fit="true">
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
					<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
					<ta:datagridItem id="aaz151" key="劳动能力鉴定ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false" />
					<ta:datagridItem id="alc020" key="工伤发生时间" hiddenColumn="false" />
					<ta:datagridItem id="ala019" key="鉴定类别" collection="ALA019" align="center"  dataAlign="center"/>
					<%--			<ta:datagridItem id="aae016" key="复核标志"  collection="AAE016"/>--%>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc060" key="护理依赖等级" collection="ALC060" width="120" align="center"  dataAlign="center"/>
					<ta:datagridItem id="aae129" key="鉴定费金额" dataType="number" align="center"  dataAlign="center" />
					<ta:datagridItem id="ylc044" key="医疗终结期" dataType="date" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc017" key="受理日期" align="center"  dataAlign="center" />
					<ta:datagridItem id="alc034" key="鉴定结论日期" width="120" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc035" key="鉴定结论书编号" width="120" align="center"  dataAlign="center" />
					<ta:datagridItem id="aae127" key="申请日期"  align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc152" key="申请人姓名" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc049" key="申请人电话" align="center"  dataAlign="center"/>
					<ta:datagridItem id="ylc025" key="鉴定发起方" collection="YLC025" align="center"  dataAlign="center"/>
					<ta:datagridItem id="aae013" key="备注" align="center"  dataAlign="center"/>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","judgeLaboringabilityAction!queryPersonInfo.do");
	}, true);
}

//初始化页面布局
$(document).ready(function() {
	$("form").css("overflow","auto");
});
	
//回调函数查询初始化页面信息
function fn_queryInfo(){
  		if (g_Suggest!=""){
  			fn_setPersonBaseInfoData();
		Base.submit("fset1", "judgeLaboringabilityAction!queryPersonInfo.do");  
  		}
}

//取得历史劳动能力鉴定信息
function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
	
 	var alc021 = rowsData[0].alc021;
 	if('1' == alc021||'4' == alc021){
	 	Base.alert("死亡或者失踪人员不能进行劳动能力鉴定！","error");
	 	Base.clearGridDirty("gsxxGrid");
	 	return false;
 	}
 	
 	Base.setValue("aaz127",rowsData[0].aaz127);
 	Base.setValue("alc020",rowsData[0].alc020);
 	Base.setValue("aab001",rowsData[0].aab001);
 	Base.setValue("aae044",rowsData[0].aae044);
 	Base.setValue("aab019",rowsData[0].aab019);
 	 Base.submit("","judgeLaboringabilityAction!getUnitInfo.do",{"dto['aab001']":rowsData[0].aab001,"dto['aaz127']":rowsData[0].aaz127});
 	//checktimeinterval();
 }

 //将历史鉴定信息直接放到fieldset修改
 function fnUpdate(rowdata){
	Base.setReadOnly("ala019");
	Base.setValue("aaz151",rowdata.aaz151);  //劳动能力鉴定ID 
	Base.setValue("aaz127",rowdata.aaz127);  //工伤认定信息ID
	Base.setValue("alc020",rowdata.alc020);  //工伤发生时间 
	Base.setValue("ala019",rowdata.ala019);  //鉴定类别
	Base.setValue("ala040",rowdata.ala040);  //伤残等级
	Base.setValue("alc060",rowdata.alc060);  //护理依赖等级 
	Base.setValue("aae129",rowdata.aae129);  //鉴定费金额
	Base.setValue("alc017",rowdata.alc017);  //受理日期
	Base.setValue("alc034",rowdata.alc034);  //鉴定结论日期 
	Base.setValue("alc035",rowdata.alc035);  //鉴定结论书编号
	Base.setValue("ylc044",rowdata.ylc044);  //鉴定结论书编号
	Base.setValue("aae127",rowdata.aae127);  //申请日期
	Base.setValue("alc152",rowdata.alc152);  //申请人姓名
	Base.setValue("alc049",rowdata.alc049);  //申请人电话
	Base.setValue("ylc025",rowdata.ylc025);  //鉴定发起方
	Base.setValue("aae013",rowdata.aae013);  //备注
 }
 
 //删除鉴定信息
 function fnDelRow(data){
	var aaz151 = data.aaz151;
	var aaz127 = data.aaz127;
	var row = data.row;
	Base.confirm("确认要删除？",function(btn, callback,options) {
	if (btn) {
		Base.submit("fset1,procInc", "judgeLaboringabilityAction!toSave.do",{"dto['aaz151']":aaz151,"dto['aaz127']":aaz127,"dto['yae587']":"3"},null,null);
		}
	});
}

//保存经办信息
function submitData(){
	if(!Base.validateForm("gsrdxx")){
		Base.hideMask();
		return false;
	}
	
	//操作选择
	var aaz127 = Base.getValue("aaz127");
	var aaz151 = Base.getValue("aaz151");
	if(aaz127 == null || aaz127 == ""){
		Base.alert("请选择需要鉴定的认定信息！","warn");
		return false;
	}
	if(aaz151 != null && aaz151 != ""){
		if(!confirm("确认更新？")){ 
			return false; 
		}
	}
	
	Base.submit("form1", "judgeLaboringabilityAction!toSave.do",null,null,null,function callBack(){
		//Base.clearData("form1");
	});
}

function checktimeinterval(){

	var ala019 = Base.getValue("ala019");
	var alc034 = Base.getValue("alc034");
	var aaz127 = Base.getValue("aaz127");
	
	var lc03Grid = Base.getGridData("lc03Grid");
	if(ala019 == 1 && lc03Grid != ""){
		Base.alert("已存在鉴定信息，不能初次鉴定!");
		Base.setValue("ala019","");
		return false;
	}
	
	if(ala019 == "" || alc034 == "" || aaz127 == ""){ //数据准备
		return false;
	}
	//如果为医疗终结期鉴定  不做判断 
	if(ala019 == 4){
	   Base.setDisRequired(["alc035","ala040","alc060","ylc025"]);
	   Base.hideObj(["alc035","ala040","alc060","ylc025"]);
	   Base.showObj("ylc044");
	   Base.setRequired("ylc044");
	   return;
	}else{
         Base.showObj(["alc035","ala040","alc060","ylc025"] );
	  Base.setRequired(["alc035","ala040","alc060","ylc025"]);
	  Base.setDisRequired("ylc044");
	  Base.hideObj("ylc044");	  
	}
	
	Base.submit("", "judgeLaboringabilityAction!getTimeInterval.do",{"dto['ala019']":ala019,"dto['aaz127']":aaz127,"dto['alc034']":alc034},null,null,null,function callBack(){
		Base.setValue("ala019","");
	});
	/*else if((ala019 == "2" || ala019 == "3") && rowData.length != 0 && rowData[0].aae016 == "1"){
		
	}
	else{
		Base.alert("找不到复核通过的历史鉴定信息，请重新选择！","warn");
		Base.setValue("ala019","");
	}*/
}

function yhjb_gsjdtimepd(){
	//判断时间
	var alc034 = Base.getValue("alc034");//取得劳动能力鉴定时间
	var alc017 = Base.getValue("alc017");
	var alc020 =  Base.getValue("alc020");//取得工伤事故时间
	if ((alc020 != null && alc020 != '')&&(alc034 != null && alc034 != '')){
	    if(alc020 >= alc034){
		  Base.alert("劳动能力鉴定时间早于事故发生时间,请核实！","warn");
		  Base.focus("alc034");
		  Base.setValue("alc034","");
		  return false;
	    }
	}
	
	if ((alc017 != null && alc017 != '')&&(alc034 != null && alc034 != '')){
	    if(alc017 > alc034){
		  Base.alert("劳动能力鉴定时间早于受理时间，请核实！","warn");
		  Base.focus("alc034");
		  Base.setValue("alc034","");
		  return false;
	    }
	}
	
	if ((alc017 != null && alc017 != '')&&(alc020 != null && alc020 != '')){
	    if(alc020 > alc017){
		  Base.alert("工伤发生时间晚于受理时间，请核实！","warn");
		  Base.focus("alc017");
		  Base.setValue("alc017","");
		  return false;
	    }
	}
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>
