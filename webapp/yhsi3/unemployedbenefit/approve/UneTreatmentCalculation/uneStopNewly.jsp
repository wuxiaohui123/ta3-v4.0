<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>uneStopNewly</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="停人员待遇信息补录[S]" icon="xui-icon-spotSave" hotKey="S" onClick="transProcess()" asToolBarItem="true" />
		<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>
		<ta:panel key="人员基本信息" cols="3" id="jbxxfset">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<ta:text id="aab001" key="失业代管单位代码" labelWidth="130" required="true" bpopTipMsg="单位名称、单位代码、单位ID" onChange="sfwQueryUtil(4,'getAb01A1',Base.getValue('aab001'))" />
			<ta:text id="aae044" key="单位名称" labelWidth="130" span="2" readOnly="true" />
			<ta:date id="aae042" key="暂停缴费时间" labelWidth="130" readOnly="true" issue="true" />
			<ta:text id="aaz170" key="待遇核定事件id" labelWidth="130" display="false" readOnly="true" />
			<ta:date key="出生日期" id="aac006" readOnly="true" labelWidth="130" />
			<ta:selectInput key="用工形式" collection="AAC013" id="aac013" readOnly="true" labelWidth="130" />
			<ta:date key="参工日期" id="aac007" readOnly="true" labelWidth="130" />
		</ta:panel>

		<ta:panel key="失业信息录入" id="bcsyxx" cols="3">
			<ta:text id="yje004" key="失业证号" required="true" labelWidth="130" />
			<ta:date key="失业时间" id="ajc090" bpopTipMsg="失业时间不能大于系统时间" onChange="fnAAE210()" showSelectPanel="true" required="true" labelWidth="130" />
			<ta:selectInput key="失业原因" collection="AJC093" id="ajc093" labelWidth="130" required="true" />
			<ta:number id="ajc071" key="本次缴费月数" required="true" labelWidth="130" />
			<ta:number id="ajc097" key="应享受失业保险待遇月数" labelWidth="180" required="true" onChange="yspd()" />
			<ta:number id="ajc099" key="剩余享受月数" labelWidth="130" required="true" onChange="yspd()" />
			<ta:date issue="true" key="待遇开始年月" id="aae210" onChange="checkAae210()" bpopTipMsg="待遇开始年月大于等于失业时间的次月" showSelectPanel="true" required="true" labelWidth="130" />
			<ta:date issue="true" key="本次失业待遇终止年月" id="ajc056" showSelectPanel="true" required="true" labelWidth="180" />
			<ta:text key="系统时间" id="system" labelWidth="130" display="false" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		setfltjb();
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
		fn_FfxxlrInitialization();
		initializeSuggestFramework(2, "ab01", "aab001", 700, 200, 3, null, 1, false);
		initializeSuggestFramework(1, "ac01", "aac001", 700, 200, 4, fn_queryInfo, 2, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
		initializeSuggestFramework(4, "ab01", "aab001", 400, 200, 2, fn_getAe10, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});
	
	function sfwQuery(instance) {
		if (instance == 1) {
		   suggestQuery(instance,"<%=path%>/process/comm/accpetBusinessAction!getAac001.do",{"dto['jstj']":Base.getValue("aac001")},true);
	    }
		if (instance == 2) {
		   suggestQuery(instance,"<%=path%>/process/comm/accpetBusinessAction!getAab001.do", {"dto['aab001']" : Base.getValue("aab001")}, true);
		}
	}

	function fnAAE210() {
		var ajc090 = Base.getValue("ajc090");
		var system = Base.getValue("system");
		var aae210_year = ajc090.substr(0, 4);
		var aae210_mon = ajc090.substr(5, 2);
		var aae210_day = parseInt(ajc090.substr(8, 2));
		var system_year = parseInt(system.substr(0, 4));
		var system_mon = parseInt(system.substr(5, 2));
		var system_day = parseInt(system.substr(8, 2));
		if ((parseInt(aae210_year) > system_year) || (parseInt(aae210_year) == system_year && parseInt(aae210_mon) > system_mon)
				|| (parseInt(aae210_year) == system_year && parseInt(aae210_mon) == system_mon && aae210_day > system_day)) {
			Base.setValue("ajc090", system);
			Base.setValue("ajc094", system);
			alert("失业时间不能大于系统时间！");
			Base.focus("ajc090");
			return;
		}
		Base.setValue("ajc094", ajc090);
		aae210_mon = parseInt(aae210_mon);//失业当月要享受待遇
		if (aae210_mon > 12) {
			aae210_mon = aae210_mon - 12;
			aae210_year = parseInt(aae210_year) + 1;
		}
		if (aae210_mon < 10) {
			aae210_mon = "0" + aae210_mon;
		}
		Base.setValue("aae210", system.substr(0, 4) + system.substr(5, 2));
	}

	function checkAae210() {
		var ajc090 = Base.getValue("ajc090");
		var aae210 = Base.getValue("aae210");
		var ajc090_year = parseInt(ajc090.substr(0, 4));
		var ajc090_mon = parseInt(ajc090.substr(5, 2));
		var aae210_year = parseInt(aae210.substr(0, 4));
		var aae210_mon = parseInt(aae210.substr(4, 2));
		if ((ajc090_year > aae210_year) || (ajc090_year == aae210_year && ajc090_mon > aae210_mon)) {
			if (ajc090_mon < 10) {
				ajc090_mon = "0" + ajc090_mon;
			}
			Base.setValue("aae210", ajc090_year + ajc090_mon);
			alert("待遇开始年月不能小于失业时间当月！");
			Base.focus("aae210");
			return;
		}
		var system = parseInt(Base.getValue("system").replace(/-/g, "").substring(0, 6));
		if (parseInt(aae210, 10) > system) {
			Base.setValue("aae210", system);
			alert("待遇开始年月不能大于经办当月！");
			Base.focus("aae210");
			return;
		}

	}

	//流程流转
	function transProcess() {
		Base.submit("form1", "uneStopNewlyAction!transProcess.do", null, null, true, null);
	}

	//回调函数
	function fn_queryInfo() {
		if (g_Suggest != "") {
			Base.submit("jbxxfset", "uneStopNewlyAction!queryPersonInfo.do", null, null, false, function(data) {
			});
		}
	}

	function yspd() {
		var ajc097 = Base.getValue("ajc097");
		var ajc099 = Base.getValue("ajc099");
		if (parseInt(ajc099) > parseInt(ajc097)) {
			Base.alert("剩余享受月数不能多于应享受失业保险待遇月数！");
			Base.setValue("ajc097", "");
			Base.setValue("ajc099", "");
		}
	}

	function fn_getAe10() {
		//RPC列表取值
		if (g_Suggest != "") {
			Base.setValue('aab001', g_Suggest[0]);
			Base.setValue('aae044', g_Suggest[1]);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
