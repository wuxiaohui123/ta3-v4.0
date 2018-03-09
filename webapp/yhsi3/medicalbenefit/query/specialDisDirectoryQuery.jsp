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
		<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"   hotKey="R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="fltQuery"  key="查询条件"  cols="3">
   		    <ta:selectInput id="aka120"  key="病种编码"  />
   		    <ta:selectInput id="aka063"  key="收费隶属"   collection="AKA063"/>
   		    <ta:text id="ake002"  key="药品目录名称" />
		 </ta:panel>
		  <ta:panel id="pnlSpecialDisDirectory" key="特殊疾病对应的用药目录"  fit="true" expanded="false"  scalable="false">
		     <ta:datagrid id="dgYyfw"  fit="true" haveSn="true"  snWidth="35" >
			     <ta:datagridItem id="aka120" align="center" key="病种编码" maxChart="5"  sortable="true"/>
			     <ta:datagridItem id="aka121" align="center" key="病种名称" maxChart="13" showDetailed="true"/>
			     <ta:datagridItem id="ake001" align="center" key="目录编码"   showDetailed="true" dataAlign="left"  maxChart="5"/>
				 <ta:datagridItem id="ake002" align="center" key="目录名称"   showDetailed="true" dataAlign="left"  maxChart="30"/>
				 <ta:datagridItem id="aka070" align="center" key="剂型"      showDetailed="true" dataAlign="left"  maxChart="5"   />
				 <ta:datagridItem id="ake003" align="center" key="目录类别"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKE003"/>
				 <ta:datagridItem id="aka063" align="center" key="收费隶属"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA063"/>
				 <ta:datagridItem id="aka031" align="center" key="医保大类"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA031"/>
				 <ta:datagridItem id="aka057" align="center" key="先自付比例"   showDetailed="true" dataAlign="right"  maxChart="5"  />
				 <ta:datagridItem id="sjxj" align="center" key="三级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="ejxj" align="center" key="二级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="yjxj" align="center" key="一级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="yjxj1" align="center" key="一级以下限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem  id="aae013" align="center" key="备注"       showDetailed="true" dataAlign="left"  maxChart="25" />
				 <ta:datagridItem  id="aae011" align="center" key="经办人"       showDetailed="true" dataAlign="left"  maxChart="5"  collection="AAE011"/>
			     <ta:datagridItem  id="aae036" align="center" key="经办时间"   showDetailed="true" dataAlign="center"  maxChart="6"  />
			</ta:datagrid>
		  </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//	查询按钮 查询
	function toQuery(){
		 Base.clearGridData("dgYyfw");
	     Base.submit("fltQuery","specialDisDirectoryQueryAction!toQueryXmmx.do");	
	}
	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("dgYyfw");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>