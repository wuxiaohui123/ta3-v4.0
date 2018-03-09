<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>文件查阅</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" icon="xui-icon-query" hotKey="Q" id="Button0" asToolBarItem="true" onClick="fn_query();" />
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" id="resetBtn" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="查询条件" id="p1" cols="3" scalable="false">
			<ta:text id="str" key="模糊查询条件" />
			<ta:selectInput id="yae800" key="文件大类" collection="YAE800" />
			<ta:selectInput id="yae801" key="文件小类" collection="YAE801" />
		</ta:panel>
		<ta:panel span="3" fit="true" expanded="false" key="查询结果">
			<ta:datagrid id="swfFile" haveSn="true" forceFitColumns="true" fit="true">
				<%@ include file="/yhsi3/synthesis/swfFile/comm/swfList.jsp"%>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script>
	$(document).ready(function(){
		$("body").taLayout();
  	});
  
	// 查询
	function fn_query(){
		Base.submit("form1","swfFileShowAction!query.do"); 
   	}
	
  	// 阅读
  	function fn_readFile(o){
    	var param = {"dto['yae263']":o.yae263,"dto['yae274']":o.yae274};
    	Base.openWindow("w_swfFileList","文件阅读>>" + o.yae803,"<%=basePath%>process/swfFile/swfFileShowAction!read.do",param, "1000", "600", null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>