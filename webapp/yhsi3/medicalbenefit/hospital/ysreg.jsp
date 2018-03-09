<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医保医师注册经办信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="regBtn" key="保存" icon="xui-icon-spotAdd" onClick="toSave()" />
		<ta:toolbarItem id="closeBtn" key="退出" icon="xui-icon-spotClose" onClick="closeWin()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj" key="登记信息" cols="2">
			<ta:box cols="2">
				<ta:text id="akb020" key="服务机构编码" required="true" labelWidth="120" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
			</ta:box>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" labelWidth="120"/>
			<ta:text id="aaz263" key="医护人员ID" required="true" labelWidth="120" onChange="fn_checkaaz263()" />
			<ta:selectInput id="aaa027" key="统筹区" labelWidth="120" required="true" collection="YAB003" />
			<ta:text id="aac003" key="医护人员姓名" labelWidth="120" required="true" />
			<%@ include file="/yhsi3/medicalbenefit/common/checksfz.jsp"%>
			<ta:selectInput id="aac004" key="性别" readOnly="true" collection="aac004" labelWidth="120" required="true" />
			<ta:text id="aae005" key="联系电话" labelWidth="120" required="true" />
			<ta:selectInput id="aaf009" key="专业技术职务" labelWidth="120" required="true" collection="AAF009" />
			<ta:selectInput id="akc049" key="行政职务" labelWidth="120" required="true" collection="AKC049" />
			<ta:selectInput id="akc051" key="多点执业" labelWidth="120" required="true" collection="AKC051" />
			<ta:selectInput id="akc052" key="门诊大病医师" labelWidth="120" required="true" collection="AKC052" />
			<ta:selectInput id="akc053" key="医师服务资格状态" labelWidth="120" required="true" collection="AKC053" />
			<ta:text id="akc054" key="医师资格证编码" labelWidth="120" required="true" />
			<ta:text id="akc056" key="医师执业证编码" labelWidth="120" required="true" />
			<ta:text id="akc057" key="第一执业地点" labelWidth="120" required="true" />
			<ta:selectInput id="akc278" key="药师类别" labelWidth="120" required="true" collection="AKC278" />
			<ta:selectInput id="akc279" key="药师执业类别" labelWidth="120" required="true" collection="AKC279" />
			<ta:selectInput id="akc281" key="药师执业范围" labelWidth="120" required="true" collection="AKC281" />
			<ta:text id="akc282" key="药师资格证编号" labelWidth="120" required="true" />
			<ta:text id="akc283" key="药师注册证编号" labelWidth="120" required="true" />
			<ta:selectInput id="apa151" key="监控等级" labelWidth="120" required="true" collection="APA151" />
			<ta:text id="akf001" key="科室编码" labelWidth="120" required="true" />
			<ta:text id="akf002" key="科室名称" labelWidth="120" required="true" />
			<ta:text id="aae013" key="备注" labelWidth="120" span="2" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("body").taLayout();
			});
	// 关闭窗口
	function closeWin() {
		parent.Base.closeWindow("win_reg");
	}

	//校验aaz263
	function fn_checkaaz263() {
		Base.submit('aaz263,akb020','physicianRegistrationAction!toCheckAaz263.do');
	}

	//保存
	function toSave() {
		if (Base.validateForm("form1")) {
			Base.submit("form1", "physicianRegistrationAction!toSaveReg.do");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>