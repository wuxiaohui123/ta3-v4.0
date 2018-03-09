<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保信息校验查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="query()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel0" key="查询条件" expanded="false" cols="3">
			<ta:selectInput id="aab066" key="暂停缴费标志" labelWidth="150" collection="AAB066" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="单位参保信息">
				<ta:datagrid id="list1" fit="true" haveSn="true" snWidth="40">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="6" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="20" showDetailed="true" sortable="true" />
					<ta:datagridItem id="cbxx" key="参保信息" align="center" dataAlign="left" maxChart="35" collection="AAB051" showDetailed="true" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" maxChart="14" collection="YAB003" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
	});
	function query() {
		Base.submit("panel0", "unitCBInfoCheckAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>