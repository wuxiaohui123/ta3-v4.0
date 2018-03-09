<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>AuxiliaryApparatusDetail</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
<body>
	<ta:pageloading />

	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]"  onClick="printRaq()" hotKey="ctrl+P" asToolBarItem="true" disabled="true"/>
		<ta:button id="showCenCalDetailBtn" icon="xui-icon-spotSave" key="器具配置情况[F]" hotKey="ctrl+F" onClick="showCenCalDetail()" asToolBarItem="true" disabled="true"/>	
		<ta:button id="SaveMedicalDetailBtn" icon="xui-icon-spotSave" key="提交报销明细[A]" hotKey="ctrl+A" onClick="submitAuxiliaryDetail()" asToolBarItem="true" disabled="true"/>
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />						
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
		<ta:panel id="fset1" cols="3" key="人员基本信息">
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" />
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" span="2" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:text id="aaz217" key="人员就诊事件ID" display="false"/>	
			<ta:text id="aaz002" key="业务日志ID" display="false"/>	
			<ta:text id="yab003" key="经办机构" display="false"/>		
			<ta:text id="aaa121" display= "false"/>
		</ta:panel>

		<!-- 初始化工伤认定信息 -->
		<ta:panel key="工伤认定信息" id="lsrdxx">
			<ta:datagrid id="gsxxGrid" selectType="radio" forceFitColumns="true" onSelectChange="fnGsxxSelectChange" height="100px">
				<ta:datagridItem id="aaz127" key="工伤登记号" hiddenColumn="true" />
				<ta:datagridItem id="alc020" key="工伤发生时间" width="120" />
				<ta:datagridItem id="alc021" key="伤害程度" width="100" collection="ALC021" />
				<ta:datagridItem id="alc022" key="伤害部位" width="100" collection="ALC022" />
				<ta:datagridItem id="alc031" key="认定时间" width="100" />
				<ta:datagridItem id="ylc035" key="工伤人员类别" width="120" collection="YLC035" />
				<ta:datagridItem id="alc034" key="鉴定时间" width="100" dataType="date"/>
				<ta:datagridItem id="ala040" key="伤残等级" width="100" collection="ALA040" />
				<ta:datagridItem id="alc060" key="护理依赖等级" width="100" collection="ALC060" />
			</ta:datagrid>
		</ta:panel>
		<ta:panel key="辅助器具核定信息" id="auxiliaryPanl" height="120" cssStyle="display:none">
			<ta:datagrid id="auxiliaryapparatus" forceFitColumns="true" haveSn="true" >
				<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
				<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
				<ta:datagridItem id="aaz195" key="辅助器具配置登记ID" hiddenColumn="true"/>
				<ta:datagridItem id="aaz127" key="工伤认定ID" hiddenColumn="true"/>
				<ta:datagridItem id="aaz122" key="工伤待遇核定信息ID" hiddenColumn="false"/>
				<ta:datagridItem id="hdqk" key="核定情况" formatter="fnFormatter"/>
				<ta:datagridItem id="akc230" key="申报类型" formatter="fnFormatter2" width="120"/>
				<ta:datagridItem id="aaz106" key="辅助器具机构ID" hiddenColumn="true"/>
				<ta:datagridItem id="aae0441" key="辅助机构名称" width="200"/>	
				<ta:datagridItem id="aae196" key="发票张数" width="120"/>
				<ta:datagridItem id="ylc051" key="发票费用金额" width="120"/>		
				<ta:datagridItem id="aae030" key="住院开始时间" width="120"/>
				<ta:datagridItem id="aae031" key="住院结束时间" width="120"/>
				<ta:datagridItem id="ylf101" key="住院天数" width="120"/>
				<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="true"/>
			</ta:datagrid>
		</ta:panel>
		<ta:panel key="辅助器具登记信息" cols="3" id="auxiliaryapparatusdetail" >
			<ta:text id="aaz195" key="辅助器具配置登记ID" readOnly="true" labelWidth="130" display="false"/>
			<ta:text id="aaz127" key="工伤认定ID" readOnly="true" required="true" labelWidth="130" display="false" />
			<ta:text id="ala027" key="有效月数" readOnly="true" required="true" labelWidth="130" display="false" />
			<ta:text id="alc020" key="工伤发生时间" display="false" />
			<ta:selectInput id="akc230" key="申报类型" data="[{'id':'1','name':'新增'},{'id':'2','name':'维修'}]" value="1" required="true" labelWidth="130" onSelect="checkIsReduplicate" />
			<ta:text id="aaz106" key="辅助器具机构编码" onChange="sfwQueryUtil(4,'getLa05',Base.getValue('aaz106')+',3'+','+Base.getValue('aae140'));" required="true" labelWidth="130" />
			<ta:text id="aae0441" key="辅助机构名称" readOnly="false" required="true" labelWidth="130" />
			<ta:number id="aae196" key="发票张数" required="true" labelWidth="130"/>
			<ta:number id="ylc051" key="发票费用金额" required="true" labelWidth="130" />
			<ta:date id="aae030" key="入院时间" labelWidth="130" validNowTime="left"
					showSelectPanel="true" onChange="yhjb_gszytimepd();" required="true" />
			<ta:date id="aae031" key="出院时间" labelWidth="130"
					showSelectPanel="true" onChange="yhjb_gszytimepd();" required="true"/>
			<ta:number id="ylf101" key="住院天数" labelWidth="130" />		
			<ta:textarea id="aae013" key="备注" span="3" maxLength="200" labelWidth="130" height="35" />
		</ta:panel>
			<ta:box cols="2">
				<ta:panel id="dyxxlr" key="明细录入" height="150" cols="2">
					<ta:selectInput key="费用类别" id="ylf103" collection="YLF103"
						onSelect="checkIsYLC052" span="1" />
					<ta:number key="申报金额" id="ylf104" min="0" max="999999" asAamount="true" precision="2" span="1" />
					<ta:number key="扣减金额" id="ylf105" min="0" max="999999" asAamount="true" precision="2" span="1" />
					<ta:number key="自费金额" id="ylf106" min="0" max="999999" asAamount="true"	precision="2" span="1" />	
					<ta:number key="天数" id="zyts" min="0" max="999" span="1" display="false" onChange="InYlf106();" />	
					<ta:number key="金额" id="zyje" min="0" max="999999" asAamount="true"  onChange="InYlf106();" precision="2" span="1" display="false" />		
				    <ta:text id="aae013_1" key="备注" span="2"/>			
					<ta:buttonLayout span="2" cssStyle="padding-top:20px">
						<ta:button key="确定" onClick="manageDetailInfo();" />
						<ta:button key="重置" onClick="resetDetailfset();" />
					</ta:buttonLayout>
				</ta:panel>

				<ta:panel id="dqdyxx" key="明细信息" height="150">
					<ta:datagrid id="dqdyxxGrid" fit="true" forceFitColumns="true" >
						<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete"  width="40" align="center" click="fnDelDetailRow" />
						<ta:datagridItem key="医疗登记ID" id="aaz194" hiddenColumn="false" />
						<ta:datagridItem key="费用类别" id="ylf103" collection="YLF103" width="125" showDetailed="true" align="center" />
						<ta:datagridItem key="申报金额" id="ylf104" align="center" width="125" totals="sum" />
						<ta:datagridItem key="扣减金额" id="ylf105" align="center" width="125"	totals="sum"  />							
						<ta:datagridItem key="自费金额" id="ylf106" align="center" width="125"	totals="sum" />
						<ta:datagridItem key="备注" id="aae013" align="center" width="125"/>							
					</ta:datagrid>
				</ta:panel>
			</ta:box>				
	</ta:form>
  <iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function (){
		//$("form").css("overflow","auto");
		initializeSuggestFramework(3,"la04","ala020",300,200,2,fn_la04,0,false);
		initializeSuggestFramework(4,"la05","aaz106",300,200,2,fn_la05,0,false);
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
			Base.submit("","stjfnxrdAction!queryBaseInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
		}, true);
	}
	
	function fn_la05(){
		Base.setValue("aaz106",g_Suggest[0]);
		Base.setValue("aae0441",g_Suggest[1]);
	}
	
	function fn_la04(){
//		 Base.setValue("akc225",g_Suggest[1]);
		 Base.setValue("aaz105",g_Suggest[2]);
//		 Base.setValue("ala027",g_Suggest[3]);
		 checkIsReduplicate();
    }
	function fnFormatter(row, cell, value, columnDef, dataContext){
		if(value == "0"){
			return "未核定";
		}
		else if(value == "1"){
			return "已核定";
		}
	}
	
	function fnFormatter2(row, cell, value, columnDef, dataContext){
		if(value == "1"){
			return "新增";
		}
		else if(value == "2"){
			return "维修";
		}
	}
	
	//查询
	function fn_queryInfo(){
		fn_setPersonBaseInfoData();
		Base.submit("fset1","auxiliaryApparatusDetailAction!queryPersonInfo.do");
  	};
  	
  	//判断重复
  	function checkIsReduplicate(){
  	    
		var aaz105 = Base.getValue("aaz105");
		var aaz127 = Base.getValue("aaz127");
		var akc230 = Base.getValue("akc230");
		if(aaz105 == null || aaz105 == "" || aaz127 == null || aaz127 == "" || akc230 == "" || akc230 == null){
			return false;
		}
		
		var rowData = Base.getGridData("auxiliaryapparatus");
		if(akc230 == "1"){
			for (var i = 0; i < rowData.length; i ++ ) {
				if(aaz105 == rowData[i].aaz105){
					Base.alert("已有该项目的历史报销记录!","warn");
				}
			}
		}
		else{
			var count = 0;
			for (var i = 0; i < rowData.length; i ++ ) {
				if(aaz105 == rowData[i].aaz105 && rowData[i].akc230 == "1"){
					count = count + 1;
				}
			}
			if(count == 0){
				Base.alert("不存在该项目的历史记录，不能维修该器具!","warn");
			}
		}
		getsummoney();
	}
  	
  	function getsummoney(){
  		var akc225 = Base.getValue("akc225");
  		var akc226 = Base.getValue("akc226");
  		if(akc225 == "" || akc226 == ""){
  			return false;
  		}
  		else{
  			var zje = akc225 * akc226;
  			Base.setValue("zje",zje);
  		}
  	}
	
	//修改认定信息
	function fnUpdate(data,e){
		if(data == "" || data == undefined){
			return false;
		}
		if(data.hdqk == '1'){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}
		if(data.aaz122 != "" && data.aaz122 != null){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}			
		Base.submit("","auxiliaryApparatusDetailAction!queryDetailInfo.do",{"dto['aaz195']":data.aaz195},null,null,function(){
			Base.setDisabled("saveBtn");
			Base.setEnable("showCenCalDetailBtn");
			Base.setEnable("SaveMedicalDetailBtn");
			});
	 }
	
	//删除认定信息
	function fnDelRow(data,e){
		var aaz195 = data.aaz195;
		var aaz002 = data.aaz002;
		var aaz127 = data.aaz127;
		if(data.hdqk == '1'){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}		
		if(data.aaz122 != "" && data.aaz122 != null){
			alert("该医疗情况登记信息已经核定不能操作，请确认！");
			return false;
		}			
		Base.confirm("确认要删除?",function(btn, callback,options) {
		if (btn) {	
			Base.submit("procInc,fset1", "auxiliaryApparatusDetailAction!toSave.do",{"dto['aaz195']":aaz195,"dto['aaz127']":aaz127,"dto['yae587']":"3"});
			}
		});
	}
	
	//保存经办信息
	function submitData(){
		if(!Base.validateForm("auxiliaryapparatusdetail")){
			Base.hideMask();
			return false;
		}
		
		//操作选择
		var aaz195 = Base.getValue("aaz195");
		var aaz127 = Base.getValue("aaz127");
		if(aaz195 != null && aaz195 != ""){
			if(!confirm("确认更新？")){ 
				return false;
			}
		}
		if(aaz127 == null || aaz127 == ""){
			Base.alert("请选择工伤信息!","warn");	
			return false; 
		}
		
		Base.submit("auxiliaryapparatusdetail,fset1","auxiliaryApparatusDetailAction!toSave.do",null,null,null,function(){
			Base.setEnable("printBtn");
		});
	}
	
	//判断赋值
	function fnGsxxSelectChange(rowsData,n){
		if(rowsData == ""){
			return false;
		}
		
		/*
	 	var alc021 = rowsData[0].alc021;
	 	if('1' == alc021||'4' == alc021){
		 	Base.alert("死亡或者失踪人员不能进行辅助器具登记！","error");
		 	Base.clearGridDirty("gsxxGrid");
		 	return false;
	 	}*/
	 	Base.setValue("alc020",rowsData[0].alc020);
	 	Base.setValue("aaz127",rowsData[0].aaz127);
	 	Base.submit("","auxiliaryApparatusDetailAction!queryAuxiliaryApparatusDetailInfo.do",{"dto['aaz127']":rowsData[0].aaz127});
	 	checkIsReduplicate();
	 }
	 
	 //检查配置时间
	 function fnCheckpz(){
		var akc230 = Base.getValue("akc230");
		if(akc230 == "2" || akc230 == ""){
			return false;
		}
	 	var ala020 = Base.getValue("ala020");//辅助器具名称
	 	var alc010 = Base.getValue("alc010");//配置时间
		var ala027 = Base.getValue("ala027");//有效月数
		if(ala027 == ""){
			return false;
		}
		var year1 = alc010.substr(0,4);
		var month1 = alc010.substr(5,2);
		var day1 = alc010.substr(8,2);
		var rows = Base.getGridData("auxiliaryapparatus");
		var len = rows.length;
		for(var i=0;i<len;i++){
			var ala020_g = rows[i].ala020;
			if(ala020!=''&&ala020_g!=''&&ala020==ala020_g){
				var alc010_g = rows[i].alc010
				var year2 = alc010_g.substr(0,4);
				var month2 = alc010_g.substr(5,2);
				var day2 = alc010_g.substr(8,2);
				var month = (year1*12+month1)-(year2*12+month2);
				if(month<ala027){
					Base.alert("该辅助器具还在有效期内，不能进行配置！","warn");
				}
				if(month=ala027){
					if(day1<day2){
						Base.alert("该辅助器具还在有效期内，不能进行配置！","warn");
					}
				}
			}
		}
	 }
	 
		//查看工伤医疗用药明细信息
		function showCenCalDetail(){
//			alert('ShowMedicalDetail');
	        var pram = { "dto['aac001']":Base.getValue("aac001"), "dto['alc010']":Base.getValue("alc010"), "dto['aaz106']":Base.getValue("aaz106"),
	        		     "dto['aaz002']":Base.getValue("aaz002"),"dto['businessCode']":Base.getValue("businessCode"), "dto['aae0441']":encodeURI(Base.getValue("aae0441")),
	        		     "dto['aaz217']":Base.getValue("aaz217"),"dto['aae030']":Base.getValue("aae030"),"dto['aae031']":Base.getValue("aae031")};
			Base.openWindow("createMedicalUseDetail", ">>明细内容","auxiliaryApparatusDetailAction!showCenCalDetail.do", pram, "90%", "60%", null, fun_success, true);		
		}
		function fun_success(){
	        var aaz217  = Base.getValue("aaz217");
			//需要判断发票金额与录入的明细金额是否相等
			Base.submit("","auxiliaryApparatusDetailAction!updateAaz217Info.do",{"dto['aaz217']":aaz217,"dto['aaz195']":Base.getValue("aaz195")});
		}
		
		//提交医疗费报销明细
		function submitAuxiliaryDetail(){
	        var data = Base.getGridData("dqdyxxGrid");
			Base.submit("form1","auxiliaryApparatusDetailAction!submitAuxiliaryDetail.do",{"dqdyxxList":Ta.util.obj2string(data)},null,null,function(){
				Base.setEnable("printBtn");
				});
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
			if(ylf103 == ''){
			   alert("费用类别不能为空！");
			   return false;
			}
			var ylf104 = Base.getValue("ylf104");
			if(ylf104 == ''){
			   alert("申报金额不能为空！");
			   return false;
			}			
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
		
		//打印
function printRaq(){
	//var data = Base.getGridData("medicalInfo");
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var yab003 = Base.getValue("yab003");
		var aaz127 = Base.getValue("aaz127");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSfzqj_shd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz002="+aaz002+";yab003="+yab003+";aaz127="+aaz127);
}
			    
</script>
<%@ include file="/ta/incfooter.jsp"%>
