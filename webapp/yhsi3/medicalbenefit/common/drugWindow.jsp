<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>药品RPC查询窗口</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">	   
		<ta:button id="queryBtn" icon="xui-icon-query" key="查询" onClick="fn_query()" asToolBarItem="true"/>
		<ta:button id="closeBtn" icon="xui-icon-spotClose" key="关闭" onClick="fn_close()" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="frm_1" fit="true">
		<ta:fieldset id="f0" key="查询条件" cols="2">
			<ta:text id="aaz231" key="三大目录ID" labelWidth="120" maxLength="20"/>
			<ta:text id="ake001" key="三大目录编码" labelWidth="120" maxLength="20"/>
			<ta:text id="ake002" key="三大目录名称" labelWidth="120" maxLength="200"/>
			<ta:selectInput id="aka070" key="剂型" collection="AkA070" labelWidth="120"/>
			<ta:text id="aka061" key="通用中文名称" labelWidth="120" maxLength="200"/>
			<ta:text id="aka062" key="英文化学名" labelWidth="120" maxLength="50"/>
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true" scalable="true">
			<ta:datagrid id="ka02List" fit="true" forceFitColumns="true" haveSn="true" onRowDBClick="fn_setData">
				<ta:datagridItem id="aaz231" align="center" dataAlign="center" key="三大目录ID" />
				<ta:datagridItem id="ake001" align="center" dataAlign="center" key="三大目录编码" />
				<ta:datagridItem id="ake002" align="center" dataAlign="center" key="三大目录名称"  />
				<ta:datagridItem id="aka070" align="center" dataAlign="center" key="剂型" collection="AkA070" />
				<ta:datagridItem id="aka061" align="center" dataAlign="center" key="通用中文名称" collection="YAB139" />
				<ta:datagridItem id="aka062" align="center" dataAlign="center" key="英文化学名"  />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//查询方法
	function fn_query() {	
	    if(checkLastOne(['aaz231','ake001','aka070','ake002','aka061','aka062'])){
	       Base.alert("请至少录入一个查询条件",'warn');
	       return false;
	    }
	    
		Base.submit("frm_1",myPath()+"/medicalbenefit/common/baseInfoAction!getKa02Ka20List.do")
	}
	//关闭窗口
	function fn_close() {
		parent.Base.closeWindow("drugwindow");
	}
	//双击行设置父页面数据
	function fn_setData(e,rowData) {
		parent.Base.setValue('aaz231', rowData.aaz231);
		parent.Base.setValue('ake001', rowData.ake001);
		parent.Base.setValue('ake002', rowData.ake002);
		parent.Base.setValue('aka070', rowData.aka070);
		parent.Base.setValue('aka061', rowData.aka061);
		parent.Base.setValue('aka062', rowData.aka062);
		parent.Base.setValue('aae030', rowData.aae030);
		parent.Base.setValue('aae031', rowData.aae031);
		parent.Base.setValue('aka063', rowData.aka063);
		parent.Base.setValue('ake004', rowData.ake004);
		parent.Base.setValue('aka036', rowData.aka036);
		parent.Base.setValue('aka064', rowData.aka064);
		parent.Base.setValue('ake103', rowData.ake103);
		parent.callbackFunDrug();
		fn_close();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
