<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>maternityAfter</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认[P]" hotKey="P" asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">

		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<%@ include file="/yhsi3/workinjurybenefit/common/gssy_dw_info.jsp"%>

		</ta:panel>

		<!-- 录入工伤认定登记信息 -->
		<ta:panel id="sydjxx" key="产前登记信息" cols="3">
			<ta:text id="ymc031" key="产前中后期检查登记ID" display="false" />
			<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
			<ta:selectInput id="ymc027" key="检查类型" collection="YMC027" required="true" labelWidth="130" />
			<ta:date id="aae127" key="申请日期" validNowTime="left" required="true" showSelectPanel="true" labelWidth="130" />
			<ta:date id="amc020" key="检查时间" validNowTime="left" onChange="checkpayfor()" showSelectPanel="true" required="true" labelWidth="130" />
			<ta:text id="amc010" key="配偶姓名" labelWidth="130" />
			<ta:text id="aaz106" key="医疗机构编码" required="true" onChange="sfwQueryUtil(3,'getLa05',Base.getValue('aaz106')+',1'+','+Base.getValue('aae140'));" labelWidth="130" />
			<ta:text id="aae0441" key="医疗机构名称" readOnly="true" required="true" labelWidth="130" />
			<ta:number id="aae005" key="联系电话" max="9999999999999" labelWidth="130" />
			<ta:date id="aae235" key="就诊开始日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:date id="aae236" key="就诊终止日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />

		</ta:panel>
		<!-- 历史工伤申报列表，可修改或删除选中项 -->
		<ta:panel key="生育历史登记信息" id="lsdjxx">
			<ta:datagrid id="mc02Grid" haveSn="true" snWidth="20" forceFitColumns="true">
				<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
				<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" />
				<ta:datagridItem key="检查类型" id="ymc027" collection="ymc027" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" />
				<ta:datagridItem key="检查时间" id="amc020" align="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" />
				<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" width="120" />
				<ta:datagridItem key="配偶姓名" id="amc010" align="center" />
				<ta:datagridItem key="联系电话" id="aae005" align="center" />
				<ta:datagridItem key="就诊开始日期" id="aae235" align="center" width="120" />
				<ta:datagridItem key="就诊终止日期" id="aae236" align="center" width="120" />
				<ta:datagridItem key="单位ID" id="aab001" align="center" hiddenColumn="true" />
				<ta:datagridItem key="单位管理码" id="aab999" align="center" hiddenColumn="true" />
				<ta:datagridItem key="产前中后期检查登记ID" id="ymc031" align="center" hiddenColumn="true" />
				<ta:datagridItem key="业务日志ID" id="aaz002" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>

</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("form").css("overflow", "auto");
		initializeSuggestFramework(3, "la05", "aaz106", 300, 200, 2, fn_la05, 0, false);
	});
	function fn_la05() {
		Base.setValue("aaz106", g_Suggest[0]);
		Base.setValue("aae0441", g_Suggest[1]);
	};
	//回调函数查询初始化页面信息
	function fn_queryInfo() { //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset", "maternityBeforeAction!queryPersonInfo.do");
			validatepayfor(Base.getValue("aac001"), Base.getValue("aab001"), Base.getValue("amc020"));
		}
	}
	function fn_ab01Info() { //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
			validatepayfor(Base.getValue("aac001"), Base.getValue("aab001"), Base.getValue("amc020"));
		}
	}

	//检查日期检查缴费
	function checkpayfor() {
		validatepayfor(Base.getValue("aac001"), Base.getValue("aab001"), Base.getValue("amc020"));
	}

	//验证缴费信息
	function validatepayfor(aac001, aab001, amc020) {

		if (aac001 == "" || aab001 == "" || amc020 == "") {
			return false;
		}
		Base.submit("", "maternityBeforeAction!validatePayfor.do", {
			"dto['amc020']" : amc020,
			"dto['aab001']" : aab001,
			"dto['aac001']" : aac001
		});
	}

	//保存经办信息
	function submitData() {
		if (!Base.validateForm("form1")) {
			Base.hideMask();
			return false;
		}

		//操作选择
		var ymc031 = Base.getValue("ymc031");
		if (ymc031 != null && ymc031 != "") {
			if (!confirm("确认更新？")) {
				return false;
			}
		}

		Base.submit("form1", "maternityBeforeAction!toSave.do");
	}

	//修改认定信息
	function fnUpdate(data, e) {
		Base.setValue("ymc031", data.ymc031); //产前中后期检查登记ID
		Base.setValue("aae005", data.aae005); //联系电话
		Base.setValue("aae127", data.aae127); //申请日期
		Base.setValue("aaz106", data.aaz107); //定点医疗机构ID
		Base.setValue("aae0441", data.aae0441); //定点医疗机构名称
		Base.setValue("amc010", data.amc010); //配偶姓名
		Base.setValue("ymc027", data.ymc027); //检查类型
		Base.setValue("aae235", data.aae235); //就诊开始日期
		Base.setValue("aae236", data.aae236); //就诊终止日期
		Base.setValue("amc020", data.amc020); //计划生育手术或生育日期
		Base.setValue("aab001", data.aab001);
		Base.setValue("aae044", data.aae044);
		Base.setValue("aab999", data.aab999);
		Base.setValue("businessLogID", data.aaz002);
	}

	//删除认定信息
	function fnDelRow(data, e) {
		var ymc031 = data.ymc031;
		var row = data.row;
		Base.confirm("确认要删除?", function(btn, callback, options) {
			if (btn) {
				Base.submit("jbxxfset,procInc", "maternityBeforeAction!toSave.do", {"dto['ymc031']" : ymc031,"dto['yae587']" : "3"}, null, null, null);
			}
		});
	}

	function yhjb_syjztimepd() {
		var aae235 = Base.getValue("aae235");
		var aae236 = Base.getValue("aae236");

		if ((aae236 != null && aae236 != '') && (aae235 != null && aae235 != '')) {
			if (aae235 > aae236) {
				alert("就诊开始日期晚于就诊结束日期，请核实！")
				Base.setValue("aae236", "");
				Base.focus(aae236);
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
