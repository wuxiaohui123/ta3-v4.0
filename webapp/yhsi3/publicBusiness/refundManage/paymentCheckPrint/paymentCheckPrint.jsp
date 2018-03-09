<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>interrupt</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
    <ta:pageloading />
	<ta:toolbar id="tlb">
	    <ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_query()" asToolBarItem="true"/>	   
		<ta:button id="saveBtn" key="保存 [S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" asToolBarItem="true"/>
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R"  type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">	   
        <ta:panel key="个人条件查询" cols="3" id="fltPerson" expanded="false" scalable="false">		   	   	   
		   <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>	
		   <ta:text id="userid" key="经办人" display="false"/>
        </ta:panel>    
        <ta:panel key="征集信息" cols="3" id="fltBushou" expanded="false" scalable="false">         
            <ta:selectInput id="zsfs" key="征收类型" data="[{'id':'1','name':'单位部分'},{'id':'2','name':'个人部分'},{'id':'3','name':'全额'}]" labelWidth="120" required="true" value="2"/>
            <ta:selectInput id="yae579" key="滞纳金征收标志" collection="yae579" labelWidth="120" required="true" onSelect="fnSelectYae597"/>
			<ta:date id="aae042" key="滞纳金结束日期" showSelectPanel="true" labelWidth="120" onChange="fnCheckDate()"/>
			<ta:selectInput id="yae581" key="利息征收标志" collection="yae581" labelWidth="120" required="true"  />
        	<ta:date id="aae042_lx" key="利息结束期号" labelWidth="120" issue="true" showSelectPanel="true"/>
        </ta:panel>	
		<ta:tabs cols="2" fit="true">			
			<ta:tab key="灵活就业人员补退信息" id="tabbushouInfo">
				<ta:datagrid id="ac43ac44Grid" columnFilter="true" selectType="checkbox" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" forceFitColumns="true">
					<%@ include file="/yhsi3/commonJSP/hdxx1.jsp"%>
				</ta:datagrid>
			</ta:tab>				
			<ta:tab key="个人历史征集信息（双击打印）" id="tab_history" >
				<ta:datagrid id="dg_history" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" onRowDBClick="clickPrint" forceFitColumns="true">
			           <%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
			    </ta:datagrid>
			</ta:tab>		
			<ta:tab id="tab_lhjyryzjd" key="灵活就业人员征集单打印信息">
				<ta:datagrid id="dg_lhjyzjdInfo" haveSn="true" fit="true" forceFitColumns="true">
		      		<%@ include file="/yhsi3/commonJSP/ad15Info.jsp"%>
	            </ta:datagrid>
			</ta:tab>		
		</ta:tabs>
		<%@ include file="/yhsi3/comm/print.jsp"%>	
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");	
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 0, false);				
	});	
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","paymentCheckPrintAction!toQueryPerson.do",null,
			function(){return true;},false,null,function(){
			    Base.clearData("fltPerson");
			    Base.clearGridData("ac43ac44Grid");
			    Base.clearGridData("dg_history");			    
		});	
	}
	
	function fn_queryInfoPerson(){
	    Base.setValue("aac001",g_Suggest[2]);
	    if (g_Suggest!=""){		   
			Base.submit("fltPerson","paymentCheckPrintAction!toQueryPerson.do",null,
			function(){return true;},false,null,function(){
			    Base.clearData("fltPerson");
			    Base.clearGridData("ac43ac44Grid");
			    Base.clearGridData("dg_history");			    
			});	
	    }
	}
	
	function fn_query(){
	    Base.clearGridData("ac43ac44Grid");
	    Base.submit("fltPerson","paymentCheckPrintAction!toQueryButui.do");
	}
	
	//滞纳金选择控制
	function fnSelectYae597(key,value){
	   if(value=="0"){
	       Base.setReadOnly("aae041,aae042");
	   }else if(value=="1"){
	       Base.setEnable("aae041,aae042");
	   } 
	}
	
	//滞纳金开始期号 结束期号校验
	function fnCheckDate(){
	    var aae041 = Base.getValue("aae041");
	    var aae042 = Base.getValue("aae042");
	    if(aae041!=''&&aae042!=''){
	        if(aae041>aae042){
	        	Base.alert("滞纳金开始期号不能晚于滞纳金结束期号!", "warn");
	            Base.setValue("aae042","");
	            return;
	        }
	    }
	}
	
	//保存
	function fnSave(){
	    var rowdata = Base.getGridSelectedRows("ac43ac44Grid");
	    var param={};
		if(rowdata==''||rowdata==null){
			Base.alert("请勾选需要保存的信息!", "warn");
			return ;
		}
	    param.bushouList = Ta.util.obj2string(rowdata);
	    Base.submit("fltPerson,fltBushou","paymentCheckPrintAction!toSave.do",param);  
	}
	//打印
	function fnPrint(){
	    var rowdata = Base.getGridSelectedRows("dg_history");
	    var param={};
		if(rowdata==''||rowdata==null){
			Base.alert("请勾选需要保存的信息!", "warn");
			return ;
		}
	    param.bushouList = Ta.util.obj2string(rowdata);
	    Base.submit("fltPerson","paymentCheckPrintAction!toPrint.do",param);  
	}	
	
	function clickPrint(e, rowdata) {
		var row = rowdata.row, aaz288 = rowdata.aaz288, aaz010 = rowdata.aaz010;
		var userid= Base.getValue("userid");
		var fileName="flexEmployeePrint.raq";
		var prm = "aaz288="+aaz288+";aaz010="+aaz010+";userid="+userid;
		Base.clearGridData("dg_lhjyzjdInfo");
		//打印成功后修改财务可以处理的标记
		Base.submit(null,"paymentCheckPrintAction!dbPrint.do",
		{"dto['aaz288']":rowdata.aaz288,
		"dto['aaz010']":aaz010
	    },null,null,
		function fnSuccess(){
			fnPrintComm(fileName,prm);
		},
		function fnFail(){
			 Base.alert("打印有误,请联系管理员!", "warn");
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>