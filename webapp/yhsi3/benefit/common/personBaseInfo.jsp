<%@ page language="java" pageEncoding="UTF-8"%>
<ta:box cols="2">
	<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="130" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
	<ta:buttonLayout align="left" columnWidth="0.1">
		<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
	</ta:buttonLayout>
</ta:box>
<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="130" />
<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="130" />
<script type="text/javascript">
	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {"dto['inputString']" : Base.getValue("aac001")});
	}
</script>