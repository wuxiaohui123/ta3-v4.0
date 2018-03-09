<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<ta:text id="aac001"  key="个人ID" labelWidth="120" display="false"/>
			<ta:text id="aaz217" key="人员就诊事件ID" display="false"/>
		</ta:box>
		<ta:panel id="panel1" key="费用明细信息" cssStyle="margin:5px;" fit="true">
			<ta:datagrid id="kc22List" fit="true" haveSn="true" forceFitColumns="true" columnFilter="true">
				<ta:datagridItem id="aaz231" key="社保三大目录ID" align="center" dataAlign="right" hiddenColumn="true" />
				<ta:datagridItem id="ake002" key="项目名称" align="center" dataAlign="center" />
				<ta:datagridItem id="akc226" key="数量" align="center" dataAlign="right" />
				<ta:datagridItem id="aae019" key="金额" align="center" dataAlign="right" totals="sum" />
				<ta:datagridItem id="aaz213" key="人员医疗费用明细ID" align="center" dataAlign="right" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	$("body").css("overflow","hidden");
});
//关闭窗口
function closeWin(){
	parent.Base.closeWindow('userwin');
}
</script>
<%@ include file="/ta/incfooter.jsp"%>
