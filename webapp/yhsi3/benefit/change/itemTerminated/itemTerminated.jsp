<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb" >
		<ta:button id="saveBtn" key="待遇终止[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" hotKey="ctrl+R" key="重置[R]" type="resetPage" asToolBarItem="true"/>
	</ta:toolbar>
	
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
		   	<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%> 	     		     		     	     			    			     
		 	<%@ include file="/yhsi3/benefit/common/treatmentBaseInfo.jsp"%> 
		</ta:panel>	
  		<ta:panel key="待遇终止信息" id="dyzzxx" cols="3">
  		    <ta:text id="aaa121" key="业务类型编码" display="false" />
  			<ta:date id="aae235" key="待遇终止日期" validNowTime="left" labelWidth="130" showSelectPanel="true"  required="true"/>
  			<ta:selectInput id="sing" key="是否补扣标志" collection="SFBZ" />		
  		</ta:panel>
  		<ta:tabs height="270">
	   		<ta:tab key="待遇终止明细" id="ac60tab">
	   			<ta:datagrid id="dqdylist" fit="true" forceFitColumns="true" border="true" selectType="checkbox">
                    <ta:datagridItem id="aaa036" key="待遇类别" collection="AAA036" align="center"/>
                    <ta:datagridItem id="aae041" key="开始年月" dataAlign="center" align="center"/>
                    <ta:datagridItem id="aae042" key="结束年月" dataAlign="center" align="center"/>
                    <ta:datagridItem id="aae019" key="金额" 	  dataAlign="right" align="center" totals="sum" dataType="Number" tatalsTextShow="false"/>
				</ta:datagrid>
	   		</ta:tab>
	   		<ta:tab key="定期待遇续发补退信息"  id="pnl_bkInfo">
				<ta:datagrid id="dg_gsdydqxfbt" fit="true" forceFitColumns="true">
					<ta:datagridItem id="dg_aac003" key="姓名" sortable="true" align="center" dataAlign="center" />
		 			<ta:datagridItem id="dg_aae044" key="单位名称" sortable="true" align="center" dataAlign="center" />
		 			<ta:datagridItem id="dg_aaa078" key="补扣发标志" collection="aaa078" sortable="true" align="center" dataAlign="center" />		 		
		 			<ta:datagridItem id="dg_aaa036" key="待遇项目"  collection="aaa036" sortable="true" align="center" dataAlign="center"/>		 								
					<ta:datagridItem id="dg_aae003" key="对应费款所属期" sortable="true" dataAlign="center" align="center"/>
					<ta:datagridItem id="dg_aae129" key="核发金额"  dataAlign="right" align="center" sortable="true" totals="sum" />				
				</ta:datagrid>
			</ta:tab>
	    </ta:tabs>
  	</ta:form>
</body>
</html>
<script type="text/javascript">	
//页面布局控制
$(document).ready(function() {
   $("form").css("overflow", "auto");
   //initializeSuggestFramework(1, '', 'aac001', 500, 200, 3, fn_queryInfo, 0, false);	
});

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("jbxxfset,aae140","itemTerminatedAction!queryPersonInfo.do",null,null,null,null);
	}, true);
}

//回调函数
function fn_queryInfo(){
   if (g_Suggest!=""){
        Base.setValue("aac002",g_Suggest[0]);
        Base.setValue("aac003",g_Suggest[1]);
        Base.setValue("aac001",g_Suggest[2]);
		Base.submit("jbxxfset,aae140","itemTerminatedAction!queryPersonInfo.do",null,null,null,null);
   }
}

//流程流转
function submitData(){
    var alllist=Base.getGridData("dqdylist");
    var list=Base.getGridSelectedRows("dqdylist");
    if(alllist.length == list.length ){
        Base.alert('不能终止所有待遇项','error')
    }
	Base.submit("form1,dqdylist", "itemTerminatedAction!toSave.do",null,null,true);
}
</script>
<%@ include file="/ta/incfooter.jsp"%>
