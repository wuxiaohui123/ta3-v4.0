<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>maternityAfter</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" hotKey="P" asToolBarItem="true" disabled="true" onClick="print();" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="单位编号" labelWidth="130" readOnly="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:selectInput id="ykc005" key="在编标识" collection="SFBZ" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			<ta:text id="aaa121" display="false" />
		</ta:panel>

		<ta:panel id="sydjxx" key="手术登记信息" hasBorder="false" cols="3">
			<ta:text id="ymc035" key="计划生育手术登记ID" display="false" />
			<ta:text id="aaz106" key="医疗机构编码" required="true" onChange="sfwQueryUtil(3,'getLa05',Base.getValue('aaz106')+',1'+','+Base.getValue('aae140'));" labelWidth="130" />
			<ta:text id="aae0441" key="医疗机构名称" required="true" labelWidth="130" />
			<ta:selectInput id="ymc032" key="手术类别" collection="YMC032" required="true" labelWidth="130" />
			<ta:date id="aae127" key="申请日期" validNowTime="left" required="true" showSelectPanel="true" labelWidth="130" />
			<ta:date id="amc020" key="手术日期" validNowTime="left" required="true" showSelectPanel="true" onChange="checkpayfor();yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="aae005" key="联系电话" max="9999999999999" labelWidth="130" />
			<ta:date id="aae235" key="就诊开始日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:date id="aae236" key="就诊结束日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="yae150" key="新农合已支付医疗费" required="true" asAamount="true" precision="2" labelWidth="130" />
			<ta:number id="aae198" key="实际医疗总费用" required="true" asAamount="true" precision="2" labelWidth="130" />
		</ta:panel>
		<!-- 历史工伤申报列表，可修改或删除选中项 -->
		<ta:panel key="生育历史登记信息" id="lsdjxx" fit="true">
			<ta:datagrid id="mc03Grid" haveSn="true" snWidth="20" forceFitColumns="true" fit="true">
				<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
				<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" />
				<ta:datagridItem key="手术类别" id="ymc032" collection="YMC032" align="center" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" dataType="date" />
				<ta:datagridItem key="手术日期" id="amc020" align="center" dataType="date" />
				<ta:datagridItem key="生育津贴金" id="amc030" width="100" formatter="convertStateRed" align="center" dataAlign="center" />
				<ta:datagridItem key="医疗费金额" id="aae187" width="100" formatter="convertStateBlue" align="center" dataAlign="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" />
				<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" width="120" />
				<ta:datagridItem key="联系电话" id="aae005" align="center" />
				<ta:datagridItem key="手术开始日期" id="aae235" align="center" dataType="date" width="120" />
				<ta:datagridItem key="手术结束日期" id="aae236" align="center" dataType="date" width="120" />
				<ta:datagridItem key="新农合已支付医疗费" width="120" id="yae150" align="center" dataAlign="center" />
				<ta:datagridItem key="实际医疗总费用" width="120" id="aae198" align="center" dataAlign="center" />
				<ta:datagridItem key="单位ID" id="aab001" align="center" hiddenColumn="true" />
				<ta:datagridItem key="单位管理码" id="aab999" align="center" hiddenColumn="true" />
				<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
				<ta:datagridItem key="业务日志ID" id="aaz002" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("body").css("overflow","hidden");
		initializeSuggestFramework(3,"la05","aaz106",300,200,2,fn_la05,0,false);
	});
	
	//人员RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset", "maternityPlanSurgeryAction!queryPersonInfo.do");
			validatepayfor(Base.getValue("aac001"),Base.getValue("aab001"),Base.getValue("amc020"));
		}, true);
	}
	
	//医疗机构RPC
	function callRyRPC() {
		sfwQueryUtil_newRPC(3, 'getLa05String', {"dto['inputString']" : Base.getValue("aaz106")});
		// sfwQueryUtil(3,'getLa05',Base.getValue('aaz106')+',1'+','+Base.getValue('aae140'));
	}
	
	function fn_la05(){
	    Base.setValue("aaz106",g_Suggest[0]);
	    Base.setValue("aae0441",g_Suggest[1]);
	};
	//回调函数查询初始化页面信息
	function fn_queryInfo(){ //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
   		if (g_Suggest!=""){
   		    fn_setPersonBaseInfoData();
			Base.submit("jbxxfset", "maternityPlanSurgeryAction!queryPersonInfo.do");
			validatepayfor(Base.getValue("aac001"),Base.getValue("aab001"),Base.getValue("amc020"));
   		}
	}
	function fn_ab01Info(){ //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
   		if (g_Suggest!=""){ 
   		    fn_setUnitBaseInfoData();
   		 	validatepayfor(Base.getValue("aac001"),Base.getValue("aab001"),Base.getValue("amc020"));
   		}
	}
	
	//手术日期检查缴费
	function checkpayfor(){
		validatepayfor(Base.getValue("aac001"),Base.getValue("aab001"),Base.getValue("amc020"),Base.getValue("aae140"));
	}

	//验证缴费信息
	function validatepayfor(aac001,aab001,amc020,aae140){
		if(aac001 == "" || aab001 == "" || amc020 == ""){
			return false;
		}
		Base.submit("", "maternityPlanSurgeryAction!validatePayfor.do",{"dto['amc020']":amc020,"dto['aab001']":aab001,"dto['aac001']":aac001,"dto['aae140']":aae140});
	}
	
	function yhjb_syjztimepd(){
	    var aae235 = Base.getValue("aae235");
	    var aae236 = Base.getValue("aae236");
	    var amc020 = Base.getValue("amc020");
	    
	    if ((aae236 != null && aae236 != '') && (aae235 != null && aae235 != '')){
	         if (aae235 > aae236){
	           alert("就诊开始日期晚于就诊结束日期，请核实！")
		       Base.setValue("aae236","");
			   Base.focus(aae236);
	       }
	    }
	    
	    if ((amc020 != null && amc020 != '') && (aae235 != null && aae235 != '')){
	         if (aae235 > amc020){
	           alert("就诊开始日期晚于手术时间，请核实！")
		       Base.setValue("amc020","");
			   Base.focus(amc020);
	       }
	    }
	    
	    if ((aae236 != null && aae236 != '') && (amc020 != null && amc020 != '')){
	         if (amc020 > aae236){
	           alert("就诊结束日期早于手术日期，请核实！")
		       Base.setValue("amc020","");
			   Base.focus(amc020);
	       }
	    }
	     
	}
	
	function convertStateRed(row, cell, value, columnDef, dataContext){
		return "<div style='color:red;margin-top:4px'>"+value+"</div>";
	}
	function convertStateBlue(row, cell, value, columnDef, dataContext){
		return "<div style='color:blue;margin-top:4px'>"+value+"</div>";
	}
	
	//保存经办信息
	function submitData(){
		if(!Base.validateForm("form1")){
			Base.hideMask();
			return false;
		}
		
		//操作选择
		var ymc035 = Base.getValue("ymc035");
		if(ymc035 != null && ymc035 != ""){
			if(!confirm("确认更新？")){ 
				return false; 
			}
		}

		Base.submit("form1", "maternityPlanSurgeryAction!toSave.do");
	}
	
	//修改认定信息
	function fnUpdate(data,e){
		Base.setValue("ymc035",data.ymc035); //计划生育手术登记ID
		Base.setValue("aae005",data.aae005); //联系电话          
		Base.setValue("aae127",data.aae127); //申请日期          
		Base.setValue("aaz106",data.aaz107); //医疗机构ID     
		Base.setValue("aae0441",data.aae0441); //定点医疗机构名称
		Base.setValue("aae235",data.aae235); //手术开始日期      
		Base.setValue("aae236",data.aae236); //手术结束日期      
		Base.setValue("amc020",data.amc020); //手术日期          
		Base.setValue("ymc032",data.ymc032); //计划生育手术类别
		Base.setValue("yae150",data.yae150);
		Base.setValue("aab001",data.aab001);
		Base.setValue("aae044",data.aae044);
		Base.setValue("aab999",data.aab999);
		Base.setValue("businessLogID",data.aaz002);
	 }
	
	//删除认定信息
	function fnDelRow(data,e){
		var amc238 = data.amc238;
		var ymc035 = data.ymc035;
		var row = data.row;
		Base.confirm("确认要删除?",function(btn, callback,options) {
		if (btn) {	
			Base.submit("jbxxfset,procInc", "maternityPlanSurgeryAction!toSave.do",{"dto['amc238']":amc238,"dto['yae587']":"3","dto['ymc035']":ymc035},null,null,null);
			}
		});
	}
	
	//打印
	function  print(){
		var aaz002 = Base.getValue("businessLogID");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_syjl_shb.raq&"
						+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
						+ "serverPagedPrint=no&mirror=no&" + "paramString=aaz002="
						+ aaz002);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
