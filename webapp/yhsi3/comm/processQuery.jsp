<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>业务流程查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="cxtj" key="查询条件" cols="3">
			<ta:selectInput id="ysy" key="经办距今时间" labelWidth="120" onSelect="fnSelect" data="[{'id':'1','name':'最近一天'},{'id':'2','name':'最近三天'},{'id':'3','name':'最近一周'},{'id':'4','name':'最近一个月'}]" />
			<ta:date id="aae036_b" key="查询开始时间" labelWidth="120" showSelectPanel="true" datetime="true" onChange="checkAAE036()" />
			<ta:date id="aae036_e" key="查询结束时间" labelWidth="120" showSelectPanel="true" datetime="true" onChange="checkAAE036()" />
			<ta:text id="aaz010_1" key="当事人ID" labelWidth="120" maxLength="20" onChange="sfwQueryUtil(1,'getDSRXX',Base.getValue('aaz010_1'))" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" />
			<ta:text id="aae044_1" key="当事人名称" readOnly="true" labelWidth="120" span="2" />
			<ta:selectInput id="aaa121_1" key="业务类型" labelWidth="120" collection="aaa121" maxVisibleRows="300" islevel="true" />
			<ta:text id="aae011" key="经办人" display="false" />
		</ta:panel>
		<ta:panel id="ae02a1ListPanel" key="流程信息(双击查看流程详细信息)" fit="true">
			<ta:datagrid id="ae02a1ListGrid" haveSn="true" fit="true" onRowDBClick="fnClick" forceFitColumns="true">
				<ta:datagridItem id="aaz002" key="业务日志编号" width="100px" dataAlign="center" align="center" hiddenColumn="false" />
				<ta:datagridItem id="aaz010" key="当事人ID" width="100px" align="center" dataAlign="center" />
				<ta:datagridItem id="aae044" key="当事人名称" width="160px" align="center" dataAlign="center" />
				<ta:datagridItem id="aaa121" key="业务类型" width="160px" collection="aaa121" align="center" dataAlign="center" />
				<ta:datagridItem id="yaa018" key="业务当前办理状态" collection="YAA018" width="120px" align="center" dataAlign="center" />
				<ta:datagridItem id="aae416" key="复核总级次" width="80px" align="center" dataAlign="center" />
				<ta:datagridItem id="aae419" key="当前级次" width="70px" align="center" dataAlign="center" />
				<ta:datagridItem id="aae016" key="复核标志" collection="aae016" width="70px" align="center" dataAlign="center" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="100px" align="center" dataAlign="center" hiddenColumn="false" />
				<ta:datagridItem id="aae036" key="经办时间" width="120px" align="center" dataAlign="center" />
				<ta:datagridItem id="yae041" key="复核人" collection="YAE092" width="100px" align="center" dataAlign="center" hiddenColumn="false" />
				<ta:datagridItem id="yae051" key="复核时间" width="120px" align="center" dataAlign="center" hiddenColumn="false" />
				<ta:datagridItem id="yae042" key="审批人" collection="YAE092" width="100px" align="center" dataAlign="center" hiddenColumn="false" />
				<ta:datagridItem id="yae052" key="审批时间" width="120px" align="center" dataAlign="center" hiddenColumn="false" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, '', 'aaz010_1', 500, 200, 4, fn_queryInfo, 0, false);
	});

	function fn_queryInfo() {
		if (g_Suggest != "") {
			Base.setValue("aaz010_1", g_Suggest[1]);
			Base.setValue("aae044_1", g_Suggest[2]);
		}
	}

	function queryData() {
		Base.submit('cxtj', 'processQueryAction!queryxx.do', null, null, null, null);
	}

	function fnSelect() {
		var ysy = Base.getValue("ysy");
		var nowtime = new Date();
		var year = nowtime.getFullYear();
		var month = nowtime.getMonth() + 1;
		var date = nowtime.getDate();
		var month1 = (month < 10) ? "0" + month : month;
		var date1 = (date < 10) ? "0" + date : date;
		var hour = nowtime.getHours();
		var minute = nowtime.getMinutes();
		var second = nowtime.getSeconds();
		var tt = ((hour < 10) ? "0" + hour : hour) + ":" + ((minute < 10) ? "0" + minute : minute) + ":" + ((second < 10) ? "0" + second : second);
		var time1 = year + "-" + month1 + "-" + date1 + " " + tt;
		Base.setValue("aae036_e", time1);
		if (ysy == 1) {
			date = date - 1;
		} else if (ysy == 2) {
			date = date - 3;
		} else if (ysy == 3) {
			date = date - 7;
		} else if (ysy == 4) {
			month = month - 1;
		}
		var month2 = (month < 10) ? "0" + month : month;
		var date2 = (date < 10) ? "0" + date : date;
		var time2 = year + "-" + month2 + "-" + date2 + " " + tt;
		Base.setValue("aae036_b", time2);
	}

	function checkAAE036() {
		Base.setValue("ysy", "");
	}

	function fnClick(e, rowdata) {
		Base.openWindow("userwin", "业务流程详情", "processQueryAction!queryXQ.do", {"dto['aaz002']" : rowdata.aaz002}, "95%", "90%", null, "", true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
