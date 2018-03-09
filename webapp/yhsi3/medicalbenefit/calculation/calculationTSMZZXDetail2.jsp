<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
	    <ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel1" key="费用明细信息" fit="true">
			<ta:datagrid id="kc22List" fit="true" haveSn="true" forceFitColumns="true"  columnFilter="true">
				<ta:datagridItem id="aaz231" key="社保三大目录ID"  hiddenColumn="true" />
				<ta:datagridItem id="aaz213" key="人员医疗费用明细ID"  hiddenColumn="true" />
				<ta:datagridItem id="yka538" key="审核类型" align="center" dataAlign="center"  showDetailed="true"  maxChart="7" formatter="fnFormatter"  collectionData="[{'id':'00','name':'拒付'},{'id':'01','name':'审核支付'},{'id':'02','name':'未审核'}]" sortable="true"/>
				<ta:datagridItem id="ake007" key="费用日期" align="center" dataAlign="center"  maxChart="9"  sortable="true"  formatter="fnFormatter" />
			    <ta:datagridItem id="ake001" key="项目编码" align="center" showDetailed="true" dataAlign="left"  maxChart="5"  sortable="true" formatter="fnFormatter" />
			    <ta:datagridItem id="ake002" key="项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="10"  sortable="true" formatter="fnFormatter" />
				<ta:datagridItem id="ake006" key="医院项目名称" align="center" dataAlign="left"  showDetailed="true"  maxChart="9"  formatter="fnFormatter" />
				<ta:datagridItem id="aka031" key="医保大类" align="center" dataAlign="left" maxChart="4" collection="AKA031" sortable="true" formatter="fnFormatter" />
				<ta:datagridItem id="akc225" key="单价" align="center" dataAlign="right" maxChart="4"   formatter="fnFormatter" />
				<ta:datagridItem id="akc226" key="数量" align="center" dataAlign="right"  maxChart="4"  formatter="fnFormatter" />
				<ta:datagridItem id="aka069" key="自付比例" align="center" dataAlign="right" maxChart="4"  />
				<ta:datagridItem id="aae019" key="总费用" align="center" dataAlign="right" maxChart="6"  totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="akc228" key="全自费" align="center" dataAlign="right" maxChart="6"   totals="sum" tatalsTextShow="false"  />
				<ta:datagridItem id="akc268" key="超限价" align="center" dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"   />
				<ta:datagridItem id="yka318" key="先行自付" align="center" dataAlign="right"  maxChart="6"   totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yka319" key="符合范围" align="center" dataAlign="right"  maxChart="6"   totals="sum" tatalsTextShow="false"  />
				<ta:datagridItem id="aka070" key="剂型" align="center" dataAlign="left"  maxChart="4"   collection="AKA070" formatter="fnFormatter" />
				<ta:datagridItem id="aka074" key="规格" align="center" dataAlign="left"  maxChart="4"   collection="AKA074" formatter="fnFormatter" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	// 列渲染方法
	function fnFormatter(row, cell, value, columnDef, dataContext){
		var yka538 = dataContext.yka538;
		if("02" != yka538){
			if("" == value || null == value)
				value = "";
			else
			   value = "<span style='color:blue;'>"+value+"</span>";
		}
		return value;
     }
	//关闭窗口
	function closeWin(){
		parent.Base.closeWindow('win_mx');
	}
	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("kc22List");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
