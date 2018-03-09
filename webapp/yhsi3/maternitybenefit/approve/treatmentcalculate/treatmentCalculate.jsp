<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>生育待遇审理</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇核定[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" disabled="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>

		<ta:panel id="jbxxfset" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:selectInput id="ykc005" key="人员类型" collection="YKC005" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			<ta:text id="yab003" key="经办机构" display="false" labelWidth="130" />
		</ta:panel>
		<ta:panel id="sydjxx" key="本次生育基本信息" cols="3" hasBorder="false">
			<ta:text id="amc238" key="生育待遇资格认定ID" display="false" />
			<ta:selectInput id="amc026" key="生育类别" collection="AMC026" labelWidth="130" readOnly="true" />
			<ta:date id="aae127" key="申请日期" labelWidth="130" readOnly="true" />
			<ta:date id="amc020" key="生育日期" labelWidth="130" readOnly="true" />
			<ta:text id="aaz106" key="医疗机构编码" labelWidth="130" readOnly="true" />
			<ta:text id="aae0441" key="医疗机构名称" labelWidth="130" readOnly="true" />
			<ta:number id="amc028" key="胎儿数" labelWidth="130" readOnly="true" />
			<ta:number id="amc031" key="胎次" labelWidth="130" readOnly="true" />
			<ta:text id="amc021" key="生育证号" labelWidth="130" readOnly="true" />
			<ta:text id="amc022" key="出生证号" labelWidth="130" readOnly="true" />
			<ta:number id="aae005" key="联系电话" labelWidth="130" readOnly="true" />
			<ta:date id="aae235" key="就诊开始日期" labelWidth="130" readOnly="true" />
			<ta:date id="aae236" key="就诊终止日期" labelWidth="130" readOnly="true" />
			<ta:number id="yae150" key="新农合已支付医疗费" readOnly="true" asAamount="true" precision="2" labelWidth="130" />
			<ta:number id="aae198" key="实际医疗总费用" readOnly="true" asAamount="true" precision="2" labelWidth="130" />
			<ta:box span="1" cols="2">
				<ta:number id="amc030" key="生育津贴金" readOnly="true" asAamount="true" precision="2" labelWidth="130" columnWidth="0.55" />
				<ta:number id="aae187" key="报销医疗费" readOnly="true" asAamount="true" precision="2" labelWidth="80" columnWidth="0.44" />
			</ta:box>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
		<ta:box cols="2">
			<ta:panel id="dqdyxx" key="当前待遇信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center" dataAlign="center" />
					<ta:datagridItem id="aae128" key="核发金额" align="center" dataAlign="right" />
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center" dataAlign="center" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="date" />
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="hisdyxx" key="历史报销信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="hisdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center" dataAlign="center" />
					<ta:datagridItem id="aae128" key="核发金额" align="center" dataAlign="right" />
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center" dataAlign="center" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" />
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("form").css("overflow","auto");
		initializeSuggestFramework(3,"la05","aaz106",300,200,2,fn_la05,0,false);		
		fn_FfxxlrInitialization();
	});
		
	//人员RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset","treatmentCalculateAction!queryPersonInfo.do",null,null,fn_check());
		}, true);
	}
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function submitData() {
		if (!Base.validateForm("form1")) {
			Base.hideMask();
			return false;
		}
		Base.submit("form1", "treatmentCalculateAction!toSave.do", null, null, null, function() {
			Base.setEnable("printBtn");
		});
	}

	//手术日期检查缴费
	function checkpayfor() {
		validatepayfor(Base.getValue("aac001"), Base.getValue("aab001"), Base.getValue("amc020"), Base.getValue("aae140"));
	}

	//验证缴费信息
	function validatepayfor(aac001, aab001, amc020, aae140) {
		if (aac001 == "" || aab001 == "" || amc020 == "") {
			return false;
		}
		var aaa121 = Base.getValue("aaa121");
		Base.submit("", "<%=path%>/process/maternitybenefit/MedicalCal/medicalcalaction!validatePayfor.do",{"dto['amc020']":amc020,"dto['aab001']":aab001,"dto['aac001']":aac001,"dto['aae140']":aae140,"dto['aaa121']":aaa121});
	}	
	
	function fnSyxxSelectChange(rowsData,n){
		if(rowsData == ""){
			return false;
		}
		
		Base.setValue("amc238",rowsData[0].amc238);
		Base.setValue("aae044",rowsData[0].aae044);
		Base.setValue("aab999",rowsData[0].aab999);
		Base.setValue("aab001",rowsData[0].aab001);
		Base.setValue("type",rowsData[0].type);
		Base.setValue("ymc035",rowsData[0].ymc035);
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
	}
	
	function fn_la05(){
	    Base.setValue("aaz106",g_Suggest[0]);
	    Base.setValue("aae0441",g_Suggest[1]);
	}	
	
	//查看工伤医疗用药明细信息
	function ShowMedicalDetail(){
		Base.openWindow("medicalDetailInfo", ">>明细内容","<%=path%>/process/workinjurybenefit/medicalcalculatedetail/medicalCalculateDetailAction!showMedicalUseDetail.do", {
			"dto['aac001']":Base.getValue("aac001"),"dto['aka130']":"51,52"}, "95%", "90%", null, null, true);		
	}	
	
	//当选择支付对象为单位或机构时弹出窗口，在窗口中选择机构或单位   
	function fn_privateContorlYaz099(){
		var yaz099 = "";
	    var aae140 = Base.getValue("aae140");
	    var yad169 = Base.getValue("yad169");	
	    var aaz001 = Base.getValue("aab001");
		if(yad169 == "31" || yad169 == "21"){	
	       yaz099 = window.showModalDialog("<%=path%>/process/benefit/maintenance/paymentinfomaintenance/paymentInfoMaintenanceAction!selectUnitInfoWindow.do?aae140="+aae140+"&yad169="+yad169+"&aaz001="+aaz001, null, 'dialogWidth:1000px;dialogHeight:500px;help:no;unadorned:no;resizable:no;toolbar=no;menubar=no;resizable=yes;location=no;status=no;scrollbars=no');
		}
	    return yaz099;
	}  
</script>
<%@ include file="/ta/incfooter.jsp"%>
