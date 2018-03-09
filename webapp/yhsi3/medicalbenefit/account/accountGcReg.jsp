<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>人员账户继承</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
<!-- 			<ta:toolbarItem id="btnPrint" key="打印[P]" icon="xui-icon-spotPrint"  hotKey="P" onClick="toPrint()" /> -->
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			 <ta:panel id="pnl_personInfo" cols="3" key="被继承人基本信息">
			        <ta:text id="aac001"  key="个人ID"  onChange="sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'))" required="true" labelWidth="120"/>
			    	<ta:text id="aac003" key="姓名"         readOnly="true"  labelWidth="150" />
					<ta:text id="aac002" key="身份证号"   readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
					<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="150" />
					<ta:selectInput id="yac084" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120"  />
					<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
					<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
					<ta:text id="aab001" key="单位编号"  readOnly="true"  labelWidth="150" />
					<ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" />
					<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
					<ta:selectInput id="ykc005" key="人员类型" readOnly="true"  collection="YKC005" labelWidth="150" />
					<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
					<ta:selectInput id="aac008" key="参保状态" collection="AAC008" readOnly="true" required="true"  cssStyle="color:red;" labelWidth="120"/>
					<ta:number id="aae042" key="退保年月"  readOnly="true" required="true" cssStyle="color:red;" labelWidth="150" />
					<ta:number id="aae240" key="账户余额"  readOnly="true" required="true" cssStyle="color:red;" labelWidth="120"/>
			 </ta:panel>
			 <ta:panel id="jcr_personInfo" cols="3" key="继承人基本信息">
			        <ta:text id="aac001_1"  key="个人ID"  onChange="sfwQueryUtil(2,'getAc01ByAae140ForYL',Base.getValue('aac001_1'))" required="true" labelWidth="120"/>
			    	<ta:text id="aac003_1" key="姓名"         readOnly="true"  labelWidth="150" />
					<ta:text id="aac002_1" key="身份证号"   readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aac004_1" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
					<ta:date id="aac006_1" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="150" />
					<ta:selectInput id="yac084_1" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120"  />
					<ta:selectInput id="aae140_1" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
					<ta:selectInput id="aac066_1" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
					<ta:text id="aab001_1" key="单位编号"  readOnly="true"  labelWidth="150" />
					<ta:text id="aab003_1" key="单位名称"  readOnly="true" labelWidth="120" />
					<ta:text id="yke112_1" key="年龄"  readOnly="true" span="1" labelWidth="120" />
					<ta:selectInput id="ykc005_1" key="人员类型" readOnly="true"  collection="YKC005" labelWidth="150" />
					<ta:selectInput id="ykc006_1" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
					<ta:selectInput id="aaa027_1" key="统筹区" readOnly="true" collection="AAA027" labelWidth="120" />
			 </ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	initializeSuggestFramework(1,"","aac001",500,300,4,toQuery,0,false);
	initializeSuggestFramework(2,"","aac001_1",500,300,4,aac001_callback_1,0,false);
});

	function aac001_callback_1(){
	   Base.setValue("aac001_1",g_Suggest[2]);
	   Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getPersonInfo.do",{"dto['aac001']":Base.getValue("aac001_1")},function(data){
			if (data.errMsg != null && data.errMsg != ''){
				Base.alert(data.errMsg);
				Base.setValue("aac001_1",'');
			    return true;
			}
			if(data &&  data.personInfoDto){ 
		 		    Base.setValue("aac002_1",data.personInfoDto.aac002); // 证件号码
					Base.setValue("aac003_1",data.personInfoDto.aac003); // 人员姓名
					Base.setValue("aac004_1",data.personInfoDto.aac004); // 性别
					Base.setValue("aac006_1",data.personInfoDto.aac006); // 出生日期
					Base.setValue("yac084_1",data.personInfoDto.yac084); // 离退休标志
					Base.setValue("aac008_1",data.personInfoDto.aac008); // 参保状态 
					Base.setValue("aae140_1",data.personInfoDto.aae140); // 险种类型
					Base.setValue("aaa027_1",data.personInfoDto.yab139); // 分中心
					Base.setValue("aac066_1",data.personInfoDto.aac066); // 参保身份
					Base.setValue("aab003_1",data.personInfoDto.aab003); // 单位名称
					Base.setValue("aab001_1",data.personInfoDto.aab001); // 单位名称
					Base.setValue("yke112_1",data.personInfoDto.yke112); // 年龄
					Base.setValue("ykc005_1",data.personInfoDto.ykc005); // 人员类型
					Base.setValue("ykc006_1",data.personInfoDto.ykc006); // 人员类别
		 	}
		 }); 
	}

   //查询数据库
   function toQuery()
   {  Base.setValue("aac001",g_Suggest[2]);
   	  Base.submit("pnl_personInfo","accountGcRegAction!queryBaseInfo.do",null,null,false,null,null);
   }
    
  //保存页面信息
  function toSave()
  { 
    if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?",
					function(btn, callback) {
						if (btn) {
							Base.submit('form1','accountGcRegAction!toSave.do');
						}
					});
		}	
   }

  // 打印
  function toPrint()
  {
	var aac001 = Base.getValue('aac001');
	//var reportName = "accountGive.raq";
	var reportName = "MedicareZHQT.raq";
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001);
	
  }
</script>
<%@ include file="/ta/incfooter.jsp"%>
