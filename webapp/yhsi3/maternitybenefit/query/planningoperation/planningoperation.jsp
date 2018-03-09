<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>mateRegistrationInfo</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" hotKey="ctrl+P" asToolBarItem="true" display="false" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="aab001" key="单位编号" bpopTipMsg="单位名称、单位代码、单位ID" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'))" />
			<ta:text id="aae044" key="单位名称" readOnly="true" span="2" />
			<ta:text id="aac001" key="个人编号" bpopTipMsg="个人编号、姓名，身份证" onChange="sfwQueryUtil(1,'getAac001DyAll',Base.getValue('aac001'));" />
			<ta:text id="aac003" key="人员姓名" readOnly="true" />
			<ta:selectInput id="ymc032" key="手术类别" collection="YMC032" labelWidth="130" />
			<ta:date id="amc020" key="手术日期" validNowTime="left" showSelectPanel="true" />
			<ta:selectInput id="aae011" key="经办人" collection="AAE011" display="false" />
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="登记经办时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
		</ta:panel>
		<ta:panel id="mc01Panel" key="生育登记基本信息" fit="true">
			<ta:datagrid id="mc03Grid" fit="true" columnFilter="true" haveSn="true">
				<ta:datagridItem key="个人编号" id="aac001" align="center" dataAlign="center" width="100" />
				<ta:datagridItem key="姓名" id="aac003" align="center" dataAlign="center" width="80" />
				<ta:datagridItem key="单位编号" id="aab001" align="center" dataAlign="center" width="100" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" dataAlign="center" width="160" showDetailed="true" />
				<ta:datagridItem key="手术类别" id="ymc032" collection="YMC032" align="center" dataAlign="center" width="100" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" dataAlign="center" hiddenColumn="true" />
				<ta:datagridItem key="手术日期" width="100" id="amc020" align="center" dataAlign="center" />
				<ta:datagridItem key="手术开始日期 " id="aae235" align="center" width="120" dataAlign="center" />
				<ta:datagridItem key="手术终止日期" id="aae236" align="center" width="120" dataAlign="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" dataAlign="center" />
				<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" width="120" dataAlign="center" showDetailed="true" />
				<ta:datagridItem key="自费金额" id="ake051" width="120" align="center" dataAlign="center" totals="sum" />
				<ta:datagridItem key="医疗费金额" id="aae187" width="120" align="center" dataAlign="center" totals="sum" />
				<ta:datagridItem key="新农合已支付医疗费" id="yae150" width="120" align="center" dataAlign="center" totals="sum" />
				<ta:datagridItem key="实际医疗总费用" id="aae198" width="120" align="center" dataAlign="center" totals="sum" />
				<ta:datagridItem key="经办人" id="aae011" align="center" dataAlign="center" collection="AAE011" />
				<ta:datagridItem key="经办时间" id="aae036" align="center" dataAlign="center" />
				<ta:dataGridToolPaging url="" pageSize="1000" showButton="true" showExcel="true" submitIds="" sqlStatementName="" resultType="java.util.HashMap" selectExpButtons="1"></ta:dataGridToolPaging>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, null, "aac001", 700, 200, 5, fn_ac01, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)				
		initializeSuggestFramework(2, null, "aab001", 500, 200, 3, fn_ab01, 1, false); //查询单位基本信息，fn_ab01Info回调函数返回自己action
	});

	function query() {
		Base.submit("form1", "familyPlanningOperationAction!query.do");
	}

	function fn_ac01() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac002", g_Suggest[0]);
		Base.setValue("aac003", g_Suggest[1]);
		Base.setValue("aac004", g_Suggest[3]);
	}

	function fn_ab01() {
		Base.setValue("aab999", g_Suggest[0]);
		Base.setValue("aab001", g_Suggest[1]);
		Base.setValue("aae044", g_Suggest[2]);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>