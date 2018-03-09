<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>家庭病床建床申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
    <ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="s" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"   hotKey="r"  asToolBarItem="true"  type="resetPage"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltPersonInfo" key="个人基本信息" cols="3">
			<ta:box cols="2">
					<ta:text id="aac001"  key="个人ID" required="true"  labelWidth="130" onChange="getAc01Info()" columnWidth="0.9"/>
					<ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
			</ta:box>
			<ta:text id="aab001" key="单位ID"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
			<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
			<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>
			<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:text id="aac003" key="姓名"         readOnly="true"  labelWidth="150" />
			<ta:text id="aac002" key="身份证号"   readOnly="true"  labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="130" />
			<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="130"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
		</ta:panel>
		<ta:panel  id="fltHospitalInfo"  key="医院信息"  cols="3" >	 
			 <ta:text id="aaz107"  key="定点医疗机构ID"  readOnly="true"  display="false"/>
			 <ta:box cols="2" >
				<ta:text id="akb020" key="医疗机构编码" required="true" labelWidth="130" onChange="getKb01Info(null)" columnWidth="0.9" />
				<ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
			 </ta:box>	
			 <ta:text id="akb021"  key="医疗机构名称"    readOnly="true" labelWidth="150" span="2"/>
			 <ta:selectInput id="akb022" key="医疗机构类型" collection="AKB022" readOnly="true" labelWidth="130" />
			 <ta:selectInput id="akb023" key="医疗服构类别" collection="AKB023" readOnly="true" labelWidth="150" />
			 <ta:selectInput id="aaa027" key="统筹区编码" collection="YAB003"  readOnly="true"  labelWidth="120" />
		</ta:panel>
		<ta:panel id="fltApply" key="申请说明"  cols="3" >
			  <ta:textarea id="akc030" key="申请原因" labelWidth="130" required="true" maxLength="100" span="3" height="50px"/>
			  <ta:textarea id="aae013" key="备注" labelWidth="130" maxLength="100" span="3" height="50px"/>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//人员窗口回调函数
	function callbackFunPerson(){
		getAc01Info();
    }
	//医疗机构窗口回调函数
	function callbackFunHos(){
		
	}
	//保存
	function toSave() 
	{
		if(Base.validateForm("form1")) {
			Base.submit("form1","hosBedHomeAppAction!toSave.do");
		}else{
			Base.alert("带红色星号的为必填内容!","warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>