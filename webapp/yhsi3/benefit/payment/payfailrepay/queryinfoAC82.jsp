<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
	<ta:pageloading />
		<ta:toolbar id="tlb">
			 <ta:buttonLayout align="center">
			    <ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('queryinfoAC82A1');" asToolBarItem="true" />
			  </ta:buttonLayout>
 	    </ta:toolbar>
		<ta:form id="form" fit="true">
			<ta:panel id="PanelAC82" key="发放明细" fit="true" >
				<ta:datagrid id="detailGrid" fit="true" haveSn="true" forceFitColumns="true"  columnFilter="true" selectType="checkbox">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="center" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="center" sortable="true" hiddenColumn="false"/>
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="center"  sortable="true" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae019" key="金额" align="center" dataAlign="center" sortable="true" totals="sum"/>
					<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae010" key="银行账号" collection="AAE010" align="center" dataAlign="center"  sortable="true" width="180"/>
					<ta:datagridItem id="aaz220" key="人员应付计划事件ID" align="center" dataAlign="center"  sortable="true" hiddenColumn="false"/> 
				    <ta:dataGridToolPaging url="" pageSize="9999" selectExpButtons="1"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function fnClose(){
		parent.Base.closeWindow("queryinfoAC82");
	}
	
	function clearData(){
		Base.clearGridDirty("detailGrid");
	}	
	
</script>
<%@ include file="/ta/incfooter.jsp"%>