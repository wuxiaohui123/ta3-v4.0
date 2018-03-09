<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保人员信息基本查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnDownload()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:fieldset id="fset1" key="查询条件" cols="3">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aab004" key="单位名称" span="2" readOnly="true" />
		</ta:fieldset>
		<ta:panel id="pan1" key="单位参保人员基本信息列表" hasBorder="true" fit="true">
			<ta:datagrid id="datagrid1" fit="true" haveSn="true" columnFilter="true">
				<ta:datagridItem id="aac001" key="人员编号" align="center" maxChart="6" sortable="true" />
				<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4" sortable="true" />
				<ta:datagridItem id="aac002" key="身份证号码" align="center" maxChart="10" sortable="true" />
				<ta:datagridItem id="aac004" key="性别" align="center" maxChart="2" sortable="true" />
				<ta:datagridItem id="aac005" key="民族" align="center" maxChart="3" sortable="true" />
				<ta:datagridItem id="aae140" key="险种信息" align="center" maxChart="14" showDetailed="true" />
				<ta:datagridItem id="aaz500" key="医保卡号" align="center" maxChart="8" showDetailed="true" />
				<ta:datagridItem id="aac006" key="出生日期" align="center" maxChart="6" dataType="date" />
				<ta:datagridItem id="aac007" key="参加工作时间" align="center" maxChart="6" dataType="date" />
				<ta:datagridItem id="aae005" key="联系电话" align="center" maxChart="8" />
				<ta:datagridItem id="aae006" key="地址" align="center" maxChart="8" showDetailed="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQueryAb01, 0, false);
	});
	function fnQuery() {
		Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonJBInfoQueryAction!toQuery.do");
	}
	function fnQueryAb01() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aab004", g_Suggest[2]);
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonJBInfoQueryAction!toQuery.do");
		}
	}

	//报盘
	function fnDownload() {
		var aab001 = Base.getValue("aab001");
		var aae044 = Base.getValue("aab004");
		if (aab001 == '' || aab001 == null) {
			alert("请输入单位编号后再导出模板！");
			return;
		} else {
			location.href = myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonJBInfoQueryAction!doDownload.do?dto.aab001=" + aab001;
		}
	}

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, function() {
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitPersonJBInfoQueryAction!toQuery.do");
		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>