<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>异地人员回统筹区</title>
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
			<ta:selectInput id="aab301" key="安置地"  labelWidth="120"  collection="AAB301"   readOnly="true"/>
			<ta:text id="akb040" key="安置地社保机构名称" span="2" labelWidth="150"  readOnly="true"/>
			<ta:date id="aae030" key="开始时间" labelWidth="120" readOnly="true"/>
			<ta:date id="aae031" key="结束时间" labelWidth="150" readOnly="true"/>
			<ta:text id="akc030" key="申请原因"  labelWidth="120"  readOnly="true"/>
			<ta:text id="aae005" key="联系电话" labelWidth="120" maxLength="200" readOnly="true"/>
			<ta:text id="aae006" key="详细地址"  labelWidth="150" span="2" readOnly="true" />
		</ta:panel>
		<ta:panel id="fltOffSiteInfo" key="填写医院" cols="3" cssStyle="margin-bottom:0px;">
			<ta:selectInput id="aka101" key="一：医院等级" collection="AKB096"   labelWidth="120" readOnly="true" />
			<ta:text id="akb021" key="医院名称" labelWidth="150" span="2"  readOnly="true"/>
		</ta:panel>
		<ta:panel cols="3" cssStyle="margin-top:0px;margin-bottom:0px;">
			<ta:selectInput id="aka101_1" key="二：医院等级" collection="AKB096"   labelWidth="120" readOnly="true" />
			<ta:text id="akb021_1" key="医院名称" labelWidth="150" span="2" readOnly="true" />
		</ta:panel>
		<ta:panel cols="3" cssStyle="margin-top:0px;">
			<ta:selectInput id="aka101_2" key="三：医院等级" collection="AKB096"   labelWidth="120" readOnly="true"/>
			<ta:text id="akb021_2" key="医院名称" labelWidth="150" span="2" readOnly="true"/>
		</ta:panel>
		<ta:panel id="backData" key="填写回统筹日期" cols="3">
			<ta:date id="aae031_r" key="回统筹日期" labelWidth="120" showSelectPanel="true" required="true"  />
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
		//getAc01Info();
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
	        var aae030=Base.getValue("aae030");
			var aae031_r=Base.getValue("aae031_r");
			if(aae031_r =="" || aae031_r == null){
				Base.alert("请选择时间!","warn");
				return false;
			}
			Base.confirm("确定要保存吗?", function(yes) {
				if (yes) {
					Base.submit("form1","offSitePlaceBackAction!toUpdateKc45.do",null,null,false);
				}
			});
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