<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto">
		<ta:panel id="detail" key="组织信息" cols="3">
			<ta:fieldset span="3" cols="3">
				<ta:text id="aae140" key="险种类型" labelWidth="130" display="false" />
				<ta:text id="yad169" key="支付对象" labelWidth="130" display="false" />
				<ta:selectInput id="aaa033" key="当事人角色类型" labelWidth="130" collection="AAA033" required="true" readOnly="true" onSelect="QueryAe31Data" span="1" />
			</ta:fieldset>
			<ta:fieldset span="3" cols="3">
				<ta:text id="aaz001" key="组织编号" labelWidth="130" bpopTipMsg="组织名称、组织代码、组织ID" onChange="sfwQueryUtil(1,'getAab001',Base.getValue('aaz001'))" span="1" />
				<ta:text id="aae044" key="组织名称" labelWidth="130" readOnly="ture" span="2" />
			</ta:fieldset>
		</ta:panel>
		<ta:panel id="ae31Panel" key="组织发放信息(双击选择确认)" height="250px">
			<ta:datagrid id="ae31GridList" selectType="radio" onRowDBClick="fn_selectdata" forceFitColumns="true" fit="true">
				<ta:datagridItem id="aae145" key="支付方式 " collection="AAE145" align="center" dataAlign="left" width="100" />
				<ta:datagridItem id="aae136" key="领取人证件号" align="center" dataAlign="left" width="140" />
				<ta:datagridItem id="aae133" key="领取人姓名 " align="center" dataAlign="left" width="80" />
				<ta:datagridItem id="aaf002" key="代发银行类别" collection="AAF002" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="aaz009" key="代发机构名称" collection="AAZ009" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="aae009" key="户名" align="center" dataAlign="center" width="160" />
				<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="center" width="160" />
				<ta:datagridItem id="yaf012" key="开户银行类别" collection="AAF002" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="yaf013" key="开户银行编号" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="yaf001" key="开户银行名称" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="yaf011" key="银行同城异地标志" align="center" collection="YAF011" dataAlign="left" width="80" />
				<ta:datagridItem id="aae007" key="邮政编码" align="center" dataAlign="right" width="80" />
				<ta:datagridItem id="aae006" key="详细地址" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="aaz099" key="待遇展示ID" hiddenColumn="true" width="115" />
			</ta:datagrid>
			<ta:panelButtonBar align="center">
				<ta:button id="colseMe" icon="xui-icon-spotClose" key="关闭" onClick="closeMe()" />
			</ta:panelButtonBar>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, null, "aaz001", 700, 200, 3, fn_ab01Info, 1, false);
		var aae140 = Base.getValue("aae140");
		var yad169 = Base.getValue("yad169");
		if (yad169 != "21") {
			if (aae140 == "110" || aae140 == "120") {
				Base.filterSelectInput("aaa033", [ "030", "090", "091" ], true);
			} else if (aae140 == "210") {
				Base.filterSelectInput("aaa033", [ "030", "050", "060", "090", "091" ], true);
			} else if (aae140 == "410") {
				Base.filterSelectInput("aaa033", [ "010", "040" ], true);
			} else if (aae140 == "510") {
				Base.filterSelectInput("aaa033", [ "010", "040" ], true);
			}
		}
	});

	function fn_ab01Info() {
		Base.setValue("aaz001", g_Suggest[1]);
		Base.setValue("aae044", g_Suggest[2]);
		QueryAe31Data();
	}

	function fn_selectdata() {
		var rowdata = Base.getGridSelectedRows("ae31GridList");
		var yaz099 = rowdata[0].aaz099;
		parent.window.returnValue = yaz099
		window.close();
	}

	function QueryAe31Data() {
		Base.submit("form1", "paymentInfoMaintenanceAction!QueryAe31Data.do", null, null, null, function() {
		});
	}
	
	function closeMe() {
		window.close();
	}
	
	function sfwQueryUtil(instance,method,param,isCallBackFn) {
	    suggestQuery(instance,"<%=path%>/process/comm/suggestFrameworkAction!"+method+".do",{"dto['jstj']":param},isCallBackFn);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>