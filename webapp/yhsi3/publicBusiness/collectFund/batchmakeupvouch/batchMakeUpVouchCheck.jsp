<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位批量补差核定复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="frm" fit="true">

		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:toolbarItem id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="fnSave()" />
				<ta:toolbarItemSeperator />
				<ta:toolbarItem id="closeBtn" key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="closeWin();" />
			</ta:buttonLayout>
		</ta:toolbar>

		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>

		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次" />

		<ta:tabs height="410">
			<ta:tab id="tab_this" key="本次核定信息">
				<ta:datagrid id="dg_this" haveSn="true" fit="true" forceFitColumns="true">
					<%@include file="/yhsi3/commonJSP/hdxx.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_sjlcjl" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>

	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();

	});

	function closeWin() {
		parent.Base.closeWindow("userwin");
	}
	//保存审核信息
	function fnSave() {
		var rows = Base.getGridData('dg_this');
		var param = {};
		param.d2List = Ta.util.obj2string(rows);
		if ("" == rows) {
			Base.alert('没有需要审核的单位预缴信息！', 'warn');
		} else {
			Base.submit('frm', 'batchMakeUpVouchCheckAction!toSave.do', param);
			Base.setDisabled('btnSave');
		}
	}

	// 将数值格式化成金额形式
	function MoneyFormatter(row, cell, num, columnDef, dataContext) {

		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num))
			num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		cents = num % 100;
		num = Math.floor(num / 100).toString();
		if (cents < 10)
			cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
			num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
		return (((sign) ? '' : '-') + num + '.' + cents);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>