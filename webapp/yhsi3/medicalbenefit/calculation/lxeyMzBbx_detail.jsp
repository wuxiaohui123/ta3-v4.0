<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>明细</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询" icon="xui-icon-query"  onClick="toQuery()"  />
		<ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose"   onClick="parent.Base.closeWindow('win_lxmzbbx')"  />
	    </ta:toolbar>
		<ta:form id="form" fit="true" >
		   <ta:text id="aaz217" key="结算流水号" display="false"/>
			<ta:box id="bxCxtj" cols="5">
			    <ta:box cols="2" span="2">
			       <ta:date id="aae030_s"  key="就诊日期" labelWidth="80" showSelectPanel="true" />
			       <ta:date id="aae030_e"  key="至" labelWidth="15" showSelectPanel="true" />
			    </ta:box>  
				<ta:text id="akb020"  key="医疗机构编号" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
				<ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2"/>
			</ta:box>
		<ta:box id="bxHz" fit="true" layout="border" layoutCfg="{leftWidth: 450,noLeftCenterBorder:false}">
			<ta:panel id="pnlHz" key="发票信息" expanded="false" fit="true" position="left">
			   <ta:datagrid id="dgHz" fit="true" forceFitColumns="true" onRowClick="fnDbClick" >
			      <ta:datagridItem id="aae030" key="就诊日期"  align="center" showDetailed="true" dataAlign="left" maxChart="6" dataType="date"/>
			      <ta:datagridItem id="akc191" key="门诊流水号"  align="center" showDetailed="true" dataAlign="right"  tatalsTextShow="false" totalsAlign="right" maxChart="5"/>
			      <ta:datagridItem id="akc264" key="总费用"  align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="yka319" key="符合范围 " align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="akc228" key="全自费" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="akc268" key="超限价" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="ake034" key="账户支付 "  align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="tczf"   key="统筹支付 "  align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="akb021" key="就诊医院"  align="center" showDetailed="true" dataAlign="left" maxChart="10" />
			      <ta:datagridItem id="aaz217" key="就诊流水号" />
			   </ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlMx" key="详细信息" expanded="false" fit="true" position="center">
			   <ta:datagrid id="dgMx" fit="true" forceFitColumns="true" onRowClick="fnDbClick">
					<ta:datagridItem id="ake007" key="处方日期" align="center" showDetailed="true" dataAlign="center"  maxChart="6" dataType="date" sortable="true"/>
			        <ta:datagridItem id="ake001" key="项目编码" align="center" showDetailed="true" dataAlign="left"  maxChart="4"  sortable="true"/>
			        <ta:datagridItem id="ake002" key="项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="10"  sortable="true"/>
			        <ta:datagridItem id="ake006" key="医疗项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="12"  sortable="true"/>
					<ta:datagridItem id="akc225" key="单价"  align="center" showDetailed="true" dataAlign="right"  maxChart="3"  collection="AKC225" dataType="number" sortable="true"/>
					<ta:datagridItem id="akc226" key="数量"  align="center" showDetailed="true" dataAlign="right"  maxChart="3" dataType="number"   sortable="true"  totals="sum"  tatalsTextShow="false"/>
					<ta:datagridItem id="aae019" key="费用合计" align="center" showDetailed="true" dataAlign="right"  maxChart="5"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="akc228" key="全自费金额" align="center" showDetailed="true" dataAlign="right"  maxChart="5" dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="akc268" key="超限价自付金额" align="center" showDetailed="true" dataAlign="right"  maxChart="7"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="yka319" key="符合范围部分"  align="center" showDetailed="true" dataAlign="right"  maxChart="6" dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="aka068" key="定价上限金额" align="center" showDetailed="true" dataAlign="right"  maxChart="5"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="aka031" key="医保大类"  align="center" showDetailed="true" dataAlign="left"  maxChart="4" collection="AKA031" />
					<ta:datagridItem id="aka063" key="项目隶属"  align="center" showDetailed="true" dataAlign="left"  maxChart="4" collection="AKA063" />
					<ta:datagridItem id="aka070" key="剂型"  align="center" showDetailed="true" dataAlign="left"  maxChart="4" collection="AKA070" />
					<ta:datagridItem id="aka074" key="规格"  align="center" showDetailed="true" dataAlign="left"  maxChart="4" collection="AKA074"/>
					<ta:datagridItem id="aka067" key="药品剂量单位" collection="AKA067" hiddenColumn="true" />
			   </ta:datagrid>
			</ta:panel>
			</ta:box>
		</ta:form>
	</body>
</html>
<script type="text/javascript">

// 医疗机构放大镜回调方法
function fnKb01MagifierBack(rowdata){
   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
}

// 查询
function toQuery()
{
	var parameter = {};
	parameter["dto.aaz217"] = Base.getValue("aaz217");
	parameter["dto.aae030_s"] = Base.getValue("aae030_s");
	parameter["dto.aae030_e"] = Base.getValue("aae030_e");
	parameter["dto.akb020"] = Base.getValue("akb020");
	Base.clearGridData("dgMx");	
	Base.clearGridData("dgHz");	
	Base.submit("","<%=path %>/medicalbenefit/calculation/lxeyMzBbxAction!toQueryKc24.do",parameter,null,false,null,null);
}

// 汇总数据行数据双击事件 
function fnDbClick(e,rowdata)
{
	Base.clearGridData("dgMx");	
	var parameter = {};
	parameter["dto['aaz217']"]=rowdata.aaz217; // 医疗待遇申请事件ID
	Base.submit("","<%=path %>/medicalbenefit/calculation/lxeyMzBbxAction!toQueryKc22.do",parameter,null,false,null,null);
}

$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>