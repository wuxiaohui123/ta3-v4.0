<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>门诊或药店费用明细</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:toolbar id="btr1">
			<ta:toolbarItem id="btnExport"  key="导出" icon="xui-icon-spotEdit"  onClick="toUpload()"/>
			<ta:toolbarItem id="btnPrint"  key="打印" icon="xui-icon-spotPrint"  onClick="toPrint()"/>
			<ta:toolbarItem id="btnClose"  key="关闭" icon="xui-icon-spotClose"   onClick="parent.Base.closeWindow('detailWin')"/>
		</ta:toolbar>
		<ta:form id="form" fit="true" >
			<ta:box id="bxID" cols="3" >
		        <ta:text id="kc24Row" key="获取扣款的结算行数" display="false" />
				<ta:text id="akc265" key="扣款金额" readOnly="true" display="false"/>
				<ta:text id="aaz217" key="人员医疗就诊事件ID" readOnly="true" display="false" />
				<ta:text id="aaz212" key="人员医疗费用扣款事件ID" readOnly="true" display="false" />
				<ta:text id="aaz002" key="业务日志ID" readOnly="true" display="false" />
				<ta:text id="aaz210" key="人员医疗费用单据ID" readOnly="true" display="false"/>
				<ta:text id="aaz216" key="人员医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz107" key="定点医疗机构ID" readOnly="true" display="false"/>
				<ta:text id="aaz272" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaa027" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
				<ta:text id="akb020" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
		   </ta:box>
			<ta:text id="yka026" key="慢性病编码" readOnly="true" labelWidth="120" display="false" />
			<ta:selectInput id="aka078" key="就诊方式" collection="AKA078" readOnly="true" labelWidth="120" display="false"/>
			<ta:panel id="pnlJz" key="人员就诊信息" cols="3">
			    <ta:text id="aac001" key="人员ID" readOnly="true" labelWidth="120"/>
			    <ta:text id="aac003" key="姓名"  readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aac004" key="性别" readOnly="true" labelWidth="120" collection="AAC004" />
			    <ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="aae140" key="险种类型" collection="AAE140" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" readOnly="true" labelWidth="120"/>
			    <ta:text id="akb021" key="医疗机构名称"  readOnly="true" labelWidth="120" span="2"/>
				<ta:date id="aae030" key="开始日期" readOnly="true" labelWidth="120"/>
				<ta:date id="aae031" key="结束日期" readOnly="true" labelWidth="120"/>
				<ta:text id="ake024" key="诊断" readOnly="true" labelWidth="120"/>
			</ta:panel>
			<ta:panel id="pnlFee" key="人员费用明细" fit="true" expanded="false">
				<ta:datagrid id="dgrdFee" fit="true" forceFitColumns="true"  haveSn="true" >
					<ta:datagridItem id="yka538" key="审核类型" align="center" dataAlign="center"  showDetailed="true"  maxChart="7" formatter="fnFormatter"  collection="YKA538" sortable="true"/>
					<ta:datagridItem id="ake007" key="费用日期" align="center" dataAlign="center"  maxChart="9"  sortable="true"  formatter="fnFormatter" />
					<ta:datagridItem id="ake006" key="项目名称" align="center" dataAlign="left"  showDetailed="true"  maxChart="9" sortable="true"  formatter="fnFormatter" />
					<ta:datagridItem id="aka031" key="医保大类" align="center" dataAlign="left" maxChart="4" collection="AKA031" sortable="true" formatter="fnFormatter" />
					<ta:datagridItem id="akc225" key="单价" align="center" dataAlign="right" maxChart="4"   formatter="fnFormatter" />
					<ta:datagridItem id="akc226" key="数量" align="center" dataAlign="right"  maxChart="4"  formatter="fnFormatter" />
					<ta:datagridItem id="aka069" key="自付比例" align="center" dataAlign="right" maxChart="4"  formatter="fnFormatter" />
					<ta:datagridItem id="aae019" key="总费用" align="center" dataAlign="right" maxChart="6"  totals="sum" tatalsTextShow="false" formatter="fnFormatter" />
					<ta:datagridItem id="akc228" key="全自费" align="center" dataAlign="right" maxChart="6"   totals="sum" tatalsTextShow="false" formatter="fnFormatter" />
					<ta:datagridItem id="yka318" key="先行自付" align="center" dataAlign="right"  maxChart="6"   totals="sum" tatalsTextShow="false" formatter="fnFormatter" />
					<ta:datagridItem id="yka319" key="符合范围" align="center" dataAlign="right"  maxChart="6"   totals="sum" tatalsTextShow="false" formatter="fnFormatter" />
					<ta:datagridItem id="aka070" key="剂型" align="center" dataAlign="left"  maxChart="4"   collection="AKA070" formatter="fnFormatter" />
					<ta:datagridItem id="aka074" key="规格" align="center" dataAlign="left"  maxChart="4"   collection="AKA074" formatter="fnFormatter" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		 <iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">

//列渲染方法
function fnFormatter(row, cell, value, columnDef, dataContext)
{
	var yka538 = dataContext.yka538;
	if("拒付" == yka538 || "00" == yka538){
		if("" != value && null != value)
		   value = "<span style='color:blue;'>"+value+"</span>";
	}
	return value;
 }

// 导出EXCEL
function  toUpload(){
	
	Base.expGridExcel("dgrdFee");
}

// 打印
function toPrint()
{
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=feeDetailJh.raq&"
			+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
			+ "serverPagedPrint=no&mirror=no&"
			+ "paramString=aaz217="+Base.getValue("aaz217"));
}
$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>