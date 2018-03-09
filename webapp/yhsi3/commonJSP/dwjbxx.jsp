<%@ page language="java" pageEncoding="UTF-8"%>
<ta:box cols="2">
	<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC()" columnWidth="0.9" />
	<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
		<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
	</ta:buttonLayout>  
</ta:box>
<ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120" />
<ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
<ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019" readOnly="true" />
<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019" readOnly="true" />
<script type="text/javascript">
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']":Base.getValue('aab001')});
	}
	function showDwRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	function fn_setDwData(){
		fn_setDwInfo();  //调用功能界面业务方法
		Base.setValue("aab001", parent.getValue("aab001"));
	}
</script>
