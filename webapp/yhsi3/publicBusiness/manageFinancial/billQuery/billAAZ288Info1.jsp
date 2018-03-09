<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center">
			<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('aaz288Listgr');" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:tabs fit="true">
		<ta:tab id="tab1" key="单位详细信息(双击查看单据详细信息)">
			<ta:datagrid id="aaz288Listdw" forceFitColumns="true" fit="true" haveSn="true" onRowDBClick="fnDBClick">
				<ta:datagridItem id="aaz288" key="征集单ID" align="center" dataAlign="center" />
				<ta:datagridItem id="aaz010" key="当事人编号" align="center" dataAlign="center" />
				<ta:datagridItem id="aae044" key="当事人名称" align="center" dataAlign="center" width="160" />
				<ta:datagridItem id="aae140" key="险种" collection="AAE140" align="center" dataAlign="center" />
				<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" />
				<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" />
				<ta:datagridItem id="aae201" key="缴费月数" align="center" dataAlign="center" />
				<ta:datagridItem id="dwjf" key="单位缴费" totals="sum" align="center" dataAlign="center" tatalsTextShow="false" />
				<ta:datagridItem id="grjf" key="个人缴费" totals="sum" align="center" dataAlign="center" tatalsTextShow="false" />
				<ta:datagridItem id="aae238" key="本金" totals="sum" align="center" dataAlign="center" tatalsTextShow="false" />
				<ta:datagridItem id="aae239" key="利息" totals="sum" align="center" dataAlign="center" tatalsTextShow="false" />
				<ta:datagridItem id="yad003" key="实处理金额" totals="sum" align="center" dataAlign="center" tatalsTextShow="false" />
			</ta:datagrid>
		</ta:tab>
		<ta:tab id="tab2" key="人员详细信息">
			<ta:datagrid id="aaz288Listgr" forceFitColumns="true" fit="true" haveSn="true">
				<ta:datagridItem id="aaz288" key="征集单ID" align="center" dataAlign="center" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" />
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" />
				<ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="center" width="120" />
				<ta:datagridItem id="yac084" key="性质" align="center" dataAlign="center" width="60" />
				<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" />
				<ta:datagridItem id="aaa115" key="应缴类型" align="center" dataAlign="center" collection="AAA115" width="120" />
				<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="center" collection="AAE140" width="120" />
				<ta:datagridItem id="aac040" key="月工资" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="aae180" key="月缴基数" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yad003" key="本月应缴" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwbl" key="单位缴费比率" align="center" dataAlign="center" width="120" />
				<ta:datagridItem id="dwjf" key="应缴" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="dwzzje" key="单位此次征集金额" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" maxChart="8" />
				<ta:datagridItem id="dwjdzje" key="单位已到账金额" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" maxChart="7" />
				<ta:datagridItem id="grbl" key="个人缴费比率" align="center" dataAlign="center" width="120" />
				<ta:datagridItem id="grjf" key="应缴" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="grzzje" key="个人此次征集金额" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" maxChart="8" />
				<ta:datagridItem id="grjdzje" key="个人已到账金额" align="center" dataAlign="center" totals="sum" tatalsTextShow="false" maxChart="7" />
				<ta:datagridItem id="dwhzbl" key="单位划账比率" align="center" dataAlign="center" width="120" />
				<ta:datagridItem id="grhzbl" key="个人划账比率" align="center" dataAlign="center" width="120" />
				<ta:datagridItem id="hrgrzh" key="划入个人账户" align="center" dataAlign="center" width="120" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="hrtc" key="划入统筹" align="center" dataAlign="center" width="120" totals="sum" tatalsTextShow="false" />
			</ta:datagrid>
		</ta:tab>
		<ta:tab id="tab3" key="征集详细信息">
			<ta:datagrid id="datagrid11" fit="true">
				<ta:datagridItem id="yae518" key="当事人核定ID" maxChart="5" />
				<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10" sortable="true" />
				<ta:datagridItem id="aaa115" key="应缴类型" collection="AAA115" showDetailed="true" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="6" sortable="true" />
				<ta:datagridItem id="yac084" key="离退休" align="center" maxChart="3" sortable="true" collection="YAC084" dataAlign="center" />
				<ta:datagridItem id="jf" key="缴费状态" align="center" dataAlign="left" maxChart="4" sortable="true" />
				<ta:datagridItem id="aae002" key="做账期号" align="center" maxChart="4" sortable="true" dataAlign="center" />
				<ta:datagridItem id="aae003" key="费款所属期" align="center" maxChart="5" sortable="true" dataAlign="center" />
				<ta:datagridItem id="aab119" key="人数" align="center" maxChart="2" dataAlign="left" sortable="true" totals="sum" tatalsTextShow="false" />
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
				<ta:datagridItem id="aab191" key="到账日期" align="center" maxChart="10" />
				<ta:datagridItem id="aae036" key="登帐经办时间" align="center" maxChart="10" />
			</ta:datagrid>
		</ta:tab>
	</ta:tabs>
</body>
</html>
<script type="text/javascript">
	//已缴金额表格列渲染
	function fnFormatterBlue(row, cell, value, columnDef, dataContext) {
		value = "<span style='color:blue;'>" + value + "</span>";
		columnDef.name = "<span style='color:blue;'>" + columnDef.name + "</span>";
		return value;
	}

	//欠缴金额表格列渲染
	function fnFormatterRed(row, cell, value, columnDef, dataContext) {
		value = "<span style='color:red;'>" + value + "</span>";
		return value;
	}

	function fnDBClick(e, rowdata) {
		Base.submit("", "unitInfoComQueryAction!toQueryZJD.do", {
			"dto['aaz288']" : rowdata.aaz288,
			"dto['aae140']" : rowdata.aae140,
			"dto['aab001']" : rowdata.aaz010
		});
		Base.activeTab("tab3");
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

