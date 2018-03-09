<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar"> 
	<ta:pageloading />
	<ta:toolbar id="tlb">
	    <ta:buttonLayout align="center">
	   	 	<ta:button id="printBtn" icon="icon-print" key="打印" asToolBarItem="true"  onClick="fnPrint()"/>
	   	 	<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	    </ta:buttonLayout>
	</ta:toolbar>
	<ta:panel id="checkInfo" key="登帐明细" fit="true">
		<ta:text id="yaz767" key="银行登帐确认ID" display="false"/>
		<ta:datagrid id="detailslist" forceFitColumns="true" fit="true" columnFilter="true" haveSn="true">
			<ta:datagridItem id="aaz288" key = "征集单ID"/>
			<ta:datagridItem id="aae019" key = "金额" totals="sum"/>
			<ta:datagridItem id="aaz010" key = "当事人ID"/>
			<ta:datagridItem id="yaa030" key = "当事人名称"/>
			<ta:datagridItem id="yad158" key = "征集套帐类型" collection="YAD158"/>
			<ta:datagridItem id="aad009" key = "凭证编号"/>
			<ta:datagridItem id="aad016" key = "结算方式" collection="aad005"/>
			<ta:datagridItem id="aad017" key = "缴费日期" width="160"/>
			<ta:datagridItem id="aae009" key = "户名" width="160"/>
			<ta:datagridItem id="aae010" key = "银行账号" width="160"/>
			<ta:datagridItem id="yad003" key = "实处理金额"/>
		</ta:datagrid>
	</ta:panel>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//打印
function fnPrint(){
    var yaz767 = Base.getValue("yaz767");
	var fileName;
	var prm;

	fileName="yhdzqrdy.raq";
	prm = "yaz767="+yaz767; 
	
	$("#report1_printIFrame").attr("src",myPath()+"/reportServlet?action=2&name=report1&reportFileName="+fileName+"&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString="+prm				
			);	
}
</script>
<%@ include file="/ta/incfooter.jsp"%>

