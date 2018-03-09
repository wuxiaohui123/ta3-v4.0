<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>单位工资查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin: 0px; padding: 1px;" class="no-scrollbar">
	<div id='pageloading'></div>
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="查询条件" cols="3" id="fltUnit">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="aae140" key="险种类型" collection="AAE140" />
			<ta:date id="aae041" key="开始年月" showSelectPanel="true" issue="true" />
			<ta:date id="aae042" key="终止年月" showSelectPanel="true" issue="true" />
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab key="人员基数信息" id="tab2">
				<ta:panel id="ac04Panel" fit="true">
					<ta:datagrid id="ac04Grid" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位编号" maxChart="6" align="center" sortable="true" />
						<ta:datagridItem id="aae044" key="单位名称" maxChart="12" align="center" sortable="true" />
						<ta:datagridItem id="aac001" key="个人编号" maxChart="6" align="center" sortable="true" />
						<ta:datagridItem id="aac003" key="姓名" maxChart="4" align="center" sortable="true" />
						<ta:datagridItem id="aac002" key="证件号码" maxChart="10" align="center" sortable="true" />
						<ta:datagridItem id="aae140" key="险种类型" maxChart="12" align="center" sortable="true" collection="AAE140" />
						<ta:datagridItem id="aae149" key="年月" maxChart="4" align="center" sortable="true" dataAlign="center" />
						<ta:datagridItem id="aac040" key="工资" maxChart="4" align="center" sortable="true" dataAlign="right" />
						<ta:datagridItem id="aae180" key="基数" maxChart="4" align="center" sortable="true" dataAlign="right" />
						<ta:datagridItem id="aaz136" key="基数核定规则" maxChart="12" collection="AAZ136" align="center" sortable="true" dataAlign="right" />
						<ta:datagridItem id="yac084" key="离退休标志" maxChart="5" collection="YAC084" align="center" sortable="true" />
						<ta:datagridItem field="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
						<ta:datagridItem field="aae036" key="经办时间" align="center" dataAlign="center" maxChart="10" sortable="true"></ta:datagridItem>
						<ta:datagridItem field="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" maxChart="10"></ta:datagridItem>
						<ta:dataGridToolPaging pageSize="200" showCount="true" submitIds="fltUnit" url="unitSalaryQueryAction!toQueryUnit.do" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="人员基数历史记录" id="tab3">
				<ta:panel id="ac04a2Panel" fit="true">
					<ta:datagrid id="ac04a2Grid" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" sortable="true" />
						<ta:datagridItem id="aae044" key="单位名称" width="120" align="center" sortable="true" />
						<ta:datagridItem id="aac001" key="个人编号" width="70" align="center" sortable="true" />
						<ta:datagridItem id="aac003" key="姓名" width="80" align="center" sortable="true" />
						<ta:datagridItem id="aac002" key="证件号码" width="140" align="center" sortable="true" />
						<ta:datagridItem id="aae140" key="险种类型" width="120" align="center" sortable="true" collection="AAE140" />
						<ta:datagridItem id="aae041" key="开始年月" width="70" align="center" sortable="true" dataAlign="center" />
						<ta:datagridItem id="aae042" key="结束年月" width="70" align="center" sortable="true" dataAlign="center" />
						<ta:datagridItem id="aac040" key="工资" width="60" align="center" sortable="true" dataAlign="right" />
						<ta:datagridItem id="aaz136" key="基数核定规则" width="120" collection="AAZ136" align="center" sortable="true" dataAlign="right" />
						<ta:datagridItem id="aae180" key="基数" width="60" align="center" sortable="true" dataAlign="right" />
						<ta:datagridItem id="aae016" key="复核标志" width="80" collection="AAE016" align="center" sortable="true" />
						<ta:datagridItem field="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
						<ta:datagridItem field="aae036" key="经办时间" align="center" dataAlign="center" width="100" sortable="true"></ta:datagridItem>
						<ta:datagridItem field="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" width="235"></ta:datagridItem>
						<ta:dataGridToolPaging pageSize="200" showCount="true" submitIds="fltUnit" url="unitSalaryQueryAction!toQueryUnit.do" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ac01', 'aac001', 950, 200, 9, fn_queryInfoPerson, 1, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_queryInfoUnit, 1, false);
	});
	//回调函数
	function fn_queryInfoPerson() {
		if (g_Suggest != "") {
			Base.setValue('aac001', g_Suggest[2]);
		}
	}
	function fn_queryInfoUnit() {
		if (g_Suggest != "") {
			Base.setValue('aab001', g_Suggest[1]);
		}
	}
	//查询单位变更信息日志表
	function fnQuery() {
		var beginTime = Base.getValue('aae041');
		var endTime = Base.getValue('aae042');
		if (beginTime != '' && endTime != '') {
			if (endTime < beginTime) {
				Base.alert('结束时间不能小于开始时间！', 'warn');
				return;
			}
		}
		if (Base.getValue('aab001') == '' && Base.getValue('aac001') == '') {
			Base.alert('单位编号和个人编号,至少输入一个!');
			return;
		}
		Base.submit("form1", "unitSalaryQueryAction!toQueryUnit.do");
	}

	/***单位RPC***/
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, null, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(2, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
	/********个人RPC*******/
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>