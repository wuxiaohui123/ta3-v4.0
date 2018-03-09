<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>门诊或药店费用明细</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:toolbar id="btr1">
			<ta:toolbarItem id="btnBFJf"   key="部分拒付"     icon="xui-icon-spotSave"  onClick="toJf('1')"/>
			<ta:toolbarItem id="btnZBJf"   key="整笔结算拒付"     icon="xui-icon-spotSave"  onClick="toJf('2')"/>
			<ta:toolbarItem id="btnQxJf" key="取消拒付"  icon="xui-icon-spotEdit"  onClick="toJf('0')"/>
			<ta:toolbarItem id="btnTg"     key="审核完成"       icon="xui-icon-spotSave"  onClick="toTg()" />
			<ta:toolbarItem id="btnReset1" key="关闭" icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('w_jf')"/>
		</ta:toolbar>
		<ta:form id="form" fit="true" >
			<ta:box id="bxID" cols="3" >
				<ta:text id="akc265" key="扣款金额" readOnly="true" display="false"/>
				<ta:text id="aaz217" key="人员医疗就诊事件ID" readOnly="true"  labelWidth="120"/>
				<ta:text id="aaz208" key="人员医疗就诊事件ID" readOnly="true" display="false" />
				<ta:text id="aaz216" key="人员医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz212" key="人员医疗费用扣款事件ID" readOnly="true" display="false" />
				<ta:text id="aaz002" key="业务日志ID" readOnly="true" display="false" />
				<ta:text id="aaz210" key="人员医疗费用单据ID" readOnly="true" display="false"/>
				<ta:text id="aaz107" key="定点医疗机构ID" readOnly="true" display="false"/>
				<ta:text id="aaz272" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaa027" key="统筹区" readOnly="true" display="false" />
				<ta:text id="akb020" key="医疗服务机构ID" readOnly="true" display="false" />
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
				<ta:datagrid id="dgrdFee" fit="true" forceFitColumns="true"  haveSn="true" selectType="checkbox">
					<ta:datagridItem id="aaz231" key="社保三大目录ID"  hiddenColumn="true" />
					<ta:datagridItem id="aaz213" key="人员医疗费用明细ID"  hiddenColumn="true" />
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
					<ta:datagridItem id="aka070" key="剂型" align="center" dataAlign="left"  maxChart="6"       formatter="fnFormatter" />
					<ta:datagridItem id="aka074" key="规格" align="center" dataAlign="left"  maxChart="4"   collection="AKA074" formatter="fnFormatter" />
					<ta:datagridItem id="akb069" key="扣款金额" align="center" dataAlign="right" maxChart="6"  totals="sum" tatalsTextShow="false" formatter="fnFormatter" >
						<ta:datagridEditor type="number" min="0" max="9999"  precition="2" />
					</ta:datagridItem>
					<ta:datagridItem id="akc269" key="扣款原因" >
						<ta:datagridEditor type="text" />
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
// 拒付
function toJf(lx)
{
	var data = Base.getGridSelectedRows("dgrdFee");
	if(1 > data.length && lx != '2'){
	   Base.alert("请勾选数据!","warn");
	   return false;
	}
	//只获取重要的字段
	var data1 = [];
	var rowdata1 = {};
	$.each(data,function(indext,rowdata){
		rowdata1 = {};
		rowdata1.aaz213 = rowdata.aaz213;//人员医疗费用明细ID
		rowdata1.akc265 = rowdata.yka319;//符合范围
		rowdata1.akc269 = rowdata.akc269;//拒付原因
		rowdata1.akb069 = rowdata.akb069;//拒付金额
		data1.push(rowdata1);
	});
	var parameter={};
	parameter["gridData"]=Ta.util.obj2string(data1);
	parameter["dto.yke091"]=lx;
	Base.submit("bxID,pnlJz","baseDetailAction!toSaveJf.do",parameter,null,false,null,null);
}

// 列渲染方法
function fnFormatter(row, cell, value, columnDef, dataContext)
{
	var yka538 = dataContext.yka538;
	if("拒付" == yka538 || "00" == yka538){
		if("" != value && null != value)
		   value = "<span style='color:blue;'>"+value+"</span>";
	}
	return value;
 }
//全部通过或全部取消
	function toTg()
	{
		Base.submit("bxID,pnlJz","baseDetailAction!toTgOne.do",null);
	}
$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>