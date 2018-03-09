<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员RPC</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
	<ta:toolbar id="tlb">	   
		<ta:button id="queryBtn" icon="xui-icon-query" key="查询" onClick="fn_query()" asToolBarItem="true"/>
		<ta:button id="closeBtn" icon="xui-icon-spotClose" key="关闭" onClick="fn_close()" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:fieldset id="f0" cols="3">
			<ta:text id="aac001" key="个人ID" maxLength="20" labelWidth="120"/>
			<ta:text id="aac002" key="证件号码" maxLength="20" labelWidth="120"/>
			<ta:text id="aac003" key="姓名" maxLength="30" labelWidth="120"/>
			<ta:text id="aae140"  display="false" />
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true">
			<ta:datagrid id="dg15" forceFitColumns="true" onRowDBClick="fn_setData" fit="true">
				<ta:datagridItem id="aac002" key="公民身份号码" align="center" dataAlign="center" width="15"/>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" width="8"/>
				<ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="center" width="10"/>
				<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="center" width="5"/>
				<ta:datagridItem id="aac006" key="年龄" align="center" dataAlign="center" width="8"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();	
	});
	function fn_query(){
		Base.setValue('aae140',parent.Base.getValue('aae140'));
		if(Base.getValue('aac001') == '' &&
		   Base.getValue('aac002') == '' &&
		   Base.getValue('aac003') == ''){
			Base.msgTopTip('需最少输入一个查询条件');
			return;
		}
		Base.submit("form1", myPath()+"/process/synthesis/suggestFrameworkAction!getAac001DyAllList.do");
	}
	//关闭前对父界面需要的数据进行设值 
	function fn_setData(e, rowdata){
		parent.Base.setValue('aac001', rowdata.aac001);
		parent.Base.setValue('aac003', rowdata.aac003);
		parent.Base.setValue('aac004', rowdata.aac004);
		parent.Base.setValue('aac002', rowdata.aac002);
		parent.Base.setValue('aac006', rowdata.aac006);
		parent.Base.closeWindow("newRPCWindow");
	}
	function fn_close(){
	    parent.Base.closeWindow("newRPCWindow");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>