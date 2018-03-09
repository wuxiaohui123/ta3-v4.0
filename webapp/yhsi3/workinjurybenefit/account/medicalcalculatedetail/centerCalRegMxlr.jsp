 <%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>明细录入</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btns2">
		<ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose"  onClick="closeWIN()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	   <ta:box id="pnlReg" cols="5">
		   <ta:text id="aae011" key="经办人" display="false"/>
		   <ta:text id="aac001" key="人员ID"  readOnly="true" labelWidth="100" display="false"/>
		   <ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  readOnly="true" labelWidth="100" display="false" />
		   <ta:text id="akb020" key="医疗机构编码" readOnly="true"  labelWidth="100" display="false"/>
		   <ta:text id="aac003" key="姓名"  readOnly="true" labelWidth="100"/>
		   <ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2"  labelWidth="100"/>
		    <ta:date id="aae030" key="开始日期" labelWidth="100" readOnly="true"/>
			<ta:date id="aae031" key="结束日期" labelWidth="100" readOnly="true"/>
	   </ta:box>	   
	   <%@ include file="/yhsi3/workinjurybenefit/account/medicalcalculatedetail/kc22Lr.jsp"%>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function closeWIN(){
		parent.Base.setValue("aaz217",Base.getValue("aaz217"));
		parent.Base.closeWindow('createMedicalUseDetail');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>		