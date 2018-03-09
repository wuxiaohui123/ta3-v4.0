<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DEMO</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="查询[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="toTest();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:fieldset id="f1" cols="3">
			<ta:date id="data1" key="日期组件测试" showSelectPanel="true"></ta:date>
			<ta:date id="aae030" key="开始时间" showSelectPanel="true" labelWidth="120" />
			<ta:date id="aae031" key="结束时间" showSelectPanel="true" labelWidth="120" /> 
			<ta:selectInput id="aab022" key="行业代码"  islevel="true" isMustLeaf="true" collection="AAB022" maxVisibleRows="15"/>
			<ta:selectInput id="aab301" key="所属行政区代码" islevel="true" isMustLeaf="true" labelWidth="125" collection="AAB301" maxVisibleRows="15"/>
		</ta:fieldset>
		<ta:panel id="p1" key="员工信息表" fit="true">
		 <ta:datagrid id="dgEMP" fit="true" forceFitColumns="true" selectType="checkbox" haveSn="true" enableColumnMove="true">
		    <ta:datagridItem id="empno" key="EMPNO"/>
		    <ta:datagridItem id="ename" key="ENAME"/>
		    <ta:datagridItem id="job" key="JOB"/>
		    <ta:datagridItem id="mgr" key="MGR"/> 
		    <ta:datagridItem id="sal" key="SAL"/>
		    <ta:datagridItem id="comm" key="COMM"/>
		    <ta:datagridItem id="deptno" key="DEPTNO"/> 
		    <ta:dataGridToolPaging url="testCaseAction!toQuery.do" pageSize="10" submitIds="f1" 
		    sqlStatementName="emp.queryData" resultType="java.util.HashMap" />
		 </ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		
	});
	function toTest(){
		Base.clearGridData("dgEMP");
		Base.submit("f1,dgEMP","testCaseAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>