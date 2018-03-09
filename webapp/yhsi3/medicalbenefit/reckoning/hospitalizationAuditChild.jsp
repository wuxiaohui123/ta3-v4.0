<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>住院费用明细</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:toolbar id="btr1">
<%--			<ta:toolbarItem id="bntSave1" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="save()" />--%>
			<ta:toolbarItem id="btnReset1" key="关闭[Q]" icon="xui-icon-spotClose" hotKey="q" onClick="parent.Base.closeWindow('detailWin')"/>
		</ta:toolbar>
		<ta:form id="form" fit="true" >
		   <ta:box id="bxID" cols="3" >
				<ta:text id="aaz217" key="人员医疗就诊事件ID" readOnly="true" display="false" />
				<ta:text id="aaz212" key="人员医疗费用扣款事件ID" readOnly="true" display="false" />
				<ta:text id="aaz002" key="业务日志ID" readOnly="true" display="false" />
				<ta:text id="aaz210" key="人员医疗费用单据ID" readOnly="true" display="false"/>
				<ta:text id="aaz216" key="人员医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz107" key="定点医疗机构ID" readOnly="true" display="false"/>
				<ta:text id="aaz272" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaa027" key="统筹区编码" readOnly="true" display="false" />
				<ta:text id="akb020" key="医疗机构编码" readOnly="true" display="false" />
		   </ta:box>	
			<ta:selectInput id="yka026" key="慢性病编码" collection="YKA026" readOnly="true" labelWidth="120" display="false" />
			<ta:selectInput id="aka042" key="住院类型" collection="AKA042" readOnly="true" labelWidth="120" display="false"/>
			<ta:selectInput id="aka078" key="就诊方式" collection="AKA078" readOnly="true" labelWidth="120" display="false"/>
			<ta:panel id="pnlJz" key="人员就诊信息" cols="3">
			    <ta:text id="aac001" key="人员ID" readOnly="true" labelWidth="120"/>
			    <ta:text id="aac003" key="姓名"  readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aac004" key="性别" readOnly="true" labelWidth="120" collection="AAC004" />
			    <ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="aae140" key="险种类型" collection="AAE140" readOnly="true" labelWidth="120"/>
				<ta:text id="akb021" key="医疗机构名称"  readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" readOnly="true" labelWidth="120"/>
				<ta:date id="aae030" key="入院日期" readOnly="true" labelWidth="120"/>
				<ta:date id="aae031" key="出院日期" readOnly="true" labelWidth="120"/>
				<ta:text id="akc190" key="门诊号" readOnly="true" labelWidth="120"/>
				<ta:text id="yke014" key="住院号" readOnly="true" labelWidth="120"/>
				<ta:text id="akc196" key="诊断" readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="aka122" key="申报病种类型" collection="AKA122" readOnly="true" labelWidth="120"/>
				<ta:text id="aka121" key="申报病种名称" readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="yka095" key="审核病种类型" collection="AKA122" labelWidth="120" filter="2" readOnly="true" />
				<ta:selectInput id="aka123" key="审核病种名称" labelWidth="120" span="2"  readOnly="true" />
			</ta:panel>
			<ta:panel id="pnlFee" key="人员费用明细" fit="true" expanded="false">
				<ta:datagrid id="dgrdFee" fit="true" haveSn="true" >
<%--					<ta:datagridItem id="akc269" key="扣款原因"  align="center"  dataAlign="left"  maxChart="8" collection="AKC269" >--%>
<%--						<ta:datagridEditor type="selectInput"  collection="AKC269" />--%>
<%--					</ta:datagridItem>--%>
<%--					<ta:datagridItem id="akc265" key="扣款金额" align="center"  dataAlign="right"  maxChart="8"  dataType="number" totals="sum"  tatalsTextShow="false">--%>
<%--						<ta:datagridEditor type="number" min="0" precition="2"/>--%>
<%--					</ta:datagridItem>--%>
					<%@ include file="../common/kc22.jsp"%>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
function save()
{
	var data=Base.getGridData("dgrdFee");
	if(1 > data.length)
		return Base.aler("没有费用明细,不能保存!","warn");
	//只获取重要的字段
	var data1 = [];
	var rowdata1 = {};
	$.each(data,function(indext,rowdata){
		rowdata1 = {};
		rowdata1.aaz213 = rowdata.aaz213;//人员医疗费用明细ID
		rowdata1.aka075 = rowdata.aka075;//扣款类型
		rowdata1.akc269 = rowdata.akc269;//扣款原因
		rowdata1.akc265 = rowdata.akc265;//扣款金额
		data1.push(rowdata1);
	});
	var parameter={};
	parameter["gridData"]=Ta.util.obj2string(data1);
	Base.submit("bxID,pnlJz","detailAuditAction!toSaveDetail.do",parameter,null,false,null,null);
}

function fnFormatter(row, cell, value, columnDef, dataContext)
{
	if(value==null || value=="")
		value = "";
	return "<span style='color:red;'>"+value+"</span>";
}
$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>