<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报销结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="saveBtn"     key="保存"    icon="xui-icon-spotAdd"        onClick="toSave()" />
		<ta:toolbarItem id="closeBtn"   key="退出"    icon="xui-icon-spotClose"      onClick="closeWin()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">  
	     <ta:text id="aaa027" key="分中心" display="false"/>
		 <ta:panel id="pnlCxtj" key="登记信息" cols="3" >
			<ta:text id="akb020"  key="医疗机构编号"  readOnly="true"  labelWidth="120"   />
			<ta:text id="akb021" key="医疗机构名称"   readOnly="true"    labelWidth="120" span="2"/>
			<ta:selectInput id="bxlb" key="报销类型" readOnly="true"  labelWidth="120"  />
			<ta:date id="aae030" key="开始日期"      readOnly="true"  showSelectPanel="true"  labelWidth="120"/>
			<ta:date id="aae031" key="结束日期"      readOnly="true"  showSelectPanel="true"  labelWidth="120"/>
			<ta:number id="akc264"  key="总费用"     readOnly="true"  max="9999999999" labelWidth="120"/>
			<ta:text id="aae013" key="备注"         readOnly="true"   labelWidth="120" span="2"/>
			<ta:text id="aac001" key="个人ID"     readOnly="true"  labelWidth="120"/>
			<ta:text id="aac003" key="姓名"      readOnly="true"  labelWidth="120"/>
			<ta:text id="aac002" key="身份证号"  readOnly="true"  labelWidth="120"/>
			<ta:text id="aae009" key="银行户名" labelWidth="120" required="true" />
			<ta:text id="aae010" key="银行账号" labelWidth="120" required="true" />			
			<ta:selectInput id="yaf011" key="银行异地标志" collection="YAF011" labelWidth="120" required="true"/> 
			<ta:selectInput id="aaf002" key="银行类型" collection="AAF002" labelWidth="120" required="true"  widthPercentage="150%" isAutoExtend="false"/> 
		    <ta:text id="yae597" key="银行名称"  labelWidth="120"  span="2"  />
			<ta:text id="aaz065" key="银行ID"    labelWidth="120"  readOnly="true"/>
			<ta:text id="aaz217" key="就诊流水号"    labelWidth="120"  readOnly="true"/>
			<ta:text id="aaz216" key="结算流水号"    labelWidth="120"  readOnly="true"/>
		</ta:panel>    
   </ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2,"","yae597",700,300,4,aaz065_callback,0,false);
	});
	 //  银行ID  change事件
	$("#yae597").change(function(){
		Base.setValue("aaz065");
		sfwQueryUtil(2,'getAf07ForYl',Base.getValue('aaz065'));
	});

	// 银行回调 方法
	function aaz065_callback()
	{
		Base.setValue("aaz065",g_Suggest[3]);
		Base.setValue("yae597",g_Suggest[0]);
	}
	
	// 关闭窗口
	function closeWin()
	{
		top.Base.closeWindow("win_js");
	}
	
	//保存
    function toSave()
	{
		if(Base.validateForm("form1"))
		{
			Base.setDisabled("saveBtn");
			Base.submit("form1","lxTjfBxAction!toSaveJs.do");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>