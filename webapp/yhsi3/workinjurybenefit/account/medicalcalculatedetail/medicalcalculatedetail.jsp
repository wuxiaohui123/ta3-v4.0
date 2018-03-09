<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>MedicalCalculateDetail</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置"	hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印"   onClick="printRaq()" hotKey="ctrl+P" asToolBarItem="true" disabled="true"/>
			<!-- <ta:button id="showCenCalDetailBtn" icon="xui-icon-spotSave" key="门诊住院情况[F]"	hotKey="ctrl+F" onClick="showCenCalDetail()" asToolBarItem="true" disabled="true"/>	
			<ta:button id="SaveMedicalDetailBtn" icon="xui-icon-spotSave" key="提交报销明细[A]"	hotKey="ctrl+A" onClick="submitMedicalDetail()" asToolBarItem="true" disabled="true"/>	
			<ta:button id="SaveModifyBtn" icon="xui-icon-spotSave" key="修改住院时间[M]" hotKey="ctrl+M" onClick="submitModify()" asToolBarItem="true" disabled="true"/> -->
			<ta:button id="queryBtn" key="查询缴费[Q]" icon="xui-icon-query"	hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />							
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<ta:text id="yab003" key="经办机构" display="false"/>
				<ta:text id="aaz002" key="业务日志ID" display="false"/>
				<ta:text id="aaa121" display="false"/>
			</ta:box>
			<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
			<ta:panel id="fset1" cols="3" key="人员基本信息">
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" />
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130"	span="2" />
				<ta:text id="aae140" key="险种类型" display="false" />
				<ta:text id="aaz217" key="人员就诊事件ID" display="false"/>
			</ta:panel>

			<!-- 初始化工伤认定信息 -->
			<ta:panel key="工伤信息" id="lsrdxx">
				<ta:datagrid id="gsxxGrid" forceFitColumns="true" selectType="radio"	onSelectChange="fnGsxxSelectChange" height="100px">
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
					<ta:datagridItem id="aae044" key="单位名称" width="100"/>
					<ta:datagridItem id="aaz127" key="工伤登记号" width="150"	hiddenColumn="true" />
					<ta:datagridItem id="alc020" key="工伤发生时间" width="140" />
					<ta:datagridItem id="alc021" key="伤害程度" width="100" collection="ALC021" />
					<ta:datagridItem id="alc022" key="伤害部位" width="100"	collection="ALC022" />
					<ta:datagridItem id="alc031" key="认定时间" width="100" />
					<ta:datagridItem id="ylc035" key="工伤人员类别" width="140" 	collection="YLC035" />
					<ta:datagridItem id="alc034" key="鉴定时间" width="100" />
					<ta:datagridItem id="ala040" key="伤残等级" width="100"	collection="ALA040" />
					<ta:datagridItem id="alc060" key="依赖等级" width="100"	collection="ALC060" />
					<ta:datagridItem id="alc014" key="诊断意见" width="100"	collection="ALC014" hiddenColumn="false" />
				</ta:datagrid>
			</ta:panel>
			
			<ta:panel key="医疗费核定信息" id="medicalPanl" height="120" cssStyle="display:none" >
				<ta:datagrid id="medicalInfo" forceFitColumns="true" haveSn="true">
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
					<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="queryDetailInfo" />
					<ta:datagridItem id="aaz194" key="工伤医疗登记情况ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz127" key="工伤认定ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz122" key="工伤待遇核定信息ID" hiddenColumn="false"/>
					<ta:datagridItem id="hdqk" key="核定情况" formatter="fnFormatter"/>
					<ta:datagridItem id="akb020" key="机构编号" hiddenColumn="false" />
					<ta:datagridItem id="ake039" key="医保基金垫付金额" hiddenColumn="false" />				
					<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="false" />
					<ta:datagridItem id="ylc051" key="发票费用金额" width="120" />
					<ta:datagridItem id="ake051" key="自费金额" />
					<ta:datagridItem id="aae187" key="基金支付金额" width="120" />
					<ta:datagridItem id="yic380" key="统筹负担金额" />	
					<ta:datagridItem id="yic381" key="单位负担金额" />						
					<ta:datagridItem id="aka078" key="就诊方式" collection="AKA078" />
					<ta:datagridItem id="ylf102" key="救治类型" collection="YLF102" />
					<ta:datagridItem id="ylf013" key="门诊时间" />
					<ta:datagridItem id="aae030" key="入院时间" />
					<ta:datagridItem id="aae031" key="出院时间" />
					<ta:datagridItem id="akb021" key="医院名称" />
					<ta:datagridItem id="ylf101" key="住院天数" />
					<ta:datagridItem id="aae196" key="发票张数" />
					<ta:datagridItem id="ylc052" key="住院补助费" width="110"/>
					<ta:datagridItem id="ylc053" key="医疗费" />
					<ta:datagridItem id="ylc054" key="扣减金额" />
					<ta:datagridItem id="alc014" key="诊断意见" />
			        <ta:datagridItem id="aae013" key="备注" />
				</ta:datagrid>
			</ta:panel>

			<ta:panel key="医疗费明细录入" cols="3" id="medicalcalculatedetail">
				<ta:text id="aaz194" key="工伤医疗登记情况ID" display="false"  />
				<ta:text id="aaz127" key="工伤认定ID" display="false" />
				<ta:text id="alc020" key="工伤发生时间" display="false" />
				<ta:text id="alc031" key="工伤认定时间" display="false" />
				<ta:selectInput id="aka078" key="就诊方式" labelWidth="130"	collection="AKA078" filter="3,4" 	onSelect="fnCheckAka078"	required="true" />
				<ta:selectInput id="ylf102" key="救治类型" labelWidth="130"	collection="YLF102" required="true" />
				<ta:date id="ylf013" key="门诊时间" labelWidth="130" validNowTime="left"		showSelectPanel="true" />
				<ta:date id="aae030" key="入院时间" labelWidth="130" validNowTime="left" showSelectPanel="true" onChange="yhjb_gszytimepd();" />
				<ta:date id="aae031" key="出院时间" labelWidth="130"	showSelectPanel="true" onChange="yhjb_gszytimepd();" />
				<ta:date id="aae030_old" key="入院时间" labelWidth="130" validNowTime="left" showSelectPanel="true"  display="false"/>
				<ta:date id="aae031_old" key="出院时间" labelWidth="130"	showSelectPanel="true" display="false"/>
				<ta:number id="ylf101" key="住院天数" labelWidth="130" />
				<ta:text id="aaz106" key="机构编号" labelWidth="130"  required="true" 
								onChange="sfwQueryUtil(3,'getLa05',Base.getValue('aaz106')+',1'+','+Base.getValue('aae140'));"/>
				<ta:text id="aae0441" key="医院名称" labelWidth="130" readOnly="false" 	required="true" />
				<ta:number id="aae196" key="发票张数" labelWidth="130" max="999" required="true" />
				<ta:number id="ylc051" key="发票费用金额" labelWidth="130" min="0" max="999999"	
									asAamount="true" precision="2" span="1" required="true"/>
				<ta:selectInput id="ylc082" key="住院科室" labelWidth="130"	collection="YLC082" display="false"/>
				<ta:text id="alc014" key="出院诊断" maxLength="200" labelWidth="130" span="2"/>					
				<ta:textarea id="aae013" key="备注" labelWidth="130" height="40px"	span="3" />
			</ta:panel>

			<ta:box cols="2">
				<ta:panel id="dyxxlr" key="明细录入" height="150" cols="2">
					<ta:selectInput key="费用类别" id="ylf103" collection="YLF103"	onSelect="checkIsYLC052" span="1" />
					<ta:number key="申报金额" id="ylf104" min="0" max="999999" asAamount="true"	precision="2" span="1" />
					<ta:number key="扣减金额" id="ylf105" min="0" max="999999" asAamount="true"	precision="2" span="1" />
					<ta:number key="自费金额" id="ylf106" min="0" max="999999" asAamount="true"	precision="2" span="1" />	
					<ta:number key="天数" id="zyts" min="0" max="999" span="1" display="false" onChange="InYlf106();" />	
					<ta:number key="金额" id="zyje" min="0" max="999999" asAamount="true"  onChange="InYlf106();"	precision="2" span="1" display="false" />		
				    <ta:text id="aae013_1" key="备注" span="2"/>			
					<ta:buttonLayout span="2" cssStyle="padding-top:20px">
						<ta:button key="确定" onClick="manageDetailInfo();" />
						<ta:button key="重置" onClick="resetDetailfset();" />
					</ta:buttonLayout>
				</ta:panel>

				<ta:panel id="dqdyxx" key="明细信息" height="150">
					<ta:datagrid id="dqdyxxGrid" fit="true" forceFitColumns="true" >
						<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" 	width="40" align="center" click="fnDelDetailRow" />
						<ta:datagridItem key="医疗登记ID" id="aaz194" hiddenColumn="false" />
						<ta:datagridItem key="费用类别" id="ylf103" collection="YLF103"	width="125" showDetailed="true" align="center" />
						<ta:datagridItem key="申报金额" id="ylf104" align="center" width="125"	totals="sum" />
						<ta:datagridItem key="扣减金额" id="ylf105" align="center" width="125"	totals="sum"  />							
						<ta:datagridItem key="自费金额" id="ylf106" align="center" width="125"	totals="sum" />
					    <ta:datagridItem id="yic381" key="单位负担金额" />
						<ta:datagridItem key="备注" id="aae013" align="center" width="125"/>							
					</ta:datagrid>
				</ta:panel>
			</ta:box>
			<ta:panel id="paymentInfo" key="" hasBorder="false" >
				<ta:panel id="ffxxsyqk" key="发放信息" cols="3">
				     <ta:selectInput id="ffxxbz" key="发放信息使用" labelWidth="130" readOnly="false"  required="true" onSelect="fn_ffxxchang"
				                     data="[{'id':'1','name':'全部个人'},{'id':'2','name':'全部单位'},{'id':'3','name':'机构+个人'},{'id':'4','name':'机构+单位'}]" />
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			</ta:panel>

		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function (){
		$("form").css("overflow","auto");
		Base.hideObj("ffxxlr");
		initializeSuggestFramework(3,"la05","aaz106",300,200,2,fn_la05,0,false);
	});
	
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
			Base.submit("","medicalCalculateDetailAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
		}, true);
	}
	
	function fn_la05(){
		Base.setValue("aaz106",g_Suggest[0]);
		Base.setValue("aae0441",g_Suggest[1]);
	};
	//查询
	function fn_queryInfo(){
		if (g_Suggest!=""){ 
			fn_setPersonBaseInfoData();
			Base.submit("fset1","medicalCalculateDetailAction!queryPersonInfo.do");
   		}
  	}
  	
    //伙食费
	function checkIsYLC052(){
		var ylf103 = Base.getValue("ylf103");
		var aae030 = Base.getValue("aae030");
		var ylf101 = Base.getValue("ylf101");
		//清楚表单中数据
		Base.setValue("ylf104", "");
		Base.setValue("ylf105", "");
		Base.setValue("ylf106", "");
		Base.setValue("zyts", "");
		Base.setValue("zyje", "");
		if(ylf103=="16"){
		    if(aae030 == "" || ylf101 == ""){
			    Base.alert("请先录入入院时间与住院天数!","warn");
			    return false;
		    }
		    Base.setValue("zyts", ylf101);
		    Base.setValue("zyje", "15");
		    InYlf106();
		}
		if(ylf103 == "16"||ylf103 == "19"){
			Base.hideObj(["ylf105","ylf106"]);
			Base.setReadOnly("ylf104");
			Base.showObj(["zyje","zyts"]);			
		}else if(ylf103 == "17"||ylf103 == "18"){
			Base.hideObj(["zyje","zyts","ylf106"]);
			Base.showObj(["ylf105"]);
			Base.setEnable("ylf104");
		}else{
			Base.hideObj(["zyje","zyts"]);
			Base.showObj(["ylf105","ylf106"]);
			Base.setEnable("ylf104");			
		}
	}
    
    function InYlf106(){
    	var zyje = Base.getValue("zyje");
    	var zyts = Base.getValue("zyts");
    	var ylf104 = zyje*zyts;
    	Base.setValue("ylf104",ylf104);
    }
	
	function manageDetailInfo(data){

		if(!Base.validateForm("dyxxlr")){
			Base.hideMask();
			return false;
		}
	   	
		var ylf103 = Base.getValue("ylf103");
		var dyxx = Base.getGridData("dqdyxxGrid");
		for(var i=0;i<dyxx.length;i++){
			if(ylf103 == dyxx[i].ylf103){
				Base.alert("类别已存在!","warn");
				return false;
			}
		}
		Base.addGridRow("dqdyxxGrid",{"ylf103":Base.getValue("ylf103")
			,"ylf104":Base.getValue("ylf104")
			,"ylf105":(Base.getValue("ylf105")==''?"0":Base.getValue("ylf105"))
			,"ylf106":(Base.getValue("ylf106")==''?"0":Base.getValue("ylf106"))
			,"aae013":Base.getValue("aae013_1")
			});
	}
	
	function resetDetailfset(){
		Base.setValue("ylf103","");
		Base.setValue("ylf104","");
		Base.setValue("ylf105","");
		Base.setValue("ylf106","");
	}
	
	//删除明细信息
	function fnDelDetailRow(data,e){
		var row = data.row;
		Base.confirm("确认要删除?",function(flag) {if(flag){Base.deleteGridRow("dqdyxxGrid",row);}});
	}
	
	function queryDetailInfo(data,e){
		if(data == "" || data == undefined){
			return false;
		}
		if(data.aaz122 != "" && data.aaz122 != null){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}			
		if(data.hdqk == '1'){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}
		var aaz002=data.aaz002;
		Base.setValue("aaz002",aaz002);
		Base.submit("","medicalCalculateDetailAction!queryDetailInfo.do",{"dto['aaz194']":data.aaz194},null,null,function(){
			Base.setDisabled("saveBtn");
			Base.setEnable("printBtn");
			Base.setEnable("showCenCalDetailBtn");
			Base.setEnable("SaveMedicalDetailBtn");
			Base.setEnable("SaveModifyBtn");
			});
	}
    
   //就诊方式
	function fnCheckAka078(){
		var aka078 = Base.getValue('aka078');
		if(aka078 == '2'){
			Base.setRequired(["aaz106","aae0441","aae030","aae031","ylf101"]);
			Base._setReadOnly(["aaz106","aae0441","aae030","aae031","ylf101"],false);
			Base.setDisRequired(["ylf013"]);
			Base._setReadOnly(["ylf013"],true);
			
			Base.setValue("ylf013","");
		}
		else{
			Base.setDisRequired(["aae030","aae031","ylf101"]);
			Base._setReadOnly(["aae030","aae031","ylf101"],true);
			Base.setRequired(["ylf013","aaz106","aae0441"]);
			Base._setReadOnly(["ylf013","aaz106","aae0441"],false);
			Base.setValue("aae030","");
			Base.setValue("aae031","");
			Base.setValue("ylf101","");
		}
	}
   
   function yhjb_gszytimepd(){
	   var aae030 = Base.getValue("aae030");
	   var aae031 = Base.getValue("aae031");
	   var alc020 = Base.getValue("alc020");
	   if(aae030 != "" && aae031 != ""){
		   if(aae030 > aae031){
			   Base.alert("入院时间不能大于出院时间!","warn");
		   }
		   else{
			   var tmpBeginTime = new Date(aae030.replace(/-/g, "\/")); //时间转换
		       var tmpEndTime = new Date(aae031.replace(/-/g, "\/")); //时间转换
		       var day = (tmpEndTime - tmpBeginTime) / (1000 * 60 * 60 * 24);
		       Base.setValue("ylf101",day+1); //相减的天数需要加1
		   }
	   }
	   else if(aae030 != "" && alc020 != ""){
		   if(aae030 < alc020){
			   Base.alert("入院时间不能小于工伤时间!","warn");
		   }
	   }
	   else if(aae031 != "" && alc020 != ""){
		   if(aae031 < alc020){
			   Base.alert("出院时间不能小于工伤时间!","warn");
		   }
	   }
   }
	
	//删除信息
	function fnDelRow(data,e){
		var aaz194 = data.aaz194;
		var aaz002 = data.aaz002;
		var aaz127 = data.aaz127;
		var aac001 = data.aac001;
		if(data.aaz122 != "" && data.aaz122 != null){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}		
		if(data.hdqk == '1'){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}		
		Base.confirm("确认要删除?",function(btn, callback,options) {
		if (btn) {	
			Base.submit("procInc", "medicalCalculateDetailAction!toSave.do",{"dto['aaz194']":aaz194,"dto['aaz127']":aaz127,"dto['aac001']":aac001,"dto['yae587']":"3"});
			}
		});
	}
	
	//保存经办信息
	function submitData(){
		//if(!Base.validateForm("medicalcalculatedetail")){
		//	Base.hideMask();
		//	return false;
		//}
		
		//操作选择
		var aaz127 = Base.getValue("aaz127");
		if(aaz127 == null || aaz127 == ""){
			Base.alert("请选择工伤信息!","warn");	
			return false;
		}
		
		var data = Base.getGridData("dqdyxxGrid");
		
		Base.submit("form1","medicalCalculateDetailAction!toSave.do",{"dqdyxxList":Ta.util.obj2string(data)},null,null,function(){
			Base.setEnable("printBtn");
			});
	}
	
	//判断赋值
	function fnGsxxSelectChange(rowsData,n){
		if(rowsData == ""){
			return false;
		}
		
	 	var alc021 = rowsData[0].alc021;
	 	if('4' == alc021){
		 	Base.alert("该人员是失踪人员,请核实！","error");
		 	Base.clearGridDirty("gsxxGrid");
		 	return false;
	 	}	 	
	 	Base.setValue("alc020",rowsData[0].alc020);
	 	Base.setValue("alc031",rowsData[0].alc031);
	 	Base.setValue("aaz127",rowsData[0].aaz127);
	 	Base.setValue("aab001",rowsData[0].aab001);
	 	Base.setValue("aae044",rowsData[0].aae044);
	 	Base.setValue("alc014",rowsData[0].alc014);
	 	Base.submit("","medicalCalculateDetailAction!queryMedicalCalculateDetailInfo.do",{"dto['aaz127']":rowsData[0].aaz127});
	 }
	
	function fn_ffxxchang(){
		var ffxxbz = Base.getValue("ffxxbz");
		if (ffxxbz == '2' || ffxxbz == '4'){
			Base.hideObj("ffxxlr");
			Base.setPanelTitle("ffxxlr", "发放信息录入", true);	
		}else{
			Base.showObj("ffxxlr");
		}
	}

	
	//查看工伤医疗用药明细信息
	function showCenCalDetail(){
//		alert('ShowMedicalDetail');
        var pram = { "dto['aac001']":Base.getValue("aac001"),"dto['aka078']":Base.getValue("aka078"),"dto['ylf102']":Base.getValue("ylf102"),
        		     "dto['ylf013']":Base.getValue("ylf013"),"dto['aae030']":Base.getValue("aae030"),"dto['aae031']":Base.getValue("aae031"),
        		     "dto['aaz106']":Base.getValue("aaz106"),"dto['aaz002']":Base.getValue("aaz002"),"dto['businessCode']":Base.getValue("businessCode"),
        		     "dto['aae0441']":encodeURI(Base.getValue("aae0441")),"dto['aaz217']":Base.getValue("aaz217")};
		Base.openWindow("createMedicalUseDetail", ">>明细内容","medicalCalculateDetailAction!showCenCalDetail.do", pram, "95%", "90%", null, fun_success, true);		
	}
	function fun_success(){
        var aaz217  = Base.getValue("aaz217");
		//需要判断发票金额与录入的明细金额是否相等
		Base.submit("","medicalCalculateDetailAction!updateAaz217Info.do",{"dto['aaz217']":aaz217,"dto['aaz194']":Base.getValue("aaz194")});
	}
	
	//提交医疗费报销明细
	function submitMedicalDetail(){
        var data = Base.getGridData("dqdyxxGrid");
		Base.submit("form1","medicalCalculateDetailAction!submitMedicalDetail.do",{"dqdyxxList":Ta.util.obj2string(data)},null,null,function(){
			Base.setEnable("printBtn");
			});
	}
	
	//修改住院时间
	function submitModify(){
	    var aae030 = Base.getValue("aae030");
	    var aae031 = Base.getValue("aae031");
	    var aae030_old = Base.getValue("aae030_old");
	    var aae031_old = Base.getValue("aae031_old");
	    if(aae030==''||aae030==null){
	       Base.alert("入院时间不能为空！");
	       return;
	    }
	    if(aae031==''||aae031==null){
	       Base.alert("出院时间不能为空！");
	       return;
	    }
	    if(aae030 != aae030_old || aae031 != aae031_old){
		    Base.submit("form1","medicalCalculateDetailAction!submitModify.do",null,null,null,function(){
				Base.setDisabled("SaveModifyBtn");
				});
		}else{
		   Base.alert("住院时间没有变动！无需修改");
		}
	}
	
	function fnFormatter(row, cell, value, columnDef, dataContext){
		if(value == "0"){
			return "未核定";
		}
		else if(value == "1"){
			return "已核定";
		}
	}	
	
	//打印
	function printRaq(){
		var data = Base.getGridData("medicalInfo");
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var yab003 = Base.getValue("yab003");
		var alc031 = Base.getValue("alc031");
		var aaz127 = data[0].aaz127;
		if(alc031 <"2004-01-01"){
		    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSylflbx_shd9.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz002="+aaz002+";yab003="+yab003+";aaz127="+aaz127);
		}else{
		    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSylflbx_shd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz002="+aaz002+";yab003="+yab003+";aaz127="+aaz127);
		
		}
		
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
