<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>住院稽核审核(弹出框)</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:form id="form" fit="true" >
		   <ta:box id="bxID" cols="3" >
				<ta:text id="aaz212" key="人员医疗费用扣款事件ID" readOnly="true" display="false" />
				<ta:text id="aaz002" key="业务日志ID" readOnly="true" display="false" />
				<ta:text id="aaz208" key="医疗待遇结算台账事件ID" readOnly="true" display="false" />
				<ta:text id="aaz210" key="人员医疗费用单据ID" readOnly="true" display="false"/>
				<ta:text id="aaz216" key="人员医疗结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaz107" key="定点医疗机构ID" readOnly="true" display="false"/>
				<ta:text id="aaz272" key="医疗服务机构结算事件ID" readOnly="true" display="false" />
				<ta:text id="aaa027" key="统筹区编码" readOnly="true" display="false" />
				<ta:text id="akb020" key="医疗机构编码" readOnly="true" display="false" />
				<ta:selectInput id="aae140" key="险种类型" collection="AAE140" readOnly="true" display="false"/>
		   </ta:box>	
			<ta:panel id="pnlZyxx" key="个人住院信息" cols="4">
				<ta:text id="aaz217" key="流水号" readOnly="true" labelWidth="120" />
			    <ta:text id="aac003" key="姓名"  readOnly="true" labelWidth="120"/>
			    <ta:text id="aab003" key="所在单位"  readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="aab019" key="单位类型" readOnly="true" labelWidth="120" collection="AAB019" />
			    <ta:text id="aac001" key="保险号" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aac004" key="性别" readOnly="true" labelWidth="120" collection="AAC004" />
			    <ta:text id="yke112" key="年龄" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="akc021" key="人员性质" collection="AKC021" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aac020" key="人员级别" collection="AAC020" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aka130" key="住院类型" collection="AKA130" readOnly="true" labelWidth="120"/>
				<ta:text id="aac040" key="年工资"  readOnly="true" labelWidth="120" />
				<ta:text id="yka436" key="统筹累计"  readOnly="true" labelWidth="120" />
				<ta:date id="aae036" key="结算日期" readOnly="true" labelWidth="120"/>
				<ta:text id="akb021" key="就诊医院"  readOnly="true" labelWidth="120" span="2"/>
				<ta:selectInput id="akb097" key="医院等级" collection="AKB097" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aka042" key="住院类型" collection="AKA042" readOnly="true" labelWidth="120"/>
				<ta:text id="yke014" key="住院号" readOnly="true" labelWidth="120"/>
				<ta:text id="ykc022" key="住院次数" readOnly="true" labelWidth="120"/>
				<ta:text id="yka115" key="本次起付线" readOnly="true" labelWidth="120"/>
				<ta:date id="aae030" key="入院日期" readOnly="true" labelWidth="120"/>
				<ta:date id="aae031" key="出院日期" readOnly="true" labelWidth="120"/>
				<ta:text id="yke021" key="住院天数" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="aka122" key="出院病种类型" collection="AKA122" readOnly="true" labelWidth="120"/>
				<ta:text id="aka121" key="出院病种" readOnly="true" labelWidth="120"/>
				<ta:text id="akc193" key="入院诊断" readOnly="true" labelWidth="120" span="2"/>
				<ta:text id="cyzd" key="出院诊断" readOnly="true" labelWidth="120" span="2"/>
			</ta:panel>
			<ta:panel id="pnlFee" key="住院费用" expanded="false" cols="4">
				<ta:text id="akc264" key="总费用" readOnly="true" labelWidth="120"/>
				<ta:text id="" key="全支付" readOnly="true" labelWidth="120"/>
				<ta:text id="akc228" key="全自费" readOnly="true" labelWidth="120"/>
				<ta:text id="akc268" key="超退额自费" readOnly="true" labelWidth="120"/>
				<ta:text id="yka318" key="按比例个人先自付" readOnly="true" labelWidth="120"/>
				<ta:text id="yka319" key="进入统筹范围费用" readOnly="true" labelWidth="120"/>
				<ta:text id="yka059" key="统筹个人支付" readOnly="true" labelWidth="120"/>
				<ta:text id="ake039" key="统筹支付" readOnly="true" labelWidth="120"/>
			</ta:panel>
			<ta:panel id="pnlSh" key="审核修改" expanded="false" cols="3" >
				<ta:selectInput id="yka095" key="审核病种类型" collection="AKA122" labelWidth="120" filter="1,3,4" reverseFilter="true"  maxVisibleRows="8" isAutoExtend="false"/>
				<ta:selectInput id="aka123" key="审核病种名称" labelWidth="120"  maxVisibleRows="8" isAutoExtend="false"/>
				<ta:text id="akc199" key="审核诊断"   labelWidth="120" />
				<ta:text id="akb069_mx" key="审核明细拒付费用" readOnly="true" labelWidth="120" />
				<ta:number id="akb069" key="实际拒付费用" labelWidth="120" precision="2" max="9999999" min="0"/>
				<ta:selectInput id="aae100" key="审核结果" labelWidth="120" collection="aae100" value="1"/>
				<ta:text id="aae013" key="拒付说明"   labelWidth="120" span="3"/>
			</ta:panel>
			<ta:buttonLayout id="btns" align="center" cssClass="no-padding">
			   <ta:button id="btnMxSh"  key="明细审核" icon="xui-icon-show"   onClick="toMxSh()"/>
			   <ta:button id="btnSh"    key="审核完毕" icon="xui-icon-spotSave"   onClick="save()"/>
			   <ta:button id="btnClose" key="退出"     icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('w_sh');"/>
			</ta:buttonLayout>
		</ta:form>
	</body>
</html>
<script type="text/javascript">

// 审核完毕按钮
function save()
{
	var parameter={};
	parameter["dto['aaz217']"]=Base.getValue("aaz217"); // 医疗待遇申请事件ID
	parameter["dto['aaz208']"]=Base.getValue("aaz208"); // 医疗待遇台账事件ID
	parameter["dto['yka095']"]=Base.getValue("yka095"); // 审核病种类型
	parameter["dto['aka123']"]=Base.getValue("aka123"); // 审核病种编码
	parameter["dto['akc197']"]=Base.getValue("aka123_desc"); // 审核病种名称
	parameter["dto['akc199']"]=Base.getValue("akc199"); // 审核诊断
	parameter["dto['yke090']"]=Base.getValue("aae100"); // 审核结果
	parameter["dto['akb069']"]=Base.getValue("akb069"); // 实际拒付费用
	parameter["dto['aae013']"]=Base.getValue("aae013"); // 拒付说明
	parameter["dto['aac001']"]=Base.getValue("aac001"); // 人员ID
	// 保存数据
	Base.submit("","<%=path %>/process/medicalbenefit/reckoning/detailAuditCommAction!toSh.do",parameter);
}

// 弹出明细审核框
function toMxSh()
{
	var parameter={};
	parameter["dto['aaz217']"]=Base.getValue("aaz217"); // 医疗待遇申请事件ID
	parent.Base.openWindow("w_mxsh","明细审核","<%=path %>/process/medicalbenefit/reckoning/detailAuditCommAction!toOpenShMx.do", parameter, "99%", "99%",null,function(){
		Base.submit("aaz217","<%=path %>/process/medicalbenefit/reckoning/detailAuditCommAction!getKc35ByAaz217.do");
	},true);	
}

$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>