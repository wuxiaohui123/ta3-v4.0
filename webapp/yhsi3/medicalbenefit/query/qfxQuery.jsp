<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>住院减免起付线信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
			<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="q"   onClick="toQuery()" />
			<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
			<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="r"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="baseInfo"  key="查询条件"  cols="3">
			    <ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="80" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				   </ta:buttonLayout>
			    </ta:box>
			    <ta:text id="aac003"  key="姓名" readOnly="true"  labelWidth="80" />
			    <ta:selectInput id="aka130" key="医疗类别" collection="AKA130" labelWidth="80" maxVisibleRows="8"/>
			    <ta:box id="bxAae036" span="1" cols="2">
				    <ta:date id="aae036_min"  key="经办时间" labelWidth="80" showSelectPanel="true"  columnWidth="0.6"/>
				    <ta:date id="aae036_max"  key="至" labelWidth="15" showSelectPanel="true"  columnWidth="0.4"/>
				</ta:box>    
			    <ta:selectInput id="aaa027" key="统筹区"     labelWidth="80" collection="AAB034"/>
			    <ta:selectInput id="aae100" key="有效标志"   labelWidth="80" collection="AAE100"/>
		    </ta:panel>
		    <ta:panel  id="accountInfo" key="住院减免起付线信息信息"  fit="true">
				<ta:datagrid id="kc21k5List"  fit="true" haveSn="true" snWidth="30" >
				     <ta:datagridItem id="aac001"   key="人员ID"     showDetailed="true"  align="center"  maxChart="6" sortable="true"/>
				     <ta:datagridItem id="aac003"   key="姓名"       showDetailed="true"  align="center"  maxChart="3" sortable="true"/>
				     <ta:datagridItem id="aac002"   key="身份证号"   showDetailed="true" align="center"  maxChart="9"   sortable="true"/>
			         <ta:datagridItem id="akb020"   key="医院编号"   showDetailed="true"  align="center"  maxChart="5"  sortable="true"/>
			         <ta:datagridItem id="akb021"   key="医院名称"   showDetailed="true"  align="center"  maxChart="9"  sortable="true"/>
			         <ta:datagridItem id="aae030"   key="入院时间"   showDetailed="true"  align="center"  maxChart="7"  sortable="true"/>
			         <ta:datagridItem id="aae031"   key="出院时间"   showDetailed="true"  align="center"  maxChart="7"  sortable="true"/>
			         <ta:datagridItem id="akc190"   key="就诊编号"   showDetailed="true"   align="center"  maxChart="7" sortable="true"/>
			         <ta:datagridItem id="ykc411" key="减免前起付线"    showDetailed="true"  align="center"  maxChart="6" sortable="true"/>
			         <ta:datagridItem id="yka115" key="减免后起付线"    showDetailed="true"  align="center"  maxChart="6" sortable="true"/>
			         <ta:datagridItem id="aae013" key="备注"         showDetailed="true"  align="center"  maxChart="10" />
				     <ta:datagridItem id="aae036" key="经办时间"    showDetailed="true"  align="center" maxChart="7" sortable="true"/>
				     <ta:datagridItem id="ykc141" key="经办人"     showDetailed="true"  align="center"  maxChart="4" sortable="true"/>
				     <ta:datagridItem id="yab003" key="统筹区"   collection="aab034"  showDetailed="true"  align="center"  maxChart="5"  sortable="true"/>
				     <ta:datagridItem id="aka130" key="医疗类别" collection="aka130"   showDetailed="true"  align="center" maxChart="7"  sortable="true"/>
				     <ta:datagridItem id="aae100" key="有效标志" collection="aae100" maxChart="4"  sortable="true"/>
				     <ta:datagridItem id="aaz217" key="就诊流水号"  maxChart="6"  sortable="true"/>
				</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	// 人员ID change事件
	function callbackFunPerson(){
		   
    }
	
	//查询
	function toQuery() 
	{
		Base.clearGridData("kc21k5List");
		Base.submit("baseInfo","qfxQueryAction!toQuery.do");
	}
	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("kc21k5List");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>