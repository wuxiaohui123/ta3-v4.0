<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位分组查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="query()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('list1');" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel0" key="查询条件" expanded="false" cols="3">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" labelWidth="150" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" span="2" labelWidth="150" />
			<ta:selectInput id="aab019" key="单位类型" labelWidth="150" islevel="true" isMustLeaf="true" />
			<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="150" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
			<ta:selectInput id="aab020" key="经济类型" labelWidth="150" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
			<ta:selectInput id="aae140" key="险种类型" labelWidth="150" collection="AAE140" />
			<ta:selectInput id="aab066" key="暂停缴费标志" labelWidth="150" collection="AAB066" />
			<ta:selectInput id="aab051" key="单位参保状态" labelWidth="150" collection="AAB051" />
			<ta:selectInput id="akc022" key="参保类型" labelWidth="150" collection="AKC022" />
			<ta:selectInput id="aab033" key="征收方式" labelWidth="150" collection="AAB033" />
			<ta:selectInput id="yab139" key="经办机构" labelWidth="150" collection="YAB003" />
			<ta:selectInput id="aaa149" key="行业风险类别" labelWidth="150" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAA149" onSelect="fnSlectAAA149" />
			<ta:selectInput id="aab022" key="行业代码" labelWidth="150" collection="AAB022" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
			<ta:selectInput id="bz" key="单位人员标志" data="[{'id':'0','name':'展示人数为0的单位','py':'0'},{'id':'1','name':'展示全部单位','py':'1'},{'id':'2','name':'排除人数为0的单位','py':'2'}]" labelWidth="150" value="1" />
			<ta:selectInput id="" key="代扣大额保险" labelWidth="150" />
			<ta:selectInput id="lxbs" key="龙圩区标识" data="[{'id':'1','name':'是'},{'id':'0','name':'否'}]" labelWidth="150" value="0" />
			<ta:selectInput id="aab021" key="隶属关系" labelWidth="150" collection="AAB021" />
			<ta:selectInput id="aab301" key="所属行政区代码" labelWidth="125" collection="AAB301" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
			<ta:selectInput id="yab019" key="单位管理类型" labelWidth="125" collection="YAB019" display="false" value="01" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="单位参保信息">
				<ta:datagrid id="list1" fit="true" haveSn="true" forceFitColumns="true" snWidth="40" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="5" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="12" showDetailed="true" sortable="true" />
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" maxChart="5" collection="aae140" />
					<ta:datagridItem id="aab051" key="参保状态" align="center" dataAlign="left" maxChart="4" collection="AAB051" />
					<ta:datagridItem id="aab066" key="暂停缴费标志" align="center" dataAlign="left" maxChart="5" collection="AAB066"></ta:datagridItem>
					<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="jfz" key="缴费至" align="center" dataAlign="left" maxChart="3"></ta:datagridItem>
					<ta:datagridItem id="zz" key="在职人数" align="center" dataAlign="right" maxChart="3" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="tx" key="退休人数" align="center" dataAlign="right" maxChart="3" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="rs" key="人数合计" align="center" dataAlign="right" maxChart="3" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="yaz289" key="征缴核定规则" align="center" dataAlign="center" maxChart="13" collection="YAZ289" />
					<ta:datagridItem id="akc022" key="参保类型" align="center" dataAlign="center" maxChart="4" collection="AKC022" />
					<ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="center" maxChart="4" collection="AAB033" />
					<ta:datagridItem id="aae009" key="银行户名" align="center" dataAlign="center" maxChart="10" />
					<ta:datagridItem id="khyh" key="开户银行" align="center" dataAlign="center" maxChart="20" />
					<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="left" maxChart="10" />
					<ta:datagridItem id="tsyh" key="托收银行" align="center" dataAlign="center" maxChart="20" />
					<ta:datagridItem id="aab019" key="单位类型" align="center" dataAlign="center" maxChart="4" collection="AAB019" />
					<ta:datagridItem id="aab020" key="经济类型" align="center" dataAlign="center" maxChart="4" collection="AAB020" />
					<ta:datagridItem id="aab065" key="特殊单位类别" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aae004" key="联系人" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aab018" key="联系电话" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aae159" key="联系电子邮箱" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aae006" key="联系地址" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aae045" key="法定代表人" align="center" dataAlign="left" maxChart="4" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" maxChart="10" collection="YAB003" />
					<ta:datagridItem id="dkde" key="是否代扣大额" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="yae106" key="银行协议号" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aae053" key="组织机构代码" align="center" dataAlign="left" maxChart="6" />
					<ta:datagridItem id="aab007" key="工商登记执照号码" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aab006" key="工商登记执照种类" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aaz066" key="税务机构ID" align="center" dataAlign="left" maxChart="6" />
					<ta:datagridItem id="aab030" key="税号" align="center" dataAlign="left" maxChart="6" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="单位基本信息">
				<ta:datagrid id="list2" fit="true" haveSn="true" forceFitColumns="true" snWidth="40">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="5" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="12" showDetailed="true" sortable="true" />
					<ta:datagridItem id="aab019" key="单位类型" align="center" dataAlign="center" maxChart="4" collection="AAB019" />
					<ta:datagridItem id="aab020" key="经济类型" align="center" dataAlign="center" maxChart="4" collection="AAB020" />
					<ta:datagridItem id="aab016" key="专管员" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aab018" key="联系电话" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aae159" key="联系电子邮箱" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="yab995" key="医保老编号" align="center" dataAlign="left" maxChart="6" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
		Base.setDisabled("btnOut");
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});

	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aae044", g_Suggest[2]);
			query();
		}
	}

	function query() {
		Base.submit("panel0", "unitInfoGroupingAction!toQuery.do");
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

	//行业风险类别控制行业代码
	function fnSlectAAA149(key, value) {
		Base.submit('aaa149,yab019', 'unitInfoGroupingAction!toSelectAAA149.do');
	}

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, query, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>