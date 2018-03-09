<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>个人补中断</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="addBtn" key="新增 [I]" icon="xui-icon-spotAdd" hotKey="I" onClick="fn_addRow()" asToolBarItem="true" />
			<ta:button id="deleteBtn" key="删除 [D]" icon="xui-icon-spotDelete" hotKey="D" onClick="fn_deleteRow()" asToolBarItem="true" />
			<ta:button id="saveBtn" key="保存 [S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true" >
			<ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">
				<ta:text id="aaz002" key="日志ID" display="false" />
				<ta:text id="dbclick" key="dbclick" display="false" />
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
			</ta:panel>
			<ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
				<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			</ta:panel>
			<ta:panel key="个人补缴信息" cols="3" id="fltBushou" expanded="false" scalable="false">
				<ta:selectInput id="aae140" key="险种类型" required="true" labelWidth="120" onSelect="getAae140" />
				<ta:date id="aae041" key="开始年月" required="true" showSelectPanel="true" issue="true" labelWidth="120" onChange="validateAae041AndAae042('aae041')" />
				<ta:date id="aae042" key="终止年月" required="true" showSelectPanel="true" issue="true" labelWidth="120" onChange="validateAae041AndAae042('aae042')" />
				<ta:selectInput id="yaz289" key="征缴规则" required="true" labelWidth="120" />
				<ta:selectInput id="aaz136" key="基数规则" required="true" labelWidth="120" />
				<ta:number id="aac040" key="申报工资" required="true" labelWidth="120" precision="2" min="0" max="99999999" asAamount="true" />
				<ta:selectInput id="ykc005" key="特殊人员类型" required="true" labelWidth="120" onSelect="getYkc005" />
				<ta:selectInput id="ykc006" key="特殊人员类别" required="true" labelWidth="120" />
				<ta:text id="ykc006ls" key="特殊人员类别（临时）" display="false" labelWidth="120" />
				<ta:selectInput id="yac084" key="离退休标志" required="true" labelWidth="120" />
				<ta:selectInput id="yae581" key="利息征收标志" required="true" labelWidth="120" collection="yae581"/>
				<ta:text id="aaz159" key="人员参保关系ID" display="false" />
			</ta:panel>
			<ta:tabs cols="2" fit="true" id="tabs">
				<ta:tab key="个人参保信息" id="tab1">
					<ta:datagrid id="ac20Grid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="缴费明细信息" id="tab2">
					<ta:datagrid id="ac43_ac44Grid" enableColumnMove="false" forceFitColumns="true" fit="true" snWidth="30" haveSn="true">
						<%@ include file="/yhsi3/commonJSP/v_ac43ac44.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_cb" key="单位参保信息">
					<ta:datagrid id="dg_cb" haveSn="true" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="6" hiddenColumn="true" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12" showDetailed="true" />
						<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="center" maxChart="4" dataType="date" />
						<ta:datagridItem id="aab051" key="参保状态" collection="AAB051" align="center" dataAlign="left" maxChart="4" />
						<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="6" />
						<ta:datagridItem id="yab139" key="参保所属机构" collection="YAB003" align="center" dataAlign="left" maxChart="8" showDetailed="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="本次补缴信息" id="tab3">
					<ta:datagrid id="ac41a1Grid" enableColumnMove="false" forceFitColumns="true" selectType="checkbox" fit="true" snWidth="40" haveSn="true">
						<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" maxChart="6" />
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="6" />
						<ta:datagridItem id="aae140" key="险种类型" maxChart="12" collection="aae140" showDetailed="true" align="center" dataAlign="left" />
						<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="right" maxChart="4" />
						<ta:datagridItem id="aae042" key="结束年月" maxChart="4" align="center" dataAlign="right">
							<ta:datagridEditor type="number" max="205012" min="195001" />
						</ta:datagridItem>
						<ta:datagridItem id="yaz289" key="征缴规则" collection="yaz289" showDetailed="true" maxChart="10" align="center" dataAlign="left" />
						<ta:datagridItem id="aaz136" key="基数规则" collection="aaz136" showDetailed="true" maxChart="10" align="center" dataAlign="left" />
						<ta:datagridItem id="aac040" key="工资" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="ykc005" key="特殊人员类型" collection="ykc005" showDetailed="true" maxChart="6" align="center" dataAlign="left" />
						<ta:datagridItem id="ykc006" key="特殊人员类别" collection="ykc006" showDetailed="true" maxChart="6" align="center" dataAlign="left" />
						<ta:datagridItem id="yae581" key="利息征收标志" collection="YAE581" maxChart="6" align="center" dataAlign="left" />
						<ta:datagridItem id="aae011" key="经办人" maxChart="4" align="center" collection="aae011" dataAlign="left" hiddenColumn="false" />
						<ta:datagridItem id="aae036" key="经办时间" maxChart="10" align="center" dataAlign="left" hiddenColumn="false" />
						<ta:datagridItem id="aaz159" key="参保关系" maxChart="10" align="center" dataAlign="right" hiddenColumn="false" />
						<ta:datagridItem id="yae099" key="业务流水号" maxChart="10" align="center" dataAlign="right" hiddenColumn="false" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="校验失败信息" id="tbFail">
					<ta:datagrid id="failGrid" enableColumnMove="false" snWidth="30" fit="true" haveSn="true">
						<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" maxChart="6" />
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="6" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" maxChart="12" align="center" dataAlign="left" />
						<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="right" maxChart="4" />
						<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="right" maxChart="4" />
						<ta:datagridItem id="yaz289" key="征缴规则" collection="yaz289" maxChart="15" align="center" dataAlign="left" />
						<ta:datagridItem id="aaz136" key="基数规则" maxChart="10" collection="aaz136" align="center" dataAlign="left" />
						<ta:datagridItem id="aac040" key="工资" maxChart="4" align="center" dataAlign="right" />
						<ta:datagridItem id="aae013" key="备注" maxChart="8" showDetailed="true" align="center" dataAlign="left" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="补收成功信息" id="tabsucc">
					<ta:datagrid id="successGrid" snWidth="30" haveSn="true" forceFitColumns="true" fit="true">
					    <ta:datagridItem field="aab001" key="单位ID" align="center" dataAlign="left" />
						<ta:datagridItem field="aae140" key="险种类型" width="170" collection="aae140" align="center" dataAlign="left" />
						<ta:datagridItem field="aaa115" key="缴费类型" width="160" collection="aaa115" align="center" dataAlign="left" />
						<ta:datagridItem field="aac040" key="工资" align="center" dataAlign="right" />
						<ta:datagridItem field="aae180" key="基数" align="center" dataAlign="right" />
						<ta:datagridItem field="aae003" key="所属期数" align="center" dataAlign="right" />
						<ta:datagridItem field="dwhtc" key="单位划统筹 " align="center" dataAlign="right" />
						<ta:datagridItem field="dwhzh" key="单位划账户" align="center" dataAlign="right" />
						<ta:datagridItem field="grhtc" key="个人划统筹" align="center" dataAlign="right" />
						<ta:datagridItem field="grhzh" key="个人划账户 " align="center" dataAlign="right" />
						<ta:datagridItem field="dwhtcbl" key="单位划统筹比例 " width="120" align="center" dataAlign="right" />
						<ta:datagridItem field="dwhzhbl" key="单位划账户比例" width="120" align="center" dataAlign="right" />
						<ta:datagridItem field="grhtcbl" key="个人划统筹比例" width="120" align="center" dataAlign="right" />
						<ta:datagridItem field="grhzhbl" key="个人划账户比例" width="120" align="center" dataAlign="right" />
				    </ta:datagrid>
				</ta:tab>
				<ta:tab key="事件流程记录" id="tab4">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
			
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		
		//设置页面展示信息部分为只读
		Base.setReadOnly("aab001,aae140,aae041,aae042,yaz289,ykc005,ykc006,yac084,aaz136,aac040,yae581");
		//设置除重置按钮外的按钮不可用用
		Base.setDisabled("addBtn,saveBtn,deleteBtn,editBtn");
		//隐藏页面的tab	
	    Base.hideObj("tabsucc,tab_error"); 
		//
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_queryUnit, 0, false);		
	});	
	
	function getInfo(rowdata,n){
	   //Base.clearData("fltBushou");	 
	   //Base.setReadOnly("aae140,aae041,aae042,yaz289,aaz136,aac040");
	   if(Base.getValue("yab019") == "02"){
	   	  Base.hideObj("aaz136");
	   	  Base.setValue("aac040","0");
	   	  Base.setRequired("aaz136_lv");
	   	  Base.showObj("aaz136_lv");
	   }
	   Base.setReadOnly("aae140,yaz289,aaz136,aac040");	
	   if(n>0){
		   var data = Base.getGridSelectedRows("ac20Grid");	 
		   if(data[0].aae140 == "110"){
		   	  Base.setValue("yae581","1");
		   }else{
		   	  Base.setValue("yae581","0");
		   } 
	   Base.submit(null,"interruptAction!toQueryBushouInfo.do",
	   {  
	    "dto['dbclick']":Base.getValue("dbclick"), 
	    "dto['yab019']":Base.getValue("yab019"), 	    
	    "dto['aab001']":data[0].aab001,
	    "dto['aab001a']":Base.getValue("aab001"),	    
	    "dto['aac001']":data[0].aac001,
	    "dto['aae140']":data[0].aae140,
	    "dto['aaz136']":data[0].aaz136,
	    "dto['yac084']":data[0].yac084,
	    "dto['yaz289']":data[0].yaz289,
	    "dto['aaz159']":data[0].aaz159,
	    "dto['yab139']":data[0].yab139		    
	    },function(){Base.setEnable('aae041'); Base.setEnable('aae042');Base.setEnable('yae581'); return true;},false);
	   }
	 }
	
	function fnSelectAaz136(key,value){
	  Base.setValue("aaz136",value);
	}

	// 个人编号回调函数
	function fn_queryInfoPerson(){	  
	    Base.setValue("aac001",g_Suggest[2]);
	    if (g_Suggest!=""){ 
			Base.submit("fltPerson","interruptAction!toQueryPersonAndCompany.do",{"dto['aab001']":g_Suggest[10]});
			Base.clearGridData("tmp_grbs01FailGrid");			
   		}
	}
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","interruptAction!toQueryPersonAndCompany.do",{"dto['aab001']":g_Suggest[10]});
		Base.clearGridData("tmp_grbs01FailGrid");	
	}
	// 单位编号回调函数
	function fn_queryUnit(){
		Base.setValue("aab001", g_Suggest[0]);
	    Base.setValue("aae044", g_Suggest[1]);
        Base.setValue("aab999", g_Suggest[2]);
        Base.setValue("aab019", g_Suggest[3]);
        Base.setValue("yab019", g_Suggest[4]);	  
	  if (g_Suggest!=""){ 
			Base.submit("fltPerson,fltUnit","interruptAction!toQueryInfoUnit.do",null);						
   		}	  
	}
	
	function fn_setDwInfo(){
		Base.submit("fltPerson,fltUnit","interruptAction!toQueryInfoUnit.do",null);
	}
	
	// 险种选择
	function getAae140(key, value){
		Base.setEnable("aae041,aae042,aaz136,yaz289,aac040,ykc005,ykc006,yac084,yae581,addBtn,deleteBtn");
	   	Base.clearData("fltBushou");
	   	Base.setValue("aae140",value);	
	   	Base.setValue("yae581","0");	
	   	var aab001 = Base.getValue("aab001");
	   	var yac084 = null;
	   	var rows = Base.getGridData('ac20Grid');
	   	var len = rows.length;
	   	for(i=0; i<len; i++){
			var aae140 = rows[i].aae140;
	   		var yae097 = rows[i].yae097 + '';
	   		if(aae140 == value){
	   			Base.setValue("aaz159",rows[i].aaz159);
	   			Base.setValue("ykc006ls",rows[i].ykc006);
	   			if (aab001 == rows[i].aab001){
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
	   			}
	   			// 重新查询信息,并给补收信息域内赋值
				Base.submit(null,"interruptAction!toQueryBushouInfo.do",
				   	{"dto['aae140']":value,
				     "dto['aab001']":Base.getValue("aab001"),
				     "dto['aac001']":Base.getValue("aac001"),
				     "dto['yac084']":rows[i].yac084,
				     "dto['aaz136']":rows[i].aaz136,
				     "dto['yaz289']":rows[i].yaz289,
				     "dto['ykc005']":rows[i].ykc005,
				     "dto['ykc006']":rows[i].ykc006,
				     "dto['yab019']":Base.getValue("yab019")},
				     function(){return true;},false,function(){			
			         	getYkc005("ykc005", Base.getValue("ykc005"));
			         	if (Base.getValue("aae041") == ""){
			    			Base.focus("aae041");
			    		}else{
			    		    Base.focus("aae042");
			    		}
			         });
	   			break;
			}
		}			   	   
	}
	
	// 特殊人员类型选择
	function getYkc005(key, value){
		Base.setValue("ykc005",value);
		Base.submit(null,"interruptAction!getYkc006ByYkc005.do",{"dto['ykc005']":value,"dto['ykc006']":Base.getValue("ykc006ls")});
		Base.focus("ykc006");
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
	       	Base.getValue("aac040")=="" ||
	       	Base.getValue("ykc005")=="" ||
	       	Base.getValue("ykc006")=="" ||
	      	Base.getValue("yae581")=="" ||
	       	Base.getValue("yac084")=="" ){		  	   
		  	Base.alert("请填全核定信息!", "warn");
		}else{
			addRow();
			Base.setEnable("saveBtn");
	        Base.setValue("aae041","");
	        Base.setValue("aae042","");
	        Base.focus("aae041");		    
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
	        	Base.alert("选择大额医疗费用补助时,开始年月必须为补收年度的1月,结束年月必须为补收年度的12月!", "warn");
	            return;
	        }
	    }
		Base.addGridRowDown("ac41a1Grid", {
	   		"aac001":Base.getValue("aac001"),
	    	"aab001":Base.getValue("aab001"),
	    	"aaz159":Base.getValue("aaz159"),
	    	"aae140":Base.getValue("aae140"),
	    	"aae041":Base.getValue("aae041"),
	    	"aae042":Base.getValue("aae042"),
	     	"yaz289":Base.getValue("yaz289"),
	   		"aaz136":Base.getValue("aaz136"),
	    	"aac040":Base.getValue("aac040"),
	    	"ykc005":Base.getValue("ykc005"),
	    	"ykc006":Base.getValue("ykc006"),
	    	"yac084":Base.getValue("yac084"),
	    	"yae581":Base.getValue("yae581")	    
	    	}
	    );
	    
	    //显示Tab页（本次核定信息）	
	    Base.activeTab("tab3");
	    
	    var rowData = Base.getGridData("ac41a1Grid");
	    var param = {};
	  	param.ac41a1List = Ta.util.obj2string(rowData);
	    Base.submit("fltPerson,fltUnit", "interruptAction!toCheck.do", param);	      
	}	
	
	//删除记录
	function fn_deleteRow(){
	    var list = Base.getGridSelectedRows("ac41a1Grid");
	    if(list.length==0){
	        Base.activeTab("tab3");
	        Base.alert("请选择需要删除的本次补缴信息!", "warn");
	        return;
	    }else{
	        Base.deleteGridSelectedRows("ac41a1Grid");
	        Base.focus("aae041");
	    }
	}

	// 保存
	function submitData(){
		//获得全部记录
	   	var ac41a1List = Base.getGridData("ac41a1Grid");
	   	if(ac41a1List.length==0){
	   	    Base.alert("本次补缴信息中没有任何数据,请添加信息后在保存!", "warn");
	   	    return;
	   	}
	   	var param = {};
	  	param.ac41a1List = Ta.util.obj2string(ac41a1List);
	    Base.submit("fltPerson,fltUnit,yae581", "interruptAction!toSave.do", param);
 	}
	 
	function validateAae041AndAae042(instance){
		var aae041 = Base.getValue("aae041");  //开始年月
	   	var aae042 = Base.getValue("aae042");  //结束年月
	   	if(parseInt(aae041) > parseInt(aae042)){
	       Base.alert("开始年月不能大于结束年月!", "warn");
	       if(instance == "aae041"){	         
	         Base.setValue("aae041","");
	       }else{
	         Base.setValue("aae042","");
	       }	
	       Base.focus(instance);	
	       return;      
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
	    	
	    	var year = Math.floor(parseInt(aae041)/100);
	    	var month = parseInt(aae041.toString().substring(4,6)) + 1;
	    	if (parseInt(month) > 12){
	    		year = parseInt(year) + 1;
	    		month = 1;   
	    	}
	    	aae041 = parseInt(year) * 100 + month;
	    }
	    return true;    	    
	}		

</script>
<%@ include file="/ta/incfooter.jsp"%>