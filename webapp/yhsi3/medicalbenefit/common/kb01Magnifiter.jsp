<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading/>
    <ta:toolbar id="tlb">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query"  onClick="fnQuery()"  asToolBarItem="true"/>
		<ta:button key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="fnClose()" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form fit="true" >
	   <ta:box id="bxCxtj" cols="4">
		   <ta:selectInput id="aaa027"  key="统筹区" collection="AAB034" onSelect="fnQuery"/>
		   <ta:selectInput id="akb022"  key="医疗机构类型"  collection="AKB022" onSelect="fnQuery"/>
		   <ta:selectInput id="akb097"  key="医疗机构等级"  collection="AKB097" onSelect="fnQuery"/>
		   <ta:text id="akb021" key="医疗机构名称" />
	   </ta:box>	   
	   <ta:panel id="pnlKb01" key="定点医疗机构信息" fit="true" >
	      <ta:datagrid id="dgKb01"  fit="true"  forceFitColumns="true"  haveSn="true" onRowDBClick="fnDbClick" >
	          <ta:datagridItem id="aaz269"  key="医疗机构及药店ID" hiddenColumn="false"/>
	          <ta:datagridItem id="akb020"  key="医疗机构编码" align="center"  dataAlign="left" maxChart="6" sortable="true"/>
	          <ta:datagridItem id="akb021"  key="医疗机构名称" align="center"  dataAlign="left" showDetailed="true"  maxChart="18"/>
	          <ta:datagridItem id="akb097"  key="医疗机构等级" align="center"  dataAlign="left" showDetailed="true"  maxChart="6" collection="AKB097" />
	          <ta:datagridItem id="aaa027"  key="统筹区" align="center"  dataAlign="left" showDetailed="true"  maxChart="6" collection="AAB034"/>
	      </ta:datagrid>
	   </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnQuery(key,value)
	{
	   Base.submit("bxCxtj","commonFunctionAction!toQuery.do");	
	}
	
	function fnClose()
	{
		parent.Base.closeWindow("w_akb021");
		parent.Base.closeWindow("w_akb020");
		parent.Base.closeWindow("w_akb021_n");
		parent.Base.closeWindow("w_akb020_n");
	}
	//选统筹区直接查询 
	// 双击回调方法
	function fnDbClick(e,rowdata)
	{
		// 离弹出框最近一层,则打开窗口
		//top._child.fnKb01MagifierBack(rowdata);
		parent.fnKb01MagifierBack(rowdata);
		fnClose();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>