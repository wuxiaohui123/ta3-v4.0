<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>病种目录查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"   hotKey="R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="fltQuery"  key="查询条件"  cols="3">
     		   <ta:text id="aka120"  key="病种编码" />
     		   <ta:text id="aka121"  key="病种名称" />
     		   <ta:selectInput id="aka122"  key="病种类型"  collection="AKA122"/>
		 </ta:panel>
	    <ta:panel id="pnlDiseaseDisDirectory"  key="疾病目录信息"  fit="true"  expanded="false"  scalable="false">
	        <ta:datagrid id="dgKe09" haveSn="true"  snWidth="25"  fit="true"  forceFitColumns="true">
				    <ta:datagridItem id="aka120" key="病种编码" align="center" maxChart="5"/>
				    <ta:datagridItem id="aka121" key="病种名称" align="center" maxChart="10"/>
				    <ta:datagridItem id="aka122" key="病种类型" align="center" collection="AKA122" maxChart="6"/>
				    <ta:datagridItem id="aka021" key="五笔助记码" align="center"  maxChart="7"/>
				    <ta:datagridItem id="aka020" key="拼音助记码" align="center" maxChart="7"/>
				    <ta:datagridItem id="aae030" key="开始日期" align="center"   maxChart="7"/>
				    <ta:datagridItem id="aae031" key="终止日期" align="center"   maxChart="7"/>
			</ta:datagrid>
	   </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	// 查询
	function toQuery(){
		 Base.clearGridData("dgKe09");
	     Base.submit("fltQuery","diseaseDirectoryQueryAction!toQueryDiseaseDirectory.do");	
	}
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("dgKe09");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>