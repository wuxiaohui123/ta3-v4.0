<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>TransferInto</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class = "no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" disabled="true"/>
	    		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:text id="sysdate" key="系统时间" display="false"/>
		<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
			<ta:panel id="procInc" key="审核信息" >
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2_1.jsp"%>
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
			</ta:panel>
			<ta:panel id="fld_emp" cols="3" key="基本信息">
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
				<ta:text id="aaz157" key="参保明细ID" display="false" />
				<ta:text id="aaz159" key="参保关系ID" display="false" />
				<ta:text id="aaz257" key="享受定期待遇人员ID" display="false" />
				<ta:text id="fhjc"   key="当前复核级次" display="false" />
			</ta:panel>
			<ta:panel id="swxx_p" cols="3" key="死亡待遇信息">
			<ta:selectInput id="aae160" key="终止原因"  collection="aae160" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aae171" key="生存状态变更类型"  collection="aae171" labelWidth="130" readOnly="true" />
			<ta:selectInput id="yac551" key="丧葬类型"  collection="yac551" labelWidth="130" readOnly="true" />
			<ta:text id="aac051" key="火化证号" readOnly="true" labelWidth="130"/>
  			<ta:date id="aae138" key="待遇终止日期" validNowTime="left" labelWidth="130" showSelectPanel="true" readOnly="true" />
			<ta:text id="old_szf" key="丧葬费" readOnly="true" labelWidth="130"/>
			<ta:text id="old_fxj" key="抚恤金" readOnly="true" labelWidth="130"/>
			<ta:text id="old_gwbzj" key="一次性工亡补助金" readOnly="true" labelWidth="130" display="false"/>
			</ta:panel>
			<ta:panel id="swxx_p" cols="3" key="一次性待遇补差信息">
			<ta:text id="szfbc" key="丧葬费补差金额" readOnly="true" labelWidth="130" cssStyle="color:red" cssInput="color:red"/>
			<ta:text id="fxjbc" key="抚恤金补差金额" readOnly="true" labelWidth="130" cssStyle="color:red" cssInput="color:red"/>
			<ta:text id="gwbzjbc" key="一次性工亡补助金补差金额" readOnly="true" labelWidth="130" cssStyle="color:red" cssInput="color:red" display="false"/>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("form").css("overflow","auto");
	$("body").css("overflow","hidden");
	var aae140 = Base.getValue("aae140");
	if(aae140 == '410'){
		Base.showObj("gwbzjbc");
		Base.showObj("old_gwbzj");
	}
});

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		fn_setPersonBaseInfoData();
	}, true);
}

//单位信息RPC
function showDwRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function(){
		fn_setPersonBaseInfoData();
	}, true);
}

function query(){
	Base.submit("form1","oneTreDiffBatchAppCheck1Action!queryBaseInfo.do");
}
//RPC
function convertState(row, cell, value, columnDef, dataContext){
	return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>"+value+"</div>";
}	
//回调函数	
function fn_queryInfo(){
   if (g_Suggest!=""){ 
	   fn_setPersonBaseInfoData();
}}

function fn_ab01Info(){
   if (g_Suggest!=""){ 
	   fn_setUnitBaseInfoData();
   }
}

//保存经办信息
function submitData(){
   Base.submit("form1","oneTreDiffBatchAppCheck1Action!toSave.do");
}
	
//覆盖公用js方法，以便填充退休申报单位名称对应数据,如果不需要录入退休申报单位则将此方法直接删除既可。
function fn_ab01Infotx(){
	Base.setValue("aab071", g_Suggest[1]);
	if(g_Suggest[0]==''||g_Suggest[0] == null){
		Base.setValue("aab999_1", g_Suggest[1]);
	}else{
		Base.setValue("aab999_1", g_Suggest[0]);
		Base.setValue("aae044_1", g_Suggest[2]);
	}
}
</script>
<%@ include file="/ta/incfooter.jsp"%>