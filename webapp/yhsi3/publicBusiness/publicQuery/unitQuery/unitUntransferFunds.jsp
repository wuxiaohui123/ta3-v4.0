<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>当事人待转金查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin: 0px; padding: 1px;" class="no-scrollbar">
	<div id='pageloading'></div>
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="查询条件" cols="3" id="fltUnit" scalable="false">
			<ta:box cols="2">
				<ta:text id="aaz010" key="单位编号" labelWidth="150" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" onChange="callDwRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRyRPCBtn" key="?" onClick="showDwRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="aaa028" key="当事人类别" labelWidth="150" collection="AAA028" />
			<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="150" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
			<ta:selectInput id="aae140" key="险种类型" labelWidth="150" collection="AAE140" />
			<ta:selectInput id="aaa093" key="承担缴费主体类型" labelWidth="150" collection="AAA093" />
			<ta:selectInput id="yae081" key="自动使用标志" labelWidth="150" collection="YAE081" />
			<ta:selectInput id="aae341" key="筹资项目" labelWidth="150" collection="AAE341" value='0106' display="false" readOnly="true" />
			<ta:number id="yae080_min" key="余额最小值" labelWidth="150" />
			<ta:number id="yae080_max" key="余额最大值" labelWidth="150" />
			<ta:selectInput id="hyqjxx" key="含有欠缴信息" data="[{'id':'1','name':'是'}]" labelWidth="150" />
			<ta:selectInput id="yab003" key="经办机构" labelWidth="150" collection="YAB003" />
		</ta:panel>
		<ta:fieldset cssClass="no-padding" id="fltUnit_old">
			<ta:text id="aaz010_old" key="当事人ID" display="false" />
			<ta:selectInput id="aaa028_old" key="当事人类别" collection="AAA028" display="false" />
			<ta:selectInput id="aab065_old" key="特殊单位类别" collection="AAB065" display="false" />
			<ta:selectInput id="aae140_old" key="险种类型" display="false" collection="AAE140" />
			<ta:selectInput id="aaa093_old" key="承担缴费主体类型" collection="AAA093" display="false" />
			<ta:selectInput id="yae081_old" key="自动使用标志" collection="YAE081" display="false" />
			<ta:selectInput id="hyqjxx_old" key="自动使用标志" collection="YAE081" display="false" />
			<ta:selectInput id="aae341_old" key="筹资项目" collection="AAE341" display="false" />
			<ta:selectInput id="yab003_old" key="经办机构" collection="YAB003" display="false" />
			<ta:number id="yae080_min_old" key="余额最小值" display="false" />
			<ta:number id="yae080_max_old" key="余额最大值" display="false" />
			<ta:text id="auto" key="是否自动加载" display="false" value="0" />
			<ta:text id="isQuery" key="是否已点击查询" display="false" value="0" />
		</ta:fieldset>
		<ta:box fit="true">
			<ta:tabs fit="true">
				<ta:tab key="待转金余额" id="tab1">
					<ta:panel id="ae28Panel" fit="true">
						<ta:datagrid id="ae28Grid" haveSn="true" fit="true">
							<ta:datagridItem id="aaa028" key="当事人类别" width="90" align="center" sortable="true" collection="AAA028" />
							<ta:datagridItem id="aaz010" key="当事人ID" width="100" align="center" sortable="true" />
							<ta:datagridItem id="yaa030" key="当事人名称" width="220" align="center" sortable="true" />
							<ta:datagridItem id="aae140" key="险种类型" width="140" align="center" sortable="true" collection="AAE140" />
							<ta:datagridItem id="aae341" key="筹资项目" width="140" align="center" sortable="true" collection="AAE341" />
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" width="130" align="center" sortable="true" collection="AAA093" />
							<ta:datagridItem id="yae080" key="余额" width="100" align="center" formatter='MoneyFormatterNo$' totals="sum" tatalsTextShow="false" dataAlign="right" />
							<ta:datagridItem id="yae081" key="自动使用标志" width="100" align="center" sortable="true" collection="YAE081" />
							<ta:dataGridToolPaging pageSize="20" showCount="true" submitIds="fltUnit_old" url="unitUntransferFundsAction!queryAe28Info.do" />
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
				<ta:tab key="待转金收支记录" id="tab2">
					<ta:panel id="ae29Panel" fit="true">
						<ta:datagrid id="ae29Grid" haveSn="true" fit="true">
							<ta:datagridItem id="aaa028" key="当事人类别" width="80" align="center" sortable="true" collection="AAA028" />
							<ta:datagridItem id="aaz010" key="当事人ID" width="100" align="center" sortable="true" />
							<ta:datagridItem id="yaa030" key="当事人名称" width="220" align="center" sortable="true" />
							<ta:datagridItem id="aae140" key="险种类型" width="100" align="center" sortable="true" collection="AAE140" />
							<ta:datagridItem id="aae341" key="筹资项目 " width="100" align="center" sortable="true" collection="AAE341" />
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" width="140" align="center" sortable="true" collection="AAA093" />
							<ta:datagridItem id="aaa117" key="收支类型" width="100" align="center" sortable="true" collection="AAA117" />
							<ta:datagridItem id="yad003" key="收支金额" width="100" align="center" formatter='MoneyFormatterNo$' totals="sum" tatalsTextShow="false" dataAlign="right" />
							<ta:datagridItem id="aae207" key="收支年月" width="70" align="center" sortable="true" dataAlign="center" />
							<ta:datagridItem id="yae080" key="待转金余额" width="100" align="center" formatter='MoneyFormatterNo$' totals="sum" tatalsTextShow="false" dataAlign="right" />
							<ta:datagridItem id="aae013" key="备注" width="100" align="center" sortable="true" />
							<ta:datagridItem id="aae011" key="经办人" width="80" align="center" sortable="true" collection="AAE011" />
							<ta:datagridItem id="aae036" key="经办时间" width="80" align="center" sortable="true" dataAlign="center" />
							<ta:datagridItem id="yab003" key="经办所属机构" width="240" align="center" collection="YAB003" />
							<ta:dataGridToolPaging pageSize="20" showCount="true" submitIds="fltUnit_old" url="unitUntransferFundsAction!queryAe29Info.do" />
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
				<ta:tab key="待转金调整记录" id="tab3">
					<ta:panel id="ac41a8Panel" fit="true">
						<ta:datagrid id="ac41a8Grid" haveSn="true" fit="true">
							<ta:datagridItem id="aaz010" key="支出当事人ID" width="95" align="center" sortable="true" />
							<ta:datagridItem id="yaa030" key="支出当事人名称" width="180" align="center" sortable="true" />
							<ta:datagridItem id="aaa018" key="支出险种类型" width="115" align="center" sortable="true" collection="AAE140" />
							<ta:datagridItem id="aaa093" key="支出承担缴费主体类型" width="145" align="center" sortable="true" collection="AAA093" />
							<ta:datagridItem id="aaz085" key="收入当事人ID" width="95" align="center" sortable="true" />
							<ta:datagridItem id="yaa030_1" key="收入当事人名称" width="180" align="center" sortable="true" />
							<ta:datagridItem id="aaa019" key="收入险种类型" width="115" align="center" sortable="true" collection="AAE140" />
							<ta:datagridItem id="yaa339" key="收入承担缴费主体类型" width="145" align="center" sortable="true" collection="AAA093" />
							<ta:datagridItem id="yad001" key="调整金额" width="100" align="center" sortable="true" dataAlign="right" />
							<ta:datagridItem id="aae013" key="备注" width="150" align="center" sortable="true" />
							<ta:datagridItem id="aae016" key="复核标志" width="70" align="center" collection="AAE016" sortable="true" />
							<ta:datagridItem id="aae011" key="经办人" width="80" align="center" sortable="true" collection="AAE011" />
							<ta:datagridItem id="aae036" key="经办时间" width="80" align="center" sortable="true" dataAlign="center" />
							<ta:datagridItem id="yab003" key="经办所属机构" width="240" align="center" collection="YAB003" />
							<ta:dataGridToolPaging pageSize="20" showCount="true" submitIds="fltUnit_old" url="unitUntransferFundsAction!queryAc41a8Info.do" />
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
			</ta:tabs>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 3, fn_getAaz010, 0, false);
		if ("1" == Base.getValue("auto")) {
			Base.clearGridData("ae28Grid");
			Base.clearGridData("ae29Grid");
			Base.clearGridData("ac41a8Grid");
			Base.submit("aaz010_old,hyqjxx_old,aab065_old,aaa028_old,aae140_old,aaa093_old,yae081_old,aae341_old,yab003_old,yae080_min_old,yae080_max_old,auto", "unitUntransferFundsAction!toQueryUnit.do", null, null, true, null, null);
		}
	});
	function fn_getAaz010() {
		if (!g_Suggest != null) {
			//设置显示当事人id、名称、类别
			Base.setValue("aaz010", g_Suggest[1]);
		}
	}
	function fnQuery() {
		Base.showMask();
		Base.setValue("isQuery", "1");
		Base.submitForm("form1", null, false, "unitUntransferFundsAction!loadQueryBatchInfo.do", null);
	}
	function queryDetail(rowData) {
		var paramData = {};
		paramData["dto['aaz010']"] = rowData.aaz010;
		paramData["dto['aae140']"] = rowData.aae140;
		paramData["dto['aae341']"] = rowData.aae341;
		paramData["dto['aaa093']"] = rowData.aaa093;
		Base.openWindow("detailWindow", ">>当事人待转金信息", "unitUntransferFundsAction!queryDetail.do", paramData, 1000, 500, null, null);
	}

	function fn_queryInfoUnit() {
		Base.clearGridData("failGrid");
		Base.setValue("aab001", g_Suggest[1]);
		if (g_Suggest != "") {
			Base.submit("fltUnit", "unitUntransferFundsAction!toQueryUnit.do", null, null, null);
		}
	}
	/***单位个人RPC***/
	function callDwRyRPC() {
		sfwQueryUtil_newRPC(1, 'getDSRXXString', {
			"dto['inputString']" : Base.getValue('aaz010')
		});
	}

	function showDwRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow06.do", null, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>