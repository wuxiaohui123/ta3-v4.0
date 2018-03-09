<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>退保人员账户清退</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:button id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" asToolBarItem="true"/>
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			 <ta:panel id="pnl_personInfo" cols="3" key="个人基本信息">
			    <ta:text id="aac001" key="个人ID" required="true" labelWidth="120" />
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
				<ta:text id="aac002" key="身份证号" readOnly="true"  labelWidth="120" />
				<ta:selectInput id="aac004" key="性别" collection="AAC004" readOnly="true" labelWidth="120" />
				<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
				<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
				<ta:selectInput id="aac008" key="参保状态" readOnly="true" collection="AAC008" labelWidth="120" />
				<ta:date id="aae042" key="退保年月" readOnly="true" showSelectPanel="true" labelWidth="120" bpopTipMsg="如201401" issue="true" />
				<ta:text id="aae240" key="账户余额"  readOnly="true" span="1" labelWidth="120" />
				<ta:text id="aab001" key="单位ID"  readOnly="true" span="1" labelWidth="120" />
				<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
				<ta:text id="yke051" key="扣减信息"  maxLength="14" span="1" labelWidth="120" required="true" onChange="checkAae058()"/>
			 </ta:panel>
			 <ta:panel id="pnl_bankinfo" cols="3" key="银行帐号">
			 	<%@ include file="/yhsi3/commonJSP/bankInfo.jsp"%>
			 </ta:panel> 
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 5, fn_getPerson, 0, false);
	});
	
	// 人员IDchange事件 
	$("#aac001").change(function(){
		sfwQueryUtil(1,"getAc01ForGivereg",this.value,null);
	});
	
	// 人员基本信息回调方法
	function fn_getPerson(){
		   Base.setValue("aac001",g_Suggest[0]);
		   Base.getJson("accountGiveRegAction1!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001")},function(data){
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
					Base.setValue("aab001",data.personInfoDto.aab001);
					Base.setValue("aae042",data.personInfoDto.aae042);
					Base.setValue("aac008",data.personInfoDto.aac008);
					Base.setValue("aae140",data.personInfoDto.aae140);
					Base.setValue("yab139",data.personInfoDto.yab139);
					Base.setValue("yke112",data.personInfoDto.yke112);
					Base.setValue("aab003",data.personInfoDto.aab003);
					Base.setValue("akc023",data.personInfoDto.yke112);
					Base.setValue("aae240",data.personInfoDto.aae240);
					Base.setEnable("btnSave");
					
					//查询银行信息
					Base.submit("form1","accountGiveRegAction1!queryBankInfo.do",null,null,false,null,null);
			 	}
			 });
		}
	//金额检查
   function checkAae058(){
	    var aae240 = parseInt(Base.getValue('aae240'));
	    var yke051 = parseInt(Base.getValue('yke051'));
	    var aac003 = Base.getValue('aac003');
	    if(yke051>aae240){
	       Base.alert("姓名【"+aac003+"】输入的金额"+yke051+"不能大于账户余额"+aae240+",请重新输入",'warn');
	       Base.setValue('yke051','');  
	       return false;
	    }
	    if(yke051 <= 0){
	       Base.alert("姓名【"+aac003+"】输入的金额"+yke051+"应大于0,请重新输入",'warn');
	       Base.setValue('yke051','');  
	       return false;
	    }
	}
  	//保存页面信息
   function toSave()
   { 
	  if(Base.validateForm("form1")) {
		  Base.submit('form1','accountGiveRegAction1!toSave.do');
	  }	
   }
   //根据银行卡号获取银行信息
	function fnSelectAae010(key,value){
		Base.submit('','accountGiveRegAction1!queryBankInfo1.do',{"dto['aae010']":key});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
