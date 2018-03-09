<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位注销申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeWinBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" asToolBarItem="true" />
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" onClick="verityHistorySuggestView();" display="false" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel fit="true" hasBorder="false">
			<ta:panel id="pnlUnitBase" key="单位基本信息" cols="3">
				<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			</ta:panel>
			<ta:text id="aaz002" display="false" />
			<ta:panel id="pnlCancell" key="单位变更信息" cols="3">
				<ta:selectInput id="aab100" key="变更类型" labelWidth="120" filter="06,09" reverseFilter="true" collection="aab100" required="true" onSelect="fnSetAae160" />
				<ta:selectInput id="aae160" key="变更原因" labelWidth="120" collection="aae160" filter="0060,0090" reverseFilter="true" required="true" readOnly="true" />
				<ta:date id="aae035" key="变更日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fn_checkTime()" />
				<ta:textarea id="aae013" span="3" key="备注" height="60" labelWidth="120" maxLength="200" />
			</ta:panel>

			<ta:tabs id="tbs_xzxx" fit="true">
				<ta:tab id="tb_cbxx" key="单位参保信息" cssStyle="overflow:auto">
					<ta:datagrid id="unitSIGrid" forceFitColumns="true" enableColumnMove="false" snWidth="30" haveSn="true" fit="true">
						<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" maxChart="12" />
						<ta:datagridItem id="aab033" key="征收方式" align="center" collection="AAB033" maxChart="8" />
						<ta:datagridItem id="aab050" key="参保日期" align="center" collection="AAB050" maxChart="8" dataAlign="center" />
						<ta:datagridItem id="aab051" key="参保状态" align="center" collection="AAB051" maxChart="8" />
						<ta:datagridItem id="yae097" key="最大做帐期号" align="center" maxChart="6" dataAlign="center" />
						<ta:datagridItem id="yab139" key="参保所属机构" align="center" maxChart="12" collection="YAB003" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="sjlcTb" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, null, 'aab001', 900, 200, 7, fn_getAb01, 1, false);
	});

	//单位信息回调函数
	function fn_getAb01() {
		if (g_Suggest != "") {
			Base.setValue('aab001', g_Suggest[1]);
			Base.submit("aab001", "unitCancellRegistAction!queryUnitInfo.do");
		}
	}
	//打开新的窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			Base.submit("aab001", "unitCancellRegistAction!queryUnitInfo.do");
		}, true);
	}
	//RPC方法调用
	function callRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}

	function fnSetAae160(key, value) {
		Base.submit('aab100', 'unitCancellRegistAction!toSetAae160.do');
	}

	//单位注销，流程跳转	
	function submitData() {
		var aae035 = Base.getValue("aae035"); //单位注销日期
		var rows = Base.getGridData("unitSIGrid"); //获取表格信息
		var isTimeout = false; //日期是否错误
		for (var i = 0; i < rows.length; i++) {
			if (rows[i].aab050.substring(0, 10) > aae035) {
				isTimeout = true;
			}
		}
		if (!isTimeout) {
			var param = {};
			param.gridList = Ta.util.obj2string(rows);
			Base.submit('form1', 'unitCancellRegistAction!toSave.do', param);
		} else {
			Base.alert("单位注销日期不能早于参保日期！", "warn");
		}

	}

	//注销时间不能大于系统日期
	function fn_checkTime() {
		var aae035 = Base.getValue("aae035");
		var otime = new Date();
		var year = otime.getFullYear();
		var month = otime.getMonth() + 1;
		var day = otime.getDate();
		if (month < 10) {
			month = "0" + month;
		}
		if (day < 10) {
			day = "0" + day;
		}
		var systime = year + "-" + month + "-" + day;
		if (aae035 > systime) {
			Base.alert("单位注销日期不能大于系统日期,请重新录入时间！", "warn");
			Base.setValue("aae035", "");
			Base.focus("aae035");
		}
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>