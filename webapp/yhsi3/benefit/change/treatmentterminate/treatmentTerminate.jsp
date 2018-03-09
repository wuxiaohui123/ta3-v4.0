<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇终止[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="printBtn210" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="ctrl+P" asToolBarItem="true" display="false" />
		<ta:button id="printBtn110_1" icon="xui-icon-spotPrint" key="打印个人一次性支付审批表" onClick="printRaq(1)" asToolBarItem="true" disabled="true" />
		<ta:button id="printBtn110_2" icon="xui-icon-spotPrint" key="打印死亡待遇对比情况表（事业）" onClick="printRaq(2)" asToolBarItem="true" disabled="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="ctrl+R" key="重置[R]" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentBaseInfo.jsp"%>
			<ta:text id="yab003" key="经办机构" readOnly="true" display="false" />
		</ta:panel>
		<ta:panel key="待遇终止信息" id="dyzzxx" cols="3">
			<ta:selectInput id="aae160" key="终止原因" collection="aae160" labelWidth="130" required="true" onSelect="checkZzxx" />
			<ta:date id="aae235" key="待遇终止日期" labelWidth="130" showSelectPanel="true" required="true" />
			<ta:selectInput id="yae235" key="账户清退类型" labelWidth="130" required="true" collection="YAE235" value="1" />
			<ta:selectInput id="aaa074" key="待遇终止类型" collection="AAA074" display="false" labelWidth="130" />
			<ta:text id="grhzh" key="个人划账户金额" labelWidth="130" display="false" readOnly="true" />
			<ta:text id="dwhzh" key="单位划账户金额" labelWidth="130" display="false" readOnly="true" />
			<ta:selectInput id="aic161" key="离退休类别" collection="AIC161" readOnly="true" display="false" labelWidth="130" />
			<ta:selectInput id="ykc005" key="是否事业单位在编人员" collection="SFBZ" readOnly="true" display="false" labelWidth="130" />
			<ta:textarea id="aae013_1" key="备注" span="3" labelWidth="130" height="50" />
		</ta:panel>
		<ta:panel id="swxxPanel" key="终止待遇信息" cols="1" bodyStyle="margin:0px">
			<ta:panel cols="3">
				<ta:text id="fxjjsfs" key="抚恤金计算方式" labelWidth="130" display="false" />
				<ta:selectInput id="yic430" key="殡葬方式" labelWidth="130" required="true" collection="YIC430" display="true" value="1" />
				<ta:selectInput id="yae233" key="是否产生一次性抚恤金" labelWidth="200" cssStyle="margin-top:8px" required="true" collection="YAE233" onSelect="fn_fxjjsff" value="1" />
				<ta:selectInput id="yae232" key="是否产生丧葬费" labelWidth="130" cssStyle="margin-top:8px" required="true" collection="YAE232" value="1" />
				<ta:selectInput id="yae230" key="是否补扣标志" labelWidth="130" required="true" collection="YAE230" value="1" />
			</ta:panel>
			<ta:panel id="fxjjs" cols="3">
				<ta:number id="yaz004" key="供养亲属人数" max="10" labelWidth="130" />
				<ta:button id="enterBtn" icon="icon-add" key="录入供养亲属明细信息" onClick="fn_enteringGYqs();" asToolBarItem="true" />
			</ta:panel>
		</ta:panel>
		<ta:panel id="paymentInfo" key="">
			<ta:panel id="ffxxsyqk" key="发放信息" cols="3">
				<ta:selectInput id="ylc026" key="发放信息使用" labelWidth="130" readOnly="false" required="true" onSelect="fn_ffxxchang" span="2"
					data="[{'id':'0','name':'一次性待遇和补退使用定期待遇发放信息'},{'id':'1','name':'一次性待遇使用定期发放信息，补退不使用定期发放信息'},
				                     		{'id':'2','name':'一次性待遇不使用定期发放信息,补退使用定期发放信息'},{'id':'3','name':'一次性待遇和补退使用新发放信息,发放信息一致'},
				                     		{'id':'4','name':'一次性待遇和补退使用新发放信息,发放信息不一致'}]" />
			</ta:panel>
			<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/paymentBaseInfoDQ.jsp"%>
			<ta:panel id="dbxx" key="代办人信息" cols="3">
				<ta:text id="aac042" key="代办人姓名" labelWidth="130" readOnly="false" />
				<ta:text id="aac044" key="代办人证件号码" labelWidth="130" readOnly="false" />
				<ta:selectInput id="aae144" key="代办人关系" collection="AAE144" labelWidth="130" readOnly="false" />
				<ta:text id="aac045" key="代办人电话" labelWidth="130" readOnly="false" />
			</ta:panel>
		</ta:panel>
		<ta:tabs height="180">
			<ta:tab key="事业单位计发死亡待遇" id="ic21tab">
				<ta:datagrid id="ic21Grid" fit="true" forceFitColumns="true">
					<ta:datagridItem id="yic424" key="工资款项类别" align="center" collection="yic424" />
					<ta:datagridItem id="aae129" key="核发金额" dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false" />
				</ta:datagrid>
			</ta:tab>

			<ta:tab key="待遇终止明细" id="ac60tab">
				<ta:datagrid id="dqdylist" fit="true" forceFitColumns="true">
					<%@ include file="/yhsi3/benefit/common/treatmentDetailInfo.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="待遇信息" id="ac73tab">
				<ta:datagrid id="ac73Grid" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aaa085" key="定期待遇标志" collection="AAA085" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae041" key="开始年月" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae042" key="终止年月" dataAlign="center" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="计算金额" dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false">
					</ta:datagridItem>
					<ta:datagridItem id="aae129" key="核发金额" dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="终止待遇补扣明细" id="pnl_bkInfo">
				<ta:datagrid id="dg_gsdydqxfbt" fit="true" forceFitColumns="true">
					<ta:datagridItem id="dg_aac003" key="姓名" sortable="true" align="center" width="60"></ta:datagridItem>
					<ta:datagridItem id="dg_aae044" key="单位名称" sortable="true" align="center" width="180"></ta:datagridItem>
					<ta:datagridItem id="dg_aaa078" key="补扣发标志" collection="aaa078" sortable="true" align="center" width="60"></ta:datagridItem>
					<ta:datagridItem id="dg_aaa036" key="待遇项目" collection="aaa036" sortable="true" align="center" width="100"></ta:datagridItem>
					<ta:datagridItem id="dg_aae003" key="对应费款所属期" sortable="true" dataAlign="center" align="center" width="60"></ta:datagridItem>
					<ta:datagridItem id="dg_aae129" key="核发金额" dataAlign="right" width="80" align="center" sortable="true" totals="sum" tatalsTextShow="false" formatter="convertState" totalsFormatter="fn_TotalsFormatter"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<br />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">	
	//页面布局控制
	$(document).ready(function() {
		Base.setPanelTitle("ffxxlr_dq", "发放信息录入(补退)", true);
		Base.setPanelTitle("ffxxlr", "发放信息录入(一次性)", true);
	    fn_AAE140ByPayment();
		fn_FfxxlrInitialization();
		Base.hideObj(["ffxxlr_dq","fxjjs"]);
		var aae140 = Base.getValue("aae140");
		if(aae140 != "110"){
			Base.hideObj("printBtn110_1");
			Base.hideObj("printBtn110_2");
		}
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
			Base.submit("jbxxfset,aaa121,aae140","treatmentTerminateAction!queryPersonInfo.do",null,null,null,null);
		}, true);
	}
	
	function checkZzxx(){
	    var aae160 = Base.getValue("aae160");
	    var aae140 = Base.getValue("aae140");
		var aic161 = Base.getValue("aic161");
		var aaa121 = Base.getValue("aaa121");
	    if(aae160 == "1401" || aae160=="2401" 
	    		|| aae160 == "4401" || aae160 == "4402"
	    		|| aae160 == "4403" || aae160 == "4406"
	    		|| aae160 == "4901"){
	    	Base.showObj(["swxxPanel"]);
	    	if (aae160 == "4901"){
	    		Base.hideObj(["yae233","yae232"]);
	    	}
	    	if (aae140 == "210"){
	    		fn_fxjjsff();
	    	}	 	    	
	    	if (aae140 == "410"){
	    		Base.hideObj(["yae233"]);
	    	}   	
	    	if(aae140 == "110"&&aaa121 == "I30003"){
	    		if(aic161 == "1"||aic161 == "8"){
	    			fn_SetKey("yae233_desc","是否产生一次性抚恤金: ");
				}else{
					fn_SetKey("yae233_desc","是否产生一次性困难补助金: ");
				}
	    	}
	    	Base.submit("jbxxfset,aae235", "treatmentTerminateAction!getSWinfoforAC26.do",null,null,false);
	    }
	    else{
            Base.showObj(["swxxPanel"]);
            Base.hideObj(["yic430","yae233","yae232","fxjjs"]);
	    	Base._setReadOnly("aae235",false);
	    	Base.setValue("aae235","");
	    	Base.setEnable("saveBtn");
	    }
	}
	
	function fn_fxjjsff(){
		var fxjjsfs = Base.getValue("fxjjsfs");
		var yae233 = Base.getValue("yae233");
		if (yae233 == "1"){
			if (fxjjsfs == "01"){
				Base.hideObj("fxjjs");
			}else if(fxjjsfs == "02"){
				Base.hideObj("enterBtn");
				Base.showObj("fxjjs");
			}else if(fxjjsfs == "03"){
				Base.hideObj("yaz004");
				Base.showObj("fxjjs");
			}else if(fxjjsfs == "04"){
				Base.hideObj("yaz004");
				Base.showObj("fxjjs");
			}			
		}else{
			Base.hideObj("fxjjs");
		}
	}
	
	function fn_enteringGYqs(){
		 var aac001 = Base.getValue("aac001");
			Base.openWindow("userwin","供养亲属信息录入","treatmentTerminateAction!enTering.do",{"dto['aac001']":aac001},'85%','90%',null,"",true);
	}
	
	//流程流转
	function submitData(){	
		Base.submit("form1", "treatmentTerminateAction!toSave.do",null,null,true);
		Base.setEnable("printBtn110_1,printBtn110_2");
	}
	
	//回调函数
	function fn_queryInfo(){
	   if (g_Suggest != ""){
	   		fn_setPersonBaseInfoData();
			Base.submit("jbxxfset,aaa121,aae140","treatmentTerminateAction!queryPersonInfo.do",null,null,null,null);
	   }
	}
	
	function fn_ffxxchang(){
		var ylc026 = Base.getValue("ylc026");
		if (ylc026 == 0){
			Base.hideObj(["ffxxlr_dq","ffxxlr"]);	
		}else if (ylc026 == '1' || ylc026 == '2' || ylc026 == '3'){
			Base.showObj("ffxxlr");
			Base.hideObj("ffxxlr_dq");
			Base.setPanelTitle("ffxxlr", "发放信息录入", true);
			Base.setValue("aae133",Base.getValue("aac003"));
			Base.setValue("aae136",Base.getValue("aac002"));
		}else{
			Base.setPanelTitle("ffxxlr", "发放信息录入(一次性)", true);
			Base.showObj(["ffxxlr_dq","ffxxlr"]);
			Base.setValue("aae133",Base.getValue("aac003"));
			Base.setValue("aae136",Base.getValue("aac002"));
			Base.setValue("aae133_dq",Base.getValue("aac003"));
			Base.setValue("aae136_dq",Base.getValue("aac002"));
		}
	}
	
	//通过aae140和aaa121，向用户展示发放信息使用下拉码表（待遇终止使用）
    function fn_AAE140ByPayment(){
	   var aae140 = Base.getValue("aae140");
	   var aaa121 = Base.getValue("aaa121");
	   var ylc026 = Base.getValue("ylc026");
	   if (aae140 != '410' || aaa121 == 'L10043'){
	       Base.setSelectInputDataWidthJson("ylc026", [{id:'0',name:'使用定期待遇发放信息'},{id:'3',name:'不使用定期待遇发放信息'}]);
	       if (ylc026 == null || ylc026 == ''){
	       		Base.setValue("ylc026","0");
	       		Base.hideObj(["ffxxlr_dq","ffxxlr"]);
	       }else{
	       		Base.setValue("ylc026",ylc026);
	       }	       
	   }else{
	   	   if (ylc026 == null || ylc026 == ''){
	       		Base.setValue("ylc026","2");
	       		Base.hideObj("ffxxlr_dq");
	       }else{
	       		Base.setValue("ylc026",ylc026);
	       }
	   }
	   if (aae140 != "110"){
	   	  Base.hideObj("yae235");
	   }
	   if (aae140 == "410"){
	    	Base.hideObj(["yae233"]);
	   }
	   if (aae140 == "150"){
	   		Base.hideObj(["yae233","yae232"]);
	   }
    }
	
	//打印失业通知单
	function print() {
		var aaz002 = Base.getValue("aaz002");
		var aae160 = Base.getValue("aae160");
		var yab003 = Base.getValue("yab003");
		if(aae160 == '2401'){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYswszffxj_slb.raq&"
					+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+ "serverPagedPrint=no&mirror=no&paramString=aaz002="+aaz002+";yab003="+yab003);
		}else{
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=tinglingsybxj.raq&"
					+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+ "serverPagedPrint=no&mirror=no&paramString=aaz002="+aaz002); 
		}
	} 
	
	//打印个人一次性支付审批表
	function printRaq(num){
		var aaz002 = Base.getValue("aaz002");
	    var aac001 = Base.getValue("aac001");
	    var yab003 = Base.getValue("yab003");
	    if(num == "1"){
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=grzhycxzf_spb_yl.raq&"
	        		+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
	        		+ "serverPagedPrint=no&mirror=no&paramString=aaz002="+aaz002+";aac001="+aac001+";yab003="+yab003); 
	    }else if(num == "2"){
	        var ykc005 = Base.getValue("ykc005");
	        if(ykc005 != "1"){
	           Base.alert("该人员不是事业单位人员，不能打印死亡待遇对比情况表（事业）！");
	           return;
	        }
	        var aab001 = Base.getValue("aab001");
	        if(aab001 == "10011896"){
	             $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=TreatmentContrast_lz.raq&"
	            		 + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
	            		 + "serverPagedPrint=no&mirror=no&paramString=aaz002="+aaz002+";aac001="+aac001); 
	        }else{
	             $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=TreatmentContrast.raq&" 
	            		 + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
	            		 + "serverPagedPrint=no&mirror=no&paramString=aaz002=" + aaz002 + ";aac001="+ aac001);
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
