<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员RPC查询窗口</title>
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
			<ta:text id="aac001" key="个人ID" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" labelWidth="120" />
			<ta:text id="aac003" key="姓名" labelWidth="120" />
			<ta:text id="aab001" key="单位ID" labelWidth="120" />
			<ta:text id="aab004" key="单位名称" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种" labelWidth="120" collection="AAE140" filter="310,340,390" reverseFilter="true"/>
			<ta:selectInput id="aaa027" key="统筹区" labelWidth="120" collection="AAA027" />
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true" scalable="true">
			<ta:datagrid id="ac01List" fit="true" forceFitColumns="true" haveSn="true" onRowDBClick="fn_setData">
				<ta:datagridItem id="aac001" align="center" dataAlign="center" key="个人ID" />
				<ta:datagridItem id="aac002" align="center" dataAlign="center" key="身份证号" />
				<ta:datagridItem id="aac003" align="center" dataAlign="center" key="姓名"  />
				<ta:datagridItem id="aae140" align="center" dataAlign="center" key="险种" collection="AAE140" />
				<ta:datagridItem id="yab139" align="center" dataAlign="center" key="所属统筹区" collection="YAB139" />
				<ta:datagridItem id="aab001" align="center" dataAlign="center" key="单位ID"  />
				<ta:datagridItem id="aab004" align="center" dataAlign="center" key="单位名称"  />
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
	    if(checkLastOne(['aac001','aac002','aac003','aab001','aab004','aae140','aaa027'])){
	       Base.alert("请至少录入一个查询条件",'warn');
	       return false;
	    }
	    
		Base.submit("frm_1",myPath()+"/medicalbenefit/common/baseInfoAction!getAc01List.do")
	}
	//关闭窗口
	function fn_close() {
		parent.Base.closeWindow("personwindow");
	}
	//双击行设置父页面数据
	function fn_setData(e,rowData) {
		parent.Base.setValue('aac001', rowData.aac001);
		parent.Base.setValue('aac003', rowData.aac003);
		parent.callbackFunPerson();
		fn_close();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
