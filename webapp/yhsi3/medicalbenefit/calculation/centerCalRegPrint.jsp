<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>明细信息展示</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:button id="seachBtn" key="查询[Q]" icon="xui-icon-query" asToolBarItem="true" hotKey="Q" onClick="toQuery()" />
			<ta:button id="printBtn" key="打印[P]" icon="xui-icon-spotPrint" asToolBarItem="true" hotKey="P" onClick="toPrint()" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="C" asToolBarItem="true" type="resetPage" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="panel_1" key="查询条件" cols="3">
				<ta:date id="aae030" key="开始经办时间" showSelectPanel="true" labelWidth="120"/>
				<ta:date id="aae031" key="结束经办时间" showSelectPanel="true" labelWidth="120"/>
				<ta:selectInput id="aae011" key="经办人" collection="AAE011" labelWidth="120"/>
				<ta:text id="aae140" key="险种类型" display="false"/>
			</ta:panel>
			<ta:panel  id="panel" key="明细信息" fit="true">
				<ta:datagrid id="kc21List" fit="true" haveSn="true" selectType="checkbox" forceFitColumns="true">
					<ta:datagridItem id="aaz217" key="人员医疗就诊事件" hiddenColumn="false"/>
					<ta:datagridItem id="aac001" key="人员编号" width="100" align="center" dataAlign="center" />
					<ta:datagridItem id="aac003" key="姓名" width="80" align="center" dataAlign="center" />
					<ta:datagridItem id="aab003" key="单位名称" width="180" align="center" showDetailed="true" />
					<ta:datagridItem id="aka130" key="医疗支付类别" width="100" collection="AKA130" align="center" dataAlign="center"/>
					<ta:datagridItem id="akb021" key="医疗机构名称" width="180" align="center" showDetailed="true" />
					<ta:datagridItem id="yke069" key="发票张数" width="150" align="center" showDetailed="true" dataAlign="right" />
					<ta:datagridItem id="yke068" key="票据金额" width="150" align="center" showDetailed="true" dataAlign="right" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
$(document).ready(
		function() {
			$("body").taLayout();
		});
function toQuery() {
	Base.submit("form1", "centerCalRegPrintAction!toQuery.do");
}
function toPrint() {
	var selectRow = Base.getGridSelectedRows('kc21List');
	if (selectRow.length == 0) {
		Base.alert('没有要打印的信息', 'warn');
		return false;
	}
	var arr = new Array();
	for(var i=0;i<selectRow.length;i++){
		arr[i] = selectRow[i].aaz217;
	}
	$("#report1_printIFrame")
			.attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=centerCalRegPrint.raq&"
							+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
							+ "serverPagedPrint=no&mirror=no&"
							+ "paramString=aaz217=" + arr);
}
</script>
<%@ include file="/ta/incfooter.jsp"%>