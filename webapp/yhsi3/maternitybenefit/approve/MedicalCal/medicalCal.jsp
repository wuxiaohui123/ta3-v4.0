<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>medicalCal</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>

		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="单位编号" labelWidth="130" readOnly="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:selectInput id="ykc005" key="人员类型" collection="YKC005" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
		</ta:panel>
		<!-- 录入工伤认定登记信息 -->
		<ta:panel key="生育医疗费登记信息" id="lsdjxx">
			<ta:datagrid id="mc03Grid" haveSn="true" snWidth="20" forceFitColumns="true" selectType="radio" onChecked="fnSelectChange">
				<ta:datagridItem key="手术类别" id="ymc032" collection="YMC032" align="center" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" dataType="date" />
				<ta:datagridItem key="手术日期" id="amc020" align="center" dataType="date" />
				<ta:datagridItem key="生育津贴金" id="amc030" width="100" align="center" dataAlign="center" />
				<ta:datagridItem key="基金支付金额" id="aae187" width="100" align="center" dataAlign="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" />
				<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" width="120" />
				<ta:datagridItem key="联系电话" id="aae005" align="center" />
				<ta:datagridItem key="手术开始日期" id="aae235" align="center" dataType="date" width="120" />
				<ta:datagridItem key="手术结束日期" id="aae236" align="center" dataType="date" width="120" />
				<ta:datagridItem key="新农合已支付医疗费" width="120" id="yae150" align="center" dataAlign="center" />
				<ta:datagridItem key="个人编号" id="aac001" align="center" hiddenColumn="true" />
				<ta:datagridItem key="姓名" id="aac003" align="center" />
				<ta:datagridItem key="身份证号码" id="aac002" align="center" />
				<ta:datagridItem key="单位ID" id="aab001" align="center" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" />
				<ta:datagridItem key="单位类型" id="aab019" align="center" collection="AAB019" />
				<ta:datagridItem key="单位管理码" id="aab999" align="center" hiddenColumn="true" />
				<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
				<ta:datagridItem key="业务日志ID" id="aaz002" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>


		<!-- 隐藏值  start-->
		<ta:panel id="sydjxx" key="手术登记信息" hasBorder="false" cols="3" cssStyle="display:none">
			<ta:text id="ymc035" key="计划生育手术登记ID" display="false" />
			<ta:text id="aaz106" key="医疗机构编码" required="true" labelWidth="130" />
			<ta:text id="aae0441" key="医疗机构名称" required="true" labelWidth="130" />
			<ta:selectInput id="ymc032" key="手术类别" collection="YMC032" required="true" labelWidth="130" />
			<ta:date id="aae127" key="申请日期" validNowTime="left" required="true" showSelectPanel="true" labelWidth="130" />
			<ta:date id="amc020" key="手术日期" validNowTime="left" required="true" showSelectPanel="true" onChange="checkpayfor();yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="aae005" key="联系电话" max="9999999999999" labelWidth="130" />
			<ta:date id="aae235" key="就诊开始日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:date id="aae236" key="就诊结束日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="yae150" key="新农合已支付医疗费" required="true" asAamount="true" precision="2" labelWidth="130" />
		</ta:panel>
		<!-- 隐藏值  end-->

		<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>

		<ta:box cols="2">
			<ta:panel id="dqdyxx" key="当前待遇信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataType="date">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="hisdyxx" key="历史报销信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="hisdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//人员RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow14.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset", "medicalcalaction!queryPersonInfo.do");
		}, true);
	}

	//初始化布局

	//回调函数查询初始化页面信息
	function fn_queryInfo() { //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset", "medicalcalaction!queryPersonInfo.do");
		}
	}

	//选择动作
	function fnSelectChange(rowsData, n) {
		if (rowsData == "") {
			return false;
		} else {
			Base.setEnable("saveBtn");
		}

		Base.setValue("aae136", rowsData.aac002);
		Base.setValue("aae133", rowsData.aac003);
		Base.setValue("ymc035", rowsData.ymc035);
		Base.setValue("aaz106", rowsData.aaz107);
		Base.setValue("aae0441", rowsData.aae0441);
		Base.setValue("ymc032", rowsData.ymc032);
		Base.setValue("aae127", rowsData.aae127);
		Base.setValue("amc020", rowsData.amc020);
		Base.setValue("aae005", rowsData.aae005);
		Base.setValue("aae235", rowsData.aae235);
		Base.setValue("aae236", rowsData.aae236);
		Base.setValue("yae150", rowsData.yae150);
		Base.setValue("aab001", rowsData.aab001);
		Base.setValue("aae044", rowsData.aae044);
		Base.setValue("aab019", rowsData.aab019);
	}

	//提交
	function submitData() {
		if (!Base.validateForm("ffxxlr")) {
			Base.hideMask();
			return false;
		}

		Base.submit("form1", "medicalcalaction!toSave.do", null, null, null, function() {
			Base.setEnable("printBtn");
		});
	}
	
	//当选择支付对象为单位或机构时弹出窗口，在窗口中选择机构或单位   
	function fn_privateContorlYaz099() {
		var yaz099 = "";
		var aae140 = Base.getValue("aae140");
		var yad169 = Base.getValue("yad169");
		var aaz001 = Base.getValue("aab001");
		if (yad169 == "31" || yad169 == "21") {
			yaz099 = window.showModalDialog("<%=path%>/process/benefit/maintenance/paymentinfomaintenance/paymentInfoMaintenanceAction!selectUnitInfoWindow.do?aae140="
					+ aae140 + "&yad169=" + yad169 + "&aaz001=" + aaz001, null, 'dialogWidth:1000px;dialogHeight:500px;help:no;unadorned:no;resizable:no;toolbar=no;menubar=no;resizable=yes;location=no;status=no;scrollbars=no');
		}
	    return yaz099;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
