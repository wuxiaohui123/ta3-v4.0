<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>基金支付登帐</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:box id="procInc">

			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="pnlJS" key="查询条件" cols="3" scalable="false">
			<ta:box cols="2">
				<ta:text id="aaz010" key="当事人ID" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" onChange="callDwRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRyRPCBtn" key="?" onClick="showDwRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="yaa030" key="当事人名称" readOnly="true" span="2" />
			<ta:box cols="2">
				<ta:text id="aaz288" key="征集单ID" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入征集通知ID、拨付通知ID查询" onChange="callZjdRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showZjdRPCBtn" key="?" onClick="showZjdRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="yad009" key="收支类型" collection="yad009" />
		</ta:panel>
		<ta:panel id="tab1" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="danjuGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true">
				<ta:datagridItem id="aaz288" key="征集单ID" align="center" width="120" />
				<ta:datagridItem id="aaz010" key="当事人ID" align="center" width="90" />
				<ta:datagridItem id="aab004" key="当事人名称" showDetailed="true" align="center" width="200" hiddenColumn="true" />
				<ta:datagridItem id="yad001" key="应处理金额" dataAlign="right" align="center" width="100" />
				<ta:datagridItem id="yad003" key="实处理金额" dataAlign="right" align="center" width="100" />
				<ta:datagridItem id="yad005" key="业务处理标志" align="center" width="100" collection="yad005" />
				<ta:datagridItem id="yad006" key="财务处理标志" align="center" width="100" collection="yad006" />
				<ta:datagridItem id="aad005" key="财务实收方式" align="center" width="100" collection="aad005" />
				<ta:datagridItem id="aae016" key="复核标志" align="center" width="100" collection="aae016" />
				<ta:datagridItem id="aae011" key="经办人" align="center" width="90" collection="aae011" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" width="150" dataType="DateTime" />
				<ta:datagridItem id="yab003" key="所属分中心" align="center" width="100" collection="yab003" showDetailed="true" />
				<ta:datagridItem id="yad009" key="收支类型" align="center" width="90" collection="yad009" />
				<ta:datagridItem id="yad060" key="业务类型" align="center" width="90" collection="yad060" />
				<ta:datagridItem id="aad009" key="实缴费凭证" align="center" width="100" />
				<ta:datagridItem id="aad016" key="缴费方式" align="center" collection="aad016" width="100" />
				<ta:datagridItem id="aad017" key="缴费日期" align="center" dataAlign="center" width="100" />
				<ta:datagridItem id="aae009" key="户名" align="center" width="200" showDetailed="true" />
				<ta:datagridItem id="aae010" key="银行账户" align="center" width="150" />
				<ta:datagridItem id="aae008" key="银行编码" align="center" width="100" />
			</ta:datagrid>
		</ta:panel>

	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
		initializeSuggestFramework(2, 'ad21', 'aaz288', 230, 200, 1, null, 0, false);
	});
	function fnSelect1() {
		Base.setValue("aaz010", g_Suggest[1]);
		Base.setValue("yaa030", g_Suggest[2]);
	}
	//查询
	function fnQuery() {
		Base.clearGridData("danjuGrid");
		Base.submit("pnlJS", "fundRegistAction!Query.do");
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
	/***征集单IDRPC***/
	function callZjdRPC() {
		sfwQueryUtil_newRPC(2, 'getAAZ288String', {
			"dto['inputString']" : Base.getValue('aaz288')
		});
	}

	function showZjdRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow07.do", null, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>