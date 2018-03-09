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
		<ta:toolbarItem id="editBtn"  key="确定" icon="xui-icon-print"   onClick="toEdit()"  />
		<ta:toolbarItem id="clearBtn" key="清条件" icon="xui-icon-delete"   onClick="toClearTj()"  />
		<ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose"   onClick="parent.Base.closeWindow('win_xxzfbx')"  />
	    </ta:toolbar>
		<ta:form id="form" fit="true" >
		   <ta:box id="bxID" cols="3" >
				<ta:text id="aaz217" key="医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz208" key="结算事件台账ID" readOnly="true" display="false"/>
				<ta:text id="aaz216" key="人员医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aac001" key="人员ID"  readOnly="true" display="false"/>
		   </ta:box>	
			<ta:box id="bxCxtj" cols="5">
			    <ta:selectInput  id="aka031" key="医保大类"  collection="AKA031" labelWidth="80"/>
			    <ta:selectInput  id="aka063" key="项目隶属"  collection="AKA063" labelWidth="80"/>
			    <ta:selectInput  id="aka069" key="自付比例"   labelWidth="80"  />
			    <ta:box cols="2" span="2">
				    <ta:number       id="akc225_s" key="价格范围"  labelWidth="78" />
				    <ta:number       id="akc225_e" key="至"  labelWidth="15"  />
				</ta:box>   
			    <ta:checkboxgroup id="cbgps" cols="6" span="2" cssStyle="padding:0px;margin-top:5px;margin-left:16px;">
			       <ta:checkbox id="xj" key="超限价"  labelStyle="padding:0px;font-size:15px;" />
			       <ta:checkbox id="jk" key="进口"  labelStyle="padding:0px;font-size:15px;" />
			       <ta:checkbox id="jf" key="拒付"  labelStyle="padding:0px;font-size:15px;" />
			       <ta:checkbox id="jgdbl" key="价格定比例"   labelStyle="padding:0px;font-size:15px;" span="2"/>
			       <ta:checkbox id="tp" key="特批"   labelStyle="padding:0px;font-size:15px;" />
			    </ta:checkboxgroup>
			    <ta:text id="ake002"  key="项目名称" labelWidth="80"/>
			    <ta:box cols="2" span="2">
			       <ta:date id="ake007_s"  key="处方日期" labelWidth="80" showSelectPanel="true" />
			       <ta:date id="ake007_e"  key="至" labelWidth="15" showSelectPanel="true" />
			    </ta:box>   
			</ta:box>
			<ta:box id="bxHz" fit="true" layout="border" layoutCfg="{leftWidth: 450,noLeftCenterBorder:false}">
			<ta:panel id="pnlHz" key="汇总数据" expanded="false" fit="true" position="left">
			   <ta:datagrid id="dgHz" fit="true" forceFitColumns="true" onRowClick="fnDbClick" >
			      <ta:datagridItem id="aaz217" key="医疗结算事件ID" hiddenColumn="false"/>
			      <ta:datagridItem id="ake006" key="医院项目名称" align="center" showDetailed="true" dataAlign="left" maxChart="15"/>
			      <ta:datagridItem id="aka069" key="先自付比例"  align="center" showDetailed="true" dataAlign="right"  tatalsTextShow="false" totalsAlign="right" maxChart="5"/>
			      <ta:datagridItem id="akc226" key="数量" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="3"/>
			      <ta:datagridItem id="aae019" key="金额" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="akc228" key="全自费" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="akc268" key="超限价" align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="yka318" key="比例先自付 "  align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			      <ta:datagridItem id="yka319" key="符合范围 " align="center" showDetailed="true" dataAlign="right" totals="sum" tatalsTextShow="false" totalsAlign="right" maxChart="4"/>
			   </ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlMx" key="详细信息,操作提示:修改比例后,点击[确定]" expanded="false" fit="true" position="center">
			   <ta:datagrid id="dgMx" fit="true" forceFitColumns="true"  selectType="radio">
					<ta:datagridItem id="aaz213" key="人员医疗费用明细ID" hiddenColumn="true"/>
					<ta:datagridItem id="aaz217" key="人员医疗费用明细ID" hiddenColumn="true"/>
					<ta:datagridItem id="ake007" key="处方日期" align="center" showDetailed="true" dataAlign="center"  maxChart="6" dataType="date" sortable="true"/>
			        <ta:datagridItem id="ake001" key="项目编码" align="center" showDetailed="true" dataAlign="left"  maxChart="4"  sortable="true"/>
			        <ta:datagridItem id="ake002" key="项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="10"  sortable="true"/>
			        <ta:datagridItem id="ake006" key="医疗项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="12"  sortable="true"/>
					<ta:datagridItem id="akc225" key="单价"  align="center" showDetailed="true" dataAlign="right"  maxChart="3"  collection="AKC225" dataType="number" sortable="true"/>
					<ta:datagridItem id="akc226" key="数量"  align="center" showDetailed="true" dataAlign="right"  maxChart="3" dataType="number"   sortable="true"  totals="sum"  tatalsTextShow="false"/>
					<ta:datagridItem id="aae019" key="费用合计" align="center" showDetailed="true" dataAlign="right"  maxChart="5"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="aka069" key="自付比例" align="center" dataAlign="right"  maxChart="4"  >
					  <ta:datagridEditor type="selectInput" data="[{'id':'0','name':'0'},{'id':'0.05','name':'0.05'},{'id':'0.1','name':'0.1'},{'id':'0.15','name':'0.15'}
					  ,{'id':'0.2','name':'0.2'},{'id':'0.35','name':'0.35'},{'id':'1','name':'1'}]" editorData="[{'id':'0','name':'0'},{'id':'0.05','name':'0.05'},{'id':'0.1','name':'0.1'},{'id':'0.15','name':'0.15'}
					  ,{'id':'0.2','name':'0.2'},{'id':'0.35','name':'0.35'},{'id':'1','name':'1'}]" onChange="fngetzfje" />
					</ta:datagridItem>  
					<ta:datagridItem id="akc228" key="全自费金额" align="center" showDetailed="true" dataAlign="right"  maxChart="5" dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="akc268" key="超限价自付金额" align="center" showDetailed="true" dataAlign="right"  maxChart="7"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="yka318" key="先行自付金额"  align="center" showDetailed="true" dataAlign="right"  maxChart="6"  dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="yka319" key="符合范围部分"  align="center" showDetailed="true" dataAlign="right"  maxChart="6" dataType="number" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="yka536" key="医院承担部分"  align="center" showDetailed="true" dataAlign="right"  maxChart="5" dataType="number" sortable="true"  totals="sum" tatalsTextShow="false"/>
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

//修改自付比例
function fngetzfje(data,value) {
  var aae019 = parseFloat(data.item.aae019);
  var akc268 = parseFloat(data.item.akc268);
  var akc228 = parseFloat(data.item.akc228);
  var aka069 = value;
  var yka318 = ((aae019-akc268) * aka069).toFixed(2);
  var yka319 =  (aae019 - akc268 - yka318).toFixed(2);
  var akc228 = (aae019 - yka318 - yka319-akc268).toFixed(2);
  // 比例为1
  if(1 == aka069)
  {
	  akc228 = aae019-akc268;
	  yka318 = 0;
	  yka319 = 0;
  }else{
	  akc228 = 0;
  }
  data.item.yka318 = yka318;
  data.item.yka319 = yka319;
  data.item.akc228 = akc228;
  Base.refreshGrid("dgMx");
}


//清空查询条件
function  toClearTj()
{
	Base.clearData("bxCxtj");
}

// 获取查询参数
function getParameter()
{
	var parameter={};
	parameter["dto['aaz217']"]=Base.getValue("aaz217");
	parameter["dto['aka031']"]=Base.getValue("aka031");
	parameter["dto['aka063']"]=Base.getValue("aka063");
	parameter["dto['ake002']"]=Base.getValue("ake002");
	parameter["dto['ake007_s']"]=Base.getValue("ake007_s");
	parameter["dto['ake007_e']"]=Base.getValue("ake007_e");
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
	return parameter;
}

// 查询
function toQuery()
{
	var parameter = getParameter();
	Base.clearGridData("dgMx");	
	Base.clearGridData("dgHz");	
	Base.submit("","<%=path %>/medicalbenefit/calculation/personCalzfAction!toQueryShMx.do",parameter,null,false,null,null);
}

// 汇总数据行数据双击事件 
function fnDbClick(e,rowdata)
{
	Base.clearGridData("dgMx");	
	var parameter = getParameter();
	parameter["dto['aaz217']"]=rowdata.aaz217; // 医疗待遇申请事件ID
	parameter["dto['ake006']"]=rowdata.ake006; // 医院项目名称
	Base.submit("","<%=path %>/medicalbenefit/calculation/personCalzfAction!toQueryKc22.do",parameter,null,false,null,null);
}

// 确定修改明细
function toEdit()
{
	var gridData = Base.getGridSelectedRows("dgMx"); 
	if("" == gridData || null == gridData){
		Base.alert("请选择费用明细!","warn");
	}else{
		var param = {};
		param["dto.aaz217"] = gridData[0].aaz217; // 医疗待遇事件ID
		param["dto.aaz213"] = gridData[0].aaz213; // 明细ID
		param["dto.aka069"] = gridData[0].aka069; // 比例
		param["dto.yka318"] = gridData[0].yka318; // 超限价
		param["dto.yka319"] = gridData[0].yka319; // 符合范围
		param["dto.akc228"] = gridData[0].akc228; // 全自费
		Base.submit("","personCalzfAction!toSaveModifiedMx.do",param);
	}
}
$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>