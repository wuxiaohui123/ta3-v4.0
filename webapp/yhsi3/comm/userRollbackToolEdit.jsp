<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密码验证</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="padding:0px;">
	<ta:form id="form1">
		<ta:fieldset id="flst" key="请输入校验码" cols="2">
			<ta:text id="jym" key="校验码" required="true" type="password" span="2" labelWidth="55" />
			<ta:text id="bz" type="password" display="false" />
			<ta:text id="jlcs" type="password" display="false" />
			<ta:buttonLayout id="tlb" span="2">
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="验证" onClick="checkMM()" asToolBarItem="true" />
				<ta:button id="btnClose" icon="xui-icon-spotClose" key="取消" onClick="checkCC()" asToolBarItem="true" />
			</ta:buttonLayout>
		</ta:fieldset>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function checkMM() {
		Base.submit("form1", myPath() + "/process/comm/priviRollbackToolAction!checkMM.do", null, false, false, function() {
			top._cbinfo123 = Base.getValue("bz");
			top._cbinfojlcs = Base.getValue("jlcs");
			top.Base.closeWindow("CBInfo");
		}, function() {
			Base.setValue("jym", "");
		});
	}
	
	function checkCC() {
		top.Base.closeWindow("CBInfo");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>