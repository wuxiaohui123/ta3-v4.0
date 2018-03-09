<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>BasicInfoMaintenanceCheck1</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="flt_jbxx" cols="3" key="基本信息" cssStyle="height:1000">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:text id="aac001" readOnly="true" labelWidth="130" key="人员ID" />
			<ta:text id="aac002" labelWidth="130" key="证件号码" maxLength="20" readOnly="true" validType="idcard" />
			<ta:text id="aac003" labelWidth="130" key="姓名" maxLength="30" readOnly="true" />
		</ta:panel>
		<ta:panel id="ac31a1Panel" key="上次变更信息" height="200px" bodyStyle="margin:0px">
			<ta:datagrid id="ac31a1Grid" fit="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aaz205" key="人员信息变更明细ID" hiddenColumn="false" width="115" align="center" dataAlign="right" />
				<ta:datagridItem id="aaz206" key="人员信息变更事件ID" hiddenColumn="false" width="115" align="center" dataAlign="right" />
				<ta:datagridItem id="aae155" key="变更项目" width="160" align="center" dataAlign="left" />
				<ta:datagridItem id="aae301" key="变更前值描述" width="160" align="center" dataAlign="left" />
				<ta:datagridItem id="aae123" key="变更前信息" width="160" align="center" dataAlign="left" />
				<ta:datagridItem id="aae302" key="变更后值描述" width="160" align="center" dataAlign="left" />
				<ta:datagridItem id="aae124" key="变更后信息" width="160" align="center" dataAlign="left" />
				<ta:datagridItem id="aae036" key="经办时间" width="160" dataAlign="center" align="center" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="160" align="center" dataAlign="left" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
	});

	function toSave() {
		Base.submit("form1", "paymentInfoMaintenanceCheck1Action!toSave.do", null, null, null, function() {
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>