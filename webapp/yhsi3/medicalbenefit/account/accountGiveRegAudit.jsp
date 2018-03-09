<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>人员账户清退复核</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="yes-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
			<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true"/>
<!-- 			<ta:toolbarItem id="btnPrint" key="打印[P]" icon="xui-icon-spotPrint"  hotKey="P" onClick="toPrint()" /> -->
		</ta:toolbar>
		<ta:form id="form1" fit="true">
		    <ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz267" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
			
			 <ta:panel id="pnl_personInfo" cols="3" key="清退信息">			
					<ta:text id="aac001" key="人员ID"    readOnly="true" required="true"/>
					<ta:text id="aac003" key="姓名"    readOnly="true"/>
					<ta:text id="aab001" key="单位ID"    readOnly="true" required="true"/>	
					<ta:text id="aab003" key="单位名称"     readOnly="true"/>	
					<ta:selectInput id="aae140" key="险种" collection="AAE140" readOnly="true"/>
					<ta:number id="aae042" key="退保年月"  readOnly="true" required="true"/>
					<ta:number id="aae240" key="账户余额"  readOnly="true" required="true"/>	
					<ta:number id="yke051" key="扣减金额"  readOnly="true" required="true"/>		
					<ta:number id="aae058" key="本次返还金额"  readOnly="true" required="true"/>								
			 </ta:panel>
		
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	Base.filterSelectInput("action", '1,2', true);
});
 //保存
	function toSave() {
	  if(Base.validateForm("form1")){
		 Base.submit("form1","accountGiveRegAuditAction!toSave.do");
	  }else{
		 Base.alert("带红星的为必输入项!","warn");
	  }
	}
 

  // 打印
  function toPrint()
  {
	var aac001 = Base.getValue('aac001');
	//var reportName = "accountGive.raq";
	var reportName = "MedicareZHQT.raq";
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001);
	
  }
</script>
<%@ include file="/ta/incfooter.jsp"%>
