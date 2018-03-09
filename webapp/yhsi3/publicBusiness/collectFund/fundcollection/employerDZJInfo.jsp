<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位待转金收支明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form" fit="true">
		<ta:panel id="fld3" key="单位待转金明细" fit="true">
			<ta:datagrid id="dg_DZJInfo" haveSn="true" fit="true" forceFitColumns="true">
				<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="170"></ta:datagridItem>
				<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="140"></ta:datagridItem>
				<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" width="140" collection="AAA093"></ta:datagridItem>
				<ta:datagridItem id="yad003" key="实处理金额" align="center" dataAlign="right" width="100" dataType="Number"></ta:datagridItem>
				<ta:datagridItem id="yae080" key="余额" align="center" dataAlign="right" width="100" dataType="Number"></ta:datagridItem>
				<ta:datagridItem id="aaa117" key="余额收支类型" align="center" dataAlign="right" width="100" collection="AAA117"></ta:datagridItem>
				<ta:datagridItem id="aae341" key="筹资项目" align="center" dataAlign="right" width="100" collection="AAE341"></ta:datagridItem>
				<ta:datagridItem id="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="100" sortable="true"></ta:datagridItem>
				<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="AAB301" width="100"></ta:datagridItem>
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
		parent.Base.closeWindow("DZJInfo");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>