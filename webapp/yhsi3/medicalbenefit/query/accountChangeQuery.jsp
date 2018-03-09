<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人账户变更记录查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
			<ta:toolbarItem id="btnQuery" key="查询([Q]" icon="xui-icon-query" hotKey="q" onClick="toQuery()" />
			<ta:toolbarItem id="btnPrint" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="toPrint()" /> 
			 <ta:toolbarItem id="btnUpload" key="导出EXCEL" icon="xui-icon-spotEdit" onClick="toUpload()" />
			<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="r" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	    <ta:panel id="queryInfo" key="查询条件" cols="3"  >
		    <ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="120" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				  </ta:buttonLayout>
			</ta:box>
		    <ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120"/>
		    <ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="120"/>
		    <ta:selectInput id="aaa097" key="账户收支类型" collection="AAA097" labelWidth="120" />
		    <ta:selectInput id="aae140" key="险种类型" collection="AAE140" filter="310,390"  reverseFilter="true" labelWidth="120"/>
		    <ta:selectInput id="aaa027" key="统筹区" collection="YAB003" labelWidth="120"/>
		    <ta:date id="aae036_s" key="发生日期(从)" showSelectPanel="true" labelWidth="120" />
		    <ta:date id="aae036_e" key="发生日期(至)" showSelectPanel="true" labelWidth="120" />
		    <ta:selectInput id="yka032" key="支付地点" labelWidth="120" collection="YKA032"/>
	    </ta:panel>
	    <ta:panel id="accountChangeInfo" key="个人账户收支明细记录" fit="true">
			<ta:datagrid id="accountChangeList" fit="true" haveSn="true" snWidth="30">
			    <%@ include file="/yhsi3/medicalbenefit/common/accountPaymentDetail.jsp" %>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>            
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		$("body").taLayout();
	});
	
	 // 人员ID change事件
	function callbackFunPerson(){
		   
    }
	//查询
	function toQuery(){
		Base.clearGridData("accountChangeList");
		Base.submit("queryInfo","accountChangeQueryAction!toQuery.do");
	}
	
	function toPrint(){
		var aac001 = Base.getValue("aac001");
		if("" == aac001 || null == aac001){
			Base.alert("请输入个人编号!","warn");
			return;
		}
		var aaa097 = Base.getValue("aaa097");
		var aae140 = Base.getValue("aae140");
		var aaa027 = Base.getValue("aaa027");
		var yka032 = Base.getValue("yka032");
		var aae036_s = Base.getValue("aae036_s");
		var aae036_e = Base.getValue("aae036_e");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=AccountDetail.raq&"
						+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
						+ "serverPagedPrint=no&mirror=no&"
						+ "paramString=aac001="+aac001
						+ ";aaa097="+aaa097
						+ ";aae140="+aae140
						+ ";aaa027="+aaa027
						+ ";yka032="+yka032
						+ ";aae036_s="+aae036_s
						+ ";aae036_e="+aae036_e
		                );
	}
	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("accountChangeList");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>