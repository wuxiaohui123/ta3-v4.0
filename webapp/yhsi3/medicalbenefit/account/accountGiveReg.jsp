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
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
<!-- 			<ta:toolbarItem id="btnPrint" key="打印[P]" icon="xui-icon-spotPrint"  hotKey="P" onClick="toPrint()" /> -->
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			 <ta:panel id="pnl_personInfo" cols="3" key="个人基本信息">
			    	<ta:text id="aac001" key="人员ID"  maxLength="20" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'));" />
			        <ta:text id="aab001" key="单位ID"  maxLength="20" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'));" />	
			 </ta:panel>
			<ta:panel id="pnlZh" key="账户信息" fit="true">
				<ta:datagrid id="accountInfo" forceFitColumns="true" fit="true" haveSn="true" selectType="checkbox">
				    <ta:datagridItem id="aaz267" key="医疗待遇申请事件ID" hiddenColumn="true"/>
     		        <ta:datagridItem id="aab001" key="单位ID"  align="center" showDetailed="true" dataAlign="left" maxChart="4"/>
     				<ta:datagridItem id="aac003" key="单位名称" align="center" showDetailed="true" dataAlign="left" maxChart="8" />
     		        <ta:datagridItem id="aac001" key="人员ID"  align="center" showDetailed="true" dataAlign="left" maxChart="4"/>
     				<ta:datagridItem id="aac003" key="姓名" align="center" showDetailed="true" dataAlign="left" maxChart="5" />
     				<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" showDetailed="true" dataAlign="left" maxChart="2" />
     				<ta:datagridItem id="aae140" key="险种" collection="AAE140" align="center" showDetailed="true" dataAlign="left" maxChart="4" />
     				<ta:datagridItem id="aac008" key="参保状态" collection="AAC008" align="center" showDetailed="true" dataAlign="left" maxChart="5" />
     				<ta:datagridItem id="aae042" key="退保年月"  align="center" showDetailed="true" dataAlign="left" maxChart="5" />
					<ta:datagridItem id="aae240" key="账户余额" align="center" showDetailed="true" dataAlign="right" maxChart="5" />     							
     				<ta:datagridItem id="yke051" key="扣减信息" align="center" showDetailed="true" dataAlign="right" maxChart="5" headerBackgroundColor="green" > 
     					<ta:datagridEditor type="number" min="0" max="999999999" precition="2" gridDatafn="true" onChange="checkAae058"/>
     				</ta:datagridItem> 							
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	initializeSuggestFramework(1,"","aac001",500,300,4,aac001_callback,0,false);
    initializeSuggestFramework(2,"","aab001",500,300,4,aab001_callback,0,false);
});

   function aac001_callback(){
	   Base.setValue("aac001",g_Suggest[2]);
	   Base.setValue("aac003",g_Suggest[1]);
	   Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getPersonInfo.do",{"dto['aac001']":Base.getValue("aac001")},function(data){
			if (data.errMsg != null && data.errMsg != ''){
				Base.alert(data.errMsg);
				Base.setValue("aac001",'');
			    return true;
			}
			if(data &&  data.personInfoDto){ 
		 		Base.setValue("aac003",data.personInfoDto.aac003);
		 	    Base.setValue("yab139",data.personInfoDto.yab139);
		 	    toQuery();
		 	}
		 }); 
	}
	
	function aab001_callback(){
	   Base.setValue("aab001",g_Suggest[1]);
	   Base.setValue("aab003",g_Suggest[2]);
	   toQuery()();
	}
   function checkAae058(data,value){
	    var aae240 = data.item.aae240;
	    var aac003 = data.item.aac003;
	    if(value>aae240){
	       Base.alert("姓名【"+aac003+"】输入的金额"+value+"不能大于账户余额"+aae240+",请重新输入");
	       return false;
	    }
	    if(value <= 0){
	       Base.alert("姓名【"+aac003+"】输入的金额"+value+"应大于0,请重新输入");
	       return false;
	    }
	}
   //查询数据库
   function toQuery()
   {
   	  Base.submit("form1","accountGiveRegAction!queryBaseInfo.do",null,null,false,null,null);
   }
    
  //保存页面信息
  function toSave()
  { 
    if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?",
					function(btn, callback) {
						if (btn) {
							Base.submit('pnl_personInfo,accountInfo','accountGiveRegAction!toSave.do');
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
