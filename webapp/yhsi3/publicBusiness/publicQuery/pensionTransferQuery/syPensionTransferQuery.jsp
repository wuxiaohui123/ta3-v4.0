<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>失业转移统计</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="fn_queryInfo()" asToolBarItem="true" />
				<ta:button id="resetBtn" key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:date id="aae041" key="开始期号" issue="true" showSelectPanel="true" />
			<ta:date id="aae042" key="结束期号" issue="true" showSelectPanel="true" />
			<ta:text id="yab003" key="经办所属机构" display="false" />
		</ta:panel>
		<ta:panel id="syzy" key="失业转移情况" fit="true">
			<ta:datagrid id="dg_syzy" fit="true" onRowDBClick="fnClick" forceFitColumns="true">
				<ta:datagridItem id="zrrc" key="转入人次" align="center" dataAlign="right" />
				<ta:datagridItem id="zcrc" key="转出人次" align="center" dataAlign="right" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	//查询基本信息
	function fn_queryInfo() {
		var yab003 = Base.getValue("yab003");
		Base.submit("jstj", "syPensionTransferQueryAction!toQuery.do");
	}

	function fnClick() {
		var yab003 = Base.getValue("yab003");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		Base.openWindow("detailWindow", "失业转移详情", myPath() + "/process/publicBusiness/publicQuery/pensionTransferQuery/syPensionTransferQueryAction!queryDetail.do", {
			"dto['aae041']" : aae041,
			"dto['aae042']" : aae042,
			"dto['yab003']" : yab003
		}, "95%", "90%", null);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>