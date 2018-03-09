<%@ page language="java" pageEncoding="UTF-8"%>
<ta:box cols="2">
	<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
	<ta:buttonLayout align="left" columnWidth="0.1">
		<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()"/>
	</ta:buttonLayout>
</ta:box>
<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120"/>
<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="120" readOnly="true"/>
<ta:selectInput id="aac058" key="证件类型" labelWidth="120" collection="aac058" readOnly="true"/>
<ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="120"/>
<ta:date id="aac006" key="出生日期" labelWidth="120" readOnly="true"/>
<ta:date id="yab139" key="参保所属机构" display="false"/>
<script type="text/javascript">
	function callRyRPC(){
		sfwQueryUtil_newRPC(1,'getAc01String',{"dto['inputString']":Base.getValue('aac001')});
	}
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
	function fn_setRyData(){
		fn_setRyInfo();  //调用功能界面业务方法
	//	Base.setValue("aac001", parent.getValue("aac001"));
	}
</script>
