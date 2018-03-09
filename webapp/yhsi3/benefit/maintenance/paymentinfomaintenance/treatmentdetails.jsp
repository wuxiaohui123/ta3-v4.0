<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<!-- class="no-scrollbar" -->
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center">
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:panel id="dymxlist" key="待遇明细信息" height="200">
		<ta:datagrid id="detailslist" forceFitColumns="true" fit="true">
			<!-- selectType="checkbox" onRowSelect="fn_fnSelect"   -->
			<ta:datagridItem id="aaa036" key="待遇类别" collection="aaa036" />
			<ta:datagridItem id="aae129" key="核发金额" totals="sum" dataType="Number" tatalsTextShow="false" formatter="convertState" totalsFormatter="fn_TotalsFormatter" align="right" dataAlign="right" />
		</ta:datagrid>
	</ta:panel>

</body>
</html>

<script type="text/javascript">
	function fn_fnSelect(rowsData) {
		var rowdata = Base.getGridSelectedRows("detailslist");
		var aaa036 = rowsData.aaa036;
		var j = 1;
		if (rowdata.length == 1) {
			Base.setSelectRowsByData("detailslist", [ {
				'aaa036' : aaa036
			} ]);
		} else {
			for (var i = 0; rowdata.length > i; i++) {
				if (rowdata[i].aaa036 != aaa036) {
					j = j + 1;
				}
			}
			if (j == 1) {
				Base.cancelCheckedRowsByArray("detailslist", [ {
					'aaa036' : aaa036
				} ]);
			} else {
				Base.setSelectRowsByData("detailslist", [ {
					'aaa036' : aaa036
				} ]);
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>

