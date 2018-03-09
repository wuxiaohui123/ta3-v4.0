<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗费用审理</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇核定[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认[P]" hotKey="P" asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:panel id="jbxxfset" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			<ta:text id="aaa121" display="false" />
		</ta:panel>

		<!-- 初始化信息 -->
		<ta:panel id="syxx" key="生育信息">
			<ta:datagrid id="syxxList" selectType="radio" onChecked="fnSyxxSelectChange" forceFitColumns="true">
				<ta:datagridItem key="单位id" id="aab001" align="center" hiddenColumn="true" />
				<ta:datagridItem key="费用来源" id="ymc036" collection="YMC036" align="center" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" />
				<ta:datagridItem key="医疗机构名称" id="yljgmc" align="center" width="120" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" />
				<ta:datagridItem key="生育手术或生育日期" id="amc020" align="center" width="140" />
				<ta:datagridItem key="检查类型" id="ymc027" collection="ymc027" />
				<ta:datagridItem key="生育类别" id="amc026" collection="AMC026" align="center" />
				<ta:datagridItem key="手术类别" id="ymc032" align="center" collection="YMC032" width="120" />
				<ta:datagridItem key="就诊开始日期" id="aae235" align="center" width="120" />
				<ta:datagridItem key="就诊终止日期" id="aae236" align="center" width="120" />
				<ta:datagridItem key="联系电话" id="aae005" align="center" />
				<ta:datagridItem key="并发症" id="ymc010" collection="SFBZ" align="center" />
				<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" />
				<ta:datagridItem key="产前中后期检查登记ID" id="ymc031" align="center" hiddenColumn="true" />
				<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>
		<ta:box cols="2">
			<ta:panel id="dyxxlr" key="待遇信息录入" height="150">
				<ta:fieldset id="dyxxfset" cssStyle="border:none;" cols="2">
					<ta:text key="生育待遇资格认定ID" id="amc238" display="false" />
					<ta:text key="产前中后期检查登记ID" id="ymc031" display="false" />
					<ta:text key="计划生育手术登记ID" id="ymc035" display="false" />

					<ta:selectInput key="费用来源" id="ymc036" collection="YMC036" readOnly="true" required="true" />
					<ta:date key="生育或手术日期" id="amc020" readOnly="true" required="true" />
					<ta:number key="实际医疗总费用" id="aae198" max="99999" asAamount="true" precision="2" onChange="getAAE187();" />
					<ta:number key="并发症金额" id="ymc009" max="99999" asAamount="true" precision="2" onChange="getAAE187();" display="false" />
					<ta:number key="自费金额" id="ake051" max="99999" asAamount="true" precision="2" onChange="getAAE187();" value="0" />
					<ta:number key="扣减金额" id="ymc008" max="99999" asAamount="true" precision="2" onChange="getAAE187();" value="0" />
					<ta:number key="基金支付金额" id="aae187" readOnly="true" required="true" />
					<ta:buttonLayout span="2">
						<ta:button key="确定" onClick="setDqdyxx();" />
						<ta:button key="重置" onClick="resetDyxxfset();" />
					</ta:buttonLayout>
				</ta:fieldset>
			</ta:panel>

			<ta:panel id="dqdyxx" key="当前待遇信息" height="150">
				<ta:datagrid id="dqdyxxGrid" fit="true" forceFitColumns="true">
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
					<ta:datagridItem key="费用来源" id="ymc036" collection="YMC036" showDetailed="true" />
					<ta:datagridItem key="生育或手术日期" id="amc020" align="center" />
					<ta:datagridItem key="基金支付金额" id="aae187" align="center" />
					<ta:datagridItem key="实际医疗总费用" id="aae198" align="center" />
					<ta:datagridItem key="自费金额" id="ake051" align="center" />
					<ta:datagridItem key="扣减金额" id="ymc008" align="center" />
					<ta:datagridItem key="并发症金额" id="ymc009" align="center" />

					<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" />
					<ta:datagridItem key="产前中后期检查登记ID" id="ymc031" align="center" hiddenColumn="true" />
					<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
				</ta:datagrid>
			</ta:panel>

		</ta:box>

		<ta:box id="paymentInfo">
			<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
		</ta:box>
		<ta:box cols="2">
			<ta:panel id="dqdyxx" key="当前待遇信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="hisdyxx" key="历史报销信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="hisdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
		</ta:box>

	</ta:form>
</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("form").css("overflow", "auto");
		fn_FfxxlrInitialization();
	});

	//人员RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("jbxxfset", "medicalCalculateAction!queryPersonInfo.do");
		}, true);
	}

	//回调函数
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset", "medicalCalculateAction!queryPersonInfo.do");
		}
	}

	//选择动作
	function fnSyxxSelectChange(rowsData, n) {
		if (rowsData == "") {
			return false;
		}

		Base.setValue("aae044", rowsData.aae044);
		Base.setValue("aab999", rowsData.aab999);
		Base.setValue("aab001", rowsData.aab001);
		Base.setValue("amc238", rowsData.amc238);
		Base.setValue("ymc031", rowsData.ymc031);
		Base.setValue("ymc035", rowsData.ymc035);
		Base.setValue("ymc036", rowsData.ymc036);
		Base.setValue("amc020", rowsData.amc020);

		//清空待遇情况
		Base.setValue("aae198", "0");
		Base.setValue("ymc009", "0");
		Base.setValue("ymc008", "0");
		Base.setValue("ake051", "0");
		Base.setValue("aae187", "0");
		if (rowsData.ymc010 == "1") {
			Base.showObj("ymc009");
		} else {
			Base.setValue("ymc009", "0");
			Base.hideObj("ymc009", false);
		}
	}

	function getAAE187() {
		var aae198 = Base.getValue("aae198");
		var ymc009 = Base.getValue("ymc009");
		var ymc008 = Base.getValue("ymc008");
		var ake051 = Base.getValue("ake051");
		if (aae198 == "") {
			return false;
		}
		if (ymc009 == "") {
			ymc009 = 0;
		}
		if (ake051 == "") {
			ake051 = 0;
		}
		if (ymc008 == "") {
			ymc008 = 0;
		}
		var aae187 = parseFloat(aae198) + parseFloat(ymc009) - parseFloat(ake051) - parseFloat(ymc008);
		Base.setValue("aae187", aae187);
	}

	function setDqdyxx() {
		if (!Base.validateForm("dyxxlr")) {
			Base.hideMask();
			return false;
		}

		var amc238 = Base.getValue("amc238");
		var ymc031 = Base.getValue("ymc031");
		var ymc035 = Base.getValue("ymc035");
		var comp = "";
		if (amc238 != "") {
			comp = amc238;
		} else if (ymc031 != "") {
			comp = ymc031;
		} else if (ymc035 != "") {
			comp = ymc035;
		}
		var gs = Base.getGridData("dqdyxxGrid");
		for (var i = 0; i < gs.length; i++) {
			if (comp == gs[i].amc238 || comp == gs[i].ymc031 || comp == gs[i].ymc035) {
				Base.alert("该待遇项已存在!", "warn");
				return false;
			}
		}
		Base.addGridRow("dqdyxxGrid", {
			"ymc036" : Base.getValue("ymc036"),
			"amc020" : Base.getValue("amc020"),
			"aae187" : Base.getValue("aae187"),
			"aae198" : Base.getValue("aae198"),
			"ake051" : Base.getValue("ake051"),
			"ymc008" : Base.getValue("ymc008"),
			"ymc009" : Base.getValue("ymc009"),
			"amc238" : Base.getValue("amc238"),
			"ymc031" : Base.getValue("ymc031"),
			"ymc035" : Base.getValue("ymc035")
		});
	}

	function resetDyxxfset() {
		//Base.clearData("dyxxfset");
		Base.setValue("aae198", "0");
		Base.setValue("ymc009", "0");
		Base.setValue("ake051", "0");
		Base.setValue("aae187", "0");
	}

	//删除认定信息
	function fnDelRow(data, e) {
		var row = data.row;
		Base.confirm("确认要删除?", function(flag) {
			if (flag) {
				Base.deleteGridRow("dqdyxxGrid", row);
			}
		});
	}

	//提交
	function submitData() {
		if (!Base.validateForm("ffxxlr")) {
			Base.hideMask();
			return false;
		}

		var sy = Base.getGridData("dqdyxxGrid");
		if (sy.length == 0) {
			Base.alert("找不到需要报销的信息!", "error");
			return false;
		}

		Base.submit("ffxxlr,jbxxfset", "medicalCalculateAction!toSave.do", {
			"dqdyxxGrid" : Ta.util.obj2string(sy)
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
