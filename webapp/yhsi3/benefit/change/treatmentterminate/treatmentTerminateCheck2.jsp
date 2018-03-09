<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminateCheck2</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇终止审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" display="false" disabled="true"/>
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		 <ta:panel id="procInc" key="审核信息">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>		
		</ta:panel>		
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
		   	<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%> 	     		     		     	     			    			     
		 	<%@ include file="/yhsi3/benefit/common/treatmentBaseInfo.jsp"%> 
		</ta:panel>	
		<ta:panel key="待遇终止信息" id="dyzzxx" cols="3">
  			<ta:selectInput id="aae160" key="终止原因" collection="aae160" labelWidth="130"  readOnly="true"  />
  			<ta:text id="aae235" key="待遇终止日期"  labelWidth="130"  readOnly="true"/>		
  			<ta:selectInput id="yae235" key="账户清退类型"  labelWidth="130" readOnly="true" collection="YAE235" />
  			<ta:selectInput id="aaa074" key="待遇终止类型" collection="AAA074" display="false" labelWidth="130"/>
  			<ta:text id="grhzh" key="个人划账户金额"  labelWidth="130" display="false" readOnly="true" />
  			<ta:text id="dwhzh" key="单位划账户金额"  labelWidth="130" display="false" readOnly="true" />
			<ta:textarea id="aae013_1" key="备注" span="3" labelWidth="130" height="50" readOnly="true"/>	  			
  		</ta:panel>
  		<ta:panel id="swxxPanel" key="终止待遇信息" cols="3" bodyStyle="margin:0px" >
	  			<ta:selectInput id="yic430" key="殡葬方式" labelWidth="130" collection="YIC430" display="false"/>
	  			<ta:selectInput id="yae233" key="是否产生抚恤金" labelWidth="130" readOnly="true" collection="YAE233"  />
	  			<ta:selectInput id="yae232" key="是否产生丧葬费" labelWidth="130" readOnly="true" collection="YAE232"  />
	  			<ta:number id="yaz004" key="供养亲属人数" max="10" labelWidth="130" display="false"/>
	  			<ta:selectInput id="yae230" key="是否补扣标志" labelWidth="130" readOnly="true" collection="YAE230"  value ="1"/>  		
  		</ta:panel>
  		<ta:panel id="paymentInfo" key="" >
				<ta:panel id="ffxxsyqk" key="发放信息" cols="3">
				     <ta:selectInput id="ylc026" key="发放信息使用" labelWidth="130"  span="2" readOnly="true"
				                     data="[{'id':'0','name':'一次性待遇和补退使用定期待遇发放信息'},{'id':'1','name':'一次性待遇使用定期发放信息，补退不使用定期发放信息'},
				                     		{'id':'2','name':'一次性待遇不使用定期发放信息,补退使用定期发放信息'},{'id':'3','name':'一次性待遇和补退使用新发放信息,发放信息一致'},
				                     		{'id':'4','name':'一次性待遇和补退使用新发放信息,发放信息不一致'}]" />
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfoDQ.jsp"%>
			</ta:panel>
  		<ta:tabs height="230">
  		    <ta:tab key="事业单位计发死亡待遇" id="ic21tab">
  		       <ta:datagrid id="ic21Grid" fit="true" forceFitColumns="true" >
	  		       <ta:datagridItem id="yic424" key="工资款项类别" align="center" collection="yic424" />
	  		       <ta:datagridItem id="aae129" key="核发金额"  dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false"/>
  		       </ta:datagrid>
  		    </ta:tab>
	   		<ta:tab key="待遇终止明细" id="ac60tab">
	   			<ta:datagrid id="dqdylist" fit="true" forceFitColumns="true" >
					<%@ include file="/yhsi3/benefit/common/treatmentDetailInfo.jsp"%>
				</ta:datagrid>
	   		</ta:tab>
	   		<ta:tab key="待遇信息" id="ac73tab">
	   			<ta:datagrid id="ac73Grid" fit="true" forceFitColumns="true" >
				    <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" align="center"> </ta:datagridItem>
				    <ta:datagridItem id="aaa085" key="定期待遇标志" collection="AAA085" align="center"> </ta:datagridItem>
				    <ta:datagridItem id="aae041" key="开始年月"  dataAlign="center" align="center"> </ta:datagridItem>
				    <ta:datagridItem id="aae042" key="终止年月"  dataAlign="center" align="center"> </ta:datagridItem>
				    <ta:datagridItem id="aae128" key="计算金额"  dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false"> </ta:datagridItem>
				    <ta:datagridItem id="aae129" key="核发金额"  dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false"> </ta:datagridItem>
				</ta:datagrid>	   			
	   		</ta:tab>
	   		<ta:tab key="终止待遇补扣明细" id="pnl_bkInfo">
	   			<ta:datagrid id="dg_gsdydqxfbt" fit="true" forceFitColumns="true">
					<ta:datagridItem id="dg_aac003" key="姓名" sortable="true" align="center" width="60"></ta:datagridItem>
		 			<ta:datagridItem id="dg_aae044" key="单位名称" sortable="true" align="center" width="180"></ta:datagridItem>
		 			<ta:datagridItem id="dg_aaa078" key="补扣发标志" collection="aaa078" sortable="true" align="center" width="60"></ta:datagridItem>		 		
		 			<ta:datagridItem id="dg_aaa036" key="待遇项目" collection="aaa036" sortable="true" align="center" width="100"></ta:datagridItem>		 								
					<ta:datagridItem id="dg_aae003" key="对应费款所属期" sortable="true" dataAlign="center" align="center" width="60"></ta:datagridItem>
					<ta:datagridItem id="dg_aae129" key="核发金额"  dataAlign="right" width="80" align="center" sortable="true" totals="sum" tatalsTextShow="false"></ta:datagridItem>				
				</ta:datagrid>
	   		</ta:tab>
	   </ta:tabs>
  	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		Base.setPanelTitle("ffxxlr_dq", "发放信息录入(补退)", true);
		Base.setPanelTitle("ffxxlr", "发放信息录入(一次性)", true);
		fn_AAE140ByPayment();	
		Base.setReadOnly(["ffxxlr_dq","ffxxlr"]);
		Base.setDisRequired(["aae136_dq","aae145_dq","aae133_dq","aaf002_dq","aaz009_dq","aae010_dq"]);
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, null, true);
	}
	
	//通过aae140和aaa121，向用户展示发放信息使用下拉码表（待遇终止使用）
    function fn_AAE140ByPayment(){
	   var aae140 = Base.getValue("aae140");
	   var aaa121 = Base.getValue("aaa121");
	   var ylc026 = Base.getValue("ylc026");
	   if (aae140 != '410' || aaa121 == 'L10043'){
	       //Base.filterSelectInput("ylc026", ["0","3"], true);
	       Base.setSelectInputDataWidthJson("ylc026", [{id:'0',name:'使用定期待遇发放信息'},{id:'3',name:'不使用定期待遇发放信息'}]);
	       Base.setValue("ylc026",ylc026);
	   }
	   
	   if (ylc026 == '1' || ylc026 == '2' || ylc026 == '3'){
	   		Base.setPanelTitle("ffxxlr", "发放信息录入", true);
	    }
	   
	   if (aae140 != "110"){
	   	  Base.hideObj("yae235");
	   }
	   
	   if (aae140 == "410"){
	    	Base.hideObj(["yae233"]);
	   }
    }
	
	//流程流转
	function submitData(){
		Base.submit("form1", "treatmentTerminateCheck2Action!toSave.do");
		Base.setDisabled("saveBtn");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
