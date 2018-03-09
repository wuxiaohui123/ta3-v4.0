<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊疾病目录查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"   hotKey="R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	     <ta:panel id="fltQuery" key="查询条件" cols="3">
	         <ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="150" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
				  </ta:buttonLayout>
			 </ta:box>
	         <ta:text id="aac002" key="身份证号" labelWidth="150" readOnly="true" /> 
	         <ta:text id="aac003" key="姓名" labelWidth="150" readOnly="true" />
	         <ta:box cols="2">
				<ta:text id="akb020" key="医疗服务机构编码" labelWidth="150" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			 </ta:box>
	         <ta:text id="akb021" key="医疗服务机构名称" labelWidth="150" readOnly="true" />
	         <ta:text id="akb022" key="医疗服务机构类型" labelWidth="150" readOnly="true" />
	         <ta:text id="aaz231" key="社保三大目录ID" labelWidth="150" onChange="sfwQueryUtil(3,'getKa20Filter',Base.getValue('aaz231')+',1')" />
	         <ta:text id="ake001" key="社保三大目录统一编码" labelWidth="150" readOnly="true" />
	         <ta:text id="ake002" key="社保三大目录名称" labelWidth="150" readOnly="true"/>	         
	     </ta:panel>
		 <ta:panel id="pnlSpecialClinics" key="特殊诊疗项目及服务申请查询"  fit="true" expanded="false"  scalable="false">
		     <ta:datagrid id="dgClinics"  fit="true" haveSn="true"  snWidth="35" >
			     <ta:datagridItem id="aac001" align="center" key="人员ID" maxChart="5"  sortable="true" />
			     <ta:datagridItem id="aac003" align="center" key="姓名" maxChart="4"  sortable="true" />
			     <ta:datagridItem id="aac002" align="center" key="身份证号" maxChart="9"  sortable="true"/>
			     <ta:datagridItem id="aac004" align="center" key="性别" maxChart="2" collection="AAC004"   sortable="true" />
				 <ta:datagridItem id="akb020" align="center" key="医疗服务机构编号"  maxChart="8" showDetailed="true" dataAlign="left"  />
			     <ta:datagridItem id="akb021" align="center" key="医疗服务机构名称" maxChart="8"  sortable="true" />
			     <ta:datagridItem id="akb022" align="center" key="医疗服务机构类型" maxChart="8"  sortable="true" collection="AKB022"/>
			     <ta:datagridItem id="aaz231" align="center" key="社保三大目录ID" maxChart="8"  sortable="true" />
			     <ta:datagridItem id="ake001" align="center" key="社保三大目录统一编码" maxChart="6"  sortable="true" />
			     <ta:datagridItem id="ake002" align="center" key="社保三大目录名称" maxChart="8"  sortable="true" />
			     <ta:datagridItem id="aaz267" align="center" key="医疗待遇申请事件ID" maxChart="8"  sortable="true" hiddenColumn="true"/>
			     <ta:datagridItem id="akc225" align="center" key="单价" maxChart="4" showDetailed="true" dataAlign="left"/>
				 <ta:datagridItem id="akc226" align="center" key="数量"  maxChart="2" showDetailed="true" dataAlign="left"  />
				 <ta:datagridItem id="aka070" align="center" key="剂型"   maxChart="6" showDetailed="true" dataAlign="left" hiddenColumn="true" />
				 <ta:datagridItem id="aka074" align="center" key="规格"   showDetailed="true" dataAlign="left"  maxChart="8" hiddenColumn="true" />
				 <ta:datagridItem id="akc193" align="center" key="入院诊断"   showDetailed="true" dataAlign="left"  maxChart="6"  hiddenColumn="true"/>
				 <ta:datagridItem id="akc195" align="center" key="已做过检查结果"   showDetailed="true" dataAlign="left"  maxChart="8" hiddenColumn="true" />
				 <ta:datagridItem id="aae013" align="center" key="申请原因"   showDetailed="true" dataAlign="left"  maxChart="20"  />
				 <ta:datagridItem id="aaz002" align="center" key="业务日志ID"    showDetailed="true" dataAlign="left"  maxChart="12" />
			     <ta:datagridItem id="aae011" align="center" key="经办人"   showDetailed="true" dataAlign="center"  maxChart="4" collection="AAE011" />
			     <ta:datagridItem id="aae036" align="center" key="经办时间"   showDetailed="true" dataAlign="center"  maxChart="8" />
			     <ta:datagridItem id="yab003" align="center" key="经办机构"   showDetailed="true" dataAlign="center"  maxChart="6"  collection="YAB003" />
			     <ta:datagridItem id="aae016" align="center" key="复核标志"   showDetailed="true" dataAlign="center"  maxChart="4"   collection="AAE016"/>
			     <ta:datagridItem id="aae011" align="center" key="复核人"   showDetailed="true" dataAlign="center"  maxChart="4"  collection="AAE011"/>
			     <ta:datagridItem id="aae036" align="center" key="复核时间"   showDetailed="true" dataAlign="center"  maxChart="8"  />
			     <ta:datagridItem id="yab003" align="center" key="复核经办机构"   showDetailed="true" dataAlign="center"  maxChart="6" collection="YAB003"  />
			</ta:datagrid>
		  </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		//initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
		//initializeSuggestFramework(2,"", "akb020", 500, 300, 4, fn_getHospital, 0, false);
		initializeSuggestFramework(3,"", "aaz231", 500, 300, 4, fn_getClinics, 0, false);
	});
	 //RPC回调函数,获取社保三大目诊疗项目及服务设施信息
   function fn_getClinics(){
	   Base.setValue("ake001","");
	   Base.setValue("ake002","");
	//   if(g_Suggest[3]=="药品"){
	//	   Base.alert("与当前申请的目录类别不符合!","warn");
	//	   Base.setValue("aaz231","");
	//	   Base.focus("aaz231");
		//   return false;
	   //}
	   Base.submit("","specialClinicsAppQueryAction!toClinicsInfo.do",{"dto['aaz231']": g_Suggest[0]},false,null,null);
   }
	
     // 人员ID change事件
	 function callbackFunPerson(){
		   
    }
	 //rpc回调
	 function callbackFunHos() {
			
	 };
	//	查询按钮 查询
	function toQuery(){
		 Base.clearGridData("dgClinics");
	     Base.submit("fltQuery","specialClinicsAppQueryAction!toQuery.do");	
	}
	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("dgClinics");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>