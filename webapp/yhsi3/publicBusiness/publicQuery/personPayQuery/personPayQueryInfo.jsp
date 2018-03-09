<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人缴费明细信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body>
		<ta:form id="form" fit="true">
			<ta:toolbar id="tb">
	        	<ta:button id="bt" key="关闭" asToolBarItem="true" icon="xui-icon-spotClose" onClick="fnClose()"/>
			</ta:toolbar>
			<ta:panel id="fld3" key="人员缴费明细信息" fit="true" expanded="false" scalable="false">
				<ta:datagrid id="grjfmxInfo" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
				    <ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="12"></ta:datagridItem>
			    	<ta:datagridItem id="aaa093" key="承担缴费主体类型 " align="center" collection="AAA093" dataAlign="right" sortable="true" maxChart="8"></ta:datagridItem>
			    	<ta:datagridItem id="aae341" key="筹资项目 " align="center" collection="AAE341" dataAlign="right" sortable="true" maxChart="6"></ta:datagridItem>
			    	<ta:datagridItem id="yad001"  key="应处理金额" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="yad002"  key="已征集金额缴" align="center" dataAlign="right" sortable="true" maxChart="7" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="yad003"  key="实处理金额" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				</ta:datagrid> 
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnClose(){
		parent.Base.closeWindow("userwin");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>