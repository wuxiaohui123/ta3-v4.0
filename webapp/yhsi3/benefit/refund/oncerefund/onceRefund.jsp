<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>一次性待遇特殊补退</title>
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
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:selectInput id="aae140" key="险种类型" collection="aae140" display="false" />
		<ta:panel id="flt_jbxx" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<ta:selectInput id="aac004" key="性别" readOnly="true" labelWidth="130" collection="AAC004" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="130" />
			<ta:date id="aac007" key="参加工作日期" readOnly="true" labelWidth="130" />
			<ta:text id="aae005" key="联系电话" readOnly="true" labelWidth="130" />
			<ta:text id="aaa076" key="待遇核定类型" display="false" />
			<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:text id="aae037" key="支付人员类别" display="false" />
			<ta:text id="aaz159" key="人员社会保险明细ID" display="false" />
			<ta:text id="aaz157" key="人员参保关系ID" display="false" />
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
		<ta:text id="time" key="开始年月" display="false" />
		<ta:panel id="flt_btxx" key="补退信息" height="150">
			<ta:datagrid id="ac61ListGrid" forceFitColumns="true" haveSn="true" fit="true">
				<ta:datagridItem id="del" key="删除" width="10" align="center" icon="xui-icon-spotDelete" click="fnDelDataitem" />
				<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="right" dataAlign="right" formatter="convertState">
					<ta:datagridEditor type="selectInput" data="Base.getJson('onceRefundAction!getAAA036.do',{\"dto['aae140']\":Base.getValue('aae140')});" />
				</ta:datagridItem>
				<ta:datagridItem id="aae129" key="补退金额" align="center" dataAlign="center" formatter="convertState">
					<ta:datagridEditor type="number" min="0" max="999999" precition="2" />
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="false" showButton="false" showDetails="false" showCount="false">
					<ta:gridToolButton id="addBtn" key="新增" icon="xui-icon-spotAdd" onClick="fnNewAdd()" />
				</ta:dataGridToolPaging>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		Base.filterSelectInput("aae145", "41", false);
		$("span.slick-pager-settings").css("float", "left");
		$("#addBtn").nextAll().css("display", "none");
		initializeSuggestFramework(1, null, "aac001", 800, 200, 7, fn_queryInfo, 1, false);
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aae140,aaa121,aaa076", "onceRefundAction!queryBaseInfo.do", null, null, null, null);
		}, true);
	}

	function fnDelDataitem(data, e) {
		Base.confirm("确认要删除?", function(btn, callback, options) {
			if (btn) {
				Base.deleteGridRow('ac61ListGrid', data.row);
			}
		});
	}

	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:center'>" + value + "</div>";
	}

	function fn_checkAc61Grid() {
		var modifiedData = Base.getGridData("ac61ListGrid");
		for (var i = 0; i < modifiedData.length; i++) {
			aaa036 = modifiedData[i].aaa036;
			if (aaa036 != "" && aaa036 != null && aaa036 != "<font color='red'>请选择待遇项</font>") {
				if (modifiedData[i].aae129 != 0) {
					continue;
				} else {
					Base.alert("补退金额为0,请确认！");
					return false;
				}
			} else {
				Base.alert("待遇项目为空或者没有改变");
				return false;
			}
		}
		return true;
	}

	// 保存经办信息
	function toSave() {
		if (fn_checkAc61Grid()) {
			var modifiedData = Base.getGridData("ac61ListGrid");//获取修改后的列表
			var prm = {};
			prm.d2List = Ta.util.obj2string(modifiedData);
			Base.submit("form1", "onceRefundAction!toSave.do", prm, null, null, function() {
				Base.setDisabled("to_save");
			});
		}
	}

	//新增
	function fnNewAdd() {
		var rows = Base.getGridData("ac61ListGrid");
		var newJson = [ {
			'aaa036' : '<font color=\'red\'>请选择待遇项</font>',
			'aae129' : '0'
		} ];
		rows.push(newJson[0]);
		Base._setGridData("ac61ListGrid", rows);
	}

	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aae140,aaa121,aaa076", "onceRefundAction!queryBaseInfo.do", null, null, null, null);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>