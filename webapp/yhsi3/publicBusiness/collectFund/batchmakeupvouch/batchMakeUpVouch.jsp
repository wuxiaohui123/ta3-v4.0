<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位批量补差核定</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
    	<ta:pageloading />
		<ta:form id="frm" fit="true">
	    	<ta:text id="aaz002" key="业务日志ID" display="false"/>
	    	<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		  	</ta:box>		  
		 	<ta:tabs fit="true">		  
		  		<!-- 单个单位补差 -->
		      	<ta:tab id="tab_unit" key="单个核定方式">
		          	<ta:toolbar id="buttonLayout1">
	               	   <ta:button id="btnQuery" key="查询[S]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q"  onClick="fnQuery()"/>
                   	   <ta:button id="btnSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S"  onClick="fnSave()"/>
                   	   <ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R"  type="resetPage"/>
                	</ta:toolbar>                 
	           	   	<ta:panel id="flst1" key="单位信息" cols="3" expanded="false" scalable="false">
	               		<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
	             	</ta:panel>
	              	<ta:tabs id="tabs" fit="true">	              
	                  	<ta:tab id="tab_cb" key="单位参保信息">
		              		<ta:box cols="3" height="30" id="flst2">
		              	    	<ta:date id="aae041_s" key="核定开始年月" showSelectPanel="true" issue="true" required="true" onChange="dateValidate('1','aae041_s')" onBlur="dateValidate('1','aae041_s')" labelWidth="120"/>
		                    	<ta:date id="aae042_s" key="核定结束年月" showSelectPanel="true" issue="true" required="true" onChange="dateValidate('1','aae042_s')" onBlur="dateValidate('1','aae042_s')" labelWidth="120"/>
		              	  	</ta:box>
	              	      	<ta:datagrid id="dg_cb" haveSn="true" fit="true" selectType="checkbox" forceFitColumns="true" onSelectChange="fnSelectChange1">
	                          	<%@include file="/yhsi3/publicBusiness/collectFund/batchmakeupvouch/dwcbInfo.jsp" %>	                          
	                      	</ta:datagrid> 
	                  	</ta:tab>
	                  	<ta:tab id="tab_bcInfo" key="补差核定人员信息">
	                      	<ta:datagrid id="dg_bcInfo" haveSn="true" fit="true" forceFitColumns="true">   
	                          	<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" maxChart="6"/>
				              	<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" maxChart="4"/>
				              	<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" maxChart="10"/>
				              	<ta:datagridItem id="aae140" key="险种" align="center" dataAlign="left" maxChart="10" collection="AAE140"/>
				              	<ta:datagridItem id="aae041" key="补退开始期号" align="center" dataAlign="center" maxChart="6" />
				              	<ta:datagridItem id="aae042" key="补退截止期号" align="center" dataAlign="center" maxChart="6" />
				              	<ta:datagridItem id="aae180_old" key="审核前基数" align="center" dataAlign="right" dataType="Number" maxChart="6" totals="sum" tatalsTextShow="false"/>
				              	<ta:datagridItem id="aae180_new" key="审核后基数" align="center" dataAlign="right" dataType="Number" maxChart="6" totals="sum" tatalsTextShow="false"/>
				              	<ta:datagridItem id="aae180_c" key="补缴基数差额" align="center" dataAlign="right" dataType="Number" maxChart="6" tatalsTextShow="false"/>                       
	                      	</ta:datagrid>
	                  	</ta:tab>		                  
	                  	<ta:tab id="tab_this" key="本次核定信息">
	                      	<ta:datagrid id="dg_this" haveSn="true" fit="true" onRowDBClick="fnShowHDInfo">
	                          	<%@include file="/yhsi3/commonJSP/hdxx.jsp" %>	                          
	                      	</ta:datagrid>
	                  	</ta:tab>	                 
	                  	<ta:tab id="tab_error" key="本次核定失败信息">
	                      	<ta:datagrid id="dg_error" haveSn="true" fit="true" forceFitColumns="true" >
	                   	      	<ta:datagridItem id="errormsg" key="失败信息" align="center" dataAlign="left" width="1200" showDetailed="true"/>
	                      	</ta:datagrid>
	                  	</ta:tab>	    
	              	</ta:tabs>	               
		      	</ta:tab>
		     
		      	<!-- 批量复核多个单位多个险种 -->
		      	<ta:tab id="tab_batch" key="批量核定方式">		      
		          	<ta:toolbar id="ButtonLayout2">
	                  	<ta:button id="btnBatchQuery" key="查询[S]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q"  onClick="fnBatchQuery()"/>
                      	<ta:button id="btnBatchSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S"  onClick="fnBatchSave()"/>
                      	<ta:button id="btnBatchReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage"/>
                  	</ta:toolbar>
                  	<%@include file="/yhsi3/publicBusiness/collectFund/batchmakeupvouch/aae140ckbx_dw.jsp" %>
		          	<ta:tabs id="tab_batch" fit="true">	              
	                  	<ta:tab id="tab_batchcb" key="单位参保信息">
		                  	<ta:box id="flst3" cols="3">
			                  	<ta:date id="aae041_b" key="核定开始年月" showSelectPanel="true" issue="true" required="true" onChange="dateValidate('2','aae041_b')" onBlur="dateValidate('2','aae041_b')" labelWidth="120"/>
			                  	<ta:date id="aae042_b" key="核定结束年月" showSelectPanel="true" issue="true" required="true" onChange="dateValidate('2','aae042_b')" onBlur="dateValidate('2','aae042_b')" labelWidth="120"/>
			                  	<ta:date id="zxsj" key="核定执行时间" datetime="true" validNowTime="right" showSelectPanel="true" labelWidth="120"/>
		                  	</ta:box>
		                  	<ta:box id="box_cb" fit="true" heightDiff="10">
		                      	<ta:datagrid id="dg_batchcb" haveSn="true" selectType="checkbox" onRowDBClick="fnShowCBInfo" fit="true" forceFitColumns="true" columnFilter="true" onSelectChange="fnSelectChange2">
		                          	<%@include file="/yhsi3/publicBusiness/collectFund/batchmakeupvouch/dwcbInfo.jsp" %>
		                      	</ta:datagrid> 
	                      	</ta:box>
	                  	</ta:tab>	                  
	                  	<ta:tab id="tab_successBatch" key="定时服务创建成功信息">
	                      	<ta:datagrid id="dg_successBatch" haveSn="true" fit="true" forceFitColumns="true">
	                          	<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" width="120" showDetailed="true" ></ta:datagridItem>
	                          	<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" width="800" showDetailed="true"></ta:datagridItem>
	                          	<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" width="400" showDetailed="true"></ta:datagridItem>
	                   	      	<ta:datagridItem id="successmsg" key="成功信息" align="center" dataAlign="left" width="100" showDetailed="true"></ta:datagridItem>
	                      	</ta:datagrid>
	                  	</ta:tab>	                  
	                  	<ta:tab id="tab_errorBatch" key="定时服务创建失败信息">
	                      	<ta:datagrid id="dg_errorBatch" haveSn="true" fit="true" forceFitColumns="true">
	                          	<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" width="120" showDetailed="true"/>
	                          	<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" width="800" showDetailed="true"/>
	                          	<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" width="400" showDetailed="true"/>
	                   	      	<ta:datagridItem id="errormsg" key="失败信息" align="center" dataAlign="left" width="100" showDetailed="true"/>
	                      	</ta:datagrid>
	                  	</ta:tab>
	              	</ta:tabs>
		      	</ta:tab>	
		      	<ta:tab id="tab_log" key="事件流程记录">
				 	<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			  	</ta:tab>	      
		  	</ta:tabs>
	    </ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
        initializeSuggestFramework(2, null, 'aab001', 900, 200, 7, fn_getAb01, 1, false); 
        Base.setDisabled("btnSave,btnBatchSave");
        Base.hideObj("tab_fail,tab_error,tab_successBatch,tab_errorBatch,tab_this,flst2,flst3");
	});	
	var url = "batchMakeUpVouchAction";	
	
	function fn_setDwInfo(){
		Base.submit("flst1",url + "!toQuery.do",null,null,false,null,null);	
	}
	
	//回调函数
	function fn_getAb01(){
		if (g_Suggest!=""){ 
			Base.setValue("aab001", g_Suggest[0]);
		    Base.setValue("aae044", g_Suggest[1]);
            Base.setValue("aab999", g_Suggest[2]);
            Base.setValue("aab019", g_Suggest[3]);
            Base.setValue("yab019", g_Suggest[4]);
		    Base.setValue("aae042","");
		    Base.setValue("aae043","");
		    Base.clearGridData("dg_this");
	        Base.clearGridData("dg_cb");
	        Base.clearGridData("dg_error");
	        Base.clearGridData("dg_bcInfo");
	        Base.activeTab("tab_cb");
	        Base.hideObj("tab_error,tab_bcInfo");
	        // 根据单位编号进行业务办理的相关判断 单个预缴
			Base.submit("flst1",url + "!toQuery.do",null,null,false,null,null);
   		}
	}	
	//查询单位基本信息和参保信息
	function fnQuery(){
	    Base.clearGridData("dg_this");
	    Base.clearGridData("dg_detail");
	    Base.clearGridData("dg_error");
	    Base.clearGridData("dg_bcInfo")
	    Base.clearGridData("dg_bcInfo");;
	    Base.activeTab("tab_cb");
	    Base.hideObj("tab_error,tab_bcInfo");
	    var aab001 = Base.getValue("aab001");
	    if(aab001==''||aab001==null){
	    	Base.alert("单位编号不能为空,请确认!","warn");
	    	return;
	    }
	    var aae041  = Base.getValue("aae041_s");
	    var aae042  = Base.getValue("aae042_s");
	    if(aae041==''||aae042==''){
	    	Base.alert("请填写核定开始年月和核定结束年月!","warn");
	        return;
	    }
	    var rowdata = Base.getGridSelectedRows("dg_cb");
	    if(rowdata.length==0){
	    	Base.alert("请勾选需要查询的单位参保信息!","warn");
	        return;
	    }
	    var param = {};
	    param.dgcb = Ta.util.obj2string(rowdata);
		Base.submit("flst1,flst2",url + "!toQueryBCInfo.do",param);
	}
	//选中改变事件
	function fnSelectChange1(rowdata,n){
	    for(var i = 0;i < rowdata.length;i++){
	        var aae140 = rowdata[i].aae140;
	        if("330"==aae140){
	           Base.alert("大额医疗费用补助不能办理此业务!","warn");
	           Base.setDisabled("btnSave");
	           return;
	        }else{
	           Base.setEnable("btnSave"); 
	        }
	    }
	}
	//选中改变事件
	function fnSelectChange2(rowdata,n){
	    for(var i = 0;i < rowdata.length;i++){
	        var aae140 = rowdata[i].aae140;
	        if("330"==aae140){
	        	Base.alert("大额医疗费用补助不能办理此业务!","warn");
	           Base.setDisabled("btnBatchSave");
	           return;
	        }else{
	           Base.setEnable("btnBatchSave"); 
	        }
	    }
	}
	//行双击事件
	function fnShowCBInfo(e,rowdata){
	    var aae041 = Base.getValue("aae041_b");
	    var aae042 = Base.getValue("aae042_b");
	    if(aae041==''||aae042==''){
	    	Base.alert("请录入开始期号和结束期号!","warn");
	        return;
	    }
        Base.openWindow(
	        "cbInfo",
	        "单位参保详情", 
	        myPath() + "/process/publicBusiness/collectFund/batchmakeupvouch/batchMakeUpVouchAction!toShowCB.do",
	        {
		        "dto['aab001']":rowdata.aab001,
		        "dto['aae041']":Base.getValue("aae041"),
		        "dto['aae042']":Base.getValue("aae042"),
		        "dto['aae140']":rowdata.aae140,
		        "dto['yae097']":rowdata.yae097
	        },"95%","90%",
	        null,
	        null,
	        true
        );
    }	
	//保存
	function fnSave(){		
		Base.submit("frm,dg_cb",url + "!toSave.do");
	}	
	//行双击事件  此次核定详情
	function fnShowHDInfo(e,rowdata){
        Base.openWindow(
        	"hdInfo",
        	"单位本期核定详情",
        	myPath() + "/process/publicBusiness/collectFund/batchmakeupvouch/batchMakeUpVouchAction!toEditHD.do",
        	{
	        	"dto['aab001']":rowdata.aab001,
	        	"dto['aae140']":rowdata.aae140,
	        	"dto['aae003']":rowdata.aae003,
	        	"dto['aae002']":rowdata.aae002
        	}
        	,"95%","90%",null,null,true);
    } 	
	//验证开始结束期号
	function dateValidate(no,id){
		var aae041,aae042;
	    if( no == "1") {
	        aae041 = Base.getValue("aae041_s");
	        aae042 = Base.getValue("aae042_s");
	    } else {
	    	aae041 = Base.getValue("aae041_b");
	        aae042 = Base.getValue("aae042_b");
	    }
	    if(aae041 != '' || aae041 == null) {
	      if(aae042 != '' || aae042 == null) {
	        if(aae041 > aae042){
				Base.alert("开始年月不能大于结束年月","warn",function(){
					Base.setValue(id,"");
					Base.focus(id);
				});
			}
	      }
	    }
	}
	//批量查询
	function fnBatchQuery(){
		Base.clearGridData("dg_batchcb");
	    Base.clearGridData("dg_batchhistory");
		var arr = new Array('110','120','210','310','320','330','340','350','370','410','510');		
		var aae140s = "";
	    for ( var x in arr ) {
			if(Base.getObj("aae140_" +arr[x] ).checked ){
			    aae140s += Base.getValue("aae140_" +arr[x]) + ",";
			}
		}
		//console.log(aae140s.substring(0,aae140s.length-1));
		Base.submit(
			"ckbxAae140,flst3,dg_batchcb", 
			url + "!toQueryBatch.do",
			{
			"dto['aae140s']":aae140s.substring(0,aae140s.length-1)
			}
		);
	}
	//批量保存
	function fnBatchSave(){
		Base.submit("flst3,dg_batchcb",url + "!toSaveBatch.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>