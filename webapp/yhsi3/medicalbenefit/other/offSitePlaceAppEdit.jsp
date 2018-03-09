<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>异地人员修改</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="r" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="fltPersonInfo"  key="人员基本信息"  cols="3"  >
		 <ta:text id="aaz267" key="登记事件ID"        display="false" labelWidth="150" />
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
			<ta:selectInput id="yac084" key="退休标志" readOnly="true" collection="YAC084" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab001" key="单位编号"  readOnly="true" labelWidth="150" />
			<ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" />
			<ta:text id="akc023" key="年龄"  readOnly="true" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" readOnly="true"  collection="YKC005" labelWidth="150" />
			<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
		</ta:panel>
		<ta:panel cols="3" key="安置信息" >
			<ta:selectInput id="aab301" key="安置地"  labelWidth="120"  collection="AAB301"   readOnly="false"/>
			<ta:text id="akb040" key="安置地社保机构名称" span="2" labelWidth="150"  readOnly="false"/>
			<ta:date id="aae030" key="开始时间" labelWidth="120"  required="true" showSelectPanel="true"/>
			<ta:date id="aae031" key="结束时间" labelWidth="150" readOnly="false" showSelectPanel="true" display="false"/>
			<ta:text id="akc030" key="申请原因"  labelWidth="150"  readOnly="false"/>
			<ta:text id="aae005" key="联系电话" labelWidth="120" maxLength="200"/>
			<ta:text id="aae006" key="详细地址"  labelWidth="120" span="2" readOnly="false" />
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
				<ta:text id="akb020_2" key="2、医院编码"  onChange="getKb01(this)" columnWidth="0.9" />
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
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
// 		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
		initializeSuggestFramework(2,"", "akb020", 750, 300, 3, fn_getHosInfo1, 0, false);
		initializeSuggestFramework(3,"", "akb020_1", 750, 300, 3, fn_getHosInfo2, 0, false);
		initializeSuggestFramework(4,"", "akb020_2", 750, 300, 3, fn_getHosInfo3, 0, false);
	});
	//人员窗口回调函数
    function callbackFunPerson(){
			getAc01Info();
	  }
	
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
	//省下拉框选择
	function fnSelect1(value,key){
		if(value=="0"){
		    Base.setValue("aab301","");//所属行政区代码、安置地
	        Base.setValue("aaa027","");//统筹区编码
		}else{
			Base.setValue("aab301",key);//所属行政区代码、安置地
		    Base.setValue("aaa027",key);//统筹区编码
		}
	    Base.submit("province","offSitePlaceAppAction!checkCode.do?dto.isPorC=province",null,null,false,function(data){
	    	Base.setValue("city","0");
	    	Base.setValue("country","0");
	    },null);
	}
	//市下拉框选择
	function fnSelect2(value,key){
		if(value!="0"){
		   Base.setValue("aab301",key);//所属行政区代码、安置地
	       Base.setValue("aaa027",key);//统筹区编码
		}
        Base.submit("city","offSitePlaceAppAction!checkCode.do?dto.isPorC=city",null,null,false,function(data){
        	Base.setValue("country","0");
        },null);
	}
	//县下拉框选择
	function fnSelect3(value,key){
		if(value!="0"){
			Base.setValue("aab301",key);//所属行政区代码、安置地
			Base.setValue("aaa027",key);//统筹区编码
		}
	}
	
	//保存
	function toSave() {
			if(Base.validateForm("form1")){
			   Base.confirm("确定要保存吗?", function(yes) {
					if (yes) {					    
						Base.submit("form1","offSitePlaceAppEditAction!toUpdateKc45.do",null,null,false);
					}
				});
			}else{
				Base.alert("带红星的为必输入项!","warn");
				return false;
			}
			
	}
	//判断当前时间是否晚于系统时间
	function judgeTime(obj){
		var aae030 = Base.getValue('aae030');
		var aae031 = Base.getValue('aae031');
		if(aae030 != '' && aae031 != '' && aae031 < aae030){
			obj.value='';
			Base.alert("开始日期【<span style='color:#ff0000;'>" + aae030 + "</span>】"
					+ "<br>必须<span style='color:#ff0000;'>小于</span><br>"
					+ "结束日期【<span style='color:#ff0000;'>" + aae031 + "</span>】","warn");
			return false;
		}
		Base.submit('aae030','offSitePlaceAppAction!judgeTime.do');
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>