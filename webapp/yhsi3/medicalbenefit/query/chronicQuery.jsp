<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
			<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="q"   onClick="toQuery()" />
			<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
			<ta:toolbarItem id="btnSet"   key="设置" icon="icon-setting"  onClick="toOpen()" />
			<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="r"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="pnlCxtj"  key="查询条件"  cols="3">
		 	<ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="120" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
				  </ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名"   labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型"  collection="YL140"   labelWidth="120"/>
			<ta:box cols="2">
				<ta:text id="akb020" key="医疗机构编码" labelWidth="120" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="akb021" key="医疗机构名称"  labelWidth="120" readOnly="true"/>
			<ta:selectInput id="akc021" key="人员性质"  labelWidth="120"  collection="AKC021" />
			<ta:date id="aae001" key="年度"  showSelectPanel="true" labelWidth="120"  dateYear="true"  required="true"/>
			<ta:selectInput id="aka120" key="病种名称"  labelWidth="120"  />
			<ta:selectInput id="aaa027" key="统筹区"    collection="YKB037"  labelWidth="120" selectFirstValue="true"/>
			<ta:text id="aae011" key="经办人"  labelWidth="120"  />
			<ta:text id="yae041" key="审批人"   labelWidth="120" />
			<ta:text id="aae013" key="备注"   labelWidth="120" />
		    <ta:box id="bxSj" cols="2">
				  <ta:date id="aae036_min" key="经办时间"  showSelectPanel="true" labelWidth="120"   columnWidth="0.65" />
				  <ta:date id="aae036_max" key="至"        showSelectPanel="true" labelWidth="15"   columnWidth="0.35"/>
			</ta:box>
		    <ta:box id="bxSq" cols="2">
				<ta:date id="aae030" key="申请日期"  showSelectPanel="true" labelWidth="120"  columnWidth="0.65" />
			    <ta:date id="aae031" key="至"  showSelectPanel="true" labelWidth="15"   columnWidth="0.35" />
			</ta:box>
			<ta:selectInput id="yke090" key="审核标记"    labelWidth="120"  data="[{'id':'0','name':'未审'},{'id':'1','name':'已审'}]"/>
	    </ta:panel>
		    <ta:panel  id="pnlKc47" key="慢性病申请年度汇总信息"  fit="true">
				<ta:datagrid id="dgkc47" fit="true" haveSn="true" snWidth="40">
					<ta:datagridItem id="yke090" key="审批标志"   align="center" dataAlign="center"  maxChart="6" sortable="true"  formatter="fnFormatter"  collectionData="[{'id':'0','name':'未审'},{'id':'1','name':'已审'}]"/>
					<ta:datagridItem id="aac001" key="人员ID"  align="center" dataAlign="center"  maxChart="6" sortable="true"  formatter="fnFormatter"/>
					<ta:datagridItem id="aac003" key="姓名"    align="center" dataAlign="center"  maxChart="4" formatter="fnFormatter"/>
					<ta:datagridItem id="aac002" key="身份证"  align="center" dataAlign="center"  maxChart="9" formatter="fnFormatter"/>
					<ta:datagridItem id="aac008" key="待遇状态"  align="center" dataAlign="center"  maxChart="5" collection="AAC008" formatter="fnFormatter"/>
					<ta:datagridItem id="aab003" key="参保单位"  align="center" dataAlign="center"  maxChart="9" showDetailed="true" formatter="fnFormatter"/>
					<ta:datagridItem id="aae030" key="申请开始日期"  align="center" dataAlign="center"  maxChart="8" sortable="true" formatter="fnFormatter"/>
					<ta:datagridItem id="aae031" key="申请结束日期"  align="center" dataAlign="center"  maxChart="8" sortable="true" formatter="fnFormatter"/>
					<ta:datagridItem id="aka121" key="病种名称" align="center" showDetailed="true" dataAlign="left"  maxChart="20" formatter="fnFormatter"/>
					<ta:datagridItem id="akb021" key="医院名称" align="center" showDetailed="true" dataAlign="left" maxChart="20" formatter="fnFormatter"/>
					<ta:datagridItem id="yke009" key="疾病名称"  align="center" showDetailed="true" maxChart="20" formatter="fnFormatter"/>
					<ta:datagridItem id="akc021" key="人员性质" align="center" dataAlign="left" maxChart="5" collection="AKC021" formatter="fnFormatter"/>
				    <ta:datagridItem id="yka115" key="起付线" align="center" dataAlign="right" maxChart="5" formatter="fnFormatter"/>
				    <ta:datagridItem id="aae180" key="年工资" align="center" dataAlign="right" maxChart="5" formatter="fnFormatter"/>
				    <ta:datagridItem id="aae005" key="联系电话" align="center" showDetailed="true" dataAlign="left"  maxChart="8" formatter="fnFormatter"/>
				    <ta:datagridItem id="aae013" key="备注" align="center" showDetailed="true" dataAlign="left" width="100" formatter="fnFormatter"/>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" showDetailed="true" dataAlign="left" maxChart="8" formatter="fnFormatter"/>
					<ta:datagridItem id="aae011" key="经办人" collection="AAE011" align="center" showDetailed="true" dataAlign="left" maxChart="8"  sortable="true" formatter="fnFormatter"/>
					<ta:datagridItem id="aae036" key="经办时间" align="center" showDetailed="true" dataAlign="left" maxChart="8"  sortable="true" formatter="fnFormatter"/>
					<ta:datagridItem id="yae041" key="审批人" collection="AAE011" align="center" showDetailed="true" dataAlign="left" maxChart="8" sortable="true" formatter="fnFormatter"/>
					<ta:datagridItem id="yae051" key="审批时间" align="center" showDetailed="true" dataAlign="left" maxChart="8"  sortable="true" formatter="fnFormatter"/>
				</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
	});
	var columnData = null;
	// 弹出设置框 ,方法来源:medicare.js 
	function toOpen()
	{
		if(null == columnData || "" == columnData){
			columnData = getColumnWZ("dgkc47");
		}
		 openGridSet("dgkc47",columnData,"menuid01030819",null,null,null);
	}
	
	// 列渲染方法:yke090 审批标志:0表示未审1表示已审
	function fnFormatter(row, cell, value, columnDef, dataContext){
		var yke090 = dataContext.yke090;
		if("1" == yke090){
			if("" == value || null == value)
				value = "";
			else
			    value = "<span style = 'color:blue;'>"+value+"</span>";
		}
		return value;
    }
	
	//rpc回调
	function callbackFunHos() {
		
	};
   
    $("#aac001").change(function(){
    	var aac001=Base.getValue("aac001");
		if(aac001==""||aac001==null){  //如果查询条件为空,则后面的数据也同步清空
			Base.setValue("aac003","");
		    Base.setValue("aac004","");
		}else{
			sfwQueryUtilForYl(1,'getKc47ListForYL',{"dto.jstj":Base.getValue('aac001'),"dto.aae100":"all"});
		}
    	
    });
	
	//RPC回调函数,获取个人基本信息
	function fn_getPerson()
	{ 
		 Base.setValue("aac001",g_Suggest[2]);
		 Base.setValue("aac003",g_Suggest[1]);
		 Base.setValue("aac002",g_Suggest[0]);
	} 
    
	//查询
	function toQuery() 
	{
		Base.clearGridData("dgkc47");
		Base.submit("pnlCxtj","chronicQueryAction!toQuery.do");
	}
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("dgkc47");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>