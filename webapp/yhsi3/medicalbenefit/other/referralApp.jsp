<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>转院申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="r" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltPersonInfo" key="人个基本信息" cols="3">
			<ta:box cols="2">
					<ta:text id="aac001"  key="个人ID" required="true"  labelWidth="120" onChange="getAc01Info()" columnWidth="0.9"/>
					<ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
			</ta:box>
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
		    <ta:box cols="2" >
				<ta:text id="akb041" key="原医疗机构编码" required="true" labelWidth="120" onChange="getKb01InfoMore(null,'akb041',1)" columnWidth="0.9" />
				<ta:button id="hosSmallBtn" key="?" onClick="showHosWindow('6')" />
			</ta:box>	 
			<ta:text id="akb021" key="原医疗机构名称"  labelWidth="120" readOnly="true"/>
			<ta:selectInput id="akb097" key="原医院等级" collection="AKA101" readOnly="true" labelWidth="120" />
			<ta:text id="aaz286" key="原医疗机构ID" readOnly="true"  display="false"/>
		</ta:panel>
		<ta:panel id="fltReferralApp" key="转往医院信息" cols="3">
		    <ta:text id="aaz294" key="转往医疗机构ID" readOnly="true"  display="false"/>
		    <ta:box cols="2" >
				<ta:text id="ake017" key="转往疗机构编码" required="true" labelWidth="120" onChange="getKb01InfoMore(null,'ake017',2)" columnWidth="0.9" />
				<ta:button id="hosSmallBtn1" key="?" onClick="showHosWindow('7')" />
			</ta:box>	 
		    <ta:text id="akc172" key="转住医院名称" labelWidth="120" maxLength="100" readOnly="true"/>
			<ta:selectInput id="aka101" key="转往医院等级" readOnly="true" collection="AKA101" labelWidth="120"  filter="01,02,03" reverseFilter="true"/>
			<ta:selectInput id="aaa034" key="转往统筹区" labelWidth="120" required="true"/>
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
	});
	
	//人员窗口回调函数
	function callbackFunPerson(){
		getAc01Info();
    }
	//原医疗机构
	function getKb01Info1(){
 		var param = {"dto['akb020']":Base.getValue('akb041')};
		Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",param,
				function(data){
					if (data.errMsg != null && data.errMsg != ''){
						Base.alert(data.errMsg, 'warn');
						Base.setValue("akb020",'');
						return true;
					}
					if(data &&  data.hospitalInfoDto){
						Base.setValue("akb021",data.hospitalInfoDto.akb021); // 医疗服务机构名称
						Base.setValue("akb097",data.hospitalInfoDto.aka101); // 医院等级
					}
			}); 
	}
	//转往医疗机构
	function getKb01Info2(){  
		var param = {"dto['akb020']":Base.getValue('ake017')};
		Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",param,
				function(data){
					if (data.errMsg != null && data.errMsg != ''){
						Base.alert(data.errMsg, 'warn');
						Base.setValue("akb020",'');
						return true;
					}
					if(data &&  data.hospitalInfoDto){
						Base.setValue("akc172",data.hospitalInfoDto.akb021); // 医疗服务机构名称
						Base.setValue("aka101",data.hospitalInfoDto.aka101); // 医院等级
					}
			});
		
	}
	//保存
	function toSave(){
	   if(!Base.validateForm("form1")){
			  return;
	   }
	   Base.submit("form1","referralAppAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>