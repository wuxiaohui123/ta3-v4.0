<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body>
		<ta:form id="form" fit="true">
			<ta:toolbar id="tb">
				<ta:button id="bt" key="关闭" asToolBarItem="true" icon="xui-icon-spotClose" onClick="fnClose()" />
			</ta:toolbar>
			<ta:panel id="fld3" key="人员明细" fit="true" expanded="false" scalable="false">
				<ta:datagrid id="dg_info" haveSn="true" fit="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="aae044" key="名称" align="center" dataAlign="left" maxChart="8"/>
					<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="8"/>
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="8"/>
					<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="left" maxChart="4"/>
					<ta:datagridItem id="aac008" key="参保状态" collection="AAC008" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12"/>
					<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084" align="center" dataAlign="left" maxChart="5"/>
					<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="6"/>
					<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="6"/>
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="6"/>
					<ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" align="center" dataAlign="left" maxChart="10"/>
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
		parent.Base.closeWindow("userwin");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>