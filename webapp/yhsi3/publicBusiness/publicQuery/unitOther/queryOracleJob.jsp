<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社保与银行报盘回盘信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" icon="xui-icon-query" hotKey="Q" id="queryBtn" asToolBarItem="true" onClick="toQuery();" />
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" id="resetBtn" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="cxtj" key="查询条件" cols="3" scalable="false">
			<ta:date id="aae036_1" key="经办时间从" showSelectPanel="true" onChange="checkworkTime()" />
			<ta:date id="aae036_2" key="至" showSelectPanel="true" onChange="checkworkTime()" />
			<ta:selectInput id="aae011" key="经办人" collection="AAE011" />
			<ta:selectInput id="aae013" key="定时服务名称" />
		</ta:panel>
		<ta:panel id="pnlDwcb" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="file" haveSn="true" fit="true" onRowDBClick="clickFn" forceFitColumns="true">
				<ta:datagridItem id="jobname" key="定时服务名称" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="what" key="定时服务内容" align="center" showDetailed="true" dataAlign="left" width="300" />
				<ta:datagridItem id="starttime" key="定时服务执行时间" align="center" dataAlign="left" width="250" dataType="dateTime" />
				<ta:datagridItem id="jobid" key="定时服务编号" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="userid" key="经办人" align="center" dataAlign="left" collection="AAE011" width="90" />
				<ta:datagridItem id="execstarttime" key="经办时间" align="center" dataAlign="left" dataType="DateTime" width="145" sortable="true" />
				<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" width="160" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//查看文件明细
	function clickFn(e, rowdata) {
		Base.openWindow("queryOracleJobInfo", "执行结果信息", "queryOracleJobAction!toEdit.do", {
			"dto['jobid']" : rowdata.jobid
		}, 1000, 480, null, null, true);
	}
	//查询文件列表
	function toQuery() {
		Base.submit("form1", "queryOracleJobAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
