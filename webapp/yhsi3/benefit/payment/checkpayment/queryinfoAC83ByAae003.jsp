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
			    <ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('queryinfoAC83ByAae003');" asToolBarItem="true" />
			  </ta:buttonLayout>
 	    </ta:toolbar>
		<ta:form id="form" fit="true">
			<ta:panel id="PanelAC83" key="发放信息" fit="true">
				<ta:datagrid id="detailGrid" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true" onRowDBClick="QueryAC83Info" >
				    <ta:datagridItem id="aaz220" key="人员应付计划事件ID" align="center" dataAlign="center" hiddenColumn="true"/>
					<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="center" />
					<ta:datagridItem id="aae002" key="做账期号"  align="center" dataAlign="center"/>
					<ta:datagridItem id="aae003" key="款费所属期"  align="center" dataAlign="center"/>
					<ta:datagridItem id="aae019" key="金额" align="center" dataAlign="center" totals="sum" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function QueryAC83Info(e, rowdata){
		Base.openWindow("queryinfoAC83", ">>发放明细","checkPaymentAction!queryinfoAC83.do", {
			"dto['aaz220']" : rowdata.aaz220,
			"dto['aac001']" : rowdata.aac001,
			"dto['aae003']" : rowdata.aae003
			}, "95%", "90%", null, null, true);
		
	}	
	
	function fnClose(){
		parent.Base.closeWindow("queryinfoAC83ByAae003");
	}
	
	function clearData(){
		Base.clearGridDirty("detailGrid");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>