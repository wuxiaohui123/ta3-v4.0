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
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R"  type="resetPage" asToolBarItem="true"/>
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />		
	</ta:toolbar>
	<ta:form  id="form1" fit="true">
	    <ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false" >
	        <ta:text id="aaz002" key="日志ID" display="false"/>		  
		    <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
        </ta:panel>
        <ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
	       <ta:selectInput id="aab001" key="单位编号" labelWidth="120" required="true" onSelect="szAAB001"/>
		   <ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
		   <ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
		   <ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
		   <ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
        </ta:panel>
        <%@ include file="/yhsi3/commonJSP/xzlx_dw.jsp"%> 
        <ta:panel key="补收起止信息" cols="3" id="fltBeginEndDate" expanded="false" scalable="false">       
             <%@ include file="/yhsi3/commonJSP/qzxx.jsp"%>	        
        </ta:panel>
        <ta:panel id="pnl" fit="true" minHeight="240"> 
        <ta:tabs cols="2"  fit="true">
			<ta:tab key="个人参保信息" id="tab1" >
		       <ta:datagrid id="ac20Grid" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" >
			       <%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
			   </ta:datagrid>
			</ta:tab>	
			<ta:tab key="欠款明细信息"  id="tab2" >
			    <ta:datagrid id="ac43_ac44Grid" forceFitColumns="true" selectType="checkbox" fit="true" enableColumnMove="false" snWidth="30" haveSn="true"  >
				    <ta:datagridItem field="yae567" key="人员核定事件ID" width='150' align="center" dataAlign="right"/>  
				    <%@ include file="/yhsi3/commonJSP/v_ac43ac44.jsp"%>
				    <ta:datagridItem id="aaz159" key="参保关系ID" maxChart="10" align="center" dataAlign="left"  hiddenColumn="true"/>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="校验失败信息" id="tbFail" >		
				<ta:datagrid id="failGrid" enableColumnMove="false" fit="true"  snWidth="30" haveSn="true" forceFitColumns="true">
					<ta:datagridItem field="aac001" key="个人ID" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem field="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"/>
					<ta:datagridItem field="yae567" key="人员核定事件ID"  maxChart="7" align="center" dataAlign="left"/>
					<ta:datagridItem field="aae157" key="变更所在表" align="center" dataAlign="right" maxChart="5"/>
					<ta:datagridItem field="aae140" key="险种类型" showDetailed="true" maxChart="10" collection="aae140" align="center" dataAlign="left" />
					<ta:datagridItem field="tsfs" key="退收方式" showDetailed="true"  collection="tsfs" align="center" dataAlign="left" maxChart="6"/>						
					<ta:datagridItem field="aae013" key="备注" showDetailed="true" maxChart="26" align="center" dataAlign="left" />
				</ta:datagrid>
			</ta:tab>	
			<ta:tab key="本次退账信息" id="tabsucc" >	
				<ta:datagrid id="ac41a1" enableColumnMove="false" snWidth="30" fit="true" haveSn="true" forceFitColumns="true">
					<ta:datagridItem field="aac001" key="个人ID" align="center" dataAlign="left" />
					<ta:datagridItem field="aab001" key="单位ID" align="center" dataAlign="left" />
					<ta:datagridItem field="aae140" key="险种类型" maxChart="10" showDetailed="true" collection="aae140" align="center" dataAlign="left" />
					<ta:datagridItem field="aaa115" key="缴费类型" maxChart="6" showDetailed="true"  collection="aaa115" align="center" dataAlign="left" />
					<ta:datagridItem field="aac040" key="工资" align="center" dataAlign="right" />
					<ta:datagridItem field="aae180" key="基数" align="center" dataAlign="right" />
					<ta:datagridItem field="aae003" key="所属期数" align="center" dataAlign="right" />
					<ta:datagridItem field="dwhtc" key="单位划统筹 " align="center" dataAlign="right" />
					<ta:datagridItem field="dwhzh" key="单位划账户" align="center" dataAlign="right" />
					<ta:datagridItem field="grhtc" key="个人划统筹" align="center" dataAlign="right" />
					<ta:datagridItem field="grhzh" key="个人划账户 " align="center" dataAlign="right" />
					<ta:datagridItem field="dwhtcbl" key="单位划统筹比例 " maxChart="7" align="center" dataAlign="right" />
					<ta:datagridItem field="dwhzhbl" key="单位划账户比例" maxChart="7" align="center" dataAlign="right" />
					<ta:datagridItem field="grhtcbl" key="个人划统筹比例" maxChart="7" align="center" dataAlign="right" />
					<ta:datagridItem field="grhzhbl" key="个人划账户比例" maxChart="7" align="center" dataAlign="right" />
				</ta:datagrid>
			</ta:tab>	
			<ta:tab key="事件流程记录"  id="tab4" >	
			    <%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>		   
			</ta:tab>						
		</ta:tabs>
		</ta:panel>		          
	</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();	
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10,fn_queryUnitAndPeron, 0, false);
	});		
	//保存经办信息
	function submitData(){	   
	   var ac43_ac44GridList=Base.getGridSelectedRows("ac43_ac44Grid");	   
	   if(ac43_ac44GridList.length==0){
	      Base.alert("请选择个人欠款退账记录!", "warn");
	   }else{
	      var param={};
	      param.ac43_ac44GridList = Ta.util.obj2string(ac43_ac44GridList);
	      Base.submit("form1", "arrearsRebatesAction!toSave.do",param,false,false,null);
	   }	   
	}	
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","arrearsRebatesAction!toQueryPersonAndUnit.do",null,
				function(){return true;},false,function(){
				   Base.submit("fltPerson,fltUnit","arrearsRebatesAction!toQueryInsuInfo.do");			
				});	
	}
	//个人回调函数 ：查询单位信息和个人信息  ，和参保信息
	function fn_queryUnitAndPeron(){	    
	    Base.setValue("aac001",g_Suggest[2]);
	    Base.clearData("fltUnit");				
		Base.clearGridData("ac20Grid");		
		Base.clearGridData("ae02a2Grid");	  	     
		if (g_Suggest!=""){ 
			Base.submit("fltPerson","arrearsRebatesAction!toQueryPersonAndUnit.do",null,
			function(){return true;},false,function(){
			   Base.submit("fltPerson,fltUnit","arrearsRebatesAction!toQueryInsuInfo.do");			
			});						
   		}
	}
	function szAAB001(key,value){	   
		Base.submit("fltPerson,fltUnit","arrearsRebatesAction!toQueryUnit.do",null,
		function(){return true;},false,function(){
		   Base.setEnable("aae041,aae042,cb_all");
		},null);					
	}
	//根据选择下拉框，生成aae140字符串格式：如 110,120,310
	function createAae140str(){
	  var ary=["aae140_110","aae140_210","aae140_310","aae140_330","aae140_320","aae140_370","aae140_340","aae140_410","aae140_510"];
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
	  Base.submit("fltPerson,fltUnit","arrearsRebatesAction!toQueryArrearage.do",{	     
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
