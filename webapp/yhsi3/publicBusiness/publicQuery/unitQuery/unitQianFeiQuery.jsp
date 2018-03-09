<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位欠费信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询详细[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="查询统计[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryTJInfo()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
		<ta:button key="打印详细信息[P1]" hotKey="P" id="btnPrint1" icon="icon-print" onClick="printPage()" asToolBarItem="true" />
		<ta:button key="打印统计信息[P2]" hotKey="P" id="btnPrint2" icon="icon-print" onClick="printTjPage()" asToolBarItem="true" />
		<ta:button key="导出详细信息[O1]" hotKey="O" id="btnOut1" icon="icon-output" onClick="fnExpFile('datagrid1');" asToolBarItem="true" />
		<ta:button key="导出统计信息[O2]" hotKey="O" id="btnOut2" icon="icon-output" onClick="fnExpFile('datagrid2');" asToolBarItem="true" />
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
			<ta:selectInput id="aae140" key="险种类型" collection="AAE140" />
			<!-- <ta:selectInput id="aaa115" key="应缴类型" collection="AAA115" /> -->
			<!-- <ta:selectInput id="jfzt" key="缴费状态" data="[{'id':'1','name':'实缴'},{'id':'2','name':'欠缴'}]" /> -->
			<ta:date id="aae041" key="开始费款所属期" showSelectPanel="true" issue="true" />
			<ta:date id="aae042" key="结束费款所属期" showSelectPanel="true" issue="true" />
			<ta:date id="aae002_b" key="开始做账期号" showSelectPanel="true" issue="true" />
			<ta:date id="aae002_e" key="结束做账期号" showSelectPanel="true" issue="true" />
			<ta:text id="yab139" key="经办机构" display="false" />
		</ta:panel>
		<ta:tabs fit="true" id="tabsQianFei">
			<ta:tab key="欠费详细信息" id="tab1">
				<ta:datagrid id="datagrid1" fit="true" haveSn="true" groupingBy="aab001" columnFilter="true">
					<ta:datagridItem id="aaz083" key="当事人征缴计划ID" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" width="150" sortable="true" />
					<ta:datagridItem id="aaa115" key="应缴类型" collection="AAA115" align="center" dataAlign="left" width="80" sortable="true" />
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="120" sortable="true" />
					<ta:datagridItem id="yae591" key="退收类型" align="center" dataAlign="left" width="65" collection="YAE591"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="做账期号" align="center" width="80" sortable="true" dataAlign="center" />
					<ta:datagridItem id="aae003" key="对应费款所属期" align="center" width="120" sortable="true" dataAlign="center" />
					<ta:datagridItem id="dw" key="单位欠费" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="dw_yj" key="单位欠费(已缴)" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="gr" key="个人欠费" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="gr_yj" key="个人欠费(已缴)" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="hj" key="合计欠费" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="hj_yj" key="合计(已缴)" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="aab119" key="应缴人数" align="center" width="80" dataAlign="left" sortable="true" />
					<ta:datagridItem id="aab084" key="职工工资总额" align="center" width="100" sortable="true" dataAlign="right" />
					<ta:datagridItem id="aab120" key="个人缴费基数总额" align="center" width="130" sortable="true" dataAlign="right" />
					<ta:datagridItem id="yab139" key="经办机构" align="center" maxChart="10" collection="YAB003" />
					<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" width="70" sortable="true" />

				</ta:datagrid>
			</ta:tab>
			<ta:tab key="欠费统计信息" id="tab2">
				<ta:datagrid id="datagrid2" fit="true" haveSn="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" width="150" sortable="true" />
					<ta:datagridItem id="dw" key="单位欠费" align="center" width="120" sortable="true" dataAlign="center" />
					<ta:datagridItem id="gr" key="个人欠费" align="center" width="120" sortable="true" dataAlign="center" />
					<ta:datagridItem id="hj" key="合计欠费" align="center" width="120" sortable="true" dataAlign="center" />

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
	//查询单位欠费详细信息
	function fnQueryInfo() {
		Base.submit("fset1", "unitQianFeiQueryAction!toQuery.do");
	}
	//查询单位欠费统计信息
	function fnQueryTJInfo() {
		Base.submit("fset1", "unitQianFeiQueryAction!toQFTJQuery.do");
	}
	/* function fnDBClick(e,rowdata){
	   Base.openWindow("modifyWin","详细信息","unitBillInfoQueryAction!modifyWin.do",{"dto['aaz083']":rowdata.aaz083,"dto['aae003']":rowdata.aae003},"95%","90%",null,null,true);
	} */
	//打印单位欠费详细信息
	function printPage() {
		var prm_aab001 = Base.getValue('aab001');
		var prm_aae140 = Base.getValue('aae140');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_yab139 = Base.getValue('yab139');
		var fileName = "dwqfxxmx01.raq";
		var prm = "prm_aab001=" + prm_aab001 + ";prm_aae140=" + prm_aae140 + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab139=" + prm_yab139;
		fnPrintComm(fileName, prm);
	}
	//打印单位欠费统计信息
	function printTjPage() {

		var prm_aab001 = Base.getValue('aab001');
		var prm_aae140 = Base.getValue('aae140');
		var prm_aae041 = Base.getValue('aae041');
		var prm_aae042 = Base.getValue('aae042');
		var prm_yab139 = Base.getValue('yab139');
		var fileName = "dwqfxxtj02.raq";
		var prm = "prm_aab001=" + prm_aab001 + ";prm_aae140=" + prm_aae140 + ";prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab139=" + prm_yab139;
		fnPrintComm(fileName, prm);
	}
	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有错误数据需要导出,请确认!", "warn");
		}
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