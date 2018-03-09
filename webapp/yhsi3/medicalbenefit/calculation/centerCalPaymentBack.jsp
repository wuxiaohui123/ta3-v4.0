<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>报盘回盘</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class = "no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
		   <ta:buttonLayout align="center">   
		       <ta:button  id="queryBtn"   icon="xui-icon-query"       key="查询"         onClick="query()"     asToolBarItem="true"/>  
		       <ta:button  id="saveBtn"    icon="xui-icon-spotSave"    key="回盘保存"     onClick="toSave()"    asToolBarItem="true"/>  
		       <ta:button  id="resetBtn"   icon="xui-icon-spotReset"   key="重置"      type="resetPage"      asToolBarItem="true" />
		    </ta:buttonLayout> 
 	   </ta:toolbar>
		<ta:form id="form1" fit="true" >
		    <ta:panel id = "pnlCxtj"  key="查询条件" cols="3">  
			    <ta:text id="aaz031" key="拨付通知ID"  required="true"/>  
			    <ta:text id="aac001" key="个人ID"  />  
			    <ta:text id="aac003" key="姓名"  />  
			    <ta:text id="aae013" key="失败原因"  required="true"/>  
		    </ta:panel>   
		    <ta:panel id = "pnlMx"  key="报盘明细" fit="true">  
			  <ta:datagrid id="dgAd34a2" fit="true" forceFitColumns="true"   haveSn="true" >  
			      <ta:datagridItem id="aae076" key="财务流水号 " align="center" dataAlign="left"  maxChart="6"/>  
			      <ta:datagridItem id="aaz031" key="拨付通知ID" align="center" dataAlign="left"  maxChart="6"/>  
			      <ta:datagridItem id="aaz010" key="个人ID"  align="center" dataAlign="left"  maxChart="6"/>  
			      <ta:datagridItem id="aac003" key="姓名"   align="center" dataAlign="left"  maxChart="4"/>  
			      <ta:datagridItem id="aac002" key="身份证"  align="center" dataAlign="left"  maxChart="9"/>  
			      <ta:datagridItem id="yad001" key="应处理金额"  align="center" dataAlign="right"  maxChart="6"/>  
			      <ta:datagridItem id="yad003" key="实处理金额"  align="center" dataAlign="right"  maxChart="6"/>  
			      <ta:datagridItem id="aae009" key="户名"    align="center" dataAlign="left"  maxChart="6"/>  
			      <ta:datagridItem id="aae010" key="银行账号"  align="center" dataAlign="left"  maxChart="10"/>  
	          </ta:datagrid>
	          
	            
	       </ta:panel>			          
		</ta:form>
	</body>
</html>
<script type="text/javascript">

//查询支付信息
function query()
{
	// 拨付通知ID
	var aaz031 = Base.getValue("aaz031");
    if("" == aaz031 || null == aaz031)
      return Base.alert("请输入拨付通知ID!","warn");
	Base.clearGridData("dgAd34a2");
	Base.submit("pnlCxtj","centerCalPaymentBackAction!toQuery.do",null,false,false);
}

//支付
function toSave()
{
  var dgAd34a2 = Base.getGridSelectedRows("dgAd34a2");
   if("" == Base.getValue("aae013") || null == Base.getValue("aae013"))
      return Base.alert("请输入失败原因!","warn");
  if("" == dgAd34a2 || null == dgAd34a2){
	  Base.alert("请选择回盘数据!","warn");
  }else{
	 var aac003 =  dgAd34a2[0].aac003;
	 var yad001 =  dgAd34a2[0].yad001;
	 var aae009 =  dgAd34a2[0].aae009;
	 var aae010 =  dgAd34a2[0].aae010;
	 var param = {};
	 param["dto['aae076']"] = dgAd34a2[0].aae076;
	 param["dto['aaz031']"] = dgAd34a2[0].aaz031;
	 Base.confirm("姓名:<b style='color:red;'>"+aac003+"</b>;处理金额:<b style='color:red;'>"+yad001+"</b>;银行账号:<b style='color:red;'>"+aae010+"</b>,确认提交?<br/>提示:提交后将不可恢复.",function(yes){
		 if(yes){
			  Base.submit("","centerCalPaymentBackAction!toSave.do",param);
		 }
	 });
  }
}

$(document).ready(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>