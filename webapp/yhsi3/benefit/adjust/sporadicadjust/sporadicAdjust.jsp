<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>零星调整</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="to_save" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		<ta:panel id="flt_jbxx" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentBaseInfo.jsp"%>
			<ta:text id="aaz257" display="false" labelWidth="130" key="享受定期待遇人员ID" />
		</ta:panel>
		<ta:panel id="ac79ListPanel" key="调整明细信息" bodyStyle="margin:0px" height="110px">
			<ta:datagrid id="ac79ListGrid" forceFitColumns="true">
				<ta:datagridItem id="aae140" key="险种类型" width="175px" collection="AAE140" hiddenColumn="true" />
				<ta:datagridItem id="aae177" key="调整方式" width="95px" collection="AAE177" />
				<ta:datagridItem id="aae043" key="开始年月" width="90px" formatter="convertState" align="right" dataAlign="right" />
				<ta:datagridItem id="aae044" key="结束年月" width="90px" formatter="convertState" align="right" dataAlign="right" />
				<ta:datagridItem id="aae176" key="调整数值" width="65px" formatter="convertState" align="right" dataAlign="right" />
				<ta:datagridItem id="aaa036" key="待遇项目" width="90px" collection="AAA036" />
				<ta:datagridItem id="aae192" key="调整前金额" width="75px" formatter="convertState" align="right" dataAlign="right" />
				<ta:datagridItem id="aae188" key="调整差额" width="75px" formatter="convertState" align="right" dataAlign="right" />
				<ta:datagridItem id="aae193" key="调整后金额" width="75px" formatter="convertState" align="right" dataAlign="right" />
				<ta:datagridItem id="aaa077" key="补扣发业务类型" width="105px" collection="AAA077" />
				<ta:datagridItem id="aae041" key="补退开始年月" width="90px" dataAlign="center" />
				<ta:datagridItem id="aae042" key="补退结束年月" width="90px" dataAlign="center" />
				<ta:datagridItem id="aae058" key="补退金额" width="65px" align="right" dataAlign="right" formatter="convertState" dataType="number" />
				<ta:datagridItem id="aae036" key="经办时间" width="145px" dataAlign="center" align="center" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="85px" />
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="ac61ListPanel" key="待遇信息" bodyStyle="margin:0px" height="250px">
			<ta:box cols="3">
				<ta:selectInput id="aaa036" collection="AAA036" labelWidth="130" key="待遇类别" />
				<ta:number id="aae019_xz" precision="2" key="金额" />
				<ta:button id="addBtn" key="新增待遇明细" onClick="fnNewAdd()" icon="xui-icon-spotAdd" />
			</ta:box>
			<ta:datagrid id="ac61ListGrid" forceFitColumns="true">
				<ta:datagridItem id="aaa036" key="待遇项目" width="320" collection="AAA036" align="right" dataAlign="right" />
				<ta:datagridItem id="aae019" key="待遇金额" width="320" align="right" dataAlign="right" totals="sum" />
				<ta:datagridItem id="aae176" key="调整金额" width="320" align="right" dataAlign="right" formatter="convertState" dataType="number">
					<ta:datagridEditor type="number" min="-99999" max="99999" precition="2" />
				</ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="flt_btxx" cols="3" key="调整条件" cssStyle="height:1000">
			<ta:selectInput id="aae177" required="true" collection="AAE177" labelWidth="130" cssStyle="color:red" key="调整类型" />
			<ta:date id="aae041" required="true" labelWidth="130" cssStyle="color:red" key="开始年月" showSelectPanel="true" issue="true" onChange="fn_checkAae212();" />
			<ta:date id="aae042" labelWidth="130" key="结束年月" showSelectPanel="true" issue="true" onChange="fn_checkAae212();" />
			<ta:selectInput id="yae230" required="true" collection="YAE230" labelWidth="130" cssStyle="color:red" key="是否产生补扣" value="1" />
			<ta:text id="aae161" required="true" labelWidth="130" key="调整原因" span="3" maxLength="200" />
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aae140", "sporadicAdjustAction!queryBaseInfo.do", null, null, null, null);
		}
	}

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aae140", "sporadicAdjustAction!queryBaseInfo.do", null, null, null, null);
		}, true);
	}

	//新增
	function fnNewAdd() {
		var aaa036 = Base.getValue("aaa036");
		var aae019_xz = Base.getValue("aae019_xz");
		if (aaa036 == '') {
			alert('请输入待遇类别!');
			Base.focus("aaa036");
			return false;
		}
		if (aae019_xz == '') {
			alert('请输入调整金额!');
			Base.focus("aae019_xz");
			return false;
		}
		Base.addGridRow("ac61ListGrid", {
			"aaa036" : Base.getValue("aaa036"),
			"aae019" : "0",
			"aae176" : Base.getValue("aae019_xz")
		});
	}

	//检查补退开始日期
	function fn_checkAae212() {
		var aae210 = Base.getValue("aae210");
		var aae212 = Base.getValue("aae212");

		if (aae212 < aae210) {
			Base.alert("调整开始年月不能小于待遇开始年月,请确认！", 'warn', function() {
				Base.setValue("aae212", "");
				Base.focus("aae212");
			});
		}
	}

	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}

	//检查补退结束日期
	function fn_checkAae212() {
		var aae210 = Base.getValue("aae210");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		if (aae041 == "" || aae041 == null) {
			Base.alert("调整开始年月不能为空,请确认！", 'warn', function() {
				Base.focus("aae041");
			});
			return false;
		} else if (aae041 < aae210) {
			Base.alert("调整开始年月不能小于待遇开始年月,请确认！", 'warn', function() {
				Base.setValue("aae041", "");
				Base.focus("aae041");
			});
			return false;
		} else if (aae042 != "" && aae041 > aae042) {
			Base.alert("开始年月不能大于结束年月年月,请确认！", 'warn', function() {
				Base.setValue("aae041", "");
				Base.focus("aae041");
			});
			return false;
		} else
			return true;
	}

	function fn_checkAc61Grid() {
		var modifiedData = Base.getGridModifiedRows("ac61ListGrid");
		var flag = 0;
		if (modifiedData == null || modifiedData == '') {
			Base.alert("调整金额为0,请确认！");
			return false;
		}
		for (var i = 0; i < modifiedData.length; i++) {
			if (modifiedData[i].aic142 != 0) {
				flag = 1;
				break;
			}
		}
		if (flag = 0) {
			Base.alert("调整金额为0,请确认！");
			return false;
		} else
			return true;
	}

	// 保存经办信息
	function toSave() {
		if (fn_checkAae212()) {
			var modifiedData = Base.getGridModifiedRows("ac61ListGrid");//获取修改后的列表
			var addData = Base.getGridAddedRows("ac61ListGrid");//获取新增的列表
			var prm = {};
			prm.d2List = Ta.util.obj2string(modifiedData);
			prm.d2ListAdd = Ta.util.obj2string(addData);
			Base.submit("form1", "sporadicAdjustAction!toSave.do", prm, null, null, function() {
				Base.setDisabled("to_save");
			});
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>