<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>住院明细审核(稽核弹出框)</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:form id="form" fit="true" >
		   <ta:box id="bxID" cols="3" >
				<ta:text id="aaz212" key="人员医疗费用扣款事件ID" readOnly="true" display="false" />
				<ta:text id="aaz002" key="业务日志ID" readOnly="true" display="false" />
				<ta:text id="aaz208" key="结算事件台账ID" readOnly="true" display="false"/>
				<ta:text id="aaz217" key="医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz216" key="人员医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz210" key="人员医疗费用单据ID" readOnly="true" display="false"/>
				<ta:text id="aaz107" key="定点医疗机构ID" readOnly="true" display="false"/>
				<ta:text id="aaz272" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaa027" key="统筹区编码" readOnly="true" display="false" />
				<ta:text id="akb020" key="医疗机构编码" readOnly="true" display="false" />
				<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" readOnly="true" display="false"/>
				<ta:text id="aac001" key="人员ID"  readOnly="true" display="false"/>
		   </ta:box>	
			<ta:box id="bxCxtj" cols="5">
			    <ta:selectInput  id="aka031" key="医保大类"  collection="AKA031" labelWidth="80"/>
			    <ta:selectInput  id="aka063" key="项目隶属"  collection="AKA063" labelWidth="80"/>
			    <ta:selectInput  id="aka069" key="自付比例"   labelWidth="80"  />
			    <ta:box cols="3" span="2">
				    <ta:number       id="akc225_s" key="价格范围"  labelWidth="80" columnWidth="0.5"/>
				    <ta:number       id="akc225_e" key="至"  labelWidth="15"  columnWidth="0.3"/>
	                <ta:button id="btnQuery"  key="查询" icon="xui-icon-query"  onClick="toQuery()" cssStyle="width:80px;" columnWidth="0.2" />
				</ta:box>   
			    <ta:checkboxgroup id="cbgps" cols="7" span="2" cssStyle="padding:0px;margin-top:5px;margin-left:16px;">
			       <ta:checkbox id="xj" key="超限价"  labelStyle="padding:0px;font-size:15px;" />
			       <ta:checkbox id="jk" key="进口"  labelStyle="padding:0px;font-size:15px;" />
			       <ta:checkbox id="jf" key="拒付"  labelStyle="padding:0px;font-size:15px;" />
			       <ta:checkbox id="jgdbl" key="价格定比例"   labelStyle="padding:0px;font-size:15px;" span="2"/>
			       <ta:checkbox id="tp" key="特批"   labelStyle="padding:0px;font-size:15px;" />
			    </ta:checkboxgroup>
			    <ta:text id="ake001"  key="项目编码" labelWidth="80"/>
			    <ta:box cols="2" span="2">
				    <ta:text id="ake002"  key="项目名称" labelWidth="80"  columnWidth="0.8"/>
	                <ta:button id="btnClear"  key="清条件" icon="xui-icon-query" onClick="toClearTj()"  cssStyle="width:80px;" columnWidth="0.2"/>
	            </ta:box>    
			</ta:box>
			<ta:box id="bxHz"  layout="border" layoutCfg="{leftWidth:450,bottomHeight:300,heightDiff:-50,noLeftCenterBorder:false}">
			<ta:panel id="pnlHz" key="汇总数据" expanded="false"  fit="true" position="left">
			   <ta:datagrid id="dgHz" fit="true" forceFitColumns="true" onRowClick="fnDbClick" >
			      <ta:datagridItem id="aaz217" key="医疗结算事件ID" hiddenColumn="false"/>
			      <ta:datagridItem id="ake006" key="医院项目名称" align="center" showDetailed="true" dataAlign="left" maxChart="15"/>
			      <ta:datagridItem id="akc226" key="数量" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="5"/>
			      <ta:datagridItem id="aae019" key="金额" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="6"/>
			      <ta:datagridItem id="akc228" key="全自费" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="6"/>
			      <ta:datagridItem id="akc268" key="超限价" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="6"/>
			      <ta:datagridItem id="yka318" key="比例先自付 " align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="6"/>
			      <ta:datagridItem id="yka319" key="符合范围 " align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="6"/>
			   </ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlMx" key="详细信息" expanded="false" fit="true" position="center" >
			   <ta:datagrid id="dgMx" fit="true" forceFitColumns="true" selectType="checkbox" >
					<ta:datagridItem id="aaz213" key="人员医疗费用明细ID" hiddenColumn="true"/>
					<ta:datagridItem id="ake007" key="处方日期" align="center" showDetailed="true" dataAlign="center"  maxChart="6" dataType="date" sortable="true"/>
			        <ta:datagridItem id="ake001" key="项目编码" align="center" showDetailed="true" dataAlign="left"  maxChart="5"  sortable="true"/>
			        <ta:datagridItem id="ake002" key="项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="10"  sortable="true"/>
			        <ta:datagridItem id="ake006" key="医疗项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="12"  sortable="true"/>
					<ta:datagridItem id="akc225" key="单价"  align="center" showDetailed="true" dataAlign="right"  maxChart="4"  collection="AKC225" dataType="number" sortable="true"/>
					<ta:datagridItem id="akc226" key="数量"  align="center" showDetailed="true" dataAlign="right"  maxChart="3" dataType="number"   sortable="true"  totals="sum"  tatalsTextShow="false"/>
					<ta:datagridItem id="aae019" key="费用合计" align="center" showDetailed="true" dataAlign="right"  maxChart="5"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="aka069" key="自付比例" align="center" showDetailed="true" dataAlign="right"  maxChart="4" dataType="number" sortable="true"/>
					<ta:datagridItem id="yka536" key="医院承担部分"  align="center" showDetailed="true" dataAlign="right"  maxChart="5" dataType="number" sortable="true"  totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="aka068" key="定价上限金额" align="center" showDetailed="true" dataAlign="right"  maxChart="5"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="akc228" key="全自费金额" align="center" showDetailed="true" dataAlign="right"  maxChart="5" dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="akc268" key="超限价自付金额" align="center" showDetailed="true" dataAlign="right"  maxChart="7"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="yka318" key="先行自付金额"  align="center" showDetailed="true" dataAlign="right"  maxChart="6"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="yka319" key="符合范围部分"  align="center" showDetailed="true" dataAlign="right"  maxChart="6" dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="aka031" key="医保大类"  align="center" showDetailed="true" dataAlign="left"  maxChart="6" collection="AKA031" />
					<ta:datagridItem id="aka063" key="项目隶属"  align="center" showDetailed="true" dataAlign="left"  maxChart="6" collection="AKA063" />
					<ta:datagridItem id="aka070" key="剂型"  align="center" showDetailed="true" dataAlign="left"  maxChart="6" collection="AKA070" />
					<ta:datagridItem id="aka074" key="规格"  align="center" showDetailed="true" dataAlign="left"  maxChart="6" collection="AKA074"/>
					<ta:datagridItem id="aka067" key="药品剂量单位" collection="AKA067" hiddenColumn="true" />
			   </ta:datagrid>
			</ta:panel>
			</ta:box>
			<ta:buttonLayout id="btns" align="right" >
			   <ta:button id="btnJf"     key="拒付"     icon="xui-icon-spotSave"   onClick="toJf(1)"/>
			   <ta:button id="btnQxJf"   key="取消拒付" icon="xui-icon-spotSave"   onClick="toJf(0)"/>
			   <ta:button id="btnSave"   key="审核完毕" icon="xui-icon-spotSave"   onClick="toSh()"/>
			   <ta:button id="btnClose" key="退出"     icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('w_mxsh');"/>
			</ta:buttonLayout>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
//拒付
function toJf(lx)
{
	var data=Base.getGridSelectedRows("dgMx");
	if("" == data || null == data)
		return Base.alert("没有勾选数据!","warn");
	//只获取重要的字段
	var data1 = [];
	var rowdata1 = {};
	if("1" == lx) // 拒付
	{
		$.each(data,function(indext,rowdata){
			rowdata1 = {};
			rowdata1.aaz213 = rowdata.aaz213;//人员医疗费用明细ID
			rowdata1.akc265 = rowdata.yka319;//扣款金额:直接扣掉整笔费用
			data1.push(rowdata1);
		});
	}else{ // 取消拒付
		$.each(data,function(indext,rowdata){
			rowdata1 = {};
			rowdata1.aaz213 = rowdata.aaz213;//人员医疗费用明细ID
			rowdata1.akc265 = 0;//扣款金额:直接扣掉整笔费用
			data1.push(rowdata1);
		});
		
	}
	var parameter={};
	parameter["gridData"]=Ta.util.obj2string(data1);
	Base.submit("bxID","<%=path %>/process/medicalbenefit/reckoning/detailAuditZYAction!toSaveDetail.do",parameter,null,false,null,null);
}

// 审核
function toSh()
{
	Base.submit("bxID","<%=path %>/process/medicalbenefit/reckoning/detailAuditZYAction!toSaveShMx.do");
}
// 查询
function toQuery()
{
	var parameter={};
	parameter["dto['aaz217']"]=Base.getValue("aaz217");
	parameter["dto['aka031']"]=Base.getValue("aka031");
	parameter["dto['aka063']"]=Base.getValue("aka063");
	parameter["dto['ake001']"]=Base.getValue("ake001");
	parameter["dto['ake002']"]=Base.getValue("ake002");
	parameter["dto['aka069']"]=Base.getValue("aka069");
	parameter["dto['akc225_s']"]=Base.getValue("akc225_s");
	parameter["dto['akc225_e']"]=Base.getValue("akc225_e");
	var flag = $("#xj")[0].checked;
	if(flag)
	   parameter["dto['xj']"]="1";
	flag = $("#jk")[0].checked;
	if(flag)
	   parameter["dto['jk']"]="1";
	flag = $("#jf")[0].checked;
	if(flag)
	   parameter["dto['jf']"]="1";
	flag = $("#jgdbl")[0].checked;
	if(flag)
	   parameter["dto['jgdbl']"]="1";
	flag = $("#tp")[0].checked;
	if(flag)
	   parameter["dto['tp']"]="1";
	Base.clearGridData("dgMx");	
	Base.clearGridData("dgHz");	
	Base.submit("","<%=path %>/process/medicalbenefit/reckoning/detailAuditZYAction!toQueryShMx.do",parameter,null,false,null,null);
}

// 汇总数据行数据双击事件 
function fnDbClick(e,rowdata)
{
	Base.clearGridData("dgMx");	
	var parameter={};
	parameter["dto['aaz217']"]=rowdata.aaz217; // 医疗待遇申请事件ID
	parameter["dto['ake006']"]=rowdata.ake006; // 医院项目名称
	var flag = $("#jf")[0].checked; // 拒付标志
	if(flag)
	   parameter["dto['jf']"]="1";
	Base.submit("","<%=path %>/process/medicalbenefit/reckoning/detailAuditZYAction!toQueryKc22.do",parameter,null,false,null,null);
}

//清空查询条件
function  toClearTj()
{
	Base.clearData("bxCxtj");
}

	                
$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>