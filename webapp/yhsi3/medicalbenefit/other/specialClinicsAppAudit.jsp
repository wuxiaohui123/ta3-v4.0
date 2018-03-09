<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊项目使用审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1">
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="s" onClick="toSave()" />
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
	
		<ta:panel id="fltPersonInfo"  key="申请人基本信息" cols="3">
			<ta:text id="aac001"  key="个人ID" required="true"  labelWidth="150"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004" readOnly="true" labelWidth="150" />
			<ta:text id="aac002"  key="身份证号码" readOnly="true"  labelWidth="150" />
			<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120" display="false"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
			<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>			
			<ta:text id="aab001" key="单位ID"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
			<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/> 
		</ta:panel>
		<ta:panel id="fltHospitalInfo"  key="医疗服务机构基本信息"  cols="3"  cssStyle="margin-top:5px;margin-bottom:5px;">
			<ta:text id="akb020" key="医疗机构编码" required="true" labelWidth="150"/>
			<ta:text id="akb021" key="医疗服务机构名称" readOnly="true" labelWidth="150"  span="2" />
			<ta:selectInput id="akb022" key="医疗服务机构类型" collection="AKB022" readOnly="true" labelWidth="150" />
			<ta:selectInput id="akb023" key="定点医疗服务机构类别" collection="AKB023" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aaa027" key="统筹区编码" collection="AAA027" readOnly="true"  labelWidth="150" />
			<ta:selectInput id="aka101" key="明细限价医院等级" collection="AKA101" readOnly="true"  labelWidth="150"  display="false"/>
			<ta:selectInput id="akb095" key="限价医院等级" collection="AKB095" readOnly="true"  labelWidth="150" display="false"/>
			<ta:selectInput id="aaf003" key="定点联网开通标志" collection="AAF003" readOnly="true" labelWidth="150" display="false"/>
			<ta:text id="aaz107" key="定点医疗机构ID" validType="number" maxLength="20" labelWidth="150"  readOnly="true" display="false"/>
		</ta:panel>
		<ta:panel id="fdstClinicsApply"  key="诊疗项目及服务申请信息"  cols="3" >
			<ta:text id="aaz231" key="社保三大目录ID" required="true" labelWidth="150"/>
			<ta:text  id="ake001" key="社保三大目录统一编码" maxLength="20" readOnly="true" labelWidth="150" />
			<ta:text  id="ake002" key="社保三大目录名称" maxLength="200" readOnly="true" labelWidth="150"/>
			<ta:text  id="aka052" key="使用单位" readOnly="true" labelWidth="150" />
			<ta:number id="akc161" key="申请使用次数" alignLeft="true" required="true"  labelWidth="150" />
			<ta:text  id="ykh302"  key="医生名称" required="true" maxLength="50" labelWidth="150" />
			<ta:text  id="ake024"  key="主要病情描述" required="true" maxLength="4000" span="3" labelWidth="150" />
			<ta:textarea  id="yke253"  key="已做过检查级结果" required="true" span="3" maxLength="4000" bpopTipMsg="最多能输入4000个字符"  height="60" labelWidth="150" />
			<ta:textarea id="akc030" key="申请原因" span="3" required="true" maxLength="2000" labelWidth="150" bpopTipMsg="最多能输入4000个字符"  height="60"  />
			<ta:textarea id="aae013" key="备注" span="3" maxLength="2000" labelWidth="150" bpopTipMsg="最多能输入4000个字符"  height="50"  />			
		</ta:panel> 
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
        Base.filterSelectInput("action", '1,2', true);
	});
  
	//保存
	function toSave(){
	   if(Base.validateForm("form1")){
		   Base.submit("form1","specialClinicsAppAuditAction!save.do");
	   }else{
		   Base.alert("有红色波浪线的为必填内容!","warn");
	   }
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>