<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构RPC查询窗口</title>
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
			<ta:text id="akb020" key="服务机构编号" labelWidth="120" />
			<ta:text id="akb021" key="服务机构名称" labelWidth="120" />
			<ta:selectInput id="akb022" key="服务机构类型" labelWidth="120" collection="AKB022" />
			<ta:selectInput id="aka101" key="医院等级" labelWidth="120" collection="AKA101" />
			
			<ta:text id="typeValue" key="类型" labelWidth="120" display="false"/>
		</ta:fieldset>
		<ta:panel id="p0" key="查询结果" fit="true" scalable="true">
			<ta:datagrid id="kb01" fit="true" forceFitColumns="true" haveSn="true" onRowDBClick="fn_setData">
				<ta:datagridItem id="akb020" align="center" dataAlign="center" key="服务机构编号" />
				<ta:datagridItem id="akb021" align="center" dataAlign="center" key="服务机构名称" />
				<ta:datagridItem id="akb022" align="center" dataAlign="center" key="服务机构类型" collection="AKB022" />
				<ta:datagridItem id="aka101" align="center" dataAlign="center" key="医院等级" collection="AKA101" />
				<ta:datagridItem id="akb023" align="center" dataAlign="center" key="服务机构类别" collection="AKB023" />
				<ta:datagridItem id="aaa027" align="center" dataAlign="center" key="所属统筹区" collection="AAA027" />
				<ta:datagridItem id="akd100" align="center" dataAlign="center" key="机构分类" collection="AKD100" />
				<ta:datagridItem id="akb301" align="center" dataAlign="center" key="主机构编码" />
				<ta:datagridItem id="aaz269" align="center" dataAlign="center" key="医疗机构及药店ID" hiddenColumn="true"/>
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
	    if(checkLastOne(['akb020','akb021','akb022','aka101'])){
	       Base.alert("请至少录入一个查询条件",'warn');
	       return false;
	    }
		Base.submit("frm_1",myPath()+"/medicalbenefit/common/baseInfoAction!getkb01List.do")
	}
	//关闭窗口
	function fn_close() {
		parent.Base.closeWindow("hoswindow");
	}
	//双击行设置父页面数据
	function fn_setData(e,rowData) {
	    var typeValue = Base.getValue("typeValue");
	    Base.alert(typeValue);
	    if("1" == typeValue){
	        parent.Base.setValue('akb020_1', rowData.akb020);
			parent.Base.setValue('akb021_1', rowData.akb021);
			parent.Base.setValue('aka101_1', rowData.aka101);
	    }else if("2" == typeValue){
	        parent.Base.setValue('akb020_2', rowData.akb020);
			parent.Base.setValue('akb021_2', rowData.akb021);
			parent.Base.setValue('aka101_2', rowData.aka101);
	    }else if("3" == typeValue){
	        parent.Base.setValue('akb020_3', rowData.akb020);
			parent.Base.setValue('akb021_3', rowData.akb021);
			parent.Base.setValue('aka101_3', rowData.aka101);
	    }else if("4" == typeValue){
	        parent.Base.setValue('akb020_4', rowData.akb020);
			parent.Base.setValue('akb021_4', rowData.akb021);
			parent.Base.setValue('aka101_4', rowData.aka101);
	    }else if("5" == typeValue){
	        parent.Base.setValue('akb020_5', rowData.akb020);
			parent.Base.setValue('akb021_5', rowData.akb021);
			parent.Base.setValue('aka101_5', rowData.aka101);
	    }else if("6" == typeValue){
			parent.Base.setValue('akb041', rowData.akb020);
			parent.Base.setValue('akb021', rowData.akb021);
			parent.Base.setValue('akb097', rowData.aka101);
	    }else if("7" == typeValue){
			parent.Base.setValue('ake017', rowData.akb020);
			parent.Base.setValue('akc172', rowData.akb021);
			parent.Base.setValue('aka101', rowData.aka101);
	    }else{
	        parent.Base.setValue('akb020', rowData.akb020);
			parent.Base.setValue('akb021', rowData.akb021);
			parent.Base.setValue('akb022', rowData.akb022);
			parent.Base.setValue('aka101', rowData.aka101);
			parent.Base.setValue('akb023', rowData.akb023);
			parent.Base.setValue('aaa027', rowData.aaa027);
			parent.Base.setValue('akd100', rowData.akd100);
			parent.Base.setValue('akb301', rowData.akb301);
			parent.callbackFunHos();
	    }
		fn_close();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
