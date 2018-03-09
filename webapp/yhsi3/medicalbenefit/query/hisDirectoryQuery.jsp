<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗机构三目查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"   hotKey="R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="fltQuery"  key="查询条件"  cols="2">
     		    <ta:box cols="2">
				<ta:text id="akb020" key="医疗机构ID" labelWidth="150" onChange="getKb01Info()" columnWidth="0.9" />
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-30px">
				    <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				  </ta:buttonLayout>
			    </ta:box>
				<ta:text id="mlCxtj" key="医疗机构目录编码"   bpopTipMsg="医疗机构目录编码或名称!"  labelWidth="150"/>
		 </ta:panel>
	    <ta:panel id="pnlHisDisDirectory"  key="医疗机构三大目录信息"  fit="true"  heightDiff="10" expanded="false"  scalable="false">
	        <ta:datagrid id="dgHisDisDirectory"  haveSn="true"  snWidth="25"  columnFilter="true"  fit="true"  >
				    <ta:datagridItem id="akb020" key="医疗机构编码" align="center" width="100"/>
				    <ta:datagridItem id="akb021" key="医疗机构名称" align="center" width="150"/>
				    <ta:datagridItem id="akb022" key="医疗机构类型" align="center" collection="AKB022"  width="100"/>
				    <ta:datagridItem id="ake005" key="医疗机构三大目录编码"  align="center" width="150"   />
				    <ta:datagridItem id="ake006" key="医疗机构三大目录名称"  align="center" width="150"       />
				    <ta:datagridItem id="aka061" key="通用中文名称" align="center" width="100" />
				    <ta:datagridItem id="aka062" key="英文化学名" align="center" width="80" />
				    <ta:datagridItem id="aka070" key="剂型" align="center" collection="AKA070"   width="80"/>
				    <ta:datagridItem id="aka052" key="使用单位" align="center" collection="AKA052"   width="80"/>
				    <ta:datagridItem id="yke006" key="除外内容" align="center" width="80"/>
				    <ta:datagridItem id="yke005" key="项目内涵" align="center" width="80"/>
			</ta:datagrid>
	   </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});
	//rpc回调
	function callbackFunHos() {
		toQuery();
	};
	//按钮查询 
	function toQuery(){
		 Base.clearGridData("dgHisDisDirectory");
	     Base.submit("form1","hisDirectoryQueryAction!toQueryHisDirectory.do");	
	}
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("dgHisDisDirectory");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>