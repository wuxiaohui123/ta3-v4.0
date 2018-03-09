<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位工伤浮动率调整申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="ALT+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ALT+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">

			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="pnlUnitBase" key="单位基本信息" cols="3" expanded="false" scalable="false">
			<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
		</ta:panel>
		<ta:panel id="pnlGS" key="单位工伤保险信息" cols="3" expanded="false" scalable="false">
			<ta:selectInput id="aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" />
			<ta:date id="aab050" key="参保日期" showSelectPanel="true" labelWidth="120" readOnly="true" />
			<ta:selectInput id="aab033" key="征收方式" labelWidth="120" collection="AAB033" readOnly="true" />
			<ta:number id="yae097" key="最大做帐期号" labelWidth="120" readOnly="true" />
			<ta:selectInput id="aab051" key="单位参保状态" labelWidth="120" collection="AAB051" readOnly="true" />
			<ta:selectInput id="aab066" key="暂停缴费标志" labelWidth="120" collection="AAB066" readOnly="true" />
		</ta:panel>
		<ta:panel id="pnlChange" key="本次费率调整信息" cols="3" expanded="false" scalable="false">
			<ta:number id="yaa337" key="浮动比例" labelWidth="120" precision="4" max="1.0000" bpopTipMsg="浮动比例不能大于1" required="true" />
			<ta:date id="aae041" key="开始年月" labelWidth="120" showSelectPanel="true" issue="true" required="true" onChange="checkDate();" />
			<ta:date id="aae042" key="终止年月" labelWidth="120" showSelectPanel="true" issue="true" required="true" onChange="checkDate();" />
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab id="pnlPre" key="历史费率调整信息">
				<ta:datagrid id="gsGrid" fit="true" forceFitColumns="true" haveSn="true" snWidth="30">
					<ta:datagridItem id="aaz113" key="浮动费率参数ID" maxChart="8" align="center" />
					<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center" dataAlign="center" />
					<ta:datagridItem id="aae042" key="终止年月" maxChart="4" align="center" dataAlign="center" />
					<ta:datagridItem id="yaa337" key="浮动比例" maxChart="4" align="center" dataAlign="right" />
					<ta:datagridItem id="aae100" key="当前有效标志" maxChart="6" collection="AAE100" align="center" />
					<ta:datagridItem id="aae016" key="复核标志" maxChart="4" align="center" dataAlign="right" collection="AAE016" />
				</ta:datagrid>
			</ta:tab>

			<ta:tab key="事件流程记录" id="caseTab">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>

	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_getAb01, 1, false);
	});
	//单位信息回调函数
	function fn_getAb01() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.submit("aab001", "applyMWIFREAction!queryUnitInfo.do");
		}
	}
	//保存经办信息
	function toSave() {
		Base.submit("form1", "applyMWIFREAction!toSave.do");
	}
	//检查开始年月、终止年月的设置是否合理
	function checkDate() {
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		if (aae041 != "" && aae042 != "") {
			if (parseInt(aae041) <= parseInt(aae042)) {
			} else {
				Base.alert("开始年月不能大于终止年月!", "warn");
				Base.setValue("aae041", "");
				Base.setValue("aae042", "");
				Base.focus("aae041");
			}
		}
	}

	//打开新的窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			//Base.clearData("aab001");
			//Base.setValue("aab001", parent.getValue("aab001"));
			Base.submit("aab001", "applyMWIFREAction!queryUnitInfo.do");
		}, true);
	}
	//RPC方法调用
	function callRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>