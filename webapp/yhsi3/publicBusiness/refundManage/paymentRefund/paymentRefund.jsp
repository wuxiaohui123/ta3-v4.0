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
		<ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">
	    	<ta:text id="aaz002" key="日志ID" display="false"/>		  
		    <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
        </ta:panel>
        <ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
	    <ta:box cols="2">
		<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC()" columnWidth="0.9" />
		<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
			<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
		</ta:buttonLayout>  
		</ta:box>
	 	<ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
		   	<ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
		   	<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
        </ta:panel> 
        <%@ include file="/yhsi3/commonJSP/xzlx_dw2.jsp"%> 
        <ta:panel key="退款起止信息" cols="3" id="fltBeginEndDate" expanded="false" scalable="false">
	    	<%@ include file="/yhsi3/commonJSP/qzxx.jsp"%>
        </ta:panel>
        <ta:panel key="退款相关信息" cols="3" id="fltBeginEndDate" expanded="false" scalable="false">
	    	<ta:selectInput id="yae585" key="退收方式" required="true" collection="YAE585"  labelWidth="120" onSelect="fnSelect" />
        	<ta:selectInput id="yae609" key="退收范围" required="true" collection="YAE609"  labelWidth="120"  />
        </ta:panel>
        <ta:panel id="pnl" fit="true" minHeight="300">	
	        <ta:tabs cols="2" fit="true">
				<ta:tab key="个人参保信息" id="tab1">
					<ta:datagrid id="ac20Grid" fit="true" enableColumnMove="false"  snWidth="30" haveSn="true" >				       
				    	<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
				    </ta:datagrid>
				</ta:tab>	
				<ta:tab key="实缴明细信息"  id="tab2">
				    <ta:datagrid id="ac43_ac44Grid" selectType="checkbox" forceFitColumns="true" fit="true"  snWidth="30" haveSn="true">
			            <ta:datagridItem id="yae567" key="人员核定事件ID" align="center" width='180' dataAlign="left" hiddenColumn="false"/> 
			            <ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="right" />
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="right" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="right" maxChart="12"/>
						<ta:datagridItem id="aae140" key="险种类型" maxChart="12" showDetailed="true" collection="aae140" align="center" dataAlign="left" />	
						<ta:datagridItem id="aaa115" key="缴费类型" maxChart="6" collection="aaa115" align="center" dataAlign="left" />
						<ta:datagridItem id="aae003" key="缴费所属期" align="center" dataAlign="right"/>
						<ta:datagridItem id="aae078" key="到账标志" maxChart="4" collection="aae078" align="center" dataAlign="left" />
						<ta:datagridItem id="aac040" key="缴费工资" align="center" dataAlign="right" />
						<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" />
						<ta:datagridItem id="je" key="金额" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="hzhje" key="划账户金额" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
			    		<ta:datagridItem id="aaz159" key="个人参保关系ID" align="center" dataAlign="right" hiddenColumn="false"/>
				    </ta:datagrid>
				</ta:tab>					
				<ta:tab key="校验失败信息" id="tbFail">			
					<ta:datagrid id="failGrid" enableColumnMove="false" forceFitColumns="true" fit="true" snWidth="30" haveSn="true">
						<ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" />
						<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" />
						<ta:datagridItem id="yae567" key="人员核定事件ID"  maxChart="7" align="center" dataAlign="left" />
						<ta:datagridItem id="aae157" key="变更所在表" align="center" dataAlign="right" />
						<ta:datagridItem id="aae140" key="险种类型" maxChart="10" collection="aae140" align="center" dataAlign="right" />
						<ta:datagridItem id="tsfs" key="退收方式"  collection="YAE585"  align="center" dataAlign="left" />						
						<ta:datagridItem id="aae013" key="备注" maxChart="26" align="center" dataAlign="left" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="本次退款信息" id="tabsucc">
					<ta:datagrid id="ac41a1" enableColumnMove="false" forceFitColumns="true" snWidth="30" fit="true" haveSn="true">
						<ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" />
						<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" />
						<ta:datagridItem id="aae140" key="险种类型" maxChart="10" collection="aae140" align="center" dataAlign="left" />
						<ta:datagridItem id="aaa115" key="缴费类型" maxChart="6" collection="aaa115" align="center" dataAlign="left" />
						<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" />
						<ta:datagridItem id="aae180" key="基数" align="center" dataAlign="right" />
						<ta:datagridItem id="aae003" key="所属期数" align="center" dataAlign="right" />
						<ta:datagridItem id="je" key="金额" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="dwhtc" key="单位划统筹 " align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="grhzh" key="个人划账户 " align="center" dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="dwhtcbl" key="单位划统筹比例 " maxChart="7" align="center" dataAlign="right" />
						<ta:datagridItem id="dwhzhbl" key="单位划账户比例" maxChart="7" align="center" dataAlign="right" />
						<ta:datagridItem id="grhtcbl" key="个人划统筹比例" maxChart="7" align="center" dataAlign="right" />
						<ta:datagridItem id="grhzhbl" key="个人划账户比例" maxChart="7" align="center" dataAlign="right" />
					</ta:datagrid>
				</ta:tab>	
				<ta:tab key="事件流程记录"  id="tab4">
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
		Base.focus("aac001");
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10,fn_queryUnitAndPeron, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7,fn_queryInfoUnit, 0, false);
	    Base.hideObj("cb_110,cb_120,cb_210,cb_310,cb_410,cb_510");	
	    Base.setDisabled("cb_all");						
	});	
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","paymentRefundAction!toQueryPersonAndUnit.do",null,
			function(){return true;},false,function(){	
			   Base.submit("fltPerson","paymentRefundAction!toQueryInsuInfo.do");
		});	
	}
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAab001_q',{"dto['inputString']":Base.getValue('aab001')});
	}
	function showDwRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	function fn_setDwData(){
		function fn_setDwInfo(){
			Base.submit("fltPerson,fltUnit","paymentRefundAction!toQueryUnit.do",null,
				function(){return true;},false,function(){
				   Base.setEnable("aae041,aae042,cb_all");
				},function(){
				   Base.clearData("fltUnit");
				   Base.hideObj("cb_110,cb_120,cb_210,cb_310,cb_410,cb_510");
				   Base.setReadOnly("aae041,aae042,cb_all");
			});		
		}
		Base.setValue("aab001", parent.getValue("aab001"));
	}
	
	//保存经办信息
	function submitData(){	   
	   var ac43_ac44GridList=Base.getGridSelectedRows("ac43_ac44Grid");	   
	   if(ac43_ac44GridList.length==0){
	      Base.alert("请选择个人实缴退款记录!", "warn");
	   }else if(Base.getValue("yae585")==""){
		  Base.focus("yae585");
		  Base.alert("请选择退收方式!", "warn");	      
	   }else if(Base.getValue("yae609")==""){
	      Base.focus("yae609");
	      Base.alert("请选择退收范围!", "warn");     
	   } else{
	      var param={};
	      param.ac43_ac44GridList = Ta.util.obj2string(ac43_ac44GridList);
	      Base.submit("form1", "paymentRefundAction!toSave.do",param,false,false,null);
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
			Base.submit("fltPerson","paymentRefundAction!toQueryPersonAndUnit.do",null,
			function(){return true;},false,function(){	
			   Base.submit("fltPerson","paymentRefundAction!toQueryInsuInfo.do");
			});						
   		}
	}
	
	//单位回调函数:改变单位信息的时侯,重新查询单位信息
	function fn_queryInfoUnit(){	   
	    Base.setValue("aab001",g_Suggest[1]);   
		if (g_Suggest!=""){ 
			Base.submit("fltPerson,fltUnit","paymentRefundAction!toQueryUnit.do",null,
			function(){return true;},false,function(){
			   Base.setEnable("aae041,aae042,cb_all");
			},function(){
			   Base.clearData("fltUnit");
			   Base.hideObj("cb_110,cb_120,cb_210,cb_310,cb_410,cb_510");
			   Base.setReadOnly("aae041,aae042,cb_all");
			});					
   		}
	}
	
	//根据选择下拉框，生成aae140字符串格式：如 110,120,310
	function createAae140str(){
	  var ary=["aae140_110","aae140_120","aae140_210","aae140_310","aae140_330","aae140_320","aae140_370","aae140_340","aae140_410","aae140_510"];
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
	  Base.submit("fltPerson,fltUnit","paymentRefundAction!toQueryArrearage.do",{	     
	         "dto['aae140str']":createAae140str(), 	        
	         "dto['aae041']":Base.getValue("aae041"),
	         "dto['aae042']":Base.getValue("aae042")});	  
	}
	
	function fnSelect(key,value){
	    var yab019 = Base.getValue("yab019");
	    if(yab019==''||yab019==null){
	    	Base.alert("没有获取到单位管理类型,请联系管理员!", "warn");
	        return;
	    }
	    if(yab019=="02"){
	    	Base.alert("该人员所在单位的单位管理类型为灵活就业虚拟管理单位,退收方式只能选择现金退款!", "warn");
	        Base.setReadOnly("yae585");
	        Base.setValue("yae585","1");
	        return;
	    }
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
