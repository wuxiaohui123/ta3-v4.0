<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>转院申请复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body  class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="toSave()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	      <ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz267" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
	
		<ta:panel id="fltPersonInfo" key="人个基本信息" cols="3">
			<ta:text id="aac001"  key="个人ID" required="true"  labelWidth="120" />
			<ta:text id="aac003" key="姓名" readOnly="true"  labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true"  labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120"/>
			<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
			<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>			
			<ta:text id="aab001" key="单位ID"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
			<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/>
		</ta:panel>
		<ta:panel id="fltOldHospital" key="原就诊医院信息" cols="3" >
			<ta:text id="akb041" key="原医疗机构编码" required="true" labelWidth="120"/>
			<ta:text id="akb021" key="原医疗机构名称"  labelWidth="120" readOnly="true"/>
			<ta:selectInput id="akb097" key="原医院等级" collection="AKA101" readOnly="true" labelWidth="120" />
			<ta:text id="aaz286" key="原医疗机构ID" readOnly="true"  display="false"/>
		</ta:panel>
		<ta:panel id="fltReferralApp" key="转往医院信息" cols="3">
		    <ta:text id="aaz294" key="转往医疗机构ID" readOnly="true"  display="false"/>
			<ta:text id="ake017" key="转往疗机构编码" required="true" labelWidth="120"/>
		    <ta:text id="akc172" key="转住医院名称" labelWidth="120" maxLength="100" readOnly="true"/>
			<ta:selectInput id="aka101" key="转往医院等级" readOnly="true" collection="AKB096" labelWidth="120"  filter="01,02,03" reverseFilter="true"/>
			<ta:selectInput id="aaa034" key="转往统筹区" labelWidth="120" required="true" collection="AAB301"/>
			<ta:date id="ake014" key="申请日期" showSelectPanel="true" required="true" labelWidth="120"/>
			<ta:selectInput id="yke270" key="转院类型" required="true" labelWidth="120" collection="YKE270"  isAutoExtend="false"/>
			<ta:text id="aae190" key="诊断" required="true" labelWidth="120" maxLength="4000" span="3"/>
			<ta:text id="ake015" key="转院原因" required="true" labelWidth="120" maxLength="4000" span="3"/>
			<ta:text id="aae013" key="备注"  labelWidth="120" maxLength="2000" span="3"/>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("action", '1,2', true);
	});
	// 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	   Base.setValue("akb097",rowdata.akb097); // 医疗机构等级
	   Base.setValue("aaz286",rowdata.aaz269); // 医疗机构及药店ID
	}
	
	//保存
	function toSave(){
	   if(!Base.validateForm("form1"))
		  return;
	   Base.setDisabled("btnSave"); // 保存按钮先置灰
	   Base.submit("form1","referralAppAuditAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>