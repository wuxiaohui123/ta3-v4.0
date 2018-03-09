<%@ page language="java" pageEncoding="UTF-8"%>
<ta:box span="3" cols="3">
	<ta:box cols="2">
		<ta:text id="aaz001" key="机构编码" maxLength="20" labelWidth="130" required="true" columnWidth="0.9" onChange="callZzRPC();" bpopTipMsg="可输入机构名称或机构编码" />
		<ta:buttonLayout align="left" columnWidth="0.1">
			<ta:button id="showZzRPCBtn" key="?" onClick="showZzRPC();" />
		</ta:buttonLayout>
	</ta:box>
	<ta:text id="aae0441" key="机构名称" readOnly="true" labelWidth="130" span="2"/>
</ta:box>
<script type="text/javascript">
	/* 个人编号RPC */
	function callZzRPC() {
		sfwQueryUtil_newRPC(3, 'getAaz001String', {"dto['inputString']" : Base.getValue("aaz001")});
		// sfwQueryUtil(3,'getAaz001',Base.getValue('aaz001')) 
	}
</script>