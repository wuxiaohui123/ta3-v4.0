<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊补发退发</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="to_save" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
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
		<ta:panel id="ac76ListPanel" key="补退明细信息">
			<ta:datagrid id="ac76ListGrid" forceFitColumns="true" height="100">
				<ta:datagridItem id="aae140" key="险种类型" width="185px" collection="AAE140" />
				<ta:datagridItem id="aaa077" key="补扣发业务类型" width="125px" collection="AAA077" />
				<ta:datagridItem id="aaa036" key="待遇项目" width="145px" collection="AAA036" />
				<ta:datagridItem id="aae041" key="补退开始年月" width="95px" dataAlign="center" />
				<ta:datagridItem id="aae042" key="补退结束年月" width="95px" dataAlign="center" />
				<ta:datagridItem id="aae129" key="补退金额" width="95px" totals="sum" align="right" dataAlign="right" formatter="convertState" dataType="number" />
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="ac61ListPanel" key="待遇信息">
			<ta:datagrid id="ac61ListGrid" forceFitColumns="true">
				<ta:datagridItem id="aaa036" key="待遇项目" width="320" collection="AAA036" align="right" dataAlign="right" />
				<ta:datagridItem id="aae019" key="待遇金额" width="320" align="right" dataAlign="right" totals="sum" />
				<ta:datagridItem id="aic142" key="补退金额" width="320" align="right" dataAlign="right" formatter="convertState" dataType="number">
					<ta:datagridEditor type="number" min="0" max="999999" precition="2" />
				</ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="flt_btxx" cols="3" key="补退信息">
			<ta:selectInput id="aaa077" required="true" collection="AAA077" labelWidth="130" cssStyle="color:red" key="补扣发业务类型" filter="14,24" reverseFilter="true" />
			<ta:date id="aae041" required="true" labelWidth="130" cssStyle="color:red" key="补退开始年月" showSelectPanel="true" issue="true" onChange="fn_checkAae041();" />
			<ta:date id="aae042" required="true" labelWidth="130" cssStyle="color:red" key="补退结束年月" showSelectPanel="true" issue="true" onChange="fn_checkAae042();" />
			<ta:text id="aae161" required="true" labelWidth="130" key="补扣发原因" span="3" maxLength="50" />
			<ta:selectInput id="flag" key="是否产生医疗代缴" labelWidth="130" required="true" collection="SFBZ" value="0" display="false" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aae140,aaa121", "specialRefundAction!queryBaseInfo.do", null, null, null, null);
		}, true);
	}

	//检查补退开始日期
	function fn_checkAae041() {
		var aae210 = Base.getValue("aae210");
		var aae041 = Base.getValue("aae041");
		if (aae041 < aae210) {
			Base.alert("补退开始年月不能小于待遇开始年月,请确认！", 'warn', function() {
				Base.setValue("aae041", "");
				Base.focus("aae041");
			});
		}
	}
	//检查补退结束日期
	function fn_checkAae042() {
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");

		if (aae041 != "" && aae041 != null && aae042 < aae041) {
			Base.alert("补退结束年月不能小于补退开始年月,请确认！", 'warn', function() {
				Base.setValue("aae042", "");
				Base.focus("aae042");
			});
		}
	}
	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}
	//检查补退结束日期
	function fn_checkAae041AndAae042() {
		var aae210 = Base.getValue("aae210");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");

		if (aae041 == "" || aae041 == null) {
			Base.alert("补退开始年月不能为空,请确认！", 'warn', function() {
				Base.focus("aae041");
			});
			return false;
		} else if (aae042 == "" || aae042 == null) {
			Base.alert("补退结束年月不能为空,请确认！", 'warn', function() {
				Base.focus("aae042");
			});
			return false;
		} else if (aae041 < aae210) {
			Base.alert("补退开始年月不能小于待遇开始年月,请确认！", 'warn', function() {
				Base.setValue("aae041", "");
				Base.focus("aae041");
			});
			return false;
		} else if (aae042 < aae041) {
			Base.alert("补退结束年月不能小于补退开始年月,请确认！", 'warn', function() {
				Base.setValue("aae042", "");
				Base.focus("aae042");
			});
			return false;
		} else
			return true;
	}

	function fn_checkAc61Grid() {
		var modifiedData = Base.getGridModifiedRows("ac61ListGrid");
		var flag = 0;
		if (modifiedData == null || modifiedData == '') {
			Base.alert("补退金额为0,请确认！");
			return false;
		}
		for (var i = 0; i < modifiedData.length; i++) {
			if (modifiedData[i].aic142 != 0) {
				flag = 1;
				break;
			}
		}
		if (flag = 0) {
			Base.alert("补退金额为0,请确认！");
			return false;
		} else
			return true;
	}
	//保存经办信息
	function toSave() {
		if (fn_checkAae041AndAae042() && fn_checkAc61Grid()) {
			var modifiedData = Base.getGridModifiedRows("ac61ListGrid");//获取修改后的列表
			var prm = {};
			prm.d2List = Ta.util.obj2string(modifiedData);
			Base.submit("form1", "specialRefundAction!toSave.do", prm, null, null, function() {
				Base.setDisabled("to_save");
			});

		}
	}

	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aae140,aaa121", "specialRefundAction!queryBaseInfo.do", null, null, null, null);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>