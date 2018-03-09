<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊工种认定</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:text id="sysdate" key="系统时间" display="false" />
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%--@ include file="/xbpm/common/xbpmInc.jsp"--%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="aac012" readOnly="true" />
			<ta:date id="aac049" key="首次参保日期" labelWidth="130" readOnly="true" />
			<ta:date id="aac007" key="参加工作时间" labelWidth="130" readOnly="true" />
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		</ta:panel>
		<ta:panel id="rdxx" key="特殊工种年限信息（列表表头中带有铅笔符号的可编辑）" height="260">
			<ta:panelToolBar>
				<ta:button id="addBtn" key="新增特殊工种明细" onClick="fnNewAdd()" icon="xui-icon-spotAdd" />
			</ta:panelToolBar>
			<ta:datagrid id="dg_rdxx" dblClickEdit="true" forceFitColumns="true" haveSn="true" fit="true">
				<ta:datagridItem id="del" key="删除" width="40" icon="icon-application_form_delete" click="fnDelDataitem" />
				<ta:datagridItem id="aaz185" key="人员工作经历ID" align="center" dataAlign="center" hiddenColumn="false"></ta:datagridItem>
				<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" formatter="fn_yanzheng" width="80">
					<ta:datagridEditor type="number" />
				</ta:datagridItem>
				<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center" formatter="fn_yanzheng" width="80">
					<ta:datagridEditor type="number" />
				</ta:datagridItem>
				<ta:datagridItem id="yae599" key="月数" align="center" dataAlign="center" formatter="fnMounth"></ta:datagridItem>
				<ta:datagridItem id="aac019" key="特殊工种" align="center" dataAlign="center" width="150">
					<ta:datagridEditor type="selectInput" collection="aac019" />
				</ta:datagridItem>
				<ta:datagridItem id="aab004" key="单位名称" align="center" dataAlign="left" width="170">
					<ta:datagridEditor type="text" max="100" />
				</ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
	    $("span.slick-pager-settings").css("float", "left");
		$("#addBtn").nextAll().css("display", "none");
		/* var aaz002 = Base.getValue("aaz002") + "";
		if (aaz002 == "") {
			$("#rdxx").height($("#rdxx").height() + $("#procInc").height());
			$("#dg_rdxx").parent().height($("#rdxx").height() - 25);
			$("#dg_rdxx").height($("#rdxx").height() - 50);
			$($("#dg_rdxx")[0].childNodes[1]).height(0);
			$($("#dg_rdxx")[0].childNodes[2]).height(0);
			$($("#dg_rdxx")[0].childNodes[3]).height($("#dg_rdxx").height() - 30);
		} */
		$("[id*='aae042'] span").css("color", "red");
		$("[id*='aae041'] span").css("color", "red");
		$("[id*='aac019'] span").css("color", "red");
		$("[id*='aab004'] span").css("color", "red"); 
	});

	// 打开查询个人信息页面
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}

	// 查询个人信息回调函数
	function fn_setRyData() {
		var aac001 = Base.getValue("aac001");
		var aae140 = Base.getValue("aae140");
		Base.submit("", "tsgzrdAction!queryBaseInfo.do", {
			"dto['aac001']" : aac001,
			"dto['aae140']" : aae140
		});
	}

	function fn_yanzheng(row, cell, value, columnDef, dataContext) {
		var pattern = /^\d{4}(0[1-9]{1}|1[0-2]{1})$/;
		if (value != "") {
			if (!pattern.test(value)) {
				Base.alert("月份格式错误(例：201212)", "warn");
				value = "";
				return value;
			} else {
				var nowtime = new Date();
				var year = nowtime.getFullYear();
				var mouth = nowtime.getMonth() + 1;
				var cgsj = Base.getValue("aac007") + "";
				if (parseInt(value) > (year * 100 + mouth)) {
					Base.alert("日期不能大于当前日期！", "warn");
					value = "";
					return value;
				}
				if (parseInt(value) < cgsj) {
					Base.alert("开始时间不能小于参工时间！", "warn");
					dataContext.aae041 = "";
					return dataContext.aae041;
				}
			}
			return value;
		}
		return value;
	}

	//删除按钮
	function fnDelDataitem(data, e) {
		Base.confirm("确认要删除?", function(btn, callback, options) {
			if (btn) {
				Base.deleteGridRow('dg_rdxx', data.row);
			}
		});
	}

	//新增
	function fnNewAdd() {
		var rows = Base.getGridData("dg_rdxx");
		var newJson = [ {
			'aaz185' : '',
			'aae041' : '',
			'aae042' : '',
			'yae599' : '',
			'aae044' : ''
		} ];
		rows.push(newJson[0]);
		Base._setGridData("dg_rdxx", rows);
	}

	//获取总月数
	function fnMounth(row, cell, value, columnDef, dataContext) {
		var start = dataContext.aae041 + "";
		var end = dataContext.aae042 + "";
		if (start != '') {
			if (end != '') {
				var nowtime = new Date();
				var year = nowtime.getFullYear();
				var mouth = nowtime.getMonth() + 1;
				start = parseInt(start.substr(0, 4)) * 12 + parseInt(start.substr(4, 2));
				end = parseInt(end.substr(0, 4)) * 12 + parseInt(end.substr(4, 2));
				if (parseInt(start) > (year * 12 + mouth)) {
					value = "";
					return value;
				}
				if (parseInt(end) > (year * 12 + mouth)) {
					value = "";
					return value;
				}
				if (start > end) {
					value = "";
					return value;
				}
				var m = Math.abs(end - start) + 1;
				value = m;
				return value;
			}
			value = "";
			return value;
		}
		value = "";
		return value;
	}

	//查询基本信息
	function fn_queryInfo() {
		var aac001 = g_Suggest[2];
		var aae140 = Base.getValue("aae140");
		Base.submit("", "tsgzrdAction!queryBaseInfo.do", {
			"dto['aac001']" : aac001,
			"dto['aae140']" : aae140
		});
	}

	function submitData() {
		var modifiedData = Base.getGridData("dg_rdxx");
		var prm = {};
		prm.ac19List = Ta.util.obj2string(modifiedData);
		Base.submit("form1", "tsgzrdAction!toSave.do", prm, null, null, function(data) {
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>