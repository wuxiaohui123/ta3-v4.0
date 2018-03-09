<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位RPC查询窗口</title>
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
			<ta:text id="aab001" key="单位ID" labelWidth="120" maxLength="20"/>
			<ta:text id="aab999" key="单位管理码" labelWidth="120" maxLength="20"/>
			<ta:text id="aab003" key="单位名称" labelWidth="120" maxLength="200"/>
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="120"/>
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true" scalable="true">
			<ta:datagrid id="ab01List" fit="true" forceFitColumns="true" haveSn="true" onRowDBClick="fn_setData">
				<ta:datagridItem id="aab001" align="center" dataAlign="center" key="单位ID" />
				<ta:datagridItem id="aab999" align="center" dataAlign="center" key="单位管理码" />
				<ta:datagridItem id="aab003" align="center" dataAlign="center" key="单位名称"  />
				<ta:datagridItem id="aab019" align="center" dataAlign="center" key="单位类型" collection="AAB019"/>
				<ta:datagridItem id="aab020" align="center" dataAlign="center" key="经济类型" />
				<ta:datagridItem id="aab021" align="center" dataAlign="center" key="隶属关系" />
				<ta:datagridItem id="yab019" align="center" dataAlign="center" key="单位管理类型" />
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
	    if(checkLastOne(['aab001','aab999','aab003','aab019'])){
	       Base.alert("请至少录入一个查询条件",'warn');
	       return false;
	    }
		Base.submit("frm_1",myPath()+"/medicalbenefit/common/baseInfoAction!getAb01List.do")
	}
	//关闭窗口
	function fn_close() {
		parent.Base.closeWindow("ogniwindow");
	}
	//双击行设置父页面数据
	function fn_setData(e,rowData) {
		parent.Base.setValue('aab001', rowData.aab001);
		parent.Base.setValue('aab003', rowData.aab003);
		parent.Base.setValue('aab019', rowData.aab019);
		parent.Base.setValue('aab020', rowData.aab020);
		parent.Base.setValue('aab021', rowData.aab021);
		parent.Base.setValue('aab065', rowData.aab065);
		parent.Base.setValue('aab999', rowData.aab999);
		parent.Base.setValue('yab019', rowData.yab019);
		parent.callbackFunOgni();
		fn_close();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
