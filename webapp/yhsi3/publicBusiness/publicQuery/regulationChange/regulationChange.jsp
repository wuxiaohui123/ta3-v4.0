<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>增减变动信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:panel id="pnlJS" key="查询条件" cols="3" scalable="false">
			<ta:date id="start" key="开始年月" showSelectPanel="true" issue="true" />
			<ta:date id="end" key="结束年月" showSelectPanel="true" issue="true" />
			<ta:selectInput id="aae140" key="险种类型" collection="AAE140" filter="110,210,310,330,390,410,510" reverseFilter="true" />
			<ta:selectInput id="yab019" key="单位类型" collection="YAB019" />
			<ta:selectInput id="yab003" key="经办机构" collection="YAB003" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="单位变动情况">
				<ta:datagrid id="dwinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" onRowDBClick="fnClickDW">
					<ta:datagridItem id="yab019" key="单位类型" align="center" dataAlign="center" maxChart="8" collection="YAB019" />
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="center" maxChart="8" collection="AAE140" />
					<ta:datagridItem id="xzdw" key="新增单位数" align="center" dataAlign="center" maxChart="5" tatalsTextShow="false" totals="sum" />
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="center" maxChart="8" collection="YAB003" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="人员变动情况">
				<ta:datagrid id="ryinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" onRowDBClick="fnClickGR">
					<ta:datagridItem id="yab019" key="单位类型" align="center" dataAlign="center" maxChart="8" collection="YAB019" />
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="center" maxChart="8" collection="AAE140" />
					<ta:datagridItem id="xzrs" key="新增人数" align="center" dataAlign="center" maxChart="4" tatalsTextShow="false" totals="sum" />
					<ta:datagridItem id="hfjfrs" key="恢复缴费人数" align="center" dataAlign="center" maxChart="4" tatalsTextShow="false" totals="sum" />
					<ta:datagridItem id="zdrs" key="中断人数" align="center" dataAlign="center" maxChart="4" tatalsTextShow="false" totals="sum" />
					<ta:datagridItem id="zzrs" key="终止人数" align="center" dataAlign="center" maxChart="4" tatalsTextShow="false" totals="sum" />
					<ta:datagridItem id="bltxrs" key="办理退休人数" align="center" dataAlign="center" maxChart="6" tatalsTextShow="false" totals="sum" />
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="center" maxChart="8" collection="YAB003" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//查询
	function fnQuery() {
		Base.clearGridData("dwinfoGrid");
		Base.clearGridData("ryinfoGrid");
		Base.submit("pnlJS", "regulationChangeAction!toQuery.do");
	}

	//行双击事件
	function fnClickDW(e, rowdata) {
		Base.openWindow("dwInfo", "单位变动详情", myPath() + "/process/publicBusiness/publicQuery/regulationChange/regulationChangeAction!toDWEdit.do", {
			"dto['aae140']" : rowdata.aae140,
			"dto['yab019']" : rowdata.yab019,
			"dto['yab003']" : rowdata.yab003,
			"dto['start']" : rowdata.start,
			"dto['end']" : rowdata.end
		}, "95%", "90%", null, null, true);
	}
	//行双击事件
	function fnClickGR(e, rowdata) {
		Base.openWindow("grInfo", "人员变动详情", myPath() + "/process/publicBusiness/publicQuery/regulationChange/regulationChangeAction!toGREdit.do", {
			"dto['aae140']" : rowdata.aae140,
			"dto['yab019']" : rowdata.yab019,
			"dto['yab003']" : rowdata.yab003,
			"dto['start']" : Base.getValue("start"),
			"dto['end']" : Base.getValue("end")
		}, "95%", "90%", null, null, true);

	}
</script>
<%@ include file="/ta/incfooter.jsp"%>