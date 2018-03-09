<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>灵活就业缴费核定</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="addBtn" key="新增 [I]" icon="xui-icon-spotAdd" hotKey="I" onClick="fn_addRow()" asToolBarItem="true" />
			<ta:button id="deleteBtn" key="删除 [D]" icon="xui-icon-spotDelete" hotKey="D" onClick="fn_deleteRow()" asToolBarItem="true" />
			<ta:button id="saveBtn" key="保存 [S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">
				<ta:text id="aaz002" key="日志ID" display="false" />
				<ta:text id="userid" key="经办人" display="false" />
				<ta:text id="nowtime" key="当前时间" display="false"/>
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
			</ta:panel>
			<ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
				<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			</ta:panel>
			<ta:text id="aae140_330" key="险种类型"  display="false"/>
			<ta:panel key="核定信息" cols="3" id="fltBushou" expanded="false" scalable="false">
				<ta:selectInput id="aae140" key="险种类型" required="true" labelWidth="120" onSelect="getAae140" />
				<ta:date id="aae041" key="开始年月" required="true" issue="true" labelWidth="120" onChange="validateAae041AndAae042('aae041')" showSelectPanel="true"/>
				<ta:date id="aae042" key="终止年月" required="true" issue="true" labelWidth="120" onChange="validateAae041AndAae042('aae042')" showSelectPanel="true"/>
				<ta:selectInput id="yaz289" key="征缴规则" required="true" labelWidth="120" />
				<ta:selectInput id="aaz136" key="缴费档次" required="true" labelWidth="120"/>
				<ta:selectInput id="ykc005" key="特殊人员类型" required="true" labelWidth="120" onSelect="getYkc005" />
				<ta:selectInput id="ykc006" key="特殊人员类别" required="true" labelWidth="120" collection="YKC006"/>
				<ta:text id="ykc006ls" key="特殊人员类别（临时）" display="false" labelWidth="120" />
				<ta:selectInput id="yac084" key="离退休标志" required="true" labelWidth="120" />
				<ta:selectInput id="yae581" key="利息征收标志" required="true" collection="YAE581" labelWidth="120" />
				<ta:selectInput id="bz" key="是否征集" required="true" labelWidth="120" data="[{'id':'0','name':'不立即征集','py':'0'},{'id':'1','name':'立即征集','py':'1'}]"/>
				<ta:text id="aaz159" key="人员参保关系ID" display="false"/>
				<%--大额医疗默认--%>
				<ta:panel id="pnldisplay" cols="3" span="3" cssStyle="display:none">
				    <ta:text id="aaz159_330" key="人员参保关系ID" />
					<ta:date id="aae041_330" key="开始年月" />
					<ta:date id="aae042_330" key="终止年月" />
					<ta:selectInput id="yaz289_330" key="征缴规则" />
					<ta:selectInput id="aaz136_330" key="缴费档次" />
					<ta:selectInput id="ykc005_330" key="特殊人员类型" />
					<ta:selectInput id="ykc006_330" key="特殊人员类别" />
					<ta:text id="ykc006ls_330" key="特殊人员类别（临时）"/>
					<ta:selectInput id="yac084_330" key="离退休标志"/>
					<ta:selectInput id="yae581_330" key="利息征收标志" collection="YAE581"/>
				</ta:panel>
			</ta:panel>
			<ta:tabs cols="2" fit="true">
				<ta:tab key="个人参保信息" id="tab_ac20">
					<ta:datagrid id="ac20Grid" snWidth="30" fit="true" haveSn="true" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="缴费明细信息" id="tab_ac43">
					<ta:datagrid id="ac43_ac44Grid" enableColumnMove="false" snWidth="30" fit="true" haveSn="true" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/v_ac43ac44.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="本次核定汇总" id="tab_ac41a1">
					<ta:datagrid id="ac41a1Grid" enableColumnMove="false" selectType="checkbox" fit="true" snWidth="30" haveSn="true" forceFitColumns="true">
						<ta:datagridItem id="aac001" key="个人编号" maxChart="7" align="center" dataAlign="left" />
						<ta:datagridItem id="aab001" key="单位编号" maxChart="7" align="center" dataAlign="left" />
						<ta:datagridItem id="aae140" key="险种类型" maxChart="10" collection="aae140" align="center" dataAlign="left" />
						<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center" dataAlign="right" />
						<ta:datagridItem id="aae042" key="结束年月" maxChart="4" align="center" dataAlign="right" />
						<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084" maxChart="5" align="center" dataAlign="left" />
						<ta:datagridItem id="yaz289" key="征缴规则" collection="yaz289" maxChart="12" align="center" dataAlign="left" />
						<ta:datagridItem id="aaz136" key="缴费档次" collection="aaz136" maxChart="6" align="center" dataAlign="left" />
						<ta:datagridItem id="ykc005" key="特殊人员类型" collection="ykc005" maxChart="6" align="center" dataAlign="left" />
						<ta:datagridItem id="ykc006" key="特殊人员类别" collection="ykc006" maxChart="6" align="center" dataAlign="left" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="本次核定明细" id="tab_success">
					<ta:datagrid id="successGrid" enableColumnMove="true" fit="true" snWidth="30" haveSn="true" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/grjfxx_lh.jsp"%>
						<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084" maxChart="5" align="center" dataAlign="left" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="个人历史征集信息（双击打印）" id="tab_history" >
					<ta:datagrid id="dg_history" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" onRowDBClick="clickPrint" forceFitColumns="true">
				     	<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
				    </ta:datagrid>
				</ta:tab>
				<ta:tab key="缴费核定效验失败信息" id="tab_error">
					<ta:datagrid id="failGrid" enableColumnMove="true" snWidth="30" fit="true" haveSn="true" forceFitColumns="true">
						<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" hiddenColumn="true" />
						<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" align="center" maxChart="8" showDetailed="true" />
						<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084" maxChart="5" align="center" dataAlign="left" />
						<ta:datagridItem id="aae041" key="费款所属期" align="center" dataAlign="center" maxChart="4" />
						<ta:datagridItem id="yaz289" key="征缴规则" collection="yaz289" align="center" maxChart="8" showDetailed="true" hiddenColumn="true" />
						<ta:datagridItem id="aaz136" key="缴费档次" collection="aaz136" align="center" maxChart="8" showDetailed="true" hiddenColumn="true" />
						<ta:datagridItem id="aae013" key="备注" align="center" maxChart="30" showDetailed="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="事件流程记录" id="tab4">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
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
		//设置页面展示信息部分为只读
		Base.setReadOnly("aab001,aae140,aae041,aae042,yaz289,aaz136,ykc005,ykc006,yac084,yae581,bz");
		//设置按钮不可用
		Base.setDisabled("addBtn,saveBtn,deleteBtn");
		//隐藏页面的tab
	    Base.hideObj("tab_success,tab_error,tab_history"); 
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_queryUnit, 0, false);		
	});	
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","paymentCheckAction!toQueryPersonAndCompany.do",null);
	}
	function fn_setDwInfo(){
		Base.submit("fltPerson,fltUnit","paymentCheckAction!toQueryInfoUnit.do",null);
	}
	
	// 个人编号回调函数
	function fn_queryInfoPerson(){	  
	    Base.setValue("aac001",g_Suggest[2]);	     
		if (g_Suggest!=""){ 
		    Base.clearData("pnldisplay");
		    Base.setValue("aae140_330","");
		    Base.hideObj("tab_history");
		    Base.clearGridData("dg_history");	
			Base.submit("fltPerson","paymentCheckAction!toQueryPersonAndCompany.do",null);
			Base.clearGridData("tmp_grbs01FailGrid");					
   		}
	}
	
	// 个人编号回调函数
	function fn_queryUnit(){
	  Base.setValue("aab001",g_Suggest[1]);	  
	  if (g_Suggest!=""){ 
	        Base.clearData("pnldisplay");
	        Base.setValue("aae140_330","");
			Base.submit("fltPerson,fltUnit","paymentCheckAction!toQueryInfoUnit.do",null);						
   		}	  
	}	
			
	// 险种选择
	function getAae140(key, value){
		Base.setEnable("aae041,aae042,aaz136,yaz289,yac084,ykc005,ykc006,yae581,bz,addBtn,deleteBtn");
	   	Base.clearData("fltBushou,pnldisplay");
	   	Base.setValue("aae140",value);	
	   	Base.setValue("bz","0"); 
	   	if(value == '110'){
	    	Base.setValue("yae581","1");
	   	} 
	   	if(value == '310'){
	      	Base.setValue("yae581","0");
	   	}
	   	if(value == '330'){
	      	Base.setValue("yae581","0");
	   	}
	   	var aab001 = Base.getValue("aab001");
	   	var yac084 = null;
	   	var rows = Base.getGridData('ac20Grid');
	   	var len = rows.length;
	   	var aae140_330;
	   	var aae041_330;
	   	var yac084_330;
	   	var aaz136_330;
	   	var yaz289_330;
	   	var ykc005_330;
	   	var ykc006_330;
	   	if("330"!=value){
	   	   if(Base.getValue("aae140_330")!=''||Base.getValue("aae140_330")!=null){
		   	    Base.setValue("yae581_330","0");
		   	    for(i=0; i<len; i++){
			   	   var aae140_330 = rows[i].aae140; 
			   	   var yae097_330 = rows[i].yae097 + '';
			   	   if (yae097_330 == "" || yae097_330 == "0"){
	   		           yae097_330 = rows[i].aae041+"";
	   		       }
			   	   if("330"==aae140_330){
			   	       if (aab001 == rows[i].aab001){
			   	            Base.setValue("ykc006ls_330",rows[i].ykc006);
			   	            Base.setValue("aaz159_330",rows[i].aaz159);
			   				var year = yae097_330.substring(0,4);
				   			var month = yae097_330.substring(4,6);
				   			if((parseInt(month)+parseInt(1)) > 12){
				   				yae097_330 = parseInt(year)+1;
				   				var time = parseInt(yae097_330 + "01");
				   			}else{
				   			    var time = parseInt(year + "01");
				   				time = parseInt(year + "01");
				   			}   			
			   			}
			   			yac084_330=rows[i].yac084;
			   	        aaz136_330=rows[i].aaz136;
			   	        yaz289_330=rows[i].yaz289;
			   	        ykc005_330=rows[i].ykc005;
			   	        ykc006_330=rows[i].ykc006;
			   			aae041_330 = time;
			   	   }
			   	}
		   	}
	   	}
	   	
	   	for(i=0; i<len; i++){
			var aae140 = rows[i].aae140;
	   		var yae097 = rows[i].yae097 + '';
	   		if (yae097 == "" || yae097 == "0"){
	   		    yae097 = rows[i].aae041+"";
	   		}
	   		if(aae140 == value){
	   			Base.setValue("aaz159",rows[i].aaz159);
	   			Base.setValue("ykc006ls",rows[i].ykc006);
	   			//if (aab001 == rows[i].aab001){
	   				var year = yae097.substring(0,4);
		   			var month = yae097.substring(4,6);
		   			if(month == '12'){
		   				month = '01';
		   				year = parseInt(year)+1+'';
		   				var time = parseInt(year + month);
		   				Base.setValue('aae041',time);
		   			}else{
		   				time = parseInt(yae097) + 1;
		   				Base.setValue('aae041',time);
		   			}   			
	   			//}
	   			// 重新查询信息,并给补收信息域内赋值
				Base.submit("aae140_330,aae042","paymentCheckAction!toQueryBushouInfo.do",
				   	{"dto['aae041_330']":aae041_330,
				   	 "dto['aae041']":time,
				   	 "dto['aae140']":value,
				     "dto['aab001']":Base.getValue("aab001"),
				     "dto['aac001']":Base.getValue("aac001"),
				     "dto['yac084']":rows[i].yac084,
				     "dto['aaz136']":rows[i].aaz136,
				     "dto['yaz289']":rows[i].yaz289,
				     "dto['ykc005']":rows[i].ykc005,
				     "dto['ykc006']":rows[i].ykc006,
				     "dto['yac084_330']":yac084_330,
				     "dto['aaz136_330']":aaz136_330,
				     "dto['yaz289_330']":yaz289_330,
				     "dto['ykc005_330']":ykc005_330,
				     "dto['ykc006_330']":ykc006_330,
				     "dto['yab019']":Base.getValue("yab019")},
				     function(){return true;},false,function(){			
			         	getYkc005("ykc005", Base.getValue("ykc005"),Base.getValue("ykc006ls"));
			         	if(value!="330"&&Base.getValue("aae140_330")!=""){
			         	   getYkc005_330("ykc005_330", Base.getValue("ykc005_330"),Base.getValue("ykc006ls_330")); 
			         	}
			         });
	   			break;
			}
		}	   	   
	}
	
	// 特殊人员类型选择
	function getYkc005(key, value, ykc006ls){
		Base.setValue(key,value);
		Base.submit(null,"paymentCheckAction!getYkc006ByYkc005.do",{"dto['ykc005']":value,"dto['ykc006']":ykc006ls});
	}
	
	// 特殊人员类型选择
	function getYkc005_330(key, value, ykc006ls){
		Base.setValue(key,value);
		Base.submit(null,"paymentCheckAction!getYkc006ByYkc005_330.do",{"dto['ykc005']":value,"dto['ykc006_330']":ykc006ls});
	}
	
	//新增记录
	function fn_addRow(){
		//验证输入框	 
	  	if(Base.getValue("aac001")=="" ||
	       Base.getValue("aab001")=="" ||
	       Base.getValue("aaz159")=="" ||
	       Base.getValue("aae140")=="" ||
	       Base.getValue("aae041")=="" ||
	       Base.getValue("aae042")=="" ||
	       Base.getValue("yaz289")=="" ||
	       Base.getValue("aaz136")=="" ||
	       Base.getValue("ykc005")=="" ||
	       Base.getValue("ykc006")=="" ||
	       Base.getValue("yac084")=="" ){		  	   
		   Base.alert("请填全核定信息!", "warn");
		}else{
			addRow();
		    Base.setEnable("saveBtn");
	        Base.setValue("aae041","");
	        Base.setValue("aae042","");
		}
	}
	
	//新增记录
	function addRow(){
	    // 检查险种类型、开始年月、结束年月
		var aae140 = Base.getValue("aae140");
	    var aae041 = Base.getValue("aae041");
	    var aae042 = Base.getValue("aae042");
	    if(!validateStartAndEndDate()){
    		return;
    	}
	    //大额
	    if(aae140=="330"){
	        var startMonth = aae041.substr(4,2);
	        var endMonth = aae042.substr(4,2);
	        if(startMonth!="01"||endMonth!="12"){
	            Base.alert("选择大额医疗费用补助时,开始年月必须为缴费年度的1月,结束年月必须缴费年度的12月!", "warn");
	            return;
	        }
	    }	
	    Base.addGridRow("ac41a1Grid", {
	   		"aac001":Base.getValue("aac001"),
	    	"aab001":Base.getValue("aab001"),
	    	"aaz159":Base.getValue("aaz159"),
	    	"aae140":Base.getValue("aae140"),
	    	"aae041":Base.getValue("aae041"),
	    	"aae042":Base.getValue("aae042"),
	     	"yaz289":Base.getValue("yaz289"),
	   		"aaz136":Base.getValue("aaz136"),
	    	"ykc005":Base.getValue("ykc005"),
	    	"ykc006":Base.getValue("ykc006"),
	    	"yac084":Base.getValue("yac084")	    
	    	}
	    );
	    
	    if("310" == Base.getValue("aae140")&&
	       Base.getValue("aae140_330")!=""&&
	       Base.getValue("aaz159_330")!="" &&
	       Base.getValue("aae041_330")!="" &&
	       Base.getValue("aae042_330")!="" &&
	       Base.getValue("yaz289_330")!="" &&
	       Base.getValue("aaz136_330")!="" &&
	       Base.getValue("ykc005_330")!="" &&
	       Base.getValue("ykc006_330")!="" &&
	       Base.getValue("yac084_330")!="" &&
	       parseInt(aae041.substring(aae041.length-2)) < 7){
	       Base.addGridRow("ac41a1Grid", {
		   		"aac001":Base.getValue("aac001"),
		    	"aab001":Base.getValue("aab001"),
		    	"aaz159":Base.getValue("aaz159_330"),
		    	"aae140":Base.getValue("aae140_330"),
		    	"aae041":Base.getValue("aae041_330"),
		    	"aae042":Base.getValue("aae042_330"),
		     	"yaz289":Base.getValue("yaz289_330"),
		   		"aaz136":Base.getValue("aaz136_330"),
		    	"ykc005":Base.getValue("ykc005_330"),
		    	"ykc006":Base.getValue("ykc006_330"),
		    	"yac084":Base.getValue("yac084_330")	    
		    	}
		    );
	    };	    
	    //显示Tab页（本次核定信息）	
	    Base.activeTab("tab_ac41a1");	    
	    var rowData = Base.getGridData("ac41a1Grid");
	    var param = {};
	  	param.ac41a1List = Ta.util.obj2string(rowData);
	    Base.submit("fltPerson,fltUnit", "paymentCheckAction!toCheck.do", param);	      
	}	
	
	function yz_330(aae140,aae041,aae042){
		var flag = 0;
		var jfmx = Base.getGridData("ac43_ac44Grid"); //获得缴费明细
		while (parseInt(aae041) <= parseInt(aae042)){
	        // 判断补交时间段不能和已缴费明细表有交叉时间段
	     	for(var i = 0; i < jfmx.length; i++){
	     	  	if(aae140 == jfmx[i].aae140 && jfmx[i].aae003 == parseInt(aae041)){
	     	  		flag = 1;
	            }
	     	}
	     }
	     if (flag == 0){
	     	return true;
	     }else{
	     	return false;
	     }
	}
	
	//删除记录
	function fn_deleteRow(){
	    Base.deleteGridSelectedRows("ac41a1Grid");
	}

	// 保存
	function submitData(){		
		var aac001 = $("#aac001").val();
		if(aac001 == '' || aac001 == null){
		  return  Base.alert("个人编号不能为空!","warn");
		}
		//获得全部记录 必传参数 其中必须包含需要校验的参数
	   	var ac41a1List = Base.getGridData("ac41a1Grid");
	   	var param = {};
	  	param.pwList = Ta.util.obj2string(ac41a1List);//业务类型  必传参数   参数名不能更改
	  	param["dto['aaa121']"] = "A05007";//业务类型  必传参数   参数名不能更改
	  	param["dto['yae858']"] = "aaz136";//业务规则  必传参数   参数名不能更改
	  	param["dto['aaz010']"] = Base.getValue("aac001");//业务规则  必传参数   参数名不能更改
	  	Base.submit("fltPerson,fltUnit,yae581,bz", "paymentCheckAction!toSave.do", param,null,false,false);
 	}
	 
	function validateAae041AndAae042(instance){
		var aae041 = Base.getValue("aae041");  //开始年月
	   	var aae042 = Base.getValue("aae042");  //结束年月
	    if(instance == "aae041"){
	         Base.setValue("aae042","");
	         aae042 = "";
	    }	 
	   	if(parseInt(aae041) > parseInt(aae042)){
	       Base.alert("开始年月不能大于结束年月!", "warn");
	       if(instance == "aae041"){	         
	         Base.setValue("aae041","");
	         Base.setValue("aae042","");
	         aae041 = "";
	         aae042 = "";
	       }else{      
	         Base.setValue("aae041","");
	         Base.setValue("aae042","");
	         aae041 = "";
	         aae042 = "";
	       }	
	       Base.focus(instance);	
	       return;      
	    }
	    if(Base.getValue("aae140") == "310"){   
	        Base.setValue("aae041_330",aae041);
	        Base.setValue("aae042_330",aae042);
	    }else if(Base.getValue("aae140") == "110"){
	        if((aae041!=null||aae041!="")&&(aae042!=null||aae042!="")){
	            Base.submit("aae041,aae042,aae140","paymentCheckAction!toQueryAAZ136.do");
	        }
	    }
	}
	
	// 效验空
	// 效验与缴费明细重复
	// 效验与申请信息重复
	function validateStartAndEndDate(){
	    if(Base.getValue("aae041") == '' || Base.getValue("aae041") == null){
			Base.alert("开始年月不能为空!", "warn");
			Base.focus("aae041");	
	       	return false;
	    }
	    if(Base.getValue("aae042") == '' || Base.getValue("aae042") == null){
			Base.alert("结束年月不能为空!", "warn");
			Base.focus("aae042");	
	       	return false;
	    }	    
	    var aae140 = Base.getValue("aae140");	    	    
		if(aae140 == '' || aae140 == null){
			Base.alert("险种类型不能为空!", "warn");
			Base.focus("aae140");	
	       	return false;
	    }
	    
	    var aae041 = Base.getValue("aae041"); //开始时间
	    var aae042 = Base.getValue("aae042"); //结束时间
	    var jfmx = Base.getGridData("ac43_ac44Grid"); //获得缴费明细
	    var bsxx = Base.getGridData("ac41a1Grid"); //获得申请信息
   	    
	    // 开始年月不能大于结束年月
		if(parseInt(aae041) > parseInt(aae042)){
			Base.alert("开始年月不能大于结束年月,请更正!", "warn");
	       	return false;      
		}
	    while (parseInt(aae041) <= parseInt(aae042)){
	        // 判断补交时间段不能和已缴费明细表有交叉时间段
	     	for(var i = 0; i < jfmx.length; i++){
	     	  	if(aae140 == jfmx[i].aae140 && jfmx[i].aae003 <= parseInt(aae041) && jfmx[i].aae003 >= parseInt(aae041)){
	     	  		Base.alert("月份" + aae041 + "已缴费,请更正开始年月和结束年月!", "warn");	
	        		Base.focus("aae041");	
	       			return false;
	            }
	     	}
	     	
	     	// 判断补交时间段不能和申请信息已有记录有交叉时间段
	    	for(var i = 0; i < bsxx.length; i++){
	    		if(aae140 == bsxx[i].aae140 && bsxx[i].aae041 <= parseInt(aae041) && bsxx[i].aae042 >= parseInt(aae041)){
	    			Base.alert("月份" + aae041 + "已申请,请更正开始年月和结束年月!", "warn");
	    			Base.focus("aae041");	
	       	 		return false;
	            }
	    	}
	    	if(parseInt(aae041) == parseInt(aae042)){
	    		
	    		break;
	    	}else{
	    		var year = Math.floor(parseInt(aae041)/100);
		    	var month = parseInt(aae041.toString().substring(4,6)) + 1;
		    	if (parseInt(month) > 12){
		    		year = parseInt(year) + 1;
		    		month = 1;   
		    	}
		    	aae041 = parseInt(year) * 100 + month;
	    	}
	    }
	    return true;    	    
	}
    
    function clickPrint(e, rowdata) {
		var row = rowdata.row, aaz288 = rowdata.aaz288, aaz010 = rowdata.aaz010;
		var userid= Base.getValue("userid");
		var fileName="flexEmployeePrint.raq";
		var prm = "aaz288="+aaz288+";aaz010="+aaz010+";userid="+userid;
		//打印成功后修改财务可以处理的标记
		Base.submit(null,"paymentCheckAction!dbPrint.do",
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