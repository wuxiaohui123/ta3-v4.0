<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:form id="form" fit="true">
			<ta:panel id="detail" hasBorder="false" fit="true" expanded="false" scalable="false">
				<ta:datagrid id="detailGrid" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aac001" key="人员ID" />
					<ta:datagridItem id="aac003" key="姓名" />
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="false" />
					<ta:datagridItem id="aae044" key="单位名称" />
					<ta:datagridItem id="aaa115" key="应缴类型" collection="AAA115" />
					<ta:datagridItem id="aac040" key="工资" />
					<ta:datagridItem id="aae180" key="人员缴费基数" />
					<ta:datagridItem id="aae002" key="做账期号" />
					<ta:datagridItem id="aae003" key="对应费款所属期" />
					<ta:datagridItem id="aae078" key="到账标志" collection="AAE078" /> 
					<ta:datagridItem id="aae079" key="到账年月" />
				</ta:datagrid>
			    <ta:panelButtonBar align="center">
					<ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('fileInfo');"/>
			    </ta:panelButtonBar>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function fnClose(){
		parent.Base.closeWindow("fileInfo");
	}
	
	function clearData(){
		Base.clearGridDirty("detailGrid");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>