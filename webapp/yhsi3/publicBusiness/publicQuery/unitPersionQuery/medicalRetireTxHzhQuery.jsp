<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗退休划账户查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" cssClass="no-padding" fit="true" cssStyle="padding-top:0px">
		<ta:panel id="fset1" key="查询条件" cols="3" scalable="false">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aab004" key="单位名称" span="2" readOnly="true" />
			<ta:date id="aae002" key="做账期号" showSelectPanel="true" issue="true" />
			<ta:date id="aae041" key="开始期号" showSelectPanel="true" issue="true" />
			<ta:date id="aae042" key="结束期号" showSelectPanel="true" issue="true" />
			<ta:date id="start" key="开始时间" showSelectPanel="true" />
			<ta:date id="end" key="结束时间" showSelectPanel="true" />
		</ta:panel>
		<ta:tabs id="tbsSI" fit="true">
			<ta:tab id="dg_this" key="医疗退休划账户信息">
				<ta:datagrid id="dg_this" haveSn="true" fit="true" onRowDBClick="fnClick2">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" maxChart="2" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="aab084" key="工资总额" align="center" dataAlign="right" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="yad001" key="划账户" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" maxChart="9"></ta:datagridItem>
					<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" maxChart="7"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="划账户失败信息">
				<ta:datagrid id="dg_error" haveSn="true" fit="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="yae354" key="错误编号" align="center" dataAlign="center" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="yae355" key="错误内容" align="center" dataAlign="left" maxChart="16" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" maxChart="9"></ta:datagridItem>
					<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" maxChart="7"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});
	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aab004", g_Suggest[2]);

		}
	}
	function fnQueryInfo() {
		Base.clearGridData('datagrid1');
		Base.submit("fset1", "medicalRetireTxHzhQueryAction!toQuery.do");
	}
	//行双击事件  此次核定详情
	function fnClick2(e, rowdata) {
		Base.openWindow("HDInfo", "详情", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/medicalRetireTxHzhQueryAction!toEditHD.do", {
			"dto['aab001']" : rowdata.aab001,
			"dto['aae140']" : rowdata.aae140,
			"dto['aae003']" : rowdata.aae003,
			"dto['aae002']" : rowdata.aae002
		}, "95%", "90%", null, null, true);
	}
	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, null, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>