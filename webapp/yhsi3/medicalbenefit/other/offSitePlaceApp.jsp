<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>异地安置申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:toolbarItem id="btnQuery" key="查询历史记录" icon="xui-icon-query"   onClick="toQueryHistory()"/>
		<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:date  id="sysdate" key="系统日期"  display="false" />
		 <ta:panel id="pnl_personInfo" cols="3" key="个人基本信息">
		    <ta:box cols="2">
			    <ta:text id="aac001"  key="个人ID" required="true"  labelWidth="120" onChange="getAc01Info()" columnWidth="0.9"/>
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名"         readOnly="true"  labelWidth="150" />
			<ta:text id="aac002" key="身份证号"   readOnly="true"  labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="150" />
			<ta:selectInput id="yac084" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120"  cssStyle="color:red;"/>
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab001" key="单位编号"  readOnly="true"  labelWidth="150" />
			<ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" />
			<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" readOnly="true"  collection="YKC005" labelWidth="150" />
			<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
		</ta:panel>
		<ta:panel cols="3" key="安置信息" >
			<ta:text id="aab301" key="安置地(省)" labelWidth="120"  maxLength="10"  bpopTipMsg="如:广西省"/>
			<ta:text id="akb040" key="安置地社保机构名称"  span="2" labelWidth="150"  maxLength="100" />
			<ta:date id="aae030" key="开始时间" labelWidth="120" showSelectPanel="true" required="true" />
			<ta:text id="akc030" key="申请原因" labelWidth="150"  span="2"  maxLength="2000" />
			<ta:text id="aae005" key="联系电话" labelWidth="120" maxLength="200"/>
			<ta:text id="aae006"  key="详细地址"  maxLength="100" labelWidth="150" span="2" />
		</ta:panel>
		<ta:panel id="fltOffSiteInfo" key="填写医院:请注意医院等级和医院名称必须同时录入，否则将不保存医院数据" cols="3" >
			<ta:box cols="2">
				<ta:text id="akb020_1" key="1、医院编码"  onChange="getKb01(this)" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn_1" key="?" onClick="showHosWindowMore(1)" />
				</ta:buttonLayout>
			</ta:box>	
			<ta:text id="akb021_1" key="医院名称" readOnly="true" />
			<ta:selectInput id="aka101_1" key="医院等级" readOnly="true" collection="AKB095"/>
		</ta:panel>
		<ta:panel cols="3" >
			<ta:box cols="2">
				<ta:text id="akb020_2" key="2、医院编码"  onChange="" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn_2" key="?" onClick="showHosWindowMore(2)" />
				</ta:buttonLayout>
			</ta:box>	
			<ta:text id="akb021_2" key="医院名称" readOnly="true" />
			<ta:selectInput id="aka101_2" key="医院等级" readOnly="true" collection="AKB095" />
		</ta:panel>
		<ta:panel cols="3" cssStyle="margin-top:0px;">
			<ta:box cols="2">
				<ta:text id="akb020_3" key="3、医院编码"  onChange="getKb01(this)" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn_3" key="?" onClick="showHosWindowMore(3)" />
				</ta:buttonLayout>
			</ta:box>	
			<ta:text id="akb021_3" key="医院名称" readOnly="true" />
			<ta:selectInput id="aka101_3" key="医院等级" readOnly="true" collection="AKB095" />
		</ta:panel>
		<ta:panel cols="3" cssStyle="margin-top:0px;">
			<ta:box cols="2">
				<ta:text id="akb020_4" key="4、医院编码"  onChange="getKb01(this)" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn_4" key="?" onClick="showHosWindowMore(4)" />
				</ta:buttonLayout>
			</ta:box>	
		    <ta:text id="akb021_4" key="医院名称" readOnly="true" />
			<ta:selectInput id="aka101_4" key="医院等级" readOnly="true" collection="AKB095" />
		</ta:panel>
		<ta:panel cols="3" cssStyle="margin-top:0px;">
			<ta:box cols="2">
				<ta:text id="akb020_5" key="5、医院编码"  onChange="getKb01(this)" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn_5" key="?" onClick="showHosWindowMore(5)" />
				</ta:buttonLayout>
			</ta:box>	
			<ta:text id="akb021_5" key="医院名称" readOnly="true" />
			<ta:selectInput id="aka101_5" key="医院等级" readOnly="true" collection="AKB095" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		
// 		initializeSuggestFramework(2,"", "akb020", 750, 300, 3, fn_getHosInfo1, 0, false);
// 		initializeSuggestFramework(3,"", "akb020_1", 750, 300, 3, fn_getHosInfo2, 0, false);
// 		initializeSuggestFramework(4,"", "akb020_2", 750, 300, 3, fn_getHosInfo3, 0, false);
// 		initializeSuggestFramework(5,"", "akb020_3", 750, 300, 3, fn_getHosInfo4, 0, false);
// 		initializeSuggestFramewor;(6,"", "akb020_4", 750, 300, 3, fn_getHosInfo5, 0, false);
	});
	function getKb01(obj){
		var num = obj.id.substr(6,8);
		var param = {"dto['akb020']":Base.getValue('akb020')};
		Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",param,
				function(data){
					if (data.errMsg != null && data.errMsg != ''){
						Base.alert(data.errMsg, 'warn');
						Base.setValue(obj.id,'');						return true;
					}
					if(data &&  data.hospitalInfoDto){
						Base.setValue(obj.id,data.hospitalInfoDto.akb020); // 医疗机构及药店ID
						Base.setValue('akb021'+num,data.hospitalInfoDto.akb021); // 医疗服务机构名称
                        Base.setValue('aka101'+num,data.hospitalInfoDto.aka101); // 医院等级
					}
			});
	}

	// 回调函数2
	  function fn_getHosInfo1(){
		   Base.setValue("akb020",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021",g_Suggest[1]);
		   Base.setValue("aka101",g_Suggest[3]);
		   var akb020 = g_Suggest[0];
		   if("990" == akb020||"991" == akb020||"992" == akb020){
		   		Base.setEnable("akb021");
		   		
		   }else{
		   		Base.setReadOnly("akb021");
		   }
		}
		
	// 回调函数3
	  function fn_getHosInfo2(){
		   Base.setValue("akb020_1",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021_1",g_Suggest[1]);
		   Base.setValue("aka101_1",g_Suggest[3]);
		   var akb020 = g_Suggest[0];
		   if("990" == akb020||"991" == akb020||"992" == akb020){
		   		Base.setEnable("akb021_1");
		   }else{
		   		Base.setReadOnly("akb021_1");
		   }
		}
		// 回调函数4
	  function fn_getHosInfo3(){
		   Base.setValue("akb020_2",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021_2",g_Suggest[1]);
		   Base.setValue("aka101_2",g_Suggest[3]);
		   var akb020 = g_Suggest[0];
		   if("990" == akb020||"991" == akb020||"992" == akb020){
		   		Base.setEnable("akb021_2");
		   }else{
		   		Base.setReadOnly("akb021_2");
		   }
		}
		// 回调函数5
	  function fn_getHosInfo4(){
		   Base.setValue("akb020_3",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021_3",g_Suggest[1]);
		   Base.setValue("aka101_3",g_Suggest[3]);
		   var akb020 = g_Suggest[0];
		   if("990" == akb020||"991" == akb020||"992" == akb020){
		   		Base.setEnable("akb021_3");
		   }else{
		   		Base.setReadOnly("akb021_3");
		   }
		}
		// 回调函数6
	  function fn_getHosInfo5(){
		   Base.setValue("akb020_4",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021_4",g_Suggest[1]);
		   Base.setValue("aka101_4",g_Suggest[3]);
		   var akb020 = g_Suggest[0];
		   if("990" == akb020||"991" == akb020||"992" == akb020){
		   		Base.setEnable("akb021_4");
		   }else{
		   		Base.setReadOnly("akb021_4");
		   }
		}
	
	
	  //人员窗口回调函数
      function callbackFunPerson(){
    	  Base.submit("aac001","offSitePlaceBackAction!toQueryPersonInfo.do");
	  }
	
	  //保存
	  function toSave() {
		 if(toCheckHospital()){
			if(Base.validateForm("form1")){
			    Base.submit("form1","offSitePlaceAppAction!toSave.do");
			}else{
				Base.alert("带红星的为必输入项!","warn");
			}
		 }
	  }
	
      //录入医院时,医疗等级和医院名称要同时录入时才有效!
      function toCheckHospital(){
		  var flg = true;
		  var akb020 = Base.getValue("akb020");
		  var akb021 = Base.getValue("akb021");
		  var akb020_1 = Base.getValue("akb020_1");
		  var akb021_1 = Base.getValue("akb021_1");
		  var akb020_2 = Base.getValue("akb020_2");
		  var akb021_2 = Base.getValue("akb021_2");
		  var akb020_3 = Base.getValue("akb020_3");
		  var akb021_3 = Base.getValue("akb021_3");
		  var akb020_4 = Base.getValue("akb020_4");
		  var akb021_4 = Base.getValue("akb021_4");
		  if("" == akb020 && "" == akb021){
			  
		  }else if("" != akb020 && "" != akb021){
			  
		  }else{
			  Base.alert("录入医院时,医疗等级和医院名称要同时录入时才有效!","warn");
			  flg = false;
		  }
		  if("" == akb020_1 && "" == akb021_1){
			  
		  }else if("" != akb020_1 && "" != akb021_1){
			  
		  }else{
			  Base.alert("录入医院时,医疗等级和医院名称要同时录入时才有效!","warn");
			  flg = false;
		  }
		  if("" == akb020_2 && "" == akb021_2){
			  
		  }else if("" != akb020_2 && "" != akb021_2){
			  
		  }else{
			  Base.alert("录入医院时,医疗等级和医院名称要同时录入时才有效!","warn");
			  flg = false;
		  }
		  if("" == akb020_3 && "" == akb021_3){
			  
		  }else if("" != akb020_3 && "" != akb021_3){
			  
		  }else{
			  Base.alert("录入医院时,医疗等级和医院名称要同时录入时才有效!","warn");
			  flg = false;
		  }
		  if("" == akb020_4 && "" == akb021_4){
			  
		  }else if("" != akb020_4 && "" != akb021_4){
			  
		  }else{
			  Base.alert("录入医院时,医疗等级和医院名称要同时录入时才有效!","warn");
			  flg = false;
		  }
		  return flg;
  }
  
  //查询历史记录
  function toQueryHistory()
  {
  	var aac001 = Base.getValue("aac001");
  	if("" == aac001 || null == aac001){
  		Base.alert("请输入个人ID","warn");
  		return;
  	}
  	var parameter = {};
  	parameter["dto['aac001']"] = aac001;
  	Base.openWindow('win_history', "历史记录", myPath()+"/process/medicalbenefit/other/offSitePlaceAppAction!toQueryHistory.do", parameter, "90%", "90%", null, null, true);
  	 
  }
  
  
  //判断当前时间是否晚于系统时间
  function judgeTime(obj)
  {
		var aae030 = obj.value; // 开始日期
		var sysdate = Base.getValue("sysdate"); // 系统日期
		if(aae030 != '' && sysdate != '' && sysdate > aae030){
			Base.alert("开始日期【<span style='color:#ff0000;'>" + aae030 + "</span>】"
					+ "<br>必须<span style='color:#ff0000;'>大于</span><br>"
					+ "系统日期【<span style='color:#ff0000;'>" + sysdate + "</span>】","warn");
		}
   }
	
</script>
<%@ include file="/ta/incfooter.jsp"%>