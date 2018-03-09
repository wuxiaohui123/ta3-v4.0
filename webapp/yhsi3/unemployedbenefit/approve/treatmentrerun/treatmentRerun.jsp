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
		<ta:button id="saveBtn" key="失业待遇重算[S]" icon="xui-icon-spotSave" hotKey="S" onClick="transProcess();"  asToolBarItem="true" />
	    <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true"/>
	    <ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />	    
	</ta:toolbar>
	
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>		
		</ta:box>	
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>	
		<ta:panel key="人员基本信息" cols="3" id="jbxxfset">
		    <%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<ta:box cols="2">
				<ta:text id="aab001" key="失业代管单位代码" maxLength="20" labelWidth="130" columnWidth="0.9"  bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true"/>
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称"   labelWidth="130" span="2" readOnly="true"/>
			<ta:text id="aae042" key="暂停缴费时间"  labelWidth="130"  readOnly="true" />
			<ta:text id="aaz170" key="待遇核定事件id"  labelWidth="130"  readOnly="true" display="false" />
			<ta:date key="出生日期" id="aac006" labelWidth="130" readOnly="true"  />
		    <ta:selectInput key="用工形式" collection="AAC013" id="aac013" readOnly="true"   labelWidth="130" />
		    <ta:date key="参工日期" id="aac007" readOnly="true"  labelWidth="130"  />
		    <ta:text key="参保险种" id="aae140_H" readOnly="true" display="false" labelWidth="130"/>
		    <ta:text key="业务类型编码" id="aaa121_H" readOnly="true" display="false" labelWidth="130"/>
			<ta:text id="aaz257" key="享受定期待遇人员ID" readOnly="true" display="false" labelWidth="130" />
		</ta:panel>
		
		<ta:panel key="上次失业信息" cols="3" id="scsyxx" >
			<ta:text id="ajc093_old" key="失业原因"    readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc090_old" key="失业时间"   readOnly="true"  labelWidth="130"/>
			<ta:date key="失业待遇证号" id="aaz257_old"  readOnly="true" labelWidth="130" />
		    <ta:date key="失业待遇终止年月" id="ajc056_old" readOnly="true" labelWidth="130"   />
		    <ta:text key="可领月数" id="ajc097_old" readOnly="true" labelWidth="130" />
		    <ta:text key="已领月数" id="ajc098_old" readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc099_old" key="剩余可享受月数" readOnly="true" labelWidth="130"  />
		</ta:panel>
		
  		<ta:panel key="本次失业信息录入" id="bcsyxx" cols="3">
			<ta:text id="yje004" key="失业证号"  labelWidth="130" readOnly="true"/>
  			<ta:selectInput key="是否农民工" collection="AAC028" id="aac028" labelWidth="130" readOnly="true"/>
			<ta:selectInput key="有无求职要求" collection="AJA012" id="aja012" readOnly="true" value="1" labelWidth="130"/>
			<ta:text id="ajc001" key="视同缴费月数" onChange="fnys()" required="true" labelWidth="130" readOnly="true"/>			
			<ta:text id="ajc071" key="实际缴费月数" readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc072" key="总缴费月数" labelWidth="130" readOnly="true" />
			<ta:text id="ajc058" key="本次缴费享受月数" labelWidth="130" readOnly="true"  />
			<ta:text id="ajc059" key="剩余享受月数"  labelWidth="130" readOnly="true" />
			<ta:text id="ajc097" key="享受总月数"  labelWidth="130" readOnly="true" />
			<ta:text id="yjc059" key="农民工缴费月数"  labelWidth="130" readOnly="true" required="true"/>
			<ta:text id="yjc060" key="农民工享受月数"  labelWidth="130" readOnly="true" />			
  			<ta:selectInput key="失业原因" collection="AJC093" id="ajc093" labelWidth="130"/>
		    <ta:date  key="失业时间" id="ajc090"  bpopTipMsg="失业时间不能大于系统时间" onChange="fnAAE210()" showSelectPanel="true" required="true" labelWidth="130" readOnly="true"/>
		    <ta:text  key="系统时间" id="system"  labelWidth="130" display="false" />
		    <ta:date  key="失业申报时间" id="ajc094" onChange="checkAjc094()" bpopTipMsg="失业申报时间大于等于失业时间且小于等于系统时间"  showSelectPanel="true" required="true" labelWidth="130" readOnly="true"/>
		    <ta:date issue="true" key="待遇开始年月" id="aae210"  onChange="checkAae210()"  bpopTipMsg="待遇开始年月大于等于失业时间的次月"  required="true" labelWidth="130" readOnly="true"/>
  		</ta:panel>
  
  		
  		<ta:tabs height="230">
	   		<ta:tab key="待遇明细" id="ac73Tab">
					<ta:datagrid id="ac73Grid" fit="true" forceFitColumns="true" haveSn="true" >
					   <ta:datagridItem id="aaz171" key="人员待遇核定项目明细ID" width="100"  hiddenColumn="true"> </ta:datagridItem>
				       <ta:datagridItem id="aaz170" key="人员待遇核定事件id"  width="100"  hiddenColumn="true"> </ta:datagridItem>
				       <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" width="100" > </ta:datagridItem>
				       <ta:datagridItem id="aaa085" key="定期待遇标志" collection="AAA085" > </ta:datagridItem>
				       <ta:datagridItem id="aae041" key="开始年月" dataAlign="right" > </ta:datagridItem>
				       <ta:datagridItem id="aae042" key="终止年月"  dataAlign="right"> </ta:datagridItem>
				       <ta:datagridItem id="aae128" key="计算金额" dataAlign="right" > </ta:datagridItem>
				       <ta:datagridItem id="aae129" key="核发金额" dataAlign="right" > </ta:datagridItem>
				    </ta:datagrid>
	   		</ta:tab>
	   		<ta:tab key="补扣明细" id="ac75Tab">
	   			<ta:panel id="ac75Panel"  fit="true" bodyStyle="margin:0px" >
					<ta:datagrid id="ac75Grid" forceFitColumns="true" haveSn="true" >
					   <ta:datagridItem id="aaz167" key="人员待遇补扣发项目明细ID" width="100" hiddenColumn="true"> </ta:datagridItem>
				       <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" width="100" > </ta:datagridItem>
				       <ta:datagridItem id="aaa078" key="待遇项目代码" collection="AAA078" width="100" > </ta:datagridItem>
				       <ta:datagridItem id="aae003" key="对应款费所属期" dataAlign="right" > </ta:datagridItem>
				       <ta:datagridItem id="aae128" key="计算金额" dataAlign="right" > </ta:datagridItem>
				       <ta:datagridItem id="aae129" key="核发金额" dataAlign="right" > </ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
	   		</ta:tab>		   		
	   </ta:tabs>
  	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		setfltjb();
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
		initializeSuggestFramework(2, "ab01", "aab001", 700, 200, 3, null, 1, false);
		initializeSuggestFramework(1, "ac01", "aac001", 700, 200, 4, fn_queryInfo, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});
	
	//人员信息RPC
	function showRyRPC(){
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset","treatmentRerunAction!queryPersonInfo.do",null,null,null);
		}, true);
	}
	
	//失业代管单位代码RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(4,'getAb01a1String',{"dto['inputString']" : Base.getValue("aab001")});
	}
	
	//失业代管单位代码RPC
	function showDwRPC(){
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow09.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset","treatmentRerunAction!queryPersonInfo.do",null,null,null);
		}, true);	
	}
	

	function sfwQuery(instance) {
		if (instance == 1) {
		   suggestQuery(instance,"<%=path%>/process/comm/accpetBusinessAction!getAac001.do",{"dto['jstj']":Base.getValue("aac001")});
	    }
		if (instance == 2) {
		   suggestQuery(instance,"<%=path%>/process/comm/accpetBusinessAction!getAab001.do",{"dto['aab001']":Base.getValue("aab001")});
	    }	
		if (instance == 3) {
		   suggestQuery(instance,"<%=path%>/process/comm/accpetBusinessAction!getAab001.do", {"dto['aab001']" : Base.getValue("aab071")});
		}
	}
	
	function fnys(){
		var ajc071 = Base.getValue("ajc071");
		var ajc001 = Base.getValue("ajc001");
		if(ajc071 != "" && ajc001 != ""){
			Base.setValue("ajc072",parseInt(ajc071)+parseInt(ajc001));
		}
	}
	
	//流程流转
	function transProcess(){
		
		Base.submit("form1", "treatmentRerunAction!transProcess.do");
	}
	
	function fnAAE210(){
       var ajc090 = Base.getValue("ajc090");
       var system = Base.getValue("system");
       var aae210_year = ajc090.substr(0,4);
       var aae210_mon = ajc090.substr(5,2);
       var aae210_day = parseInt(ajc090.substr(8,2));
       var system_year = parseInt(system.substr(0,4));
       var system_mon = parseInt(system.substr(5,2));
       var system_day = parseInt(system.substr(8,2));
       if((parseInt(aae210_year) > system_year) || (parseInt(aae210_year) == system_year && parseInt(aae210_mon) > system_mon) ||
           (parseInt(aae210_year) == system_year && parseInt(aae210_mon) == system_mon && aae210_day > system_day)){
         Base.setValue("ajc090",system);
         Base.setValue("ajc094",system);
         alert("失业时间不能大于系统时间！");
         Base.focus("ajc090");
         return;
       }
       Base.setValue("ajc094",ajc090);
       aae210_mon = parseInt(1+aae210_mon)+1;
       aae210_mon = aae210_mon-100;
       if(aae210_mon>12){
          aae210_mon = aae210_mon-12;
          aae210_year = parseInt(aae210_year)+1;
       }
       if(aae210_mon<10)
       {
       aae210_mon = "0"+aae210_mon;
       }
       Base.setValue("aae210",aae210_year+aae210_mon);
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
       if((ajc090_year > ajc094_year) || (ajc090_year == ajc094_year && ajc090_mon > ajc094_mon) || (ajc090_year == ajc094_year && ajc090_mon == ajc094_mon && ajc090_day > ajc094_day)){
         Base.setValue("ajc094",ajc090);
         alert("失业申报时间不能小于失业时间！");
         Base.focus("ajc094");
         return;
       }
       if((ajc094_year > system_year) || (ajc094_year == system_year && ajc090_mon > system_mon) || (ajc094_year == system_year && ajc090_mon == system_mon && ajc094_day > system_day)){
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
       if((ajc090_year > aae210_year) || (ajc090_year == aae210_year && ajc090_mon+1 > aae210_mon)){
         
         ajc090_mon = ajc090_mon+1;
         if(ajc090_mon>12){
           ajc090_mon = ajc090_mon-12;
           ajc090_year = ajc090_yaer+1;
         }
         if(ajc090_mon<10)
         {
           ajc090_mon = "0"+ajc090_mon;
         }
         Base.setValue("aae210",ajc090_year+ajc090_mon);
         alert("待遇开始年月不能小于失业时间次月！");
         Base.focus("aae210");
         return;
       }
       
    }
	
	//回调函数
	function fn_queryInfo(){
	   if (g_Suggest!=""){
			Base.submit("jbxxfset","treatmentRerunAction!queryPersonInfo.do",null,null,null);
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
				} catch (e) {
					alert("\u6267\u884c\u56de\u8c03\u51fd\u6570: [" + callBackFun + "]\u65f6\u53d1\u751f\u5f02\u5e38:" + e.message);
				}
			}
		} catch (e) {
			fnCatch(e);
		}
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>
