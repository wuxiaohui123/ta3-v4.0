<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊待遇明细查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="ctrl+P" asToolBarItem="true" />
		</ta:toolbar>
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:date id="aae036_begin" key="经办开始时间" showSelectPanel="true" required="true" labelWidth="120" />
			<ta:date id="aae036_end" key="经办结束时间" showSelectPanel="true" required="true" labelWidth="120" />
		</ta:panel>
		<ta:panel id="resultPanel" key="特殊待遇明细查询结果" fit="true">
			<ta:datagrid id="ac73Grid" fit="true" forceFitColumns="true" columnFilter="true">
				<ta:datagridItem id="aac001" key="个人编号" />
				<ta:datagridItem id="aac002" key="身份证号" />
				<ta:datagridItem id="aac003" key="姓名" />
				<ta:datagridItem id="aab001" key="单位编号" />
				<ta:datagridItem id="aae044" key="单位名称" />
				<ta:datagridItem id="aaa037" key="待遇项目" />
				<ta:datagridItem id="aae129" key="金额" />
				<ta:dataGridToolPaging url="" showExcel="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
			$("body").taLayout();
		}
	 );
	
	function query(){
		var aae036_begin = Base.getValue("aae036_begin");
		var aae036_end = Base.getValue("aae036_end");
		if(aae036_begin == ""){
			Base.alert("经办开始日期不能为空！","warn");
			return ;
		}
		if(aae036_end == ""){
			Base.alert("经办结束日期不能为空！","warn");
			return ;
		}	
		Base.submit("aae036_begin,aae036_end","specialTreatmentQueryAction!query.do");
	}
	
	function print(){
		var aae036_begin = Base.getValue("aae036_begin");
		var aae036_end = Base.getValue("aae036_end");
		if(aae036_begin == ""){
			Base.alert("经办开始日期不能为空！","warn");
			return ;
		}
		if(aae036_end == ""){
			Base.alert("经办结束日期不能为空！","warn");
			return ;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyhd_tsdyhdmxb.raq&"
				+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aae036_begin="+aae036_begin+";aae036_end="+aae036_end);
	}
</script>

<%@ include file="/ta/incfooter.jsp"%>