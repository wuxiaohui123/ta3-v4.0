<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位台账信息详细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb1">
		<ta:button id="btnClose" key="关闭[C]" icon="xui-icon-spotClose" hotKey="c" asToolBarItem="true" onClick="fnClose()" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('dg_HDInfo');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form2" fit="true">
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="单位台账明细">
				<ta:datagrid id="datagrid2" fit="true" haveSn="true" forceFitColumns="true" onRowDBClick="dbClick">
					<ta:datagridItem id="yae518" key="当事人核定ID" align="center" maxChart="6" />
					<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="6" />
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" maxChart="10" />
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" maxChart="6" />
					<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084" align="center" maxChart="4" />
					<ta:datagridItem id="aae002" key="做账期号" align="center" maxChart="4" dataAlign="center" />
					<ta:datagridItem id="aae003" key="费款所属期" align="center" maxChart="5" dataAlign="center" />
					<ta:datagridItem id="aab119" key="人次" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="aab120" key="缴费基数" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="jfhj" key="应缴合计" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="yjhj" key="已缴合计" formatter="fnFormatterBlue" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="qjhj" key="欠缴合计" formatter="fnFormatterRed" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="dwjf" key="单位应缴" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="dwyj" key="单位已缴" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="dwqj" key="单位欠缴" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="grjf" key="个人应缴" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="gryj" key="个人已缴" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="grqj" key="个人欠缴" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="zhjf" key="账户应缴" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="zhyj" key="账户已缴" formatter="fnFormatterBlue" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="zhqj" key="账户欠缴" formatter="fnFormatterRed" align="center" maxChart="4" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="aae011" key="经办人" align="center" maxChart="4" collection="aae011" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" maxChart="6" sortable="true" dataAlign="right" />
					<ta:datagridItem id="aab191" key="到账日期" align="center" maxChart="6" sortable="true" />
					<ta:datagridItem id="aae036_dz" key="登帐经办时间" align="center" maxChart="6" sortable="true" />
					<ta:datagridItem id="yab003" key="经办机构" align="center" maxChart="10" collection="YAB003" />
					<ta:datagridItem id="aae013" key="备注" align="center" maxChart="6" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="核定人员明细">
				<ta:panel id="fld3" key="核定人员明细" fit="true" expanded="false" scalable="true">
					<ta:datagrid id="dg_HDInfo" haveSn="true" fit="true" columnFilter="true">
						<ta:datagridItem id="yae518" key="当事人核定ID" align="center" maxChart="6" />
						<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" width="80"></ta:datagridItem>
						<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" width="60"></ta:datagridItem>
						<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" width="150"></ta:datagridItem>
						<ta:datagridItem id="yac084" key="离退休标志" align="center" dataAlign="center" width="100" collection="YAC084"></ta:datagridItem>
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" width="100"></ta:datagridItem>
						<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" width="100"></ta:datagridItem>
						<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" dataType="Number" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" dataType="Number" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="jfhj" key="应缴合计" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="dwjfbl" key="单位缴费比例" align="center" dataAlign="right" maxChart="6"></ta:datagridItem>
						<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="grjfbl" key="个人缴费比例" align="center" dataAlign="right" maxChart="6"></ta:datagridItem>
						<ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="hzhbl" key="划账户比例" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
						<ta:datagridItem id="aae036_dz" key="登帐经办时间" align="center" maxChart="6" sortable="true" />
						<ta:datagridItem id="ykc005" key="参保类型" align="center" dataAlign="center" maxChart="5" collection="YKC005"></ta:datagridItem>
						<ta:datagridItem id="ykc006" key="人员类别" align="center" dataAlign="center" maxChart="5" collection="YKC006"></ta:datagridItem>
						<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="center" maxChart="2"></ta:datagridItem>
						<ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" align="center" dataAlign="center" maxChart="10"></ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//关闭编辑窗口
	function fnClose() {
		parent.Base.closeWindow("modifyWin");
	}

	//已缴金额表格列渲染
	function fnFormatterBlue(row, cell, value, columnDef, dataContext) {
		value = "<span style='color:blue;'>" + value + "</span>";
		return value;
	}

	//欠缴金额表格列渲染
	function fnFormatterRed(row, cell, value, columnDef, dataContext) {
		value = "<span style='color:red;'>" + value + "</span>";
		return value;
	}

	function dbClick(e, rowdata) {
		Base.submit("", "unitBillInfoQuery2Action!dbClick.do", {
			"dto['yae518']" : rowdata.yae518
		});
	}

	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有错误数据需要导出,请确认!", "warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>