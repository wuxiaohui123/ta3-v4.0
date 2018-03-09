<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>资源文件上传</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" icon="xui-icon-query" hotKey="Q" id="Button0" asToolBarItem="true" onClick="fn_query();" />
		<ta:button key="新增[A]" icon="xui-icon-spotAdd" hotKey="A" id="save" asToolBarItem="true" onClick="fn_add();" />
		<ta:button key="删除[D]" icon="xui-icon-spotDelete" hotKey="D" id="delete" asToolBarItem="true" onClick="fn_delete();" />
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" id="resetBtn" asToolBarItem="true" type="resetPage" />
		<%@ include file="/yhsi3/synthesis/swfFile/comm/help.jsp"%>
	</ta:toolbar>

	<ta:form id="form1" enctype="multipart/form-data" methord="post" fit="true">
		<ta:panel cols="3" key="查询条件" scalable="false">
			<ta:text id="str" key="模糊查询条件" />
			<ta:selectInput id="yae800" key="文件大类" collection="YAE800" />
			<ta:selectInput id="yae801" key="文件小类" collection="YAE801" />
		</ta:panel>
		<ta:panel span="3" fit="true" expanded="false" key="查询结果">
			<ta:datagrid id="swfFile" haveSn="true" fit="true" selectType="checkbox" onRowDBClick="fn_update">
				<%@ include file="/yhsi3/synthesis/swfFile/comm/swfList.jsp"%>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script> 
	$(document).ready(function(){
		$("body").taLayout();
		Base.focus("str"); 
	}); 
	
	//查看
	function fn_readFile(o){
		var param = {"dto['yae263']":o.yae263,"dto['yae274']":o.yae274};
		Base.openWindow("w_swfFileList","文件阅读>>" + o.yae803,"<%=basePath%>process/swfFile/swfFileShowAction!read.do",param,"1000","600",null,null,true);
	} 
	
    //查询
	function fn_query(){
		Base.submit('form1','swfFileUploadAction!query.do',null,null,false,null,null,true);
  	};
  	
  	//新增
	function fn_add(){
		Base.openWindow("fileInfo",">>文件新增","swfFileUploadAction!executeChild.do",null,"95%","90%",null,null,true);
  	};
  	
  	//删除
	function fn_delete(){
		var rows = Base.getGridSelectedRows("swfFile");
		var param={};
		if(""==rows){
			Base.alert("请您选择需要删除的文件!!");
			return;
		}
		param.selectList = Ta.util.obj2string(rows);
		Base.submit('form1','swfFileUploadAction!delete.do',param,null,false,null,null,true);
  	};
  	
  	//更新
	function fn_update(e,rowdata){
		Base.openWindow("fileInfo",">>文件更新","swfFileUploadAction!queryForEdit.do",{"dto['yae263']":rowdata.yae263,"dto['yae274']":rowdata.yae274},"95%","90%",null,null,true);
  	};
  	
  	// 帮助文档
  	function toHelp(){
		var param = {"dto['yae049']":Base.getValue("yae049")};
	    Base.openWindow("w_swfFileList",">>帮助文档","<%=basePath%>
	process/swfFile/swfFileShowAction!help.do", param, "1000", "600", null, null, true);
	};
</script>
<%@ include file="/ta/incfooter.jsp"%>