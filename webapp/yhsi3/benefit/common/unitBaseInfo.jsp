<%@ page language="java" pageEncoding="UTF-8"%>
<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130"/>
<ta:box cols="2">
	<ta:text id="aab001" key="单位编号" maxLength="20" labelWidth="130" required="true" columnWidth="0.9" onChange="callDwRPC();" bpopTipMsg="单位名称、单位代码、单位ID" />
	<ta:buttonLayout align="left" columnWidth="0.1">
		<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
	</ta:buttonLayout>
</ta:box>
<ta:text id="aae044" key="单位名称"  readOnly="true" labelWidth="130" span="2"/>
<script type="text/javascript">
	/* 个人编号RPC */
	function callDwRPC() {
		sfwQueryUtil_newRPC(2, 'getAb01String', {"dto['inputString']" : Base.getValue("aab001")});
		// sfwQueryUtil(2,'getAab001',Base.getValue('aab001'))
	}
</script>