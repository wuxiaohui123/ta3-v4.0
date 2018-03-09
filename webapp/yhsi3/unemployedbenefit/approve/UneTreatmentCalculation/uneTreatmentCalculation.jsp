<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="遇待新增[S]" icon="xui-icon-spotSave" hotKey="S" onClick="transProcess()"  asToolBarItem="true" disabled="true"/>
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印失业证[P]" onClick="print(1)"  hotKey="P" asToolBarItem="true" disabled="true"/>
		<ta:button id="printBtn2" icon="xui-icon-spotPrint" key="打印失业信息" onClick="print(2)"   asToolBarItem="true" disabled="true" display="false"/>
		<ta:button id="printBtn1" icon="xui-icon-spotPrint" key="打印失业保险金申领表" onClick="printRaq()"   asToolBarItem="true" disabled="true"/>
		<ta:button id="printnmgBtn" icon="xui-icon-spotPrint" key="打印农民工一次性补贴表" onClick="printnmg()"  asToolBarItem="true" display="false"/>		
	    <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true"/>
	    <ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
	</ta:toolbar>
	
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>	
	    	<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>					
		</ta:box>	
		<ta:panel key="人员基本信息" cols="3" id="jbxxfset" >
		    <%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>			
			<ta:box cols="2">
				<ta:text id="aab001" key="失业代管单位代码" maxLength="20" labelWidth="130" columnWidth="0.9"  bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true"/>
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称"   labelWidth="130" span="2" readOnly="true"/>
			<ta:date id="aae042" key="暂停缴费时间"   labelWidth="130" readOnly="true" issue="true"/>
			<ta:text id="aaz170" key="待遇核定事件id"  labelWidth="130" display="false" readOnly="true"  />
			<ta:date key="出生日期" id="aac006"  readOnly="true" labelWidth="130" />
		    <ta:selectInput key="用工形式" collection="AAC013" id="aac013" readOnly="true"  labelWidth="130"  />
		    <ta:date key="参工日期" id="aac007" readOnly="true"  labelWidth="130"  />
		    <ta:number key="联系电话" id="aae005" labelWidth="130"  onChange="updatePhone()" />
		    <ta:number key="联系电话" id="aae005_old" labelWidth="130" display="false" />
		    <ta:text key="参保险种" id="aae140_H" readOnly="true" display="false" labelWidth="130" />
		    <ta:text key="业务类型编码" id="aaa121_H" readOnly="true" display="false" labelWidth="130"/>
		</ta:panel>
		
		<ta:panel key="上次失业信息" cols="3" id="scsyxx" >
			<ta:selectInput id="ajc093_old" key="失业原因"  collection="AJC093" readOnly="true" labelWidth="130" />
			<ta:date id="ajc090_old" key="失业时间"   readOnly="true" labelWidth="130" />
			<ta:text key="失业待遇证号" id="jye004_old"  readOnly="true"  labelWidth="130"/>
			<ta:text key="享受待遇ID" id="aaz257_old"  readOnly="true" display="true" labelWidth="130"/>
		    <ta:date key="失业待遇终止年月" id="ajc056_old" readOnly="true" labelWidth="130" issue="true"/>
		    <ta:text key="可领月数" id="ajc097_old" readOnly="true" labelWidth="130"/>
		    <ta:text key="已领月数" id="ajc098" readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc099" key="剩余可享受月数" readOnly="true"   labelWidth="130"/>
		</ta:panel>
		
  		<ta:panel key="本次失业信息录入" id="bcsyxx" cols="3">	
			<ta:text id="yje004" key="失业证号"   required="true" readOnly="true" labelWidth="130"/>
  			<ta:selectInput key="是否农民工" collection="AJA004" id="aja004" labelWidth="130" readOnly="true"/>
  			<ta:selectInput key="有无求职要求" collection="AJA012" id="aja012"  labelWidth="130"  value="1"/>
  			<ta:selectInput key="培训意向" collection="YJC002" id="yjc002"  labelWidth="130"/>
			<ta:number id="ajc001" key="视同缴费月数" readOnly="true"  required="true" labelWidth="130" max="999" min="0" bpopTipMsg="最大值为999"/>
			<ta:text id="ajc071" key="实际缴费月数" readOnly="true"   required="true" labelWidth="130"/>
			<ta:text id="ajc072" key="总缴费月数" labelWidth="130"  readOnly="true"  />
			<ta:text id="ajc058" key="本次缴费享受月数" labelWidth="130" readOnly="true" />
			<ta:text id="ajc059" key="剩余享受月数" labelWidth="130" readOnly="true" display="false"/>
			<ta:text id="ajc097" key="享受总月数"  labelWidth="130" readOnly="true" />
			<ta:text id="yjc059" key="农民工缴费月数"  labelWidth="130" readOnly="true" required="true"/>
			<ta:text id="yjc060" key="农民工享受月数"  labelWidth="130" readOnly="true" />
  			<ta:selectInput key="失业原因" collection="AJC093" id="ajc093"  labelWidth="130"  required="true" />
		    <ta:date  key="失业时间" id="ajc090"  bpopTipMsg="失业时间不能大于系统时间" onChange="fnAAE210()" showSelectPanel="true" required="true" labelWidth="130"/>
		    <ta:text  key="系统时间" id="system"  labelWidth="130" display="false"/>
		    <ta:date  key="失业申报时间" id="ajc094" onChange="checkAjc094()" bpopTipMsg="失业申报时间大于等于失业时间且小于等于系统时间"  showSelectPanel="true" required="true" labelWidth="130"/>
		    <ta:date issue="true" key="待遇开始年月" id="aae210"  onChange="checkAae210()"  bpopTipMsg="待遇开始年月大于等于失业时间的次月" showSelectPanel="true"  required="true" labelWidth="130"/>
		    <ta:text id="flag" key="医疗参保缴费情况标识"  labelWidth="130" readOnly="true" display="false"/>
		    <ta:selectInput id="yae230" key="是否补扣标志" labelWidth="130" required="true" collection="YAE230" value ="1"/>
  		</ta:panel>
  
		<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
  		
  		<ta:tabs height="230">
	   		<ta:tab key="待遇明细" id="ac73Tab">
	   			<ta:panel id="ac73Panel"  fit="true" bodyStyle="margin:0px" >
					<ta:datagrid id="ac73Grid" forceFitColumns="true" haveSn="true" >
					   <ta:datagridItem id="aaz171" key="人员待遇核定项目明细ID" width="100" hiddenColumn="true" > </ta:datagridItem>
				       <ta:datagridItem id="aaz170" key="人员待遇核定事件id"  width="100" hiddenColumn="true"> </ta:datagridItem>
				       <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" dataAlign="center" width="100" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aaa085" key="定期待遇标志" collection="AAA085" dataAlign="center" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae041" key="开始年月" dataAlign="right" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae042" key="终止年月" dataAlign="right" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae128" key="计算金额" dataAlign="right" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae129" key="核发金额" dataAlign="right" align="center"> </ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
	   		</ta:tab>
	   		
	   		<ta:tab key="补扣明细" id="ac75Tab">
	   			<ta:panel id="ac75Panel"  fit="true" bodyStyle="margin:0px" >
					<ta:datagrid id="ac75Grid" forceFitColumns="true" haveSn="true" >
					   <ta:datagridItem id="aaz167" key="人员待遇补扣发项目明细ID" width="100" hiddenColumn="true"> </ta:datagridItem>
				       <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" dataAlign="center" width="100" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aaa078" key="补扣发标志" collection="AAA078" dataAlign="center" width="100" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae003" key="对应款费所属期" dataAlign="right" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae128" key="计算金额" dataAlign="right" align="center"> </ta:datagridItem>
				       <ta:datagridItem id="aae129" key="核发金额" dataAlign="right" align="center"> </ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
	   		</ta:tab>	   		
	   		
	   </ta:tabs>
  	</ta:form> 
  <iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>	
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		setfltjb();
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
		fn_FfxxlrInitialization();
		// initializeSuggestFramework(2,"ab01","aab001",700,200,3,null,1,false);
		initializeSuggestFramework(1,"ac01","aac001",800,200,7,fn_queryInfo,1,false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
		initializeSuggestFramework(4,"ab01","aab001",400,200,2,fn_getAe10,1,false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});	

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow14.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset","uneTreatmentCalculationAction!queryPersonInfo.do",null,null,false,function(data){
				fnQueryInfo();
			});	
		}, true);
	}

	//单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(4,'getAb01a1String',{"dto['inputString']" : Base.getValue("aab001")});
	}
	
	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow08.do", null, 1000, 450, null, function(){
			Base.submit("jbxxfset","uneTreatmentCalculationAction!queryPersonInfo.do",null,null,false,function(data){
				fnQueryInfo();
			});
		}, true);	
	}

	//RPC
	function sfwQuery(instance) {
		if (instance == 1) {
		   suggestQuery(instance,"<%=path %>/process/comm/accpetBusinessAction!getAac001.do",{"dto['jstj']":Base.getValue("aac001")},true);
	    }
		if (instance == 2) {
		   suggestQuery(instance,"<%=path %>/process/comm/accpetBusinessAction!getAab001.do",{"dto['aab001']":Base.getValue("aab001")},true);
	    }	
		if (instance == 3) {
		   suggestQuery(instance,"<%=path %>/process/comm/accpetBusinessAction!getAab001.do",{"dto['aab001']":Base.getValue("aab071")},true);
	    }		
	}  
  
	function sfwSelectThis(instance, index) {
		try {
			if (sfw[instance].rowcount == 1) {
				if (sfw[instance].columns > 1 && sfw[instance].capture > 1) {
					sfw[instance].hiddenInput.value = sfw[instance].suggestions[sfw[instance].suggestionsIndex][sfw[instance].capture - 1];
				}
				if (!isNaN(index)) {
					sfw[instance].suggestionsIndex = index;
				}
				var selection = sfw[instance].suggestions[sfw[instance].suggestionsIndex];
				if (sfw[instance].columns > 1) {
					g_Suggest = selection;
					if (sfw[instance].what == "ac01") {
						selection = g_Suggest[2];
					}
					if (sfw[instance].what == "ab01") {
						Base.setValue("aab001", selection[1]);
						Base.setValue("aab999", selection[0]);
						Base.setValue("aae044", selection[2]);
						selection = g_Suggest[1];
					}
					if (sfw[instance].what == "ab01_1") {
					    Base.setValue("aab999_1", selection[0]);
						Base.setValue("aab071", selection[1]);
						Base.setValue("aae044_1", selection[2]);
						selection = g_Suggest[1];
					}				
					//下面两句徐进修改，要求采用这种模式，第一个字段必须是输入的字段
					//selection = selection[sfw[instance].selectColumn];
					//selection = g_Suggest[0];
				}
				sfw[instance].inputContainer.value = selection;
				sfw[instance].previous = selection;
				sfwHideOutput(instance);
				try {
					if ("function" == typeof sfw[instance].callBackFun) {
						sfw[instance].callBackFun();
					} else {
						eval(sfw[instance].callBackFun);
					}
				}
				catch (e) {
					alert("\u6267\u884c\u56de\u8c03\u51fd\u6570: [" + callBackFun + "]\u65f6\u53d1\u751f\u5f02\u5e38:" + e.message);
				}
			}
		}
		catch (e) {
			fnCatch(e);
		}
	}
	function fnQueryInfo(){
		var aae140 = Base.getValue("aae140");
		var aac001 = Base.getValue("aac001");
		var aac002 = Base.getValue("aac002");
		var aac003 = Base.getValue("aac003");	
		if(aae140 == "" || aac001 == ""){
			return false;
		}
	    Base.setValue("aae136", aac002);
		Base.setValue("aae133", aac003);			
		getSpeIssueBenefit();
	}

	function fnys(){
		var ajc071 = Base.getValue("ajc071");
		var ajc001 = Base.getValue("ajc001");
		if(ajc071 != "" && ajc001 != ""){
			Base.setValue("ajc072",parseInt(ajc071)+parseInt(ajc001));
		}
	}

	function fnAAE210(){
	   var ajc090 = Base.getValue("ajc090");
	   var system = Base.getValue("system");
	   var aae210_year = ajc090.substr(0,4);
	   var aae210_mon = ajc090.substr(5,2);
	   var aae210_day = ajc090.substr(8,2);
	   var system_year =system.substr(0,4);
	   var system_mon = system.substr(5,2);
	   var system_day = system.substr(8,2);
	   if((aae210_year > system_year) || (aae210_year == system_year && aae210_mon > system_mon) ||
	       (aae210_year == system_year && aae210_mon == system_mon && aae210_day > system_day)){
	     Base.setValue("ajc090",system);
	     Base.setValue("ajc094",system);
	     Base.alert("失业时间不能大于系统时间！");
	     Base.focus("ajc090");  
	     return;
	   }
	}
	
	function checkAjc094(){
       var ajc090 = Base.getValue("ajc090");
       var ajc094 = Base.getValue("ajc094");
       var system = Base.getValue("system");
       var ajc090_year = parseInt(ajc090.substr(0,4));
       var ajc090_mon = parseInt(ajc090.substr(5,2));
       var ajc090_day = parseInt(ajc090.substr(8,2));
       var ajc094_year = parseInt(ajc094.substr(0,4));
       var ajc094_mon = parseInt(ajc094.substr(5,2));
       var ajc094_day = parseInt(ajc094.substr(8,2));
       var system_year = parseInt(system.substr(0,4));
       var system_mon = parseInt(system.substr(5,2));
       var system_day = parseInt(system.substr(8,2));
       if((ajc090_year > ajc094_year) || (ajc090_year == ajc094_year && ajc090_mon > ajc094_mon) ||
           (ajc090_year == ajc094_year && ajc090_mon == ajc094_mon && ajc090_day > ajc094_day)){
         Base.setValue("ajc094",ajc090);
         alert("失业申报时间不能小于失业时间！");
         Base.focus("ajc094"); 
         return;
       }
       if((ajc094_year > system_year) || (ajc094_year == system_year && ajc094_mon > system_mon) ||
           (ajc094_year == system_year && ajc094_mon == system_mon && ajc094_day > system_day)){
         Base.setValue("ajc094",system);
         alert("失业申报时间不能大于系统时间！");
         Base.focus("ajc094"); 
         return;
       }
   }
    
	function checkAae210(){
		var ajc090 = Base.getValue("ajc090");
	    var aae210 = Base.getValue("aae210");
	    var ajc090_year = parseInt(ajc090.substr(0,4));
	    var ajc090_mon = parseInt(ajc090.substr(5,2));
	    var aae210_year = parseInt(aae210.substr(0,4));
	    var aae210_mon = parseInt(aae210.substr(4,2));
	    if((ajc090_year > aae210_year) || (ajc090_year == aae210_year && ajc090_mon > aae210_mon)){
	      if(ajc090_mon<10) {
	        ajc090_mon = "0"+ajc090_mon;
	      }
	      Base.setValue("aae210",ajc090_year+ajc090_mon);
	      alert("待遇开始年月不能小于失业时间当月！");
	      Base.focus("aae210");
	      return;
	    }
	    var system = parseInt(Base.getValue("system").replace(/-/g, "").substring(0, 6));
	    if(parseInt(aae210, 10) > system){
	        Base.setValue("aae210",system);
	        alert("待遇开始年月不能大于经办当月！");
	        Base.focus("aae210");
	        return;    	   
	    }	   
	}
	
	//流程流转
	function transProcess(){
		Base.showMask();
		Base.getValue("flag", "");
		if (g_Suggest!=""){
		   //判断失业距今是否超过60天
		   s1 = new Date(Base.getValue("ajc090").replace(/-/g, "/"));
	          s2 = new Date();
	          var time = s2.getTime() - s1.getTime();
	          var days = parseInt(time / (1000 * 60 * 60 * 24));
	          if(days >= 60){
	       	  if(!confirm("该人员失业距今已经超过60天，是否继续办理失业待遇核定？")){
	       		 return false; 
	       	  } 
	          }
		   Base.submit("form1","uneTreatmentCalculationAction!CheckPersonalInfo.do",null,null,true,saveX);	
		}
	}

	function saveX(){
		Base.showMask();
		   var flag = Base.getValue("flag");
		   if(flag != '00'){
		       if(flag == "01"){
		    	  alert("该人员城镇职工基本医疗保险和大额医疗费用补助参保单位不同!");
		     	  return false;
		        }else if(flag == "02"){
		    	  if(!confirm("该人员参保单位类型为普通单位，且未终止缴费，是否继续核定！")){
		     	     return false;
		    	  }
		        }else if(flag == "03"){
		    	    alert("该人员参加了大病补助，却未参加基本医疗!");
		      	    return false;
		         }else if(flag == "04"){
		    	    alert("该人员参加了参加基本医疗，却未参加大病补助!");
		      	    return false;
		         }else if(flag == "05"){
		    	   if(!confirm("该人员未参加医疗保险,是否继续办理！")){
		    		  return false;
		    	   }
		         }else{
		    	    alert("判断人员代缴医疗处理方式错误!");
		      	    return false;
			     }  
		   }
		Base.submit("form1", "uneTreatmentCalculationAction!transProcess.do",null,null,true,function(){Base.hideMask();});
	}
	
	
	//回调函数
	function fn_queryInfo(){
	   if (g_Suggest!=""){
			Base.submit("jbxxfset","uneTreatmentCalculationAction!queryPersonInfo.do",null,null,false,function(data){
				fnQueryInfo();
			});			
	   }
	}

	function fn_getAe10(){ 
	   //RPC列表取值
	   if(g_Suggest!=""){ 
		   Base.setValue('aab001',g_Suggest[0]);
	       Base.setValue('aae044',g_Suggest[1]);
	   }  
	} 
		
	//套打失业证
	function print(raq){
	       var aac001 = Base.getValue("aac001");
		if(aac001==''||aac001==null){
			Base.alert("没有获取到个人编号，请联系管理员！");
			return;
		}
		if(raq==1){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=shiyezheng.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aac001=" + aac001);
		}else if(raq==2){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=shiyezheng_xxdy.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aac001=" + aac001);
		}					
	}
	
	//打印农民工一次性生活补助
	function printnmg(){
		var aaz002 = Base.getValue("aaz002");
		if(aaz002==''||aaz002==null){
			Base.alert("没有获取到业务日志ID，请联系管理员！");
			return;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=sy_nmgycxshbz.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aaz002=" + aaz002);
	}

	//打印失业金申领表
	function printRaq(){
	  var aaz002 = Base.getValue("aaz002");
		if(aaz002==''||aaz002==null){
			Base.alert("没有获取到业务日志ID，请联系管理员！");
			return;
		}
		var aae140 = Base.getValue("aae140");
		if(aae140==''||aae140==null){
			Base.alert("没有获取到险种信息，请联系管理员！");
			return;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYbxjslb.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aaz002=" + aaz002+";aae140="+aae140);
	}

	function updatePhone() {
		if (confirm("是否修改电话号码？")) {
			Base.submit("form1", "uneTreatmentCalculationAction!updatePhone.do", null, null, false);
		} else {
			return false;
		}

	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
