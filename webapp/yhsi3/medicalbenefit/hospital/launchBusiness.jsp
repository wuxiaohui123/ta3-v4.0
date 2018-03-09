<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗开通支付类别</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="btnCancel" key="暂停[D]" icon="xui-icon-spotDelete" hotKey="D" onClick="toCancel()" />
		<ta:toolbarItem id="btnSave" key="开通[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fld_ddyljgxx" key="查询条件" cols="3">
			<ta:box cols="2">
				<ta:text id="akb020" key="服务机构编码" required="true" labelWidth="120" onChange="getKb01Info(query())" columnWidth="0.9" />
				<ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
			</ta:box>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="akb022" key="医疗机构类型" collection="AKB022" labelWidth="120" />
			<ta:selectInput id="akb097" key="医院等级" collection="AKB096" labelWidth="120" />
			<ta:selectInput id="aaa027" key="统筹区编码" collection="AAB034" labelWidth="120" readOnly="true" />
			<ta:text id="aae013" key="备注" labelWidth="120" span="2" bpopTipMsg="输入字符长度小于200" />
			<ta:date id="sysdate" display="false" />
			<ta:text id="akb020_hide" key="医疗机构编码(隐藏)" readOnly="true" display="false" />
			<ta:selectInput id="aaa027_local" key="当前统筹区编码" collection="AAB034" labelWidth="120" readOnly="true" display="false" />
		</ta:panel>
		<ta:box layout="border" layoutCfg="{leftWidth: 400,rightWidth: 300,noLeftCenterBorder:false}">
			<ta:panel id="pnlkb01Info" key="医疗机构信息(双击查询支付类别开通信息)" expanded="false" position="left" fit="true">
				<ta:datagrid id="kb01Info" haveSn="true" forceFitColumns="true" fit="true" snWidth="25" onRowDBClick="fnDBClick">
					<ta:datagridItem id="akb020" key="机构编号" align="center" width="80" showDetailed="true" />
					<ta:datagridItem id="akb021" key="机构名称" align="center" width="200" showDetailed="true" />
					<ta:datagridItem id="aaa027" key="统筹区" collection="AAB034"></ta:datagridItem>
					<ta:datagridItem id="akb022" key="医疗机构类型" collection="AKB022"></ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="panle1" expanded="false" key="已开通支付类别" position="center" fit="true">
				<ta:datagrid id="datagrid1" haveSn="true" forceFitColumns="true" fit="true" snWidth="25" selectType="checkbox">
					<ta:datagridItem id="aka130" key="医疗类别" collection="AKA130" align="center" showDetailed="true" />
					<ta:datagridItem id="yab003" key="统筹区" collection="AAB034" align="center" showDetailed="true" />
					<ta:datagridItem id="aae030" key="开始日期" dataType="date" dataAlign="center" align="center" showDetailed="true" />
					<ta:datagridItem id="aae031" key="结束日期" dataType="date" align="center" showDetailed="true" hiddenColumn="true" />
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnl" key="可开通支付类别" expanded="false" position="right" fit="true">
				<ta:datagrid id="dgInfo" haveSn="true" forceFitColumns="true" fit="true" selectType="checkbox" snWidth="25">
					<ta:datagridItem id="aka130" key="医疗类别" collection="AKA130" align="center" showDetailed="true" />
					<ta:datagridItem id="yab003" key="统筹区" collection="AAB034" align="center" showDetailed="true" />
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
		//查询数据库
	function query(){
		Base.resetForm('form1');
		Base.submit("akb020","modifyHospitalAction!queryHospital.do");
	}
	function callbackFunHos() {
		query();
	}
	//保存页面信息
	function toSave() {
		if (Base.validateForm("form1")) {
			var dgInfo = Base.getGridSelectedRows('dgInfo');
			if (dgInfo.length == 0) {
				Base.alert('请勾选要开通的支付类别', 'warn');
				return false;
			}
			var param = {};
			param.dgInfo = Ta.util.obj2string(dgInfo);
			Base.submit('fld_ddyljgxx', 'launchBusinessAction!save.do', param);
		}
	}

	//查询
	function toQuery() {
		Base.clearGridData("kb01Info");
		Base.clearGridData("datagrid1");
		Base.clearGridData("dgInfo");
		Base.submit('form1', 'launchBusinessAction!toQuery.do');
	}

	//双击行
	function fnDBClick(e, rowdata) {
		Base.clearGridData("datagrid1");
		Base.clearGridData("dgInfo");
		var akb020 = rowdata.akb020;
		Base.setValue('akb020_hide', akb020);//给隐藏的医疗机构编码赋值
		Base.setValue('akb020', akb020);
		Base.setValue('akb022', rowdata.akb022);
		Base.submit('', 'launchBusinessAction!queryInfo.do', {
			"dto['akb020']" : akb020,
			"dto['akb022']" : rowdata.akb022
		});
	}

	//暂停
	function toCancel() {
		var dgInfo = Base.getGridSelectedRows('datagrid1');
		if (dgInfo.length == 0) {
			Base.alert('请勾选要暂停的支付类别', 'warn');
			return false;
		}
		var param = {};
		param.dgInfo = Ta.util.obj2string(dgInfo);
		Base.submit('fld_ddyljgxx', 'launchBusinessAction!toCalcel.do', param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>