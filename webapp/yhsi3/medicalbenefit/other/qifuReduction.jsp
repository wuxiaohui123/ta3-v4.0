<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>起付减免登记</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltPersonInfo" key="申请人基本信息" cols="3">
		    <ta:box cols="2">
				<ta:text id="aac001" key="个人ID" required="true" labelWidth="120" onChange="getAc01Info(query())" columnWidth="0.9"/>
				<ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
			</ta:box>
			<ta:text id="aac003" key="姓名" readOnly="true"  labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true"  labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
			<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>			
			<ta:text id="aab001" key="单位ID"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
			<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/>
	    </ta:panel>
		<ta:panel id="pnl_3" key="起付线" cols="3">
			<ta:number id="ykc411" key="减免后起付线" required="true" labelWidth="120" precision="2"/>
			<ta:text id="aae013" key="备注" maxLength="100"  labelWidth="120"/></br>
			说明：减免本次住院次数选择"是",代表不累计本次住院次数
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
		  <ta:tab key="住院信息(勾选后点击保存)" id="tab2">
			<ta:datagrid id="dateGrid_kc21" fit="true" forceFitColumns="true" selectType="checkbox" >
				<ta:datagridItem id="aaz217" key="人员医疗就诊事件ID" hiddenColumn="true"/>
				<ta:datagridItem id="aac001" key="人员ID"   hiddenColumn="false"/>
				<ta:datagridItem id="aac003" key="姓名"     align="center" showDetailed="true"  dataAlign="left"  maxChart="3"/>
				<ta:datagridItem id="akb021" key="医院名称"  align="center" showDetailed="true"  dataAlign="left" maxChart="10"/>
				<ta:datagridItem id="aae030" key="开始日期"  align="center" dataAlign="center"  dataType="date" maxChart="7"/>
				<ta:datagridItem id="aae031" key="终止日期"  align="center" dataAlign="center"  dataType="date" maxChart="7"/>
				<ta:datagridItem id="akc190"   key="就诊编号"   showDetailed="true"   align="center"  maxChart="7" sortable="true"/>
				<ta:datagridItem id="yke019" key="登记日期"  align="center" dataAlign="center"  dataType="date" maxChart="7"/>
				<ta:datagridItem id="aka130" key="医疗类别"  collection="AKA130" align="center" dataAlign="center"  showDetailed="true"  maxChart="6"/>
				<ta:datagridItem id="yka115" key="减免前起付线"  align="center" showDetailed="true" dataAlign="right" maxChart="5"/>
				<ta:datagridItem id="ykc022" key="本次住院次数"  align="center" showDetailed="true" dataAlign="right" maxChart="5"/>
				<ta:datagridItem id="akc193" key="入院诊断"  align="center" showDetailed="true" dataAlign="left" maxChart="10"/>
				<ta:datagridItem id="aka121" key="病种名称"  align="center" showDetailed="true" dataAlign="left" maxChart="8"/>
				<ta:datagridItem id="yke014" key="住院号"    align="center" showDetailed="true" dataAlign="left" maxChart="4"/>
			</ta:datagrid>
		  </ta:tab>
	      <ta:tab key="减免历史" id="tab3">
	          <ta:datagrid id="kc21k5List"  fit="true"  forceFitColumns="true" haveSn="true" snWidth="30" >
				     <ta:datagridItem id="aac001"   key="人员ID"     showDetailed="true"  align="center"  maxChart="6" sortable="true"/>
				     <ta:datagridItem id="aac003"   key="姓名"       showDetailed="true"  align="center"  maxChart="3" sortable="true"/>
				     <ta:datagridItem id="aac002"   key="身份证号"   showDetailed="true" align="center"  maxChart="9"   sortable="true"/>
			         <ta:datagridItem id="akb020"   key="医院编号"   showDetailed="true"  align="center"  maxChart="5"  sortable="true"/>
			         <ta:datagridItem id="akb021"   key="医院名称"   showDetailed="true"  align="center"  maxChart="9"  sortable="true"/>
			         <ta:datagridItem id="aae030"   key="入院时间"   showDetailed="true"  align="center"  maxChart="7"  sortable="true"/>
			         <ta:datagridItem id="aae031"   key="出院时间"   showDetailed="true"  align="center"  maxChart="7"  sortable="true"/>
			         <ta:datagridItem id="akc190"   key="就诊编号"   showDetailed="true"   align="center"  maxChart="7" sortable="true"/>
			         <ta:datagridItem id="ykc411" key="减免后起付线"    showDetailed="true"  align="center"  maxChart="6" sortable="true"/>
			         <ta:datagridItem id="yka115" key="减免后起付线"    showDetailed="true"  align="center"  maxChart="6" sortable="true" hiddenColumn="true"/>
			         <ta:datagridItem id="aae013" key="备注"         showDetailed="true"  align="center"  maxChart="10" />
				     <ta:datagridItem id="aae036" key="经办时间"    showDetailed="true"  align="center" maxChart="10" sortable="true"/>
				     <ta:datagridItem id="aae014" key="经办人"     showDetailed="true"  align="center"  maxChart="4" sortable="true"/>
				     <ta:datagridItem id="yab003" key="统筹区"   collection="aab034"  showDetailed="true"  align="center"  maxChart="5"  sortable="true"/>
				     <ta:datagridItem id="aka130" key="医疗类别" collection="aka130"   showDetailed="true"  align="center" maxChart="7"  sortable="true"/>
				     <ta:datagridItem id="aae100" key="有效标志" collection="aae100" maxChart="4"  sortable="true"/>
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
		getAc01Info(query());
    }
   // 查询
   function query(){
	   Base.submit("aac001","qifuReductionAction!queryKc21Info.do"); 
   }

	//保存
	function toSave() 
	{
		var gridData = Base.getGridSelectedRows("dateGrid_kc21");
		if(gridData.length < 1){
			return Base.alert("请勾选住院信息!","warn");	
		}
		var ykc411 = Base.getValue("ykc411");
		if("" == ykc411 || null == ykc411){
			return Base.alert("请输入减免后起付线!","warn",function(){Base.focus("ykc411");});	
		}
		var param = {};
		param.gridData = Ta.util.obj2string(gridData);
		Base.submit("form1","qifuReductionAction!toSave.do",param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>