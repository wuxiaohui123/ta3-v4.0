<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社会保险证年检</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:box id="procInc">
		<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
	</ta:box>
	<ta:toolbar id="ButtonLayout1">
		<ta:button id="btnQuery" key="查询[Q]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" />
		<ta:button id="btnSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" />
		<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="flst1" key="单位信息" cols="3" expanded="false" scalable="false">
			<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			<ta:text id="aab023" key="主管部门或主管机构" labelWidth="120" readOnly="true" />
			<ta:text id="aae045" key="法人代表人" readOnly="true" labelWidth="120" />
			<ta:text id="aae053" key="组织机构代码" readOnly="true" labelWidth="120" />
			<ta:text id="aae006" key="地址" span="2" readOnly="true" labelWidth="120" />
			<ta:text id="aab002" key="社会保险登记证编号" labelWidth="120" maxLength="50" readOnly="true" />
		</ta:panel>
		<ta:panel id="flst2" key="年检情况" cols="3" expanded="false" scalable="false">
			<ta:number id="aae001" key="年度" labelWidth="120" required="true" readOnly="true" alignLeft="true" />
			<ta:selectInput id="aab341" key="年检情况" collection="AAB341" required="true" value="1" labelWidth="120" />
			<ta:text id="aae013" key="备注" labelWidth="120" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab_cb" key="单位参保信息">
				<ta:datagrid id="dg_cb" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="11"></ta:datagridItem>
					<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="center" maxChart="6" dataType="date"></ta:datagridItem>
					<ta:datagridItem id="aab051" key="参保状态" collection="AAB051" align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aaz136" key="基数核定规则ID" align="center" dataAlign="left" maxChart="10" collection="AAZ136" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="yaz289" key="缴费核定规则ID" align="center" dataAlign="left" maxChart="14" collection="YAZ289" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="yab139" key="参保所属机构" collection="YAB003" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_djz" key="社会保险登记证">
				<ta:datagrid id="dg_djz" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aaz057" key="发放事件ID" sortable="true" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aab002" key="登记证编码" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="9" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aab059" key="发放类型" collection="AAB059" align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aab036" key="发证日期" align="center" dataAlign="center" maxChart="9" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aab038" key="登记证有效期限" align="center" dataAlign="left" maxChart="9"></ta:datagridItem>
					<ta:datagridItem id="aab057" key="登记证状态" collection="AAB057" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" maxChart="4" collection="AAE011" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_nj" key="社会保险登记证年检">
				<ta:datagrid id="dg_nj" fit="true" groupingBy="aaz057" forceFitColumns="true">
					<ta:datagridItem id="aaz057" key="发放事件ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aaz058" key="年检信息ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="12"></ta:datagridItem>
					<ta:datagridItem id="aae001" key="年度" align="center" dataAlign="center" maxChart="4" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aab341" key="年检情况" align="center" dataAlign="left" maxChart="6" collection="AAB341"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" maxChart="4" collection="AAE011"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_getAb01, 1, false);
	});
	//回调函数
	function fn_getAb01() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.clearGridData("dg_cb");
			Base.clearGridData("dg_djz");
			Base.clearGridData("dg_nj");
			Base.activeTab("tab_cb");
			Base.submit("aab001", "socialSecurityAsAction!toQuery.do", null, null, null, function() {
				var param = uptAOlData("form1");
			});
		}
	}
	//查询单位基本信息和参保信息
	function fnQuery() {
		Base.focus("aae013");
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' || aab001 == null) {
			alert("单位编号不能为空，请确认！");
			return;
		}
		Base.clearGridData("dg_cb");
		Base.clearGridData("dg_djz");
		Base.clearGridData("dg_nj");
		Base.submit("aab001", "socialSecurityAsAction!toQuery.do");
	}
	//保存
	function fnSave() {
		var aab341 = Base.getValue("aab341");
		if (aab341 == '' || aab341 == null) {
			Base.alert("年检情况不能为空");
			return;
		}
		var aae001 = Base.getValue("aae001");
		if (aae001 == '' || aae001 == null) {
			Base.alert("年度不能为空");
			return;
		}
		Base.submit("form1", "socialSecurityAsAction!toSave.do");
	}

	//打开新的窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			Base.clearGridData("dg_cb");
			Base.clearGridData("dg_djz");
			Base.clearGridData("dg_nj");
			Base.activeTab("tab_cb");
			Base.submit("aab001", "socialSecurityAsAction!toQuery.do", null, null, null, function() {
				var param = uptAOlData("form1");
			});
		}, true);
	}
	//RPC方法调用
	function callRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>