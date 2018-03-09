<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AdministrativeApproval</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:text id="sysdate" key="系统时间" display="false" />
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="单位编号" labelWidth="130" readOnly="true" required="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" span="2" />
			<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="aac012" required="true" />
			<ta:selectInput id="aac013" key="用工形式" labelWidth="130" collection="aac013" required="true" />
			<ta:date id="aac007" key="参加工作时间" labelWidth="130" required="true" />
			<ta:date id="aac049" key="养老参保日期" labelWidth="130" readOnly="true" issue="true" />
			<ta:selectInput id="aac008" key="人员状态" labelWidth="130" collection="aac008" readOnly="true" />
			<ta:text id="aaz157" key="参保明细ID" display="false" />
			<ta:text id="aaz159" key="参保关系ID" display="false" />
			<ta:date id="yac516" key="档案出生日期" labelWidth="130" showSelectPanel="true" required="true" />
		</ta:panel>
		<ta:panel id="rytxxx" cols="3" key="人员退休信息">
			<ta:text id="aab999_1" key="退休申报单位ID" display="false" />
			<ta:box cols="2" >
				<ta:text id="aab071" key="退休申报单位编号" labelWidth="130" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC();" columnWidth="0.9"/>
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()"/>
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044_1" key="退休申报单位名称" labelWidth="130" readOnly="ture" span="2" />
			<ta:selectInput id="aic161" key="离退休类别" labelWidth="130" collection="aic161" required="true" value="2" onSelect="checkTsgz" />
			<ta:date id="aic162" key="离退休日期" bpopTipMsg="离退休日期不能大于系统时间" labelWidth="130" showSelectPanel="true" onChange="fnAic162()" readOnly="false" required="true" />
			<ta:text key="系统时间" id="system" labelWidth="130" display="false" />
			<ta:number id="aae200" key="视同缴费月数" labelWidth="130" readOnly="true" max="999" min="0" required="true" alignLeft="true" />
			<ta:number id="aae201" key="实际缴费月数" labelWidth="130" readOnly="true" max="999" min="0" required="true" alignLeft="true" />
			<ta:number id="aae204" key="特殊工种折算月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
			<ta:selectInput id="aac014" key="专业技术职务等级" labelWidth="130" collection="aac014" />
			<ta:selectInput id="aac015" key="国家职业资格等级" labelWidth="130" collection="aac015" />
			<ta:selectInput id="aac020" key="行政职务(级别)" labelWidth="130" collection="aac020" />
			<ta:selectInput id="aac081" key="建国前老工人标志" labelWidth="130" collection="aac081" />
			<ta:selectInput id="aac085" key="原工商业者标志" labelWidth="130" collection="aac085" />
			<ta:selectInput id="aac093" key="最高荣誉称号级别" labelWidth="130" collection="aac093" />
			<ta:date id="aac055" key="参加革命工作日期" labelWidth="130" showSelectPanel="true" readOnly="false" />
			<ta:selectInput id="aac064" key="退役军人类别" labelWidth="130" collection="aac064" filter="10" />
			<ta:selectInput id="aac065" key="退役军衔级别" labelWidth="130" collection="aac065" />
			<ta:number id="aac056" key="军龄(月)" labelWidth="130" max="999" min="0" alignLeft="true" />
			<ta:number id="aae203" key="军龄折算月数" labelWidth="130" max="999" min="0" alignLeft="true" />
			<ta:selectInput id="yic009" key="特殊贡献表彰类型" labelWidth="130" collection="YIC009" />
			<ta:selectInput id="yic010" key="计划生育类型" labelWidth="130" collection="YIC010" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){ 
		$("body").css("overflow","hidden");
		initializeSuggestFramework(3,null,"aab071",700,200,3,fn_ab01Infotx,0,false);
	});
	
	// 打开个人信息查询页面
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
    
	// 查询个人信息回调函数
	function fn_setRyData(){
		Base.submit("aac001,aae140,aaa121","<%=path%>/process/pensionbenefit/approve/administrativeapproval/administrativeApprovalAction!queryBaseInfo.do", null, null, fn_check);
	}
	
	// 单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(3,"getAb01String",{"dto['inputString']":Base.getValue("aab071")});
	}
	
	// 打开单位信息查询页面
	function showDwRPC(){
        Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	
	// 查询单位信息回调函数
	function fn_setDwData(){
		
	}
	//回调函数	
	function fn_queryInfo(){
	   if (g_Suggest!=""){ 
		   fn_setPersonBaseInfoData();
		   Base.submit("aac001,aae140,aaa121","<%=path%>/process/pensionbenefit/approve/administrativeapproval/administrativeApprovalAction!queryBaseInfo.do", null, null, fn_check);
		}
	}

	function fn_ab01Info() {
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
		}
	}

	function fnAic162() {
		var aic162 = Base.getValue("aic162");
		var system = Base.getValue("system");
		var aic162_year = aic162.substr(0, 4);
		var aic162_mon = aic162.substr(5, 2);
		var aic162_day = aic162.substr(8, 2);
		var system_year = system.substr(0, 4);
		var system_mon = system.substr(5, 2);
		var system_day = system.substr(8, 2);
		if ((aic162_year > system_year) || (aic162_year == system_year && aic162_mon > system_mon) 
			|| (aic162_year == system_year && aic162_mon == system_mon && aic162_day > system_day)) {
			Base.setValue("aic162", system);
			Base.alert("离退休时间不能大于系统时间！");
			return;
		}
	}

	function fn_check() {
		//Base.resetForm("form1");
	}

	//保存经办信息
	function submitData() {
		Base.submit("form1", "administrativeApprovalAction!toSave.do", null, null, null, function(data) {
			/* if (data.fieldData.biaozhi != "warn") {
				Base.setDisabled("btnSave");
				//Base.setDisabled("btnReset");
			} */
		});
	}

	//覆盖公用js方法，以便填充退休申报单位名称对应数据,如果不需要录入退休申报单位则将此方法直接删除既可。
	function fn_ab01Infotx() {
		Base.setValue("aab071", g_Suggest[0]);
		if(g_Suggest[2] == '' || g_Suggest[2] == null){
			Base.setValue("aab999_1", g_Suggest[0]);
		}else{
			Base.setValue("aab999_1", g_Suggest[2]);
		}
		Base.setValue("aae044_1", g_Suggest[1]);
	}

	function checkTsgz(key, value) {
		if(value == '5') {
			Base.submit("form1", "administrativeApprovalAction!checkTsgz.do", null, null, false, null);
		}else{
			Base.setEnable("btnSave");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>