<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AnnualAdjust</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="调整[S]" icon="xui-icon-spotSave" hotKey="S" onClick="Save();" asToolBarItem="true" />
		<ta:button id="initBtn" key="重置[B]" icon="xui-icon-spotReset" hotKey="B" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:box id="procInc">
		<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
	</ta:box>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">1
		<ta:panel id="prl1" key="调整信息录入" fit="false" height="230px">
			<ta:fieldset cssStyle="margin:5px;" cols="2" id="fieldest1" key="查询条件">
				<ta:selectInput id="aaa134" key="调整文号" />
			</ta:fieldset>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		<ta:panel id="prl2" key="待遇调整信息" fit="false" height="230px">
			<ta:fieldset cssStyle="margin:5px;" cols="2" id="fieldest2" key="调整信息">
				<ta:text id="tzrs" key="调整人数" readOnly="true" />
				<ta:text id="ljje" key="累积调整金额" readOnly="true" />
			</ta:fieldset>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	//重置所有数据
	function resetAll() {
		Base.resetForm('form1');
		Base.setEnable("saveBtn");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>