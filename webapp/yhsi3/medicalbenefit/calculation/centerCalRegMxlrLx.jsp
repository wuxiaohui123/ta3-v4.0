 <%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>明细录入(离休)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btns2">
		<ta:toolbarItem id="printBtn" key="打印审核表" icon="xui-icon-spotPrint" onClick="toPrint()" />
		<ta:toolbarItem id="yjsBtn" key="预结算" icon="xui-icon-spotEdit"  onClick="toYjs()" />
		<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('win_mxlr');" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	   <ta:box id="pnlReg" cols="5">
		   <ta:text id="aae011" key="经办人" display="false"/>
		   <ta:text id="aac001" key="人员ID"  readOnly="true" labelWidth="100" display="false"/>
		   <ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  readOnly="true" labelWidth="100" display="false" />
		   <ta:text id="akb020" key="医疗机构编码" readOnly="true"  labelWidth="100" display="false"/>
		   <ta:text id="aac003" key="姓名"  readOnly="true" labelWidth="100"/>
		   <ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2"  labelWidth="100"/>
		    <ta:date id="aae030" key="开始日期" labelWidth="100" readOnly="true"/>
			<ta:date id="aae031" key="结束日期" labelWidth="100" readOnly="true"/>
	   </ta:box>	   
	   <%@ include file="../common/kc22Lr.jsp"%>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//打印审核表
	function toPrint()
	{
		var aaz217 = Base.getValue("aaz217");
		var aae011 = Base.getValue("aae011");
		var aka130 = Base.getValue("aka130");
		var aac001 = Base.getValue("aac001");
		var reportName="CenterJS_SHDLX.raq"; // 住院审核单
		if("11" == aka130 || "12" == aka130 || "14"==aka130 || "15" == aka130)
			reportName = "centerBxMxsh_LXMZ.raq"; // 门诊审核单
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011+";aac001="+aac001);
	}
	
	//预结算
	function toYjs()
	{
		var parameter = {};
		parameter["dto['aac001']"] = Base.getValue("aac001");
		parameter["dto['aaz217']"] = Base.getValue("aaz217");
		Base.openWindow("win_yjs", "预结算信息", "<%=path%>/medicalbenefit/calculation/cenCalDetailAction!toYjs.do", parameter, "99%", "99%", null, null, true, null, null);
	}
	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("kc22List");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>		