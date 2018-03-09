<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特诊特治及用药申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="r" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fltPersonInfo" key="申请人基本信息" cols="3">
			<ta:text id="aac001" key="个人ID" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))" labelWidth="150" bpopTipMsg="输入个人ID、身份证号、姓名，可自动完成查询" />
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004" readOnly="true" labelWidth="150" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" readOnly="true" labelWidth="150" />
			<ta:selectInput id="aac009" key="户口性质" collection="AAC009" readOnly="true" labelWidth="150" />
			<ta:text id="aac010" key="户口所在地" span="2" readOnly="true" labelWidth="150" />
			<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="150" />
		</ta:panel>
		<ta:panel id="fltHospitalInfo" key="医疗服务机构基本信息" cols="3" cssStyle="margin-top:5px;margin-bottom:5px;">
			<ta:text id="akb020" key="医疗服务机构编号" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="150" />
			<ta:text id="akb021" key="医疗服务机构名称" readOnly="true" labelWidth="150" span="2" />
		</ta:panel>
		<ta:panel id="pnl_kc44_beform" key="特殊殊项目申请信息(勾选后点击保存即为审核)" fit="true" heightDiff="100">
			<ta:datagrid id="dateGrid_kc44" fit="true" haveSn="true" forceFitColumns="true" selectType="checkbox">
				<ta:datagridItem id="aac001" key="人员ID" align="center" />
				<ta:datagridItem id="akb020" key="医疗服务机构编号" align="center" />
				<ta:datagridItem id="ake001" key="社保三大目录统一编码" align="center" />
				<ta:datagridItem id="ake002" key="社保三大目录名称" align="center" />
				<ta:datagridItem id="akc226" key="数量" width="50" align="center" />
				<ta:datagridItem id="akc225" key="单价" width="50" align="center" />
				<ta:datagridItem id="aka074" key="规格" width="50" align="center" />
				<ta:datagridItem id="akc193" key="入院诊断" align="center" showDetailed="true" />
				<ta:datagridItem id="akc195" key="已做过的检查结果" align="center" showDetailed="true" />
				<ta:datagridItem id="aae191" key="医院审批意见" align="center" showDetailed="true" />
				<ta:datagridItem id="aaz267" key="医疗待遇申请事件ID" hiddenColumn="true" align="center" />
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="spyj" key="审批意见">
			<ta:textarea id="aae189" key="审批意见" height="60" maxLength="500" labelWidth="150"></ta:textarea>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
		initializeSuggestFramework(2,"", "akb020", 500, 300, 4, fn_getHospital, 0, false);
	});
	
 
	
	
   function fn_getPerson(){
	   Base.setValue("aac001",g_Suggest[2]);
	   Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",{"dto['aac001']":Base.getValue("aac001")},function(data){
		   if (data.errMsg != null && data.errMsg != ''){
	           Base.alert(data.errMsg);
	           Base.setValue("aac001",'');
			    return true;
			 }
			 if(data &&  data.personInfoDto)
		 	{ 
				Base.setValue("aac002",data.personInfoDto.aac002);
		 		Base.setValue("aac003",data.personInfoDto.aac003);
		 		Base.setValue("aac004",data.personInfoDto.aac004);
		 	    Base.setValue("aac005",data.personInfoDto.aac005);
		 	    Base.setValue("aac060",data.personInfoDto.aac060);
		 		Base.setValue("aac008",data.personInfoDto.aac008);
		 	    Base.setValue("aac009",data.personInfoDto.aac009);
		 	    Base.setValue("aac010",data.personInfoDto.aac010);
		 	    Base.setValue("yab139",data.personInfoDto.yab139);
		 	}
			 Base.submit("","specialProjectAppAction!queryKc44Info.do",{"dto['aac001']": data.personInfoDto.aac001} );
		 });
	}
function fn_getHospital(){
	Base.getJson("<%=path%>
	/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
						{
							"dto['akb020']" : Base.getValue("akb020")
						},
						function(data) {
							if (data.errMsg != null && data.errMsg != '') {
								Base.alert(data.errMsg);
								Base.setValue("akb020", "");
								return false;
							}
							if (data && data.hospitalInfoDto) {
								Base.setValue("akb021",
										data.hospitalInfoDto.akb021);
							}
							Base
									.submit(
											"",
											"specialProjectAppAction!queryKc44Info.do",
											{
												"dto['akb020']" : data.hospitalInfoDto.akb020
											});
						});
	}

	//保存
	function toSave() {
		Base.confirm("确定要保存吗?", function(yes) {
			if (yes) {
				Base.submit("dateGrid_kc44,aae189",
						"specialProjectAppAction!toSave.do");
			}
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>