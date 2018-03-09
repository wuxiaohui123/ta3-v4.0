<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" 

"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医院医保医师注册</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询" icon="xui-icon-query" onClick="query()" />
		<ta:toolbarItem id="regBtn" key="医护人员登记" icon="xui-icon-spotAdd" onClick="toReg()" />
		<ta:button id="btnReset" key="重置" icon="xui-icon-spotReset" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" methord="post" enctype="multipart/form-data">
		<ta:panel id="pnlCxtj" key="查询条件" cols="3">
			<ta:box cols="2">
				<ta:text id="akb020" key="服务机构编码" required="true" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
			</ta:box>
			<ta:text id="akb021" key="机构名称" readOnly="true" />
			<ta:selectInput id="aae016" key="审批标志" collection="AAE016" selectFirstValue="true" value="1" />
			<ta:text id="aaz263" key="医护人员ID" />
			<ta:text id="aac003" key="医护人员姓名" />
			<ta:text id="aac002" key="身份证号" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004" />
			<ta:text id="akf002" key="科室名称" />
			<ta:selectInput id="aaf009" key="专业技术职务" collection="AAF009" />
			<ta:selectInput id="akc049" key="行政职务" collection="AKC049" />
			<ta:text id="akc056" key="医师执业证号" />
			<ta:text id="akc054" key="医师资格证号" />
			<ta:text id="akc282" key="药师资格证号" />
			<ta:text id="akc283" key="药师注册证号" />
			<ta:selectInput id="aaa027" key="统筹区" collection="YAB003" />
		</ta:panel>
		<ta:panel id="pnlZdjr" key="医院医保医护人员审批列表" fit="true">
			<ta:datagrid id="dg_zdjr" haveSn="true" fit="true">
				<ta:datagridItem id="edit" key="修改" width="50" align="true" icon="icon-edit" click="toEdit" />
				<ta:datagridItem id="aae016" key="审核标志" collection="AAE016" hiddenColumn="true" align="center" showDetailed="true" dataAlign="left" />
				<ta:datagridItem id="akb020" key="机构编号" align="center" showDetailed="true" maxChart="4" dataAlign="left" />
				<ta:datagridItem id="akb021" key="机构名称" align="center" showDetailed="true" maxChart="12" dataAlign="left" />
				<ta:datagridItem id="aka101" key="医院等级" align="center" showDetailed="true" maxChart="4" dataAlign="left" collection="akb096" />
				<ta:datagridItem id="aaz263" key="医护人员ID" align="center" showDetailed="true" maxChart="4" dataAlign="left" />
				<ta:datagridItem id="aac003" key="医护人员姓名" align="center" showDetailed="true" maxChart="4" dataAlign="left" />
				<ta:datagridItem id="akf001" key="科室编码" align="center" showDetailed="true" maxChart="4" dataAlign="left" />
				<ta:datagridItem id="akf002" key="科室名称" align="center" showDetailed="true" maxChart="12" dataAlign="left" />
				<ta:datagridItem id="aaf009" key="专业技术职务" align="center" showDetailed="true" maxChart="12" dataAlign="left" collection="AAF009" />
				<ta:datagridItem id="akc049" key="行政职务" align="center" showDetailed="true" maxChart="12" dataAlign="left" collection="AKC049" />
				<ta:datagridItem id="akc051" key="多点执业" align="center" showDetailed="true" maxChart="12" dataAlign="left" collection="AKC051" />
				<ta:datagridItem id="akc052" key="门诊大病医师" align="center" showDetailed="true" maxChart="12" dataAlign="left" collection="AKC052" />
				<ta:datagridItem id="akc053" key="医师医保服务资格状态" align="center" showDetailed="true" maxChart="12" dataAlign="left" collection="AKC053" />
				<ta:datagridItem id="akc056" key="医师执业许可证号" align="center" showDetailed="true" maxChart="8" dataAlign="left" />
				<ta:datagridItem id="akc054" key="医师资格证证号" align="center" showDetailed="true" maxChart="8" dataAlign="left" />
				<ta:datagridItem id="akc057" key="第一执业点" align="center" showDetailed="true" maxChart="8" dataAlign="left" />
				<ta:datagridItem id="akc278" key="药师类别" align="center" showDetailed="true" maxChart="8" dataAlign="left" collection="AKC278" />
				<ta:datagridItem id="akc279" key="药师执业类别" align="center" showDetailed="true" maxChart="8" dataAlign="left" collection="AKC279" />
				<ta:datagridItem id="akc281" key="药师执业范围" align="center" showDetailed="true" maxChart="8" dataAlign="left" collection="AKC281" />
				<ta:datagridItem id="akc282" key="药师资格证证号" align="center" showDetailed="true" maxChart="8" dataAlign="left" />
				<ta:datagridItem id="akc283" key="药师注册证证号" align="center" showDetailed="true" maxChart="8" dataAlign="left" />
				<ta:datagridItem id="aac002" key="身份证号" align="center" showDetailed="true" maxChart="10" dataAlign="left" />
				<ta:datagridItem id="aac004" key="性别" align="center" showDetailed="true" maxChart="2" dataAlign="left" collection="aac004" />
				<ta:datagridItem id="aae005" key="联系电话" align="center" showDetailed="true" maxChart="2" dataAlign="left" />
				<ta:datagridItem id="aae013" key="备注" align="center" showDetailed="true" maxChart="30" dataAlign="left" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" showDetailed="true" maxChart="8" dataType="date" dataAlign="left" />
				<ta:datagridItem id="aae011" key="经办人" align="center" showDetailed="true" maxChart="4" dataAlign="left" collection="aae011" />
				<ta:datagridItem id="apa151" key="监控等级" align="center" showDetailed="true" maxChart="4" dataAlign="left" collection="APA151" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//查询医师信息
	function query() {
		if (Base.validateForm("form1"))
			Base.submit("pnlCxtj",
					"physicianRegistrationAction!queryHospital.do");
	}

	// 审批保存
	function toSave() {
		var gridData = Base.getGridSelectedRows("dg_zdjr"); // 选中的医师数据
		var akc175 = Base.getValue("akc175_r"); // 审核标志
		if ("" == akc175 || null == akc175) {
			Base.alert("请选择审核标志!", "warn");
		} else if ("" == gridData || null == gridData) {
			Base.alert("请勾选需要审批的数据!", "warn");
		} else {
			Base.submit("form1,dg_zdjr",
					"physicianRegistrationAction!savekf33Info.do");
		}
	}
	// 登记
	function toReg() {
		var param = {};
		Base.openWindow(
						'win_reg',
						"医护人员登记",
						myPath()+ "/process/medicalbenefit/hospital/physicianRegistrationAction!toOpenReg.do",
						param, "85%", "75%", null, function() {
						}, true);
	}

	// 医师信息修改
	function toEdit(data,e) {
		var param = {};
		param["dto.akb020"] = data.akb020;
		param["dto.akb021"] = data.akb021;
		param["dto.aaz263"] = data.aaz263;
		param["dto.aac002"] = data.aac002;
		param["dto.aac003"] = data.aac003;
		param["dto.aac004"] = data.aac004;
		param["dto.aae005"] = data.aae005;
		param["dto.akf001"] = data.akf001;
		param["dto.akf002"] = data.akf002;
		param["dto.aaf009"] = data.aaf009;
		param["dto.akc049"] = data.akc049;
		param["dto.akc051"] = data.akc051;
		param["dto.akc052"] = data.akc052;
		param["dto.akc053"] = data.akc053;
		param["dto.akc054"] = data.akc054;
		param["dto.akc056"] = data.akc056;
		param["dto.akc057"] = data.akc057;
		param["dto.akc278"] = data.akc278;
		param["dto.akc279"] = data.akc279;
		param["dto.akc281"] = data.akc281;
		param["dto.akc282"] = data.akc282;
		param["dto.akc283"] = data.akc283;
		param["dto.apa151"] = data.apa151;
		param["dto.aae013"] = data.aae013;
		Base.openWindow(
						'win_edit',
						"医护人员信息修改",
						myPath()+ "/process/medicalbenefit/hospital/physicianRegistrationAction!toOpenEdit.do",
						param, "85%", "75%", null, function() {
						}, true);
	}

	//下载模版
	function fnDownload() {
		location.href = "physicianRegistrationAction!download.do";
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>