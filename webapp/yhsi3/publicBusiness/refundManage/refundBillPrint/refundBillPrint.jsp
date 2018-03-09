<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>interrupt</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_query()" asToolBarItem="true" />
			<ta:button id="saveBtn" key="保存 [S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
				<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			</ta:panel>
			<ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				<ta:text id="userid" key="经办人" display="false" />
			</ta:panel>
			<ta:panel key="基金征集信息" cols="3" id="fltBushou" expanded="false" scalable="false">
				<ta:selectInput id="zsfs" key="征收类型" data="[{'id':'1','name':'单位部分'},{'id':'2','name':'个人部分'},{'id':'3','name':'全额'}]" labelWidth="120" required="true" value="3" />
				<ta:selectInput id="yad159" key="是否使用待转金" readOnly="true" collection="YAD159" labelWidth="120" required="true" value="0" />
				<ta:selectInput id="aab033" key="征收方式" collection="AAB033" labelWidth="120" required="true" value="8" />
				<ta:selectInput id="yae581" key="利息征收标志" collection="yae581" labelWidth="120" required="true" value="0" />
				<ta:selectInput id="yae579" key="滞纳金征收标志" collection="yae579" labelWidth="120" required="true" onSelect="fnSelectYae597" value="0" />
				<ta:date id="aae042" key="滞纳金结束日期" showSelectPanel="true" labelWidth="120" onChange="fnCheckDate()" />
			</ta:panel>
			<ta:tabs cols="2" fit="true">
				<ta:tab key="参保单位个人补收信息" id="tabbushouInfo">
					<ta:button id="btn_create" key="增加" icon="xui-icon-spotAdd" onClick="fnCreateChange();" />
					<ta:datagrid id="ac43ac44Grid" selectType="checkbox" fit="true" enableColumnMove="false" snWidth="30" haveSn="true" onRowDBClick="fnCilckHD" columnFilter="true" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/hdxx1.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tb_changeInfo" key="参与征集的核定信息">
					<ta:button id="btn_change" key="删除" icon="xui-icon-spotDelete" onClick="fnAllChange();" />
					<ta:datagrid id="changeInfoGrid" fit="true" enableColumnMove="false" snWidth="30" haveSn="true" onRowDBClick="fnCilckHD" columnFilter="true"
						selectType="checkbox" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/hdxx1.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="单位历史征集信息" id="tab_history">
					<ta:datagrid id="dg_history" selectType="checkbox" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" columnFilter="true" forceFitColumns="true">
						<ta:datagridItem id="btnPrint" icon="icon-print" key="点击打印" align="center" click="clickPrint"></ta:datagridItem>
						<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
						<ta:datagridItem id="dycs" key="打印次数" align="center" dataAlign="left" maxChart="4" sortable="true" dataType="number"></ta:datagridItem>
						<ta:datagridItem id="mcdysj" key="末次打印时间" align="center" dataAlign="left" maxChart="10"></ta:datagridItem>
						<ta:datagridItem id="mcdyr" key="末次打印经办人" align="center" dataAlign="left" maxChart="6" collection="AAE011"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_grzjdInfo" key="个人征缴单打印信息">
					<ta:datagrid id="dg_grzjdInfo" haveSn="true" forceFitColumns="true" fit="true">
						<%@ include file="/yhsi3/commonJSP/ad15Info.jsp"%>
					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
			<ta:box key="printBox">
				<%@ include file="/yhsi3/comm/print.jsp"%>
			</ta:box>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();			
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_queryInfoUnit, 0, false);		
	});	
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","refundBillPrintAction!toQueryPerson.do",null,false,false,function(){
			fn_query();
		});
	}
	function fn_setDwInfo(){
		Base.submit("fltUnit","refundBillPrintAction!toQueryUnit.do",null,false,false,function(){
			fn_query();
		});
	}
	function fn_queryInfoPerson(){
	    Base.setValue("aac001",g_Suggest[2]);
	    if (g_Suggest!=""){ 
			Base.submit("fltPerson","refundBillPrintAction!toQueryPerson.do",null,false,false,function(){
				fn_query();
			});					
   		}	    	    
	}
	
	function fn_queryInfoUnit(){
	  Base.setValue("aab001",g_Suggest[1]);   
		if (g_Suggest!=""){ 
			Base.submit("fltUnit","refundBillPrintAction!toQueryUnit.do",null,false,false,function(){
				fn_query();
			});							
   		}
	}
	
	function fn_query(){
	    Base.clearGridData("ac43ac44Grid");
	    Base.clearGridData("changeInfoGrid");
	    Base.submit("fltPerson,fltUnit","refundBillPrintAction!toQueryButui.do");
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
	        	Base.alert("滞纳金开始期号不能晚于滞纳金结束期号!","warn");
	            Base.setValue("aae042","");
	            return;
	        }
	    }
	}
	//核定详情
	function fnCilckHD(e,rowdata){
	    var yae518 = rowdata.yae518;
	    //必传项 yae518 
	    Base.openWindow("ourwin","核定明细",myPath()+"/process/publicBusiness/collectFund/fundCollection/showCheckMXInfoAction!zzhdxx.do",{"dto['yae518']":yae518},"95%","90%",null,null,true);
	}
	//保存
	function fnSave(){
	    var rowdata = Base.getGridData("changeInfoGrid");
	    var param={};
		if(rowdata==''||rowdata==null){
			Base.alert("参与征集的核定信息中没有需要保存的数据!","warn");
			return ;
		}
	    param.bushouList = Ta.util.obj2string(rowdata);
	    Base.submit("fltPerson,fltUnit,fltBushou","refundBillPrintAction!toSave.do",param);  
	}
	var url = "<%=basePath%>runqian/reportJsp/mulprint.jsp?prompt=no&report=";
	//打印
	function fnPrint(){
	    var rowdata = Base.getGridSelectedRows("dg_history");
	    var param={};
		if(rowdata==''||rowdata==null){
			Base.alert("请勾选需要打印的信息!","warn");
			return ;
		}
		var userid = Base.getValue("userid");
	    param.bushouList = Ta.util.obj2string(rowdata);
	    Base.submit("fltPerson,fltUnit","refundBillPrintAction!toPrint.do",param,null,null,
			       function fnSuccess(){
		    			var reportVals = new Array();
					  for(var i=0;i < rowdata.length;i++){
					  	reportVals[i]="paycostPrint.raq";
					  		var aaz288=rowdata[i].aaz288;
					       var yab003 = rowdata[i].yab003;
					       var aab001 = rowdata[i].aaz010;
						   url = url + "{"+reportVals[i]+"(aaz288="+aaz288+";userid="+userid+";aab001="+aab001+")}";
				       } 
		    			Base.openWindow("main","批量打印",url,null,500,300,null,null,true);
			         },
			       function fnFail(){
			       		Base.alert("打印有误，请联系管理员!","warn");
					}); 
	}	
	
	function clickPrint(rowdata, e) {
			var userid = Base.getValue("userid");
			var aaz288 = rowdata.aaz288;
	        var yab003 = rowdata.yab003;
	        var aab001 = rowdata.aaz010;
			var fileName='paycostPrint.raq';
			var prm = "aaz288="+aaz288+";userid="+userid+";aab001="+aab001;
			fnPrintComm(fileName,prm);
			
			Base.submit("fltUnit","refundBillPrintAction!toSavePrint.do",
			{"dto['aaz288']":aaz288,"dto['aaz010']":rowdata.aaz010} 
			,null,null,
			function successFun(){
				Base.alert("打印成功!");
			},
				function fnFail(){
			       		Base.alert("打印有误,请联系管理员!","warn");
					}
			);
	}
	
	//勾选要征集的核定信息
	function fnCreateChange(){
		//判断是否有选中信息
		var changeRows = Base.getGridSelectedRows('ac43ac44Grid');
		if(changeRows == ''){
			Base.alert('请先选择将要进行征集的核定信息!','warn');
			return false;
		}
		for(var i = 0; i < changeRows.length; i++){
			Base.addGridRowDown("changeInfoGrid", changeRows[i]);
		}
		//删除选中数据
		Base.deleteGridSelectedRows("ac43ac44Grid");
		Base.activeTab('tb_changeInfo');
	}
	
	//删除已经生成的变更数据 
	function fnAllChange(){
		var allRows = Base.getGridSelectedRows("changeInfoGrid");//获取选中行数据
		if(allRows == ''){
			Base.alert('没有需要删除的数据!','warn');
			return false;
		}
		for(var i = 0; i < allRows.length; i++){
			Base.addGridRowDown("ac43ac44Grid", allRows[i]);
		}
		Base.deleteGridSelectedRows("changeInfoGrid");//删除所有数据
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>