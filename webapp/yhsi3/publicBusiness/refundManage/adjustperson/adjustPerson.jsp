<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>YOURTITLE</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
	<div id='pageloading'></div>
	<ta:toolbar id="tlb">
	    <ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_queryArrearage()" asToolBarItem="true"/>	   
		<ta:button id="saveBtn" key="保存 [S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true"/>
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R"  type="resetPage" asToolBarItem="true"/>
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />	
	</ta:toolbar>
	<ta:form  id="form1" fit="true">
	    <ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">		  
		    <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
        </ta:panel>
        <ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
	        <%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
        </ta:panel>        
        <%@ include file="/yhsi3/commonJSP/xzlx_dw3.jsp"%> 
        <ta:panel key="补收起止信息" cols="3" id="fltBeginEndDate" expanded="false" scalable="false">
	        <%@ include file="/yhsi3/commonJSP/qzxx.jsp"%>
        </ta:panel>

        <ta:tabs cols="2" fit="true">
			<ta:tab key="个人参保信息" id="tab1" >
			    <ta:datagrid id="ac20Grid" enableColumnMove="false" fit="true" snWidth="30" haveSn="true"    >
			       <%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>				      
			    </ta:datagrid>
			</ta:tab>			
			<ta:tab key="缴费明细信息"  id="tab2">
			    <ta:datagrid id="tmp_grbs01FailGrid1" forceFitColumns="true" selectType="checkbox" enableColumnMove="false" fit="true" snWidth="30" haveSn="true"  >
			      <ta:datagridItem id="yae567" key="人员核定事件ID" maxChart="6" align="center" dataAlign="left"/>  
			      <%@ include file="/yhsi3/commonJSP/v_ac43ac44.jsp"%>
			    </ta:datagrid>
			</ta:tab>									
			<ta:tab key="本次补收信息"  id="tab3" >
			    <ta:datagrid id="ac41a1" enableColumnMove="false" fit="true" snWidth="30" haveSn="true">
			        <ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="aae140" key="险种类型" maxChart="10" collection="aae140" align="center" dataAlign="left" />
					<ta:datagridItem id="aaa115" key="缴费类型" maxChart="6" collection="aaa115" align="center" dataAlign="left" showDetailed="true"/>
					<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" maxChart="3"/>
					<ta:datagridItem id="aae180" key="基数" align="center" dataAlign="right" maxChart="3"/>
					<ta:datagridItem id="aae003" key="所属期数" align="center" dataAlign="right" maxChart="4"/>
					<ta:datagridItem id="hj" key="合计金额 " align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="dwhtc" key="单位划统筹 " align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="grhzh" key="个人划账户 " align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="dwhtcbl" key="单位划统筹比例 " width="120" align="center" dataAlign="right" maxChart="7"/>
					<ta:datagridItem id="dwhzhbl" key="单位划账户比例" width="120" align="center" dataAlign="right" maxChart="7"/>
					<ta:datagridItem id="grhtcbl" key="个人划统筹比例" width="120" align="center" dataAlign="right" maxChart="7"/>
					<ta:datagridItem id="grhzhbl" key="个人划账户比例" width="120" align="center" dataAlign="right" maxChart="7"/>     
			    </ta:datagrid>
			</ta:tab>	
			<ta:tab key="事件流程记录"  id="tab4" >
			    <%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>						
		</ta:tabs>		          
	</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();	
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10,fn_queryUnitAndPeron, 0, false);
	    initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7,fn_queryInfoUnit, 0, false);
	    Base.hideObj('aae140_330');
	});	
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","adjustPersonAction!toQueryPersonAndUnit.do",null,
			function(){return true;},false,function(){	
			   Base.submit("fltPerson","adjustPersonAction!toQueryInsuInfo.do");			
			});	
	}
	//保存经办信息
	function submitData(){	   
	   var ac43_ac44GridList=Base.getGridSelectedRows("tmp_grbs01FailGrid1");	   
	   if(ac43_ac44GridList.length==0){
	      Base.alert("请选择补欠费记录!", "warn");
	   }else{
	      var param={};
	      param.ac43_ac44GridList = Ta.util.obj2string(ac43_ac44GridList);
	      Base.submit("form1", "adjustPersonAction!toSave.do",param,false,false,null);
	   }	   
	}
	
	//个人回调函数 ：查询单位信息和个人信息  ，和参保信息
	function fn_queryUnitAndPeron(){	    
	    Base.setValue("aac001",g_Suggest[2]);
	    Base.clearData("fltUnit");				
		Base.clearGridData("ac20Grid");
		Base.clearGridData("tmp_grbs01FailGrid1");
		Base.clearGridData("tmp_grbs01FailGrid");
		Base.clearGridData("ae02a2Grid");	  	     
		if (g_Suggest!=""){ 
			Base.submit("fltPerson","adjustPersonAction!toQueryPersonAndUnit.do",null,
			function(){return true;},false,function(){	
			   Base.submit("fltPerson","adjustPersonAction!toQueryInsuInfo.do");			
			});						
   		}
	}
	
	//单位回调函数:改变单位信息的时侯,重新查询单位信息
	function fn_queryInfoUnit(){	   
		Base.setValue("aab001", g_Suggest[0]);
	    Base.setValue("aae044", g_Suggest[1]);
        Base.setValue("aab999", g_Suggest[2]);
        Base.setValue("aab019", g_Suggest[3]);
        Base.setValue("yab019", g_Suggest[4]);  
		if (g_Suggest!=""){ 
			Base.submit("fltPerson,fltUnit","adjustPersonAction!toQueryUnit.do",null,
			function(){return true;},false,function(){
			   Base.setEnable("aae041,aae042,cb_all");
			},function(){
			   Base.clearData("fltUnit");			   
			   Base.setReadOnly("aae041,aae042,cb_all");
			});					
   		}
	}
	function fn_setDwInfo(){
		Base.submit("fltPerson,fltUnit","adjustPersonAction!toQueryUnit.do",null,
				function(){return true;},false,function(){
				   Base.setEnable("aae041,aae042,cb_all");
				},function(){
				   Base.clearData("fltUnit");			   
				   Base.setReadOnly("aae041,aae042,cb_all");
				});		
	}
	
	//根据选择下拉框，生成aae140字符串格式：如 110,120,310
	function createAae140str(){
	  var ary=["aae140_110","aae140_120","aae140_210","aae140_310","aae140_320","aae140_370","aae140_340","aae140_410","aae140_510"];
	  var aae140str="";
	  for(var i=0;i<ary.length;i++){
	     if(Base.getObj(ary[i]).checked){
	     
	       if(Base.getObj(ary[i]).hide){	          
	          continue;
	       }
	       if(Base.getObj(ary[i]).disabled){	          
	          continue;
	       }	       
	       aae140str = aae140str + ary[i].substring(ary[i].indexOf("_")+1)+",";
	     }
	     
	  }
	  return aae140str.substring(0,aae140str.length-1);		
	}
	
	//查询个人欠费信息
	function fn_queryArrearage(){	 
	  Base.submit("fltPerson,fltUnit","adjustPersonAction!toQueryArrearage.do",{	     
	         "dto['aae140str']":createAae140str(), 	        
	         "dto['aae041']":Base.getValue("aae041"),
	         "dto['aae042']":Base.getValue("aae042")});	  
	}
	
	function fn_dateValidate(id){
	   if(id=="aae041"){	     
	      if(!Base.getValue("aae042")==""&&Base.getValue("aae041")>Base.getValue("aae042")){
	        Base.alert("开始年月不能大于结束年月!", "warn");
	        Base.setValue("aae041","");
	      }
	   }
	   
	   if(id=="aae042"){
	      if(!Base.getValue("aae041")==""&&Base.getValue("aae041")>Base.getValue("aae042")){
	         Base.alert("开始年月不能大于结束年月!", "warn");
	         Base.setValue("aae042","");
	      }
	   }
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
