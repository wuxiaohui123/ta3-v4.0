<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊疾病用药目录维护</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading/>
    <ta:toolbar id="tlb">
		<ta:button key="保存[S]" hotKey="S" icon="xui-icon-spotSave"  onClick="fnSave()"   asToolBarItem="true"/>
		<ta:button key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="fnClose()"  asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form fit="true" >
	   <ta:panel id="bxCxtj" cols="4" >
	       <ta:text id="aaz254"  key="流水号"     display="false"/>
	       <ta:text id="aka120"  key="病种编码"   display="false"/>
	       <ta:text id="ake001"  key="目录编码"  readOnly="true"/>
	       <ta:text id="ake002"  key="目录名称"  readOnly="true" span="2"/>
	       <ta:selectInput id="ake003"  key="目录类别"  readOnly="true"  collection="AKE003"/>
	       <ta:selectInput id="aka065"  key="医保大类"  readOnly="true"  collection="AKA065"/>
	       <ta:selectInput id="aka070"  key="剂型"  readOnly="true"  collection="AKA070"/>
	       <ta:text id="aka057"  key="先自付比例"  readOnly="true"/>
	       <ta:text id="sjxj"  key="三级医院限价"  readOnly="true"/>
	       <ta:text id="ejxj"  key="二级医院限价"  readOnly="true"/>
	       <ta:text id="yjxj"  key="一级医院限价"  readOnly="true"/>
	       <ta:text id="yjxj1"  key="一级以下限价"  readOnly="true"/>
	       <ta:text id="aae013"  key="备注"  readOnly="true"/>
	       <ta:date id="aae030"  key="开始日期"  readOnly="true"/>
	       <ta:date id="aae031"  key="结束日期"  required="true"  showSelectPanel="true"/>
	       <ta:selectInput id="aae100"  key="有效标志"  collection="AAE100"  required="true"/>
	   </ta:panel>	   
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	// 关闭
	function fnClose()
	{
		parent.Base.closeWindow("w_ake001");
	}
	
	// 保存
	function fnSave()
	{
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		var aae100 = Base.getValue("aae100");
		if("" == aae031 || null == aae031){
		    Base.alert("请输入结束日期!","warn");
		    return false;
		}
		if("" == aae100 || null == aae100){
		    Base.alert("请输入有效标志!","warn");
		    return false;
		}
		if(aae030 > aae031){
		    Base.alert("结束日期不能小于开始日期!","warn");
		    return false;
		}
		Base.submit("aaz254,aae031,aae100","drugsRangAction!toSaveModify.do");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>