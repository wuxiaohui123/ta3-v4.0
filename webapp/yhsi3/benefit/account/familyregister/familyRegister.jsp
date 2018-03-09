<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>familyRegister</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<ta:text id="aaa121" key="业务类型编码" display = "false"  />
			</ta:box>
			<ta:panel key="人员基本信息" cols="3" id="fset1">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDyAll.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
			</ta:panel>

			<ta:panel key="人员死亡信息" cols="3" id="rygwxx">
				<ta:date id="aae138" key="死亡时间" labelWidth="130" readOnly="true" />
				<ta:selectInput id="yac551" key="丧葬方式" labelWidth="130"
					collection="YAC551" readOnly="true" />
				<ta:text id="yac001" key="最大发放期" labelWidth="130" readOnly="true" />
			</ta:panel>

			<ta:panel id="gyqsxxlr" key="供养亲属信息录入" cols="3">
			    <ta:text id="aaz257_gy" key="供养亲属定期待遇享受ID" display="false" />
			    <ta:text id="aac001_gy" key="供养亲属编号" labelWidth="130" onChange="sfwQuery()" bpopTipMsg="可输入公民身份号码、姓名、人员ID"  />
				<ta:selectInput id="aac058_gy" key="证件类型" collection="aac058"  required="true" labelWidth="120" selectFirstValue="true" value="1" display="false"/>
				<ta:text id="aac002_gy" key="身份证号码" labelWidth="130" readOnly="true" />
				<ta:text id="aac003_gy" key="供养亲属姓名" labelWidth="130" required="true" onChange="Changeaae136()" />
				<ta:selectInput id="aac004_gy" key="性别"  collection="aac004" labelWidth="130" required="true"/>
				<ta:selectInput id="yac520" key="丧失劳动能力" labelWidth="130" required="true" value="0" collection="AAC086" />
				<ta:selectInput id="aae144" key="供养关系" labelWidth="130" required="true" onSelect="changeXSBL" collection="AAE144" />
				<ta:selectInput id="aac086" key="孤寡标志" labelWidth="130" required="true" value="0" onSelect="changeXSBL" collection="AAC086"/>
				<ta:number id="aic172" key="享受比例" labelWidth="130" required="true" precision="1" max="1" />
				<ta:date id="aac006_gy" key="出生日期" labelWidth="130" required="true" showSelectPanel="true"/>
				<ta:selectInput id="yac583_gy" key="户口所在行政区划代码"  labelWidth="140" islevel="true" isMustLeaf="true" isAutoExtend="false" required="true"/>
				<ta:date id="aae210" key="待遇享受开始年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="false"/>
				<ta:text id="aae013_gy" key="备注" labelWidth="130" span="3" />
			</ta:panel>
			<ta:box id="paymentInfo">
				<ta:text id="aaz009_bk" key="代发机构名称" display="false" />
				<ta:text id="yaf013_bk" key="开户银行编号" display="false" />
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			</ta:box>

			<ta:panel id="gyqslb" key="供养亲属列表" bodyStyle="margin:0px">
				<ta:datagrid id="gyqsxxList" dblClickEdit="true">
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
					<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
					<ta:datagridItem id="aaz257_gy" key="供养亲属定期待遇享受ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz009" key="代发机构名称" hiddenColumn="false" />
					<ta:datagridItem id="aac001_gy" key="亲属编号" hiddenColumn="false" />
					<ta:datagridItem id="aac002_gy" key="身份证号码" />
					<ta:datagridItem id="aac003_gy" key="亲属姓名" />
					<ta:datagridItem id="aae144" key="供养关系" collection="AAE144" />
					<ta:datagridItem id="aac004_gy" key="性别" collection="AAC004" />
					<ta:datagridItem id="aac006_gy" key="出生日期" dataType="date" />
					<ta:datagridItem id="yac583_gy" key="户口所在行政区划代码" collection="AAB301" />
					<ta:datagridItem id="yac520" key="丧失劳动" collection="AAC086" />
					<ta:datagridItem id="aac086" key="孤寡标志" collection="AAC086" />
					<ta:datagridItem id="aic172" key="享受比例" />
					<ta:datagridItem id="aae210" key="待遇享受开始年月" />
					<ta:datagridItem id="aae004" key="联系人" />
					<ta:datagridItem id="aae005" key="联系电话" />
					<ta:datagridItem id="aae013" key="备注" />
					<ta:datagridItem id="aae145" key="待遇发放方式" width="110px" collection="AAE145" />
					<ta:datagridItem id="aac059" key="领取人证件类型" width="110px" collection="AAC059" />
					<ta:datagridItem id="aaf002" key="代发银行类别" width="110px" collection="AAF002" />
					<ta:datagridItem id="dfjgmc" key="代发机构名称" width="110px" />
					<ta:datagridItem id="aae010" key="银行账号" />
					<ta:datagridItem id="yaf012" key="开户银行类别" width="110px" collection="AAF002" />
					<ta:datagridItem id="yaf013" key="开户银行编号" width="110px" />
					<ta:datagridItem id="yaf001" key="开户银行名称" width="110px" />
					<ta:datagridItem id="aae133" key="领取人姓名" width="100px" />
					<ta:datagridItem id="aae136" key="领取人证件号码" width="120px" />
					<ta:datagridItem id="aae007" key="邮政编码" />
					<ta:datagridItem id="aae006" key="详细地址" />
					<ta:datagridItem id="yad169" key="发放对象" hiddenColumn="false"/>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
//页面布局控制
$(document).ready(function() {
	$("form").css("overflow","auto");
	fn_FfxxlrInitialization();
	Base._setReadOnly("aae133",false);
	initializeSuggestFramework(5,"","aac001_gy",500,150,4,fnCheck,0,false);
	var aae140 = Base.getValue("aae140");
	if(aae140 =="110" || aae140 =="410"){
	   Base.setRequired("aae210"); 
	}
});

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","familyRegisterAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

function sfwQuery() {
	   var aac001 = Base.getValue("aac001_gy");
	   g_Suggest=null;
	   suggestQuery(5,"<%=path %>/process/synthesis/suggestFrameworkAction!getAac001DyAll.do",{"dto['jstj']":aac001},true);
}      

//回调函数查询初始化页面信息
function fn_queryInfo(){
	if (g_Suggest!=""){ 
		fn_setPersonBaseInfoData();
		Base.submit("fset1", "familyRegisterAction!queryPersonInfo.do");
	}
}

//供养回调函数	
function fnCheck(){
	if (g_Suggest!=null){ 
	    var aac002 = g_Suggest[0];
	    var aac001 = g_Suggest[2];
        Base.setValue("aac002_gy",g_Suggest[0]);
        Base.setValue("aac003_gy",g_Suggest[1]);
        Base.setValue("aac001_gy",g_Suggest[2]);
        fn_gyqueryInfo();
        Base.setValue("aae133",g_Suggest[1]);
        Base.setValue("aae136",g_Suggest[0]);
        Base.setEnable('saveBtn');
	}else{
		var aac002 =Base.getValue("aac001_gy");
		Base.setValue("aac001_gy","");
		Base.setValue("aac002_gy",aac002);
		Base.setValue("aae136",aac002);
        Base.setDisRequired("aac001");
        if(fnCheckIdCard(aac002)){
        	Base.setEnable('saveBtn');
        }
    }
}

function Changeaae136(){
	var aac003 = Base.getValue("aac003_gy");
	Base.setValue("aae133",aac003);
}

//删除某行数据
function fnDelRow(data){
	var aaz257_gy = data.aaz257_gy;
	var aac001_gy = data.aac001_gy;
	var aac002_gy = data.aac002_gy;
	Base.confirm("确认要删除?",function(btn, callback,options) {
		if (btn) {	
			Base.submit("fset1,procInc", "familyRegisterAction!toSave.do",{"dto['aac002_gy']":aac002_gy,"dto['aaz257_gy']":aaz257_gy,"dto['aac001_gy']":aac001_gy,"dto['yae587']":"3"});
		}
	});
}

//更新赋值
function fnUpdate(data,e){
 	var yad169 =data.yad169;
 	var aae145 =data.aae145;
 	Base.setValue("yad169",yad169);
 	fn_checkbankzs();
 	if(yad169 == '11'){
 	   Base.setValue("aae145",aae145); 	//待遇发放方式
 	   checkRequired();
	   Base.setValue("aaz257_gy",data.aaz257_gy); //供养亲属定期待遇享受ID
 	   Base.setValue("aac001_gy",data.aac001_gy); //亲属编号
 	   Base.setValue("aac002_gy",data.aac002_gy); //身份证号码
 	   Base.setValue("aac003_gy",data.aac003_gy); //亲属姓名
 	   Base.setValue("aae144"   ,data.aae144);    //供养关系
 	   Base.setValue("aac004_gy",data.aac004_gy); //性别
 	   Base.setValue("aac006_gy",data.aac006_gy); //出生日期
 	   Base.setValue("yac520"   ,data.yac520);    //丧失劳动
 	   Base.setValue("aac086"   ,data.aac086);    //孤寡标志
 	   Base.setValue("aic172"   ,data.aic172);    //享受比例
 	   Base.setValue("aae210"   ,data.aae210);    //待遇享受开始年月
 	   Base.setValue("aae004"   ,data.aae004);    //联系人
 	   Base.setValue("aae005"   ,data.aae005);    //联系电话
	   Base.setValue("aae013_gy"   ,data.aae013);    //备注
 	   Base.setValue("aac059",data.aac059); 	//领取人证件类型
 	   Base.setValue("aaf002",data.aaf002); 	//代发银行类别
 	   Base.setValue("aaz009",data.aaz009);    //代发机构名称
 	   Base.setValue("yaf012",data.yaf012); 	//开户银行类别
 	   Base.setValue("yaf001",data.yaf001); 	//开户银行名称
 	   Base.setValue("yaf013",data.yaf013);    //开户银行编号
 	   Base.setValue("aae009",data.aae009); 	//户名
 	   Base.setValue("aae010",data.aae010); 	//银行账号
 	   Base.setValue("aae133",data.aae133); 	//领取人姓名
 	   Base.setValue("aae136",data.aae136); 	//领取人证件号码
 	   Base.setValue("aae007",data.aae007); 	//邮政编码
 	   Base.setValue("aae006",data.aae006); 	//详细地址
 	   Base.setValue("yac583_gy",data.yac583_gy); //户口所在行政区划代码
 	   Base.submit("fset1", "familyRegisterAction!PersonInfoGy.do",{"dto['aaf002']":data.aaf002,
 		   "dto['yaf012']":data.yaf012,"dto['yaf013']":data.yaf013,"dto['yaf001']":data.yaf001},false,false);
 	}

}

//支付对象变更特殊要求调用
function fn_privateContorlYad169(){
	var aaa121 = Base.getValue("aaa121"); 
    var aac002_gy = Base.getValue("aac002_gy");
    var aac003_gy = Base.getValue("aac003_gy");
	//供养亲属登记单独赋值
	if(aaa121 == "L10039"||aaa121=="I80004"||aaa121=="G80004"){
		if (aac002_gy == null || aac002_gy == ''){
			Base._setReadOnly("aae136",false);
		}else{
			Base.setValue("aae136",aac002_gy);
		}
		if (aac003_gy == null || aac003_gy == ''){
			Base._setReadOnly("aae133",false);
		}else{
			Base.setValue("aae133",aac003_gy);
		}
	}
}

//发放方式变更特殊要求调用
function fn_privateContorlAae145(){
	var aaa121 = Base.getValue("aaa121"); 
    var aac002_gy = Base.getValue("aac002_gy");
    var aac003_gy = Base.getValue("aac003_gy");
	//供养亲属登记单独赋值
	if(aaa121 == "L10039"||aaa121=="I80004"||aaa121=="G80004"){
		if (aac002_gy == null || aac002_gy == ''){
			Base._setReadOnly("aae136",false);
		}else{
			Base.setValue("aae136",aac002_gy);
		}
		
		if (aac003_gy == null || aac003_gy == ''){
			Base._setReadOnly("aae133",false);
		}else{
			Base.setValue("aae133",aac003_gy);
		}
	}
}

//自动填写享受比例
function changeXSBL(){
	var aae144 = Base.getValue("aae144");
	var aac086 = Base.getValue("aac086");
	if(aae144 != null || aae144 != null){
		if(aae144 == 1){
			if(aac086 == 1){
				Base.setValue("aic172","0.5");
			}else{
				Base.setValue("aic172","0.4");
			}
		} else{
			if(aac086 == 1){
				Base.setValue("aic172","0.4");
			}else{
				Base.setValue("aic172","0.3");
			}
		}
	}
	checkIsAgeOK();
}

//检查享受比例是否大于1   获取列别数据相加
function checkIsBigOne(){
	var rowData = Base.getGridData("gyqsxxList");
	var aaz257_gy = Base.getValue("aaz257_gy");
	var aic172 = parseFloat(Base.getValue("aic172"));
	var sum = parseFloat(0.0);
	var sum_other = parseFloat(0.0);
	var sum_delete = parseFloat(0.0);
	for (var i = 0; i < rowData.length; i ++ ) {
		if(aaz257_gy != "" && aaz257_gy == rowData[i].aaz257_gy){
			sum_delete = rowData[i].aic172;
		}
		sum_other = sum_other + parseFloat(rowData[i].aic172);
	}
	if(sum_other + aic172 - sum_delete > 1){
		Base.alert("享受比例总和不能大于一！","error");
		return false;
	}
	return true;
}

//子女检查是否满18岁
function checkIsAgeOK(){
	var aac002_gy = Base.getValue("aac002_gy");
	var aac004_gy = Base.getValue("aac004_gy");
	var aae144 = Base.getValue("aae144");			//供养关系
	if(aae144 == null || aac002_gy == null){
		return false;
	}
	if(aae144 == "2"||aae144 == "4"){								//子女
		var aac006_gy = Base.getValue("aac006_gy");	//出生年月
		//满18岁日期
		aac006_gy = (parseInt(aac006_gy.substr(0,4))+18)+aac006_gy.substr(4);
		var now = new Date();
		var day = GetDateDiff(aac006_gy,now,"day");
		if(day > 0){
			Base.alert("该人员已超过十八岁不能登记供养亲属!","error");
			Base.setValue("aae144","");
		}
	}else if(aae144 == "1"||aae144 == "5"||aae144 == "7"){
		if(aac004_gy == "1"){
		   var aac006_gy = Base.getValue("aac006_gy");	//出生年月
		   //满18岁日期
		   aac006_gy = (parseInt(aac006_gy.substr(0,4))+60)+aac006_gy.substr(4);
		   var now = new Date();
		   var day = GetDateDiff(aac006_gy,now,"day");
		   if(day < 0){
			   Base.alert("该人员未超过六十岁不能登记供养亲属!","error");
			   Base.setValue("aae144","");
		   }
		}else if(aac004_gy == "2"){
			var aac006_gy = Base.getValue("aac006_gy");	//出生年月
			 //满18岁日期
			aac006_gy = (parseInt(aac006_gy.substr(0,4))+55)+aac006_gy.substr(4);
			var now = new Date();
			var day = GetDateDiff(aac006_gy,now,"day");
			if(day < 0){
		    Base.alert("该人员未超过五十五岁不能登记供养亲属!","error");
			Base.setValue("aae144","");
			}
		}
		
	}
}

//保存
function submitData(){
	//检查比例
	if(!checkIsBigOne()){
		return false;
	}
	
	//操作选择
	var aaz257_gy = Base.getValue("aaz257_gy");
	if(aaz257_gy != null && aaz257_gy != ""){
		if(!confirm("确认更新？")){ 
			return false; 
		}
	}
	Base.submit("form1", "familyRegisterAction!toSave.do",null,null,null,function(){
		Base.clearData("gyqsxxlr");
		Base.clearData("paymentInfo");
	});
}

//校验身份证号码,取得性别、出生日期
 function fnCheckIdCard(idCard){
    	var idCard = idCard;
    	if(idCard.length==15){
    		if(isValidityBrithBy15IdCard(idCard)){
    		   var csrq = idCard.substring(6,12);
    		   csrq = "19"+csrq.substring(0,2)+"-"+csrq.substring(2,4)+"-"+csrq.substring(4,6);
    		   var sex = idCard.charAt(idCard.length - 1);
    		   if(jioushu(sex)){
    			   Base.setValue("aac004_gy",1);
    		   }else{
    			   Base.setValue("aac004_gy",2);
    		   }
    		   Base.setValue("aac006_gy",csrq);
    		   return true;
    		   }
    	}else if(idCard.length==18){
    		if(isValidityBrithBy18IdCard(idCard)){
    		   var csrq = idCard.substring(6,14);
    		   var sex = idCard.charAt(idCard.length - 2);
    		   csrq = csrq.substring(0,4)+"-"+csrq.substring(4,6)+"-"+csrq.substring(6,8);
    		   if(jioushu(sex)){
    			   Base.setValue("aac004_gy",1);
    		   }else{
    			   Base.setValue("aac004_gy",2);
    		   }
    		   Base.setValue("aac006_gy",csrq);
    		   return true;
    		}
    	}else{
    		return Base.alert('身份证录入有误','error'), Base.setDisabled('saveBtn'), false;
    	}
    	checkIsAgeOK();
    }

//判断数字的奇偶性
function jioushu(i) {
	if(Number(i)>=0){
		return Number(i) % 2 == 1; 
	}
	else{
		return Math.abs(Number(i))%2==1;
	}
}

/*
* 开始时间为字符串：结束时间为日期格式
*/
function GetDateDiff(startTime, endTime, diffType) {
	//将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式
	startTime = startTime.replace(/\-/g, "/");
	//endTime = endTime.replace(/\-/g, "/");
	//将计算间隔类性字符转换为小写
	diffType = diffType.toLowerCase();
	var sTime = new Date(startTime); //开始时间
	//var eTime = new Date(endTime); //结束时间
	//作为除数的数字
	var divNum = 1;
	switch (diffType) {
		case "second":
		divNum = 1000;
		break;
		case "minute":
		divNum = 1000 * 60;
		break;
		case "hour":
		divNum = 1000 * 3600;
		break;
		case "day":
		divNum = 1000 * 3600 * 24;
		break;
		default:
		break;
	}
	return parseInt((endTime.getTime() - sTime.getTime()) / parseInt(divNum));
} 


//回调函数查询供养亲属页面信息
function fn_gyqueryInfo(){
	if (g_Suggest!=""){ 
		Base.submit("gyqsxxlr", "familyRegisterAction!queryPersonInfoGy.do",null,false,false);
	}
}

/**     * 验证15位数身份证号码中的生日是否是有效生日     * @param idCard15 15位书身份证字符串     * @return     */    
function isValidityBrithBy15IdCard(idCard15){         
	var year =  idCard15.substring(6,8);         
	var month = idCard15.substring(8,10);         
	var day = idCard15.substring(10,12);         
	var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));         
	// 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法         
	if(temp_date.getYear()!=parseFloat(year)||temp_date.getMonth()!=parseFloat(month)-1||temp_date.getDate()!=parseFloat(day))
	{                   
		return Base.alert('15位身份证录入有误','error'), Base.setDisabled('saveBtn'), false;           
		}else{               
			return true;           
			}     
	}

/**    * 验证18位数身份证号码中的生日是否是有效生日    * @param idCard 18位书身份证字符串    * @return    */  
function isValidityBrithBy18IdCard(idCard18){       
	var year =  idCard18.substring(6,10);       
	var month = idCard18.substring(10,12);       
	var day = idCard18.substring(12,14);       
	var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));       
	// 这里用getFullYear()获取年份，避免千年虫问题       
	if(temp_date.getFullYear()!=parseFloat(year)||temp_date.getMonth()!=parseFloat(month)-1||temp_date.getDate()!=parseFloat(day))
	{               
		return Base.alert('18位身份证录入有误','error'), Base.setDisabled('saveBtn'), false;       
	}else{           
		return true;       
		}   
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>
