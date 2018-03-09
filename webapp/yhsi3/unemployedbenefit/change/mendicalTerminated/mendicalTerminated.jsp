<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>mendicalterminated</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="queryResultBtn" key="查询已中断缴费人员[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="queryResult()" asToolBarItem="true" />
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="save();" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">

		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="aae140" labelWidth="130" key="险种类型" display="false" />
			<ta:date id="aae235" key="变更年月" issue="true" labelWidth="130" showSelectPanel="true" />
			<ta:selectInput id="aae160" labelWidth="130" key="变更原因" collection="AAE160" />
			<ta:text id="yje004" labelWidth="130" key="失业证号" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="130" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="130" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="130" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" labelWidth="130" required="true" columnWidth="0.9" onChange="callDwRPC();" bpopTipMsg="单位名称、单位代码、单位ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<%-- <ta:text id="aab001" key="单位编号" labelWidth="130" bpopTipMsg="单位名称、单位代码、单位ID" onChange="sfwQueryUtil(2,'getAb01A1',Base.getValue('aab001'))" required="true" /> --%>
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" span="2" />
			<ta:box span="1" cols="2">
				<ta:date id="aae235_s" key="变更年月起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" issue="true" />
				<ta:date id="aae235_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" issue="true" />
			</ta:box>
		</ta:panel>

		<ta:tabs id="ac81Tabs" fit="true">
			<ta:tab id="Ac81tab" key="人员变更信息">
				<ta:panel id="Ac81Panel" key="人员变更信息" fit="true">
					<ta:datagrid id="Ac81Grid" fit="true" columnFilter="true" haveSn="true" selectType="checkbox">
						<ta:datagridItem id="aac001" key="个人编号" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aac002" key="公民身份号码" width="150px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aac003" key="姓名" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aab001" key="单位编号" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aae044" key="单位名称" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="yje004" key="失业证号" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="ajc056" key="本次失业待遇终止年月" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="ajc099" key="本次剩余可享受待遇月数" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aae210" key="待遇享受开始年月" dataAlign="center" align="center" width="100px" sortable="true" />
						<ta:datagridItem id="aae235" key="待遇享受终止年月" dataAlign="center" align="center" width="100px" sortable="true" />
						<ta:datagridItem id="aae160" key="变更原因" width="180px" collection="AAE160" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aae013" key="备注" dataAlign="center" align="center" width="100px" sortable="true" />
						<ta:datagridItem id="aaz002" key="业务日志ID" width="150px" dataAlign="center" align="center" sortable="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="Ac20tab" key="已中断缴费人员">
				<ta:panel id="Ac20Panel" key="已中断缴费人员" fit="true">
					<ta:datagrid id="Ac20Grid" fit="true" columnFilter="true" haveSn="true" selectType="checkbox">
						<ta:datagridItem id="aac001" key="个人编号" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aac002" key="公民身份号码" width="150px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aac003" key="姓名" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aab001" key="单位编号" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aae044" key="单位名称" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="yje004" key="失业证号" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="ajc056" key="本次失业待遇终止年月" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="ajc099" key="本次剩余可享受待遇月数" width="100px" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aae210" key="待遇享受开始年月" dataAlign="center" align="center" width="100px" sortable="true" />
						<ta:datagridItem id="aae235" key="待遇享受终止年月" dataAlign="center" align="center" width="100px" sortable="true" />
						<ta:datagridItem id="aae160" key="变更原因" width="180px" collection="AAE160" dataAlign="center" align="center" sortable="true" />
						<ta:datagridItem id="aae013" key="备注" dataAlign="center" align="center" width="100px" sortable="true" />
						<ta:datagridItem id="aaz002" key="业务日志ID" width="150px" dataAlign="center" align="center" sortable="true" />
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
		//		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, null, "aac001", 800, 200, 7, fn_setPersonBaseInfoData, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)				
		initializeSuggestFramework(2, null, "aab001", 500, 200, 2, fn_setUnitBaseInfoData, 1, false); //查询单位基本信息，fn_ab01Info回调函数返回自己action		
	});
	
	//个人编号RPC
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001DYAC60String', {"dto['inputString']" : Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow13.do", null, 1000, 450, null, null, true);
	}
	
	//单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2, 'getAb01a1String', {"dto['inputString']" : Base.getValue("aab001")});
	}
	
	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow08.do", null, 1000, 450, null, null, true);
	}

	//rpc 查询给页面单位基本信息赋值
	function fn_setUnitBaseInfoData() {
		Base.setValue("aab001", g_Suggest[0]);
		Base.setValue("aae044", g_Suggest[1]);
	}

	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", "mendicalTerminatedaction!queryBaseInfo.do", null, null, null, function() {
		});
	}

	//已中断缴费人员
	function queryResult() {
		Base.submit("form1", "mendicalTerminatedaction!queryResultInfo.do", null, null, null, function(data) {
			Base.setPanelTitle("Ac20Panel", "已中断缴费人员,合计:" + data.fieldData.rows + "人次");
		});
	}
	//保存
	function save() {
		var rowdata = Base.getGridSelectedRows("Ac81Grid");
		if (rowdata == '' || rowdata == null) {
			Base.alert("请选择需要中断缴费的失业人员！", "warn");
			return false;
		}
		Base.submit("form1,Ac81Grid", "mendicalTerminatedaction!toSave.do", null, null, null, function() {
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>