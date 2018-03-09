<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="sBtn" key="导出成功信息[S]" icon="icon-output" hotKey="S" onClick="exportSuccess();" asToolBarItem="true" />
			<ta:button id="fBtn" key="导出失败信息[F]" icon="icon-output" hotKey="F" onClick="exportFailed();" asToolBarItem="true" />
		</ta:toolbar>
		<ta:tabs fit="true">
			<ta:tab key="成功信息" id="tab1">
				<ta:datagrid id="dg_fileInfo1" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="jobid" key="服务编号" align="center" dataAlign="left" width="110" />
					<ta:datagridItem id="successmsg" key="成功信息" align="center" dataAlign="left" width="280" showDetailed="true" />
					<ta:datagridItem id="execstarttime" key="经办时间" align="center" dataAlign="left" width="145" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="失败信息" id="tab2">
				<ta:datagrid id="dg_fileInfo2" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="jobid" key="服务编号" align="center" dataAlign="left" width="110" />
					<ta:datagridItem id="errormsg" key="失败信息" align="center" dataAlign="left" width="280" showDetailed="true" />
					<ta:datagridItem id="execstarttime" key="经办时间" align="center" dataAlign="left" width="145" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	//导出成功信息
	function exportSuccess() {
		var rows = Base.getGridData("dg_fileInfo1");
		if (rows != "") {
			Base.expGridExcel("dg_fileInfo1");
		} else {
			Base.alert("没有成功信息需要导出,请确认!", "warn");
		}
	}

	//导出失败信息
	function exportFailed() {
		var rows = Base.getGridData("dg_fileInfo2");
		if (rows != "") {
			Base.expGridExcel("dg_fileInfo2");
		} else {
			Base.alert("没有失败信息需要导出,请确认!", "warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>