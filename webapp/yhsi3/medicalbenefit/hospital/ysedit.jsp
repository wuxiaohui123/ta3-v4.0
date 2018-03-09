<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报销结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="regBtn" key="保存" icon="xui-icon-spotAdd" onClick="toSave()" />
		<ta:toolbarItem id="closeBtn" key="退出" icon="xui-icon-spotClose" onClick="closeWin()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlOld" key="原信息" cols="3">
			<ta:text id="akb020" key="医疗机构编号" readOnly="true" labelWidth="120" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" labelWidth="120" span="2" />
			<ta:text id="ykh301" key="医生编码" labelWidth="120" readOnly="true" />
			<ta:text id="ykh302" key="医生姓名" labelWidth="120" readOnly="true" />
			<ta:text id="aac002" key="身份证号" labelWidth="120" readOnly="true" />
			<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="120" readOnly="true" />
			<ta:date id="aac006" key="出生日期" labelWidth="120" readOnly="true" />
			<ta:selectInput id="lb" key="医师执业类别" collection="LB" labelWidth="120" readOnly="true" />
			<ta:date id="zjsj" key="执业证取得时间" labelWidth="120" readOnly="true" />
			<ta:text id="akf007" key="执业许可证号" labelWidth="120" readOnly="true" />
			<ta:text id="jszc" key="技术职称" labelWidth="120" readOnly="true" />
			<ta:date id="aae030" key="医师资格开始日期" labelWidth="120" readOnly="true" showSelectPanel="true" />
			<ta:date id="aae031" key="医师资格终止日期" labelWidth="120" readOnly="true" showSelectPanel="true" />
			<ta:text id="ykh201" key="科室编码" labelWidth="120" readOnly="true" />
			<ta:text id="ykh202" key="科室名称" labelWidth="120" readOnly="true" />
			<ta:text id="aae013" key="备注" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="aaz010" key="医师ID" labelWidth="120" readOnly="true" />
		</ta:panel>
		<ta:panel id="pnlCxtj" key="修改信息" cols="3">
			<ta:text id="akb020_n" key="医疗机构编号" labelWidth="120" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020_n'))" />
			<ta:text id="akb021_n" key="医疗机构名称" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="ykh301_n" key="医生编码" labelWidth="120" onChange="fn_checkykh301()" readOnly="true" />
			<ta:text id="ykh302_n" key="医生姓名" labelWidth="120" />
			<ta:text id="aac002_n" key="身份证号" labelWidth="120" validType="idcard" />
			<!-- <ta:text id="aac002_n" key="身份证号"  labelWidth="120" /> -->
			<ta:selectInput id="aac004_n" key="性别" collection="aac004" labelWidth="120" />
			<ta:date id="aac006_n" key="出生日期" labelWidth="120" showSelectPanel="true" />
			<ta:selectInput id="lb_n" key="医师执业类别" collection="LB" labelWidth="120" />
			<ta:date id="zjsj_n" key="执业证取得时间" labelWidth="120" showSelectPanel="true" />
			<ta:text id="akf007_n" key="执业许可证号" labelWidth="120" />
			<ta:text id="jszc_n" key="技术职称" labelWidth="120" />
			<ta:date id="aae030_n" key="医师资格开始日期" labelWidth="120" showSelectPanel="true" />
			<ta:date id="aae031_n" key="医师资格终止日期" labelWidth="120" showSelectPanel="true" />
			<ta:text id="ykh201_n" key="科室编码" labelWidth="120" />
			<ta:text id="ykh202_n" key="科室名称" labelWidth="120" />
			<ta:text id="aae013_n" key="备注" labelWidth="120" span="2" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("body").taLayout();
				initializeSuggestFramework(2, "", "akb020_n", 500, 300, 4,
						fn_getHospital, 0, false);
			});

	//获取医疗机构信息
	function fn_getHospital() {
		Base.getJson(myPath()
				+ "/medicalbenefit/common/baseInfoAction!getHospitalInfo.do", {
			"dto['akb020']" : Base.getValue("akb020_n")
		},//参数
		function(data) {//成功回调
			if (data.errMsg != null && data.errMsg != '') {
				Base.alert(data.errMsg);
				Base.setValue("akb020_n", "");
				return false;
			}
			if (data && data.hospitalInfoDto) {
				Base.setValue("akb021_n", data.hospitalInfoDto.akb021);
			}
		});
	}

	//校验ykh301
	function fn_checkykh301() {
		Base.submit('ykh301,ykh301_n,akb020,akb020_n',
				'physicianRegistrationAction!toCheckYkh301_n.do');
	}
	// 关闭窗口
	function closeWin() {
		parent.Base.closeWindow("win_edit");
	}

	//保存
	function toSave() {
		Base.submit("form1", "physicianRegistrationAction!toSaveEdit.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>