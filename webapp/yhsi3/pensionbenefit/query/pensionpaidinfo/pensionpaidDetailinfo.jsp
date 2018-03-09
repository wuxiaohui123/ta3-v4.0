<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pensionpaidDtail</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印" onClick="print()" asToolBarItem="true" />
		<ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('pensionpaidDtail');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:box id="jstj" cols="3">
			<ta:text id="yab003" key="经办机构" display="false" />
			<ta:text id="aab001" key="单位编号" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:date id="aae002" key="拨付期号" issue="true" display="false" />
		</ta:box>
		<ta:panel id="pensionpaidDtailPanel" key="变动信息" fit="true">
			<ta:datagrid id="pensionpaidDtailGrid" fit="true" forceFitColumns="true" columnFilter="true" haveSn="true">
				<ta:datagridItem id="bdlx" key="变动类型" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aac063" key="供养标识" collection="AAC063" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae019_s" key="上月正常应发" dataAlign="center" align="center" totals="sum">
				</ta:datagridItem>
				<ta:datagridItem id="aae019_b" key="本月正常应发" dataAlign="center" align="center" totals="sum">
				</ta:datagridItem>
				<ta:datagridItem id="bdje" key="变动金额" dataAlign="center" align="center" totals="sum">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" selectExpButtons="1" showButton="true" pageSize="9999" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">

	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
	});
	
	function print(){
		var aab001 = Base.getValue("aab001");
		var aae002 = Base.getValue("aae002");
		var yab003 = Base.getValue("yab003");
		var aae140 = Base.getValue("aae140");
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ylbfqkbdxxxq_yl.raq&" 
	    		+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
	    		+ "serverPagedPrint=no&mirror=no&" + "paramString=aab001=" + aab001 + ";aae002="+ aae002
			    + ";aae140=" + aae140 + ";yab003=" + yab003);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>