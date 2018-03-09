<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>三目对码信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
	    <ta:toolbarItem id="btnQuery"  key="查询[Q]" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()" />
	    <ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"   hotKey="R" asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel  id="fltQuery"  key="查询条件"   cols="3" >
		        <ta:box cols="2">
				  <ta:text id="akb020" key="医疗机构编码" labelWidth="130" onChange="getKb01Info()" columnWidth="0.9" />
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				    <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				  </ta:buttonLayout>
			    </ta:box>
		        <ta:text id="aaz231"  key="社保目录ID"   bpopTipMsg="可输入社保目录ID、编码或名称,自动完成查询!"    labelWidth="140"  onChange="fnRpc2()"/>
		        <ta:text id="hosDicCxtj"  key="医疗机构目录编码"  bpopTipMsg="可输入医疗机构目录编码或名称!"  labelWidth="160" />
		        <ta:text id="zjm"       key="助记码"   bpopTipMsg="可输入五笔助记码或拼音助记码!"   labelWidth="130"  />
		        <ta:selectInput id="ake003"  key="社保目录类别"  collection="AKE003"  labelWidth="140"/>
		</ta:panel>
	    <ta:panel id="pnlCodeDirectory"  key="三目对码信息" fit="true">
	        <ta:datagrid id="dgCodeDirectory" columnFilter="true"  haveSn="true" fit="true" snWidth="20" >
				  <ta:datagridItem id="akb020" key="医疗机构编码" showDetailed="true"  align="center" width="120"/>
				  <ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" width="120"/>
				  <ta:datagridItem id="ake001" key="社保三大目录编码" showDetailed="true" align="center" width="150"/>
				  <ta:datagridItem id="ake002" key="社保三大目录名称" showDetailed="true" align="center" width="150"/>
				  <ta:datagridItem id="ake003" key="社保三大目录类别"   collection="AKE003" align="center" showDetailed="true" width="150"/>
				  <ta:datagridItem id="aka020" key="拼音助记码"   showDetailed="true" align="center" width="100"/>
				  <ta:datagridItem id="aka021" key="五笔助记码"   showDetailed="true" align="center" width="100"/>
				  <ta:datagridItem id="aja006" key="失业使用标志"   collection="AJA006"  showDetailed="true" align="center" width="120"/>
				  <ta:datagridItem id="ama006" key="生育使用标志"  collection="AMA006"  showDetailed="true" align="center" width="120" />
				  <ta:datagridItem id="ala006" key="工伤使用标志"  collection="ALA006"  showDetailed="true" align="center" width="120"/>
				  <ta:datagridItem id="ake005" key="医疗机构目录编码" showDetailed="true" align="center" width="150"/>
				  <ta:datagridItem id="ake006" key="医疗机构目录名称" showDetailed="true" align="center" width="150"/>
				  <ta:datagridItem id="aka067" key="药品剂量单位"  showDetailed="true"  collection="AKA067" align="center"  width="150"/>
				  <ta:datagridItem id="aka070" key="剂型"     collection="AKA070"  showDetailed="true" align="center" width="150"/>
				  <ta:datagridItem id="aka052" key="使用单位"  collection="AKA052"  showDetailed="true" align="center"  width="150"/>
			</ta:datagrid>
	   </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2,"", "aaz231", 500, 300, 4, fn_getML, 0, false);
	});
	//rpc回调
	function callbackFunHos() {
		Base.clearGridData("dgCodeDirectory");
		Base.submit("","theCodeQueryAction!toQueryCodeDirectory.do",{"dto['akb020']":Base.getValue("akb020")},false,null,null);
	};
	//中心目录rpc查询
	function fnRpc2(){
		sfwQueryUtil(2,'getKa20',Base.getValue('aaz231'));
	}
	//RPC回调函数
    function fn_getML(){
    	Base.clearGridData("dgCodeDirectory");
    	Base.submit("","theCodeQueryAction!toQueryCodeDirectory.do",{"dto['aaz231']": g_Suggest[0]},false,null,null);
	}
	
	function toQuery(){
		Base.clearGridData("dgCodeDirectory");
		Base.submit("form1","theCodeQueryAction!toQueryCodeDirectory.do");
	}
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("dgCodeDirectory");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>