<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>年度待遇调整清单</title>
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
			<ta:selectInput id="yie013" key="增发类型" labelWidth="120" collection="yie013" required="true" />
			<ta:date id="aae212" key="调整年月" labelWidth="120" showSelectPanel="true" issue="true" required="true" />
		</ta:panel>
		<ta:panel id="resultPanel" key="查询结果" fit="true">
			<ta:datagrid id="ic33Grid" fit="true" haveSn="false">
				<ta:datagridItem id="xh" key="序号" width="50" />
				<ta:datagridItem id="aab001" key="单位编号" width="80" />
				<ta:datagridItem id="aae044" key="单位名称" width="120" showDetailed="true" />
				<ta:datagridItem id="aac001" key="个人编号" width="80" />
				<ta:datagridItem id="aac003" key="姓名" width="100" />
				<ta:datagridItem id="yae015" key="计发基数" width="80" />
				<ta:datagridItem id="zf_new" key="新增发金额" width="80" />
				<ta:datagridItem id="zf_old" key="旧增发金额" width="80" />
				<ta:datagridItem id="zf_ce" key="差额" width="80" />
				<ta:datagridItem id="bfys" key="补发月数" width="80" />
				<ta:datagridItem id="bfje" key="补发金额" width="80" />
				<ta:datagridItem id="aae013" key="备注" width="120" showDetailed="true" />
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
			$("body").taLayout();
		});	
	
	function query(){
		if(Base.getValue("yie013")==""){
			Base.alert("请选择增发类型!","warn");
			Base.focus("yie013");
			return;
		}
		if(Base.getValue("aae212")==""){
			Base.alert("请输入调整年月!","warn");
			return;		
		}
		Base.submit("yie013,aae212","annualAdjustmentsQueryAction!query.do");
	}
	
	function print(){
		var yie013 = Base.getValue("yie013");
		if(yie013 == ""){
			Base.alert("缺失参数:增发类型!","warn");
			return ;
		}
		var aae212 = Base.getValue("aae212");
		if(aae212 == ""){
			Base.alert("缺失参数:调整年月!","warn");
			return ;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dytz_nddytzqd.raq&" 
				+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
				+ "serverPagedPrint=no&mirror=no&" + "paramString=yie013=" + yie013 + ";aae212="+ aae212 + ";aae140=110");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>