<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位增减变动详细信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tb">
			<ta:button id="bt" key="关闭" asToolBarItem="true" icon="xui-icon-spotClose" onClick="fnClose()" />
		</ta:toolbar>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="单位变动详细情况">
				<ta:datagrid id="dwinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="5" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="12" showDetailed="true" sortable="true" />
					<ta:datagridItem id="yab019" key="单位管理类型" align="center" dataAlign="center" maxChart="8" collection="YAB019" />
					<ta:datagridItem id="aab051" key="单位参保状态" align="center" dataAlign="left" maxChart="6" collection="AAB051" />
					<ta:datagridItem id="akc022" key="参保类型" align="center" dataAlign="center" maxChart="4" collection="AKC022" />
					<ta:datagridItem id="aab019" key="单位类型" align="center" dataAlign="center" maxChart="4" collection="AAB019" />
					<ta:datagridItem id="aab020" key="经济类型" align="center" dataAlign="center" maxChart="4" collection="AAB020" />
					<ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="center" maxChart="3" collection="AAB033" />
					<ta:datagridItem id="khyh" key="开户银行" align="center" dataAlign="center" maxChart="8" />
					<ta:datagridItem id="tsyh" key="托收银行" align="center" dataAlign="center" maxChart="8" />
					<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="yae106" key="银行协议号" align="center" dataAlign="left" maxChart="8" />
					<ta:datagridItem id="aab016" key="专管员" align="center" dataAlign="left" maxChart="3" />
					<ta:datagridItem id="aab018" key="联系电话" align="center" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aae159" key="联系电子邮箱" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" maxChart="7" collection="aae140" />
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
	function fnClose() {
		parent.Base.closeWindow("dwInfo");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>