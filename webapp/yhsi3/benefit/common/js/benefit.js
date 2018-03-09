<script type="text/javascript" charset="UTF-8">  
// 页面初始化，// TA+3布局必须的，如果没有某些属性使用不了，如 fit
$(document).ready(function() {
// 延迟加载会使ACTION的JS置焦点失效
//	setTimeout(function() {
//		$("body").taLayout();
//		var par='<%-- =request.getParameter("fhjc")--%>';
//	    if (par != 1 && par != 2){
//	    	setfltjb();
//	    }    
//	},1) 
	
	$("body").taLayout();
	var par='<%=request.getParameter("fhjc")%>';
    if (par != 1 && par != 2){
    	setfltjb();
    }
//    fn_setKayname();
    //fn_reconsitutionByAction();   
    initializeSuggestFramework(1, null, "aac001", 800, 200,7,fn_queryInfo,1,false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)				
	initializeSuggestFramework(2, null, "aab001", 500, 200,3,fn_ab01Info, 1,false); //查询单位基本信息，fn_ab01Info回调函数返回自己action
	initializeSuggestFramework(3, null, "aaz001", 500, 200,2,fn_ae10Info, 1,false); //查询机构本信息，fn_ae10Info回调函数返回自己action

});	

// rpc 查询给页面个人基本信息赋值
function fn_setPersonBaseInfoData(){
	Base.setValue("aac001",g_Suggest[2]);
	Base.setValue("aac002",g_Suggest[0]);
	Base.setValue("aac003",g_Suggest[1]);	
	Base.setValue("aac004",g_Suggest[3]);
//	Base.setValue("aac006",g_Suggest[4]);
}

//rpc 查询给页面单位基本信息赋值
function fn_setUnitBaseInfoData(){
	Base.setValue("aab999",g_Suggest[0]);
	Base.setValue("aab001",g_Suggest[1]);
	Base.setValue("aae044",g_Suggest[2]);
}

//rpc 查询给页面机构基本信息赋值
function fn_setAidBaseInfoData(){
	Base.setValue("aaz001",g_Suggest[0]);
	Base.setValue("aae0441",g_Suggest[1]);
}

//初始化使用rpc 调用回调函数 fn_ae10Info 初始化
function fn_ae10Info(){
}

// 初始化使用rpc 调用回调函数 fn_ab01Info 初始化
function fn_ab01Info(){
}

//初始化使用rpc 调用回调函数 fn_queryInfo 初始化
function fn_queryInfo(){
}

// 打回重新经办的时候，将审批标志置灰
function setfltjb(){
	Base._setReadOnly(["action"],true);
}

//通过JS过滤action的下拉列表
function fn_reconsitutionByAction(){
	
	Base.filterSelectInput("action", ["1","2","3"], true);
	
	/* Base.setSelectInputDataWidthJson("action", [{id:'1',name : '通过'}, 
	                                            {id:'2',name : '不通过'}, 
	                                            {id:'3',name : '打回'}]); */
	
}


function fn_setKayname(key,val){
	var aae140 = Base.getValue("aae140");
	if (aae140 == "150"){
		fn_SetKey("aab001","村编号：");
		fn_SetKey("aae044","村名称：");
		fn_SetKey("aae002","村最大做账期号：");

	}else{
		fn_SetKey("aab001","单位编号：");
		fn_SetKey("aae044","单位名称：");
		fn_SetKey("aae002","单位最大做账期号：");
	}
}

//设置界面datagrid中Item的key值
function fn_SetGridTitle(gridId,itemId,val){
	$("div[id="+gridId+"]").find("div[field="+itemId+"]").attr("title",val);
	$("div[id="+gridId+"]").find("div[field="+itemId+"]").children("span[class='slick-column-name']").html(val);
}

//设置界面输入框的key值
function fn_SetKey(key,val){
	var A = $("label[for="+key+"]").children();
	var B = $("label[for="+key+"]");
	$("label[for="+key+"]").html(val);
	A.appendTo(B);
}

//datagrid 将datagridItem 列设置为红色字体  使用发放直接在 datagridItem 设置属性 formatter="convertState"
function convertState(row, cell, value, columnDef, dataContext){
	return "<div style='color:red;font-weight:bolder;margin-top:4px'>"+value+"</div>";
}

function fn_TotalsFormatter(value){
	return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>合计："+value+"</div>";
}

//界面初始化，如果发放信息不是在核定时候录入，去掉必输项红星
function fn_FfxxlrInitialization(){
/*	var aaa005 = Base.getValue("aaa005");
	
	if (aaa005 == '' || aaa005 == null){
		alert("系统未配置发放信息录入点参数！");
		return;
	}else{
		if (aaa005 == "01"){
			Base.setRequired("aae145");
			Base.setRequired("aae145_dq");
		}else{
			Base.setDisRequired(["aae145","aae010","aaf002","aaz009","yaf001","yaf012","yaf013","aae133","aae136","aae007","aae006"]);
			Base.setDisRequired(["aae145_dq","aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae133_dq","aae136_dq","aae007_dq","aae006_dq"]);
		}
	}*/
	return false;
}

function fn_personJfmxQuery(){
    var aae140 = Base.getValue("aae140");
//    var aab001 = Base.getValue("aab001");
    var aab001 = "";
    var aac001 = Base.getValue("aac001");
    var toUrl="<%=path%>/process/benefit/query/commonquery/commonQueryAction!persondetails.do";
	Base.openWindow("userwin","缴费信息",toUrl,{"dto['aac001']":aac001,"dto['aae140']":aae140,"dto['aab001']":aab001},'90%','70%',null,"",true);
}

//在读取发放信息的时候初始化界面显示
function fn_setPaymentInfoReadOnlyPage(){
	var aae145 = Base.getValue("aae145");	
   	if(aae145 == "11"){
   		Base.hideObj(["aae006","aae007"]);
   		Base.showObj(["aae133","aae136","aae145","aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]);
   		Base.setDisRequired("yaf012");
   	}else if(aae145 == "12"){
   		Base.showObj(["aae006","aae007"]);
   		Base.hideObj(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]);
   	}else if(aae145 == "14"){
   		Base.hideObj(["aae006","aae007","aaf002","aaz009"]);
   		Base.showObj(["aae133","aae136","aae145","aae010","yaf001","yaf012","yaf013","yaf011"]);
   		Base.setRequired(["yaf012"]);
   	}else if(aae145 == "21"){
   		Base.showObj(["aae010","yaf012"]);	   		
   		Base.hideObj(["aae133","aae136","aae145","aaf002","aaz009","aae006","aae007"]);
   	}else{
   		//alert("支付方式录入错误！");
   		return false;
   	}		
}

//在读取发放信息的时候初始化界面显示
function fn_setPaymentInfoPage(){
	var aae145 = Base.getValue("aae145");	
   	if(aae145 == "11"){
   		Base.hideObj(["aae006","aae007"]);
   		Base.showObj(["aae133","aae136","aae145","aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]); 
   		Base.setDisRequired("yaf012");
   	}else if(aae145 == "12"){
   		Base.showObj(["aae006","aae007"]);
   		Base.hideObj(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]);
   	}else if(aae145 == "14"){
   		Base.hideObj(["aae006","aae007","aaf002","aaz009"]);
   		Base.showObj(["aae133","aae136","aae145","aae010","yaf001","yaf012","yaf013","yaf011"]); 
   		Base.setRequired(["yaf012"]);
   		Base.setRequired(["aae010","aaf002","aaz009","yaf011","yaf012"]);
   	}else if(aae145 == "21"){
   		Base.showObj(["aae010","yaf012"]);	   		
   		Base.hideObj(["aae133","aae136","aae145","aaf002","aaz009","aae006","aae007"]);
   	}else{
   		//alert("支付方式录入错误！");
   		return false;
   	}		
}

//在读取发放信息的时候初始化界面显示
function fn_setPaymentInfoReadOnlyPage_dq(){
	var aae145 = Base.getValue("aae145_dq");	
   	if(aae145 == "11"){
   		Base.hideObj(["aae006_dq","aae007_dq"]);
   		Base.showObj(["aae133_dq","aae136_dq","aae145_dq","aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]); 
   	}else if(aae145 == "12"){
   		Base.showObj(["aae006_dq","aae007_dq"]);
   		Base.hideObj(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]);
   	}else if(aae145 == "14"){
   		Base.hideObj(["aaf002_dq","aaz009_dq","aae006_dq","aae007_dq"]);
   		Base.showObj(["aae133_dq","aae136_dq","aae145_dq","aae010_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]); 	
   	}else if(aae145 == "21"){
   		Base.showObj(["aae010_dq","yaf012_dq"]);	   		
   		Base.hideObj(["aae133_dq","aae136_dq","aae145_dq","aaf002_dq","aaz009_dq","aae006_dq","aae007_dq"]);
   	}else{
   		//alert("支付方式录入错误！");
   		return false;
   	}		
}

//支付对象变更特殊要求调用
function fn_privateContorlYad169(){
}
//发放方式变更特殊要求调用
function fn_privateContorlAae145(){
}
//组织ID变更特殊要求调用
function fn_privateContorlAaz001(){
	var aaz001 = "";
	return aaz001;
}
//组织ID变更特殊要求调用
function fn_privateContorlYaz099(){
	var yaz099 = "";
	return yaz099;
}
</script>