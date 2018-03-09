<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保人员核定明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:panel id="fld2" key="核定信息" height="100" expanded="false" scalable="false">
			<ta:datagrid id="dg_thisHDInfo" haveSn="true" fit="true" forceFitColumns="true">
				<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12" showDetailed="true"></ta:datagridItem>
				<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="yac084" key="离退休标志" align="center" dataAlign="left" maxChart="5" collection="YAC084"></ta:datagridItem>
				<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" maxChart="3"></ta:datagridItem>
				<ta:datagridItem id="aab084" key="工资总额" align="center" dataAlign="right" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="hj" key="合计" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9" sortable="true"></ta:datagridItem>
				<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="AAB301" maxChart="9"></ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="fld3" key="单位下参保人员核定明细" fit="true" expanded="false" scalable="true">
			<ta:datagrid id="dg_HDInfo" haveSn="true" fit="true" columnFilter="true" forceFitColumns="true">
				<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="9"></ta:datagridItem>
				<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="left" maxChart="2"></ta:datagridItem>
				<ta:datagridItem id="aac008" key="参保状态" collection="AAC008" align="center" dataAlign="left" maxChart="4" hiddenColumn="true"></ta:datagridItem>
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12" showDetailed="true"></ta:datagridItem>
				<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4"></ta:datagridItem>
				<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="6" hiddenColumn="true"></ta:datagridItem>
				<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" dataType="Number" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" dataType="Number" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="yad001" key="核定金额" align="center" dataAlign="right" dataType="Number" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwjfbl" key="单位缴费比例" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grjfbl" key="个人缴费比例" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwhzhbl" key="单位划账户比例" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="grhzhbl" key="个人划账户比例" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" maxChart="5"></ta:datagridItem>
				<ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" align="center" dataAlign="left" maxChart="9"></ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnClose() {
		parent.Base.closeWindow("HDInfo");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>