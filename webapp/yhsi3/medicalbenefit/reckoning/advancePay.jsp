<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构预付初审</title>
<%@ include file="/ta/inc.jsp"%>
</head>
  <body >	
  <ta:pageloading />
	<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="s" onClick="toSave()" />
		    <ta:button id="btnReset"  asToolBarItem="true" key="重置[R]" icon="xui-icon-spotReset"   hotKey="r"   type="resetPage"/> 
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
		    <%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fltHospital"  key="医疗服务机构信息" cols="3"  cssStyle="margin:5px;margin-bottom:15px;">
		      <ta:text id="akb020"  key="医疗服务机构编码"   onChange="fnRpc()" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" required="true"  labelWidth="150" />
			  <ta:text id="akb021" key="医疗服务机构名称" readOnly="true" labelWidth="160" span="2"/>
			  <ta:selectInput id="akb022" key="医疗服务机构类型" collection="AKB022" readOnly="true" labelWidth="150" />
			  <ta:selectInput id="akb023" key="定点医疗服务机构类别" collection="AKB023" readOnly="true" labelWidth="160" />
              <ta:selectInput id="aaa027"  key="统筹区编码"  collection="AAA027" readOnly="true"/>
         </ta:panel>
         <ta:panel id="fltYFXX"   key="预付信息"  cols="3" cssStyle="margin:5px;">
                 <ta:date  id="aae041"  key="开始年月"  showSelectPanel="true" dateMonth="true"  required="true"/>
                 <ta:date  id="aae042"  key="终止年月"  showSelectPanel="true" dateMonth="true"  required="true"  onChange="fnDate()"/>
                 <ta:number id="ykf008"  key="预付金额"  precision="2"  max="999999999999.99"  min="0"  required="true"/>
         </ta:panel>	
	</ta:form>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	$("form").css("overflow","auto");
	$("body").css("overflow","hidden");
	initializeSuggestFramework(1,"", "akb020", 500, 300, 4, fn_getHospital, 0, false);
});
   //医疗服务机构信息RPC查询
   function fnRpc(){
	  var akb020=Base.getValue("akb020");
	  if(akb020==""||akb020==null){
		  Base.clearData("fltHospital");
	   }else{
 		 sfwQueryUtil(1,'getKb01',Base.getValue('akb020'));
	  }
   }
  //RPC回调函数,获取医疗服务机构信息
  function fn_getHospital(){
	Base.clearData("fltHospital");
	Base.submit("","advancePayAction!toQueryHospitalInfo.do",{"dto['akb020']":g_Suggest[0]},false,null,null);
  }
  function fnDate(){
	  var aae041=Base.getValue("aae041");
	  var aae042=Base.getValue("aae042");
	  if((aae041!=""||aae041!=null)&&(aae042!=""||aae042!=null)){
		  if(aae042 <= aae041){
			  Base.alert("终止年月必须大于开始年月!","warn");
			  Base.setValue("aae042","");
			  Base.focus("aae042");
			  return false;
		  }
	  }
	  return true;
  }
	//保存
	function toSave(){
	   if(Base.validateForm("form1")){
		   if(!fnDate()){
			   return;
		   }
		   Base.submit("form1","advancePayAction!toSave.do");
		} else{
			Base.alert("带红星的为必输项!","warn");
		} 
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>