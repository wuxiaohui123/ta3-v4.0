<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗欠费特权报销认定</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave"  key="保存[S]" icon="xui-icon-spotSave"   hotKey="S"   onClick="toSave()" />
		<ta:toolbarItem id="btnCancel"  key="作废[E]" icon="xui-icon-spotDelete"  hotKey="E"   onClick="toZuoFei()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"     hotKey="R"  asToolBarItem="true"  type="resetPage"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltPersonInfo" key="个人基本信息" cols="3" >
			<ta:box cols="2">
					<ta:text id="aac001" key="个人ID" labelWidth="120" onChange="getAc01Info(toQuery())" columnWidth="0.9"/>
					<ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
			</ta:box>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:box cols="2">
					<ta:text id="aab001" key="单位ID" labelWidth="120" onChange="getAb01Info(toQuery())" columnWidth="0.9"/>
					<ta:button id="ogniSmallBtn" key="?" onClick="showOgniWindow()" />
			</ta:box>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" collection="AAB020" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" collection="AAB021" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" collection="AAB065" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" collection="YAB019" display="false"/>
			<ta:text id="aab999" key="单位管理码" display="false"/>
		</ta:panel>
		<ta:panel  id="fltAffirmInfo"  key="医疗欠费特权报销认定信息"  cols="3" >
		    <ta:selectInput id="ykc239" key="基本医疗享受类别" collection="YKC239"   labelWidth="130" required="true"/>
		    <ta:selectInput id="ykd086" key="大额（大病）享受类别" collection="YKD086"    labelWidth="130" required="true"/>
		    <ta:selectInput id="ykc238" key="公务员补充享受类别" collection="YKC238"    labelWidth="130" required="true"/>
		    <ta:date id="aae030" key="开始日期" labelWidth="130" isFocusShowPanel="true" required="true" showSelectPanel="true"/>
		    <ta:date id="aae031" key="结束日期" labelWidth="130" isFocusShowPanel="true" required="true" showSelectPanel="true"/>
		    <ta:selectInput id="aka130" key="医疗类别" collection="AKA130"    labelWidth="130" required="true"/>
			<ta:text id="aae013" key="备注" span="3" bpopTipMsg="最大能输入字符200" maxLength="200"  required="true" labelWidth="130"/>
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
		<ta:tab id="tab1" key="个人信息">
		    <ta:datagrid id="ac01List" fit="true" forceFitColumns="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="aac001" key="个人ID"  align="center" showDetailed="true"  dataAlign="left" width="100"/>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" showDetailed="true"  width="100"/>
				<ta:datagridItem id="aac002" key="身份证号" collection="AAE011" align="center" width="100"/>
				<ta:datagridItem id="aab001" key="单位ID"  align="center" dataAlign="center" width="100"/>
				<ta:datagridItem id="aab003" key="单位名称"  align="center" dataAlign="center" width="100"/>
				<ta:datagridItem id="aae140" key="险种"  align="center" width="100" collection="AAE140"/>
				<ta:datagridItem id="aac066" key="参保身份"  collection="AAC066" hiddenColumn="true"/>
				<ta:datagridItem id="yac299" key="人员类别"  collection="YAC299" hiddenColumn="true"/>			
				<ta:datagridItem id="aac020" key="行政职务"  collection="AAC020" hiddenColumn="true"/>			
				<ta:datagridItem id="aac093" key="最高荣誉称号级别代码（劳模级别）" collection="AAC093" hiddenColumn="true"/>			
				<ta:datagridItem id="aja004" key="农民工标识" collection="AJA004" hiddenColumn="true"/>			
			</ta:datagrid>
		</ta:tab>
		<ta:tab id="tab2" key="历史信息">
		    <ta:datagrid id="kc40k7List" fit="true" forceFitColumns="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="aaz267" key="申请事件ID" align="center" dataAlign="left" showDetailed="true"  width="100" />
				<ta:datagridItem id="yke244" key="是否使用"  align="center" showDetailed="true"  dataAlign="left" width="100" collection="YKE244"/>
				<ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" showDetailed="true"  width="100" />
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" showDetailed="true"  width="100"/>
				<ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="left" showDetailed="true"  width="100"/>
				<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" showDetailed="true"  width="100"/>
				<ta:datagridItem id="aab003" key="单位名称" align="center" dataAlign="left" showDetailed="true"  width="100"/>
				<ta:datagridItem id="aka130" key="医疗类别"   align="center" width="100" collection="YKC239"/>
				<ta:datagridItem id="ykc239" key="基本医疗享受类别"     align="center" width="100" collection="YKC239"/>
				<ta:datagridItem id="ykd086" key="大额（大病）享受类别"  align="center" dataAlign="center" width="100" collection="YKD086"/>
				<ta:datagridItem id="ykc238" key="公务员补充享受类别"  align="center" dataAlign="center" width="100" collection="YKC238"/>
				<ta:datagridItem id="aae016" key="审核标志"  align="center" dataAlign="center" width="100" hiddenColumn="true"/>
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
	//人员窗口回调函数
	function callbackFunPerson(){
		getAc01Info(toQuery());
    }
	//单位窗口回调函数
	function callbackFunOgni(){
		toQuery();
    }
	// 查询
	function toQuery(){
		Base.submit("aac001,aab001", "arrearsClearAction!toQuery.do");
	}
	//保存
	function toSave() {
		var aac001 = Base.getValue("aac001");
	    var aab001 = Base.getValue("aab001");
	    if((aac001 == "" || aac001 == null) && (aab001 == "" || aab001 == null)){
	       Base.alert("个人ID和单位ID不能同时为空!","warn");
	    }
	    if (!Base.validateForm("form1")) {
		   Base.alert("带红色星号的为必填内容!","warn");
		   return false;
		}
	    if(!checkDate()) {
	    	return false;	//日期检查
	    }
	    var gridData = Base.getGridSelectedRows("ac01List");
	    if("" == gridData || null == gridData){
	    	Base.alert("请先选择个人信息!","warn");
	    	return false;
	    }
	    
	    var param = {};
	    param.gridData = Ta.util.obj2string(gridData);
		Base.submit("form1","arrearsClearAction!toSave.do",param);
	}
	
	//作废
	function toZuoFei() {
		var gridData = Base.getGridSelectedRows("kc40k7List");
		if("" == gridData || null == gridData){
			Base.alert("请先选择需要作废的数据!","warn");
		    return false;
		}
	    for(var i=0;i<gridData.length;i++){
	       if("1" == gridData[i].yke244){
				Base.alert("申请事件ID"+gridData[i].aaz267+"已使用不能作废!","warn");
				return false;
			}
	       if("0" == gridData[i].aae016){
				Base.alert("申请事件ID"+gridData[i].aaz267+"未审核，不能作废!","warn");
				return false;
	       }
	    }
 	    var param = {};
	    param.gridData = Ta.util.obj2string(gridData);
		Base.submit("aac001,aab001","arrearsClearAction!toCandel.do",param); 
	}
	
	//日期验证
	function checkDate(){
		var aae030=Base.getValue("aae030"); //开始日期
		var aae031=Base.getValue("aae031"); //结束日期
		if("" == aae030 || null == aae030)
	   {
			Base.alert("请输入开始日期!","warn",function(){Base.focus("aae030");});
			return false;
	   }
		if("" == aae031 || null == aae031)
		{
			Base.alert("请输入结束日期!","warn",function(){Base.focus("aae031");});
			return false;
		}
		if(!Base.validateForm("aae030"))
		{
			Base.alert("请输入正解的开始日期格式!","warn");
			return false;
		}
		if(!Base.validateForm("aae031"))
		{
			Base.alert("请输入正解的结束日期格式!","warn");
			return false;
		}
		if(aae031 < aae030)
		{
			Base.alert("结束日期必须大于开始日期!","warn");
			return false;
		}
		return true;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>