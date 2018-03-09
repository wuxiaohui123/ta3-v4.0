<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位欠费详细信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button id="bt" key="关闭" asToolBarItem="true" icon="xui-icon-spotClose" onClick="fnClose()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:tabs fit="true" id="tabsQianFei">
			<ta:tab key="欠费详细信息" id="tab1">
				<ta:datagrid id="datagrid1" fit="true" haveSn="true" groupingBy="aab001" columnFilter="true">
					<ta:datagridItem id="aaz083" key="当事人征缴计划ID" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" width="150" sortable="true" />
					<ta:datagridItem id="aaa115" key="应缴类型" collection="AAA115" align="center" dataAlign="left" width="80" sortable="true" />
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="120" sortable="true" />
					<ta:datagridItem id="yae591" key="退收类型" align="center" dataAlign="left" width="65" collection="YAE591"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="做账期号" align="center" width="80" sortable="true" dataAlign="center" />
					<ta:datagridItem id="aae003" key="对应费款所属期" align="center" width="120" sortable="true" dataAlign="center" />
					<ta:datagridItem id="dw" key="单位欠费" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="gr" key="个人欠费" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="hj" key="合计欠费" align="center" width="120" sortable="true" dataAlign="center" totals="sum" />
					<ta:datagridItem id="aab119" key="应缴人数" align="center" width="80" dataAlign="left" sortable="true" />
					<ta:datagridItem id="aab084" key="职工工资总额" align="center" width="100" sortable="true" dataAlign="right" />
					<ta:datagridItem id="aab120" key="个人缴费基数总额" align="center" width="130" sortable="true" dataAlign="right" />
					<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" width="70" sortable="true" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
	});
	function fnClose() {
		parent.Base.closeWindow("userwin");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>