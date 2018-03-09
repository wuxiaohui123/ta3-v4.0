<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>业务回退工具</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin: 0px; padding: 1px;">
	<div id='pageloading'></div>
	<ta:box fit="true">
		<ta:box height="100%">
			<ta:box height="45%" cols="2">
				<ta:box height="100%" columnWidth="0.65" cssStyle="margin-left:1px;">
					<ta:panel id="p1" key="业务日志信息" fit="true">
						<ta:datagrid id="logGrid" fit="true" columnFilter="true" onRowClick="fnLogRowClk" rowColorfn="fnColor">
							<ta:datagridItem id="aaz002" key="业务日志ID" maxChart="10" align="center" />
							<ta:datagridItem id="aaa121" key="业务类型" collection="AAA121" maxChart="6" showDetailed="true" align="center" />
							<ta:datagridItem id="yaa017" key="办理状态" collection="YAA017" showDetailed="true" maxChart="5" align="center" />
							<ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="5" />
							<ta:datagridItem id="aae044" key="当事人名称" align="center" maxChart="8" showDetailed="true" />
							<ta:datagridItem id="aae036" key="经办时间" maxChart="8" align="center" />
							<ta:datagridItem id="aae011" key="经办人" collection="AAE011" maxChart="2" align="center" />
							<ta:datagridItem id="aaa792" key="是否已回退" collection="AAA831" maxChart="4" align="center" />
							<ta:datagridItem id="aae790" key="记录日志流水号" maxChart="10" align="center" />
							<ta:datagridItem id="aab034" key="经办机构" collection="YAB003" maxChart="4" align="center" />
							<ta:datagridItem id="aae013" key="备注" maxChart="10" showDetailed="true" align="center" />
							<ta:datagridItem id="aaa794" key="回退人" collection="AAE011" maxChart="2" align="center" />
							<ta:datagridItem id="aaa793" key="回退时间" maxChart="8" align="center" />
						</ta:datagrid>
					</ta:panel>
				</ta:box>
				<ta:box height="100%" columnWidth="0.1" cssStyle="margin-left:1px;">
					<ta:panel id="p2" key="操作信息" fit="true">
						<ta:number id="days" key="X天内" labelWidth="50" columnWidth="0.1" alignLeft="true" />
						<ta:buttonLayout align="left">
							<ta:submit submitIds="days,norb" key="检&nbsp;&nbsp;索" url="rollbackToolAction!queryLog.do" />
						</ta:buttonLayout>
						<div style="padding-left: 10px;">
							<ta:checkbox id="norb" key="未回退" value="0" onClick="Base.submit('days,norb', 'rollbackToolAction!queryLog.do');" />
						</div>
						<ta:buttonLayout align="left">
							<ta:submit submitIds="logGrid,days,norb" key="回&nbsp;&nbsp;退" url="rollbackToolAction!doRollback.do" />
						</ta:buttonLayout>
					</ta:panel>
				</ta:box>
				<ta:box height="100%" columnWidth="0.25" cssStyle="margin-left:1px;">
					<ta:panel id="p3" key="编码及含义" cssStyle="margin:0px;" fit="true">
						<ta:datagrid id="appCodeGrid" fit="true" forceFitColumns="true">
							<ta:datagridItem id="codeType" key="代码类别" maxChart="3" align="center" />
							<ta:datagridItem id="codeTypeDESC" key="类别名称" maxChart="5" align="center" />
							<ta:datagridItem id="codeValue" key="代码值" maxChart="3" align="center" />
							<ta:datagridItem id="codeDESC" key="代码名称" maxChart="5" align="center" />
						</ta:datagrid>
					</ta:panel>
				</ta:box>
			</ta:box>
			<ta:box height="55%" cols="2">
				<ta:box height="100%" columnWidth="0.5" cssStyle="margin-left:1px;">
					<ta:panel id="p4" key="涉及表（单击右边显示数据变更痕迹，双击弹出回退SQL）" fit="true">
						<ta:datagrid id="sqlGrid" forceFitColumns="true" fit="true" onRowClick="fnSqlRowClk" onRowDBClick="fnRowDbClk">
							<ta:datagridItem id="aae820" key="顺序号" align="center" />
							<ta:datagridItem id="aaa821" key="操作类型" align="center" formatter="fnOptFormat" />
							<ta:datagridItem id="aaa801" key="表名" align="center" />
							<ta:datagridItem id="aaa823" key="条件" width="280" showDetailed="true" align="center" />
						</ta:datagrid>
					</ta:panel>
				</ta:box>
				<ta:box height="100%" columnWidth="0.5" cssStyle="margin-left:1px;">
					<ta:panel id="p5" key="数据变更痕迹" fit="true">
						<ta:datagrid id="traceGrid" forceFitColumns="true" fit="true" onRowClick="fnTraceRowClk">
							<ta:datagridItem id="aaa811" key="字段名" width="60" align="center" />
							<ta:datagridItem id="aaa812" key="旧值" width="100" align="center" />
							<ta:datagridItem id="aaa813" key="新值" width="100" align="center" />
							<ta:datagridItem id="aae813" key="字段类型" formatter="fnColFormat" align="center" />
							<ta:datagridItem id="comments" key="注释" width="180" align="center" />
						</ta:datagrid>
					</ta:panel>
				</ta:box>
			</ta:box>
		</ta:box>
	</ta:box>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Ta.autoPercentHeight();
	});
	
	function fnColor(rowdata) {
		//aaa792 是否已经回退
		if (rowdata.aaa792 == '是' || rowdata.aaa792 == 1) {
			return "silver";
		}
	}
	function fnLogRowClk(e, rowdata) {
		Base.submit(null, "rollbackToolAction!queryConstraint.do", {
			"dto['aae790']" : rowdata.aae790
		});
	}
	
	function fnSqlRowClk(e, rowdata) {
		Base.submit(null, "rollbackToolAction!queryTrace.do", {
			"dto['aae820']" : rowdata.aae820,
			"dto['aaa801']" : rowdata.aaa801
		});
	}
	
	function fnTraceRowClk(e, rowdata) {
		Base.submit(null, "rollbackToolAction!queryAppCode.do", {
			"dto['aaa811']" : rowdata.aaa811
		});
	}
	
	function fnOptFormat(row, cell, value, columnDef, dataContext) {
		if (value == '0')
			return 'INSERT';
		if (value == '1')
			return 'UPDATE';
		if (value == '2')
			return 'DELETE';
		if (value == '4')
			return '未使用触发器';
	}
	
	function fnColFormat(row, cell, value, columnDef, dataContext) {
		if (value == '1')
			return 'VARCHAR2';
		if (value == '2')
			return 'NUMBER';
		if (value == '3')
			return 'DATE';
	}
	
	function fnRowDbClk(e, rowdata) {
		alert(rowdata.aaa822);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>