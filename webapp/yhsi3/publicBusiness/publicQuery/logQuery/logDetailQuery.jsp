<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>logDetaiQuery</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:datagrid id="logDetailGrid" fit="true" snWidth="true">
			<ta:datagridItem id="aaz002" key="业务日志ID" align="center" width="120" />
			<ta:datagridItem id="yaz002" key="日志流水号" align="center" width="125" />
			<ta:datagridItem id="aaa121" key="业务类型编码" align="center" width="150" collection="AAA121" showDetailed="true" />
			<ta:datagridItem id="aaz010" key="当事人ID" width="80" align="center" />
			<ta:datagridItem id="name" key="当事人名称" width="150" align="center" showDetailed="true" />
			<ta:datagridItem id="yaa017" key="业务办理状态" align="center" width="90" collection="YAA017" showDetailed="true" />
			<ta:datagridItem id="aae013" key="备注" width="140" align="center" showDetailed="true" />
			<ta:datagridItem id="aae011" key="经办人" width="90" align="center" showDetailed="true" />
			<ta:datagridItem id="aae036" key="经办时间" width="145" align="center" dataAlign="center" />
			<ta:datagridItem id="yab003" key="经办所属机构" width="235" collection="YAB003" align="center" showDetailed="true" />
			<ta:datagridItem id="aaa795" key="主机名" align="center" width="90" />
			<ta:datagridItem id="aaa796" key="主机IP地址" align="center" width="110" />
			<ta:datagridItem id="aaa792" key="是否已经回退" align="center" width="90" collection="AAA792" hiddenColumn="true" />
			<ta:datagridItem id="aaa793" key="回退时间" align="center" dataAlign="center" width="160" hiddenColumn="true" />
			<ta:datagridItem id="aaa794" key="回退经办人" align="center" width="120" hiddenColumn="true" />
			<ta:datagridItem id="yab139" key="参保所属机构" width="90" collection="YAB139" hiddenColumn="true" />
			<ta:datagridItem id="aaa831" key="是否使用触发器" width="90" collection="AAA831" hiddenColumn="true" />
			<ta:datagridItem id="aaa832" key="是否可回退" width="90" collection="AAA832" hiddenColumn="true" />
		</ta:datagrid>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();

		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
	});

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('logDetail');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>