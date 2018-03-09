<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<ta:panel id="f" fit="true" cssStyle="overflow-y:scroll;" hasBorder="false">
	<ta:toolbar id="tlb">
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:panel id="panel1" key="待转金余额" height="70px" bodyStyle="margin:0px">
		<ta:datagrid id="ae28GridDeatil" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true">
			<ta:datagridItem id="aaa028" key="当事人类别" maxChart="5" align="center" sortable="true" collection="AAA028" />
			<ta:datagridItem id="aaz010" key="当事人ID" maxChart="6" align="center" sortable="true" />
			<ta:datagridItem id="yaa030" key="当事人名称" maxChart="12" align="center" sortable="true" />
			<ta:datagridItem id="aae140" key="险种类型" maxChart="8" align="center" sortable="true" collection="AAE140" />
			<ta:datagridItem id="aae341" key="筹资项目" maxChart="6" align="center" sortable="true" collection="AAE341" />
			<ta:datagridItem id="aaa093" key="承担缴费主体类型" maxChart="8" align="center" sortable="true" collection="AAA093" />
			<ta:datagridItem id="yae080" key="余额" maxChart="6" align="center" dataAlign="right" />
			<ta:datagridItem id="yae081" key="自动使用标志" maxChart="6" align="center" sortable="true" collection="YAE081" />
		</ta:datagrid>
	</ta:panel>
	<ta:panel id="panel2" key="待转金收支记录" height="150px" bodyStyle="margin:0px">
		<ta:datagrid id="ae29GridDeatil" enableColumnMove="false" snWidth="30" haveSn="true" fit="true">
			<ta:datagridItem id="aaa028" key="当事人类别" maxChart="5" align="center" sortable="true" collection="AAA028" />
			<ta:datagridItem id="aaz010" key="当事人ID" maxChart="6" align="center" sortable="true" />
			<ta:datagridItem id="yaa030" key="当事人名称" maxChart="12" align="center" sortable="true" />
			<ta:datagridItem id="aae140" key="险种类型" maxChart="8" align="center" sortable="true" collection="AAE140" />
			<ta:datagridItem id="aae341" key="筹资项目 " maxChart="6" align="center" sortable="true" collection="AAE341" />
			<ta:datagridItem id="aaa093" key="承担缴费主体类型" width="140" align="center" sortable="true" collection="AAA093" />
			<ta:datagridItem id="aaa117" key="收支类型" maxChart="6" align="center" sortable="true" collection="AAA117" />
			<ta:datagridItem id="yad003" key="收支金额" maxChart="6" align="center" formatter='MoneyFormatterNo$' totals="sum" tatalsTextShow="false" dataAlign="right" />
			<ta:datagridItem id="aae207" key="收支年月" maxChart="6" align="center" sortable="true" dataAlign="center" />
			<ta:datagridItem id="yae080" key="待转金余额" maxChart="6" align="center" formatter='MoneyFormatterNo$' totals="sum" tatalsTextShow="false" dataAlign="right" />
			<ta:datagridItem id="aae013" key="备注" maxChart="6" align="center" sortable="true" />
			<ta:datagridItem id="aae011" key="经办人" maxChart="4" align="center" sortable="true" collection="AAE011" />
			<ta:datagridItem id="aae036" key="经办时间" maxChart="10" align="center" sortable="true" dataAlign="center" />
			<ta:datagridItem id="yab003" key="经办所属机构" maxChart="10" align="center" collection="YAB003" />
		</ta:datagrid>
	</ta:panel>
	<ta:panel id="panel3" key="待转金调整记录" fit="true" bodyStyle="margin:0px">
		<ta:datagrid id="ac41a8GridDeatil" enableColumnMove="false" snWidth="30" haveSn="true" fit="true">
			<ta:datagridItem id="aaz010" key="支出当事人ID" maxChart="6" align="center" sortable="true" />
			<ta:datagridItem id="yaa030" key="支出当事人名称" maxChart="12" align="center" sortable="true" />
			<ta:datagridItem id="aaa018" key="支出险种类型" maxChart="6" align="center" sortable="true" collection="AAE140" />
			<ta:datagridItem id="aaa093" key="支出承担缴费主体类型" maxChart="10" align="center" sortable="true" collection="AAA093" />
			<ta:datagridItem id="aaz085" key="收入当事人ID" maxChart="6" align="center" sortable="true" />
			<ta:datagridItem id="yaa030_1" key="收入当事人名称" maxChart="12" align="center" sortable="true" />
			<ta:datagridItem id="aaa019" key="收入险种类型" maxChart="6" align="center" sortable="true" collection="AAE140" />
			<ta:datagridItem id="yaa339" key="收入承担缴费主体类型" maxChart="10" align="center" sortable="true" collection="AAA093" />
			<ta:datagridItem id="yad001" key="调整金额" maxChart="6" align="center" sortable="true" dataAlign="right" />
			<ta:datagridItem id="aae013" key="备注" maxChart="6" align="center" sortable="true" />
			<ta:datagridItem id="aae016" key="复核标志" maxChart="5" align="center" collection="AAE016" sortable="true" />
			<ta:datagridItem id="aae011" key="经办人" maxChart="4" align="center" sortable="true" collection="AAE011" />
			<ta:datagridItem id="aae036" key="经办时间" maxChart="10" align="center" sortable="true" dataAlign="center" />
			<ta:datagridItem id="yab003" key="经办所属机构" maxChart="10" align="center" collection="YAB003" />
		</ta:datagrid>
	</ta:panel>
</ta:panel>

<script type="text/javascript">
	$(document).ready(function() {
	});
	function closeWin() {
		Base.closeWindow('detailWindow');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>