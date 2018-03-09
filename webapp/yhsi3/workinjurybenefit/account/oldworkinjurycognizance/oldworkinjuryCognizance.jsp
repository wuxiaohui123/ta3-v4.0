<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>OldworkinjuryCognizance</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" 
				onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认[P]" hotKey="P" 	asToolBarItem="true" display="false" />
			<ta:button id="verityBtn" icon="icon-save" key="审核记录" 	asToolBarItem="true" 
				onClick="verityHistorySuggestView();" display="false" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>
			<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3" >
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<ta:selectInput id="aac004" key="性别"  collection="aac004" labelWidth="130" required="true"/>
				<ta:date id="aac006" key="出生日期" required="true" labelWidth="130" showSelectPanel="true" />
				<ta:date id="aac007" key="参加工作时间" required="true" labelWidth="130" showSelectPanel="true" />
				
			</ta:panel>
			<!-- 录入工伤认定登记信息 -->
			<ta:panel id="gsrdxx" key="工伤认定信息" cols="3">
				<ta:text id="aaz128" key="工伤申报id" display="false" />
				<ta:text id="aaz127" key="工伤认定id" display="false" />
				<ta:text id="aab001" key="单位检索条件" required="true"
					onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'));" labelWidth="130" />
				<ta:text id="aae044" key="工伤单位名称" readOnly="true" labelWidth="130" />
				<ta:selectInput id="ylc035" key="工伤人员类别" required="true"
					collection="YLC035" onSelect="validateYLC035" value="2" filter="3" 	labelWidth="130" readOnly="true" />
				<ta:selectInput id="alc021" key="伤害程度" required="true"
					collection="ALC021" onSelect="validateALC021" labelWidth="130" filter="4" />
				<ta:selectInput id="alc022" key="伤害部位" collection="ALC022" labelWidth="130" />
				<ta:selectInput id="ala023" key="与受伤害人关系" collection="ALA023" 	labelWidth="130" />
				<ta:date id="alc020" key="工伤发生时间" showSelectPanel="true"
					required="true" validNowTime="left" onChange="timealert();" labelWidth="130" />
				<ta:date id="alc040" key="死亡/失踪日期" showSelectPanel="true"
					required="true" validNowTime="left" onChange="timealert();" labelWidth="130" />
				<ta:text id="alc011" key="认定书编号" required="true" labelWidth="130" />
				<ta:date id="alc026" key="申报日期" showSelectPanel="true"
					required="true" validNowTime="left" labelWidth="130" onChange="slrq_gstimepd()" />
				<ta:date id="alc017" key="受理日期" validNowTime="left"
					showSelectPanel="true" labelWidth="130"  onChange="yhjb_gstimepd()" />
				<ta:selectInput id="alc029" key="工伤认定结论" collection="ALC029"
					required="true" filter="3" labelWidth="130" />
				<ta:text id="alc030" key="工伤认定机构" required="true" labelWidth="130" />
				<ta:date id="alc031" key="工伤认定日期" validNowTime="left"
					showSelectPanel="true" labelWidth="130" required="true" onChange="yhjb_gstimepd()" />
				<ta:selectInput id="alc027" key="工亡类别" collection="ALC027" labelWidth="130" display="false" />
				<ta:text id="aca111" key="职业/工种" labelWidth="130" />
				<ta:selectInput id="ala017" key="职业病" collection="ALA017" labelWidth="130" />
				<ta:text id="alc007" key="诊断机构" labelWidth="130" />
				<ta:date id="ylc045" key="停工留薪期开始" validNowTime="left" labelWidth="130" showSelectPanel="true" />
				<ta:date id="ylc046" key="停工留薪期结束" validNowTime="right" labelWidth="130" showSelectPanel="true" />
				<ta:text id="aac042" key="申报人姓名" labelWidth="130" />
				<ta:selectInput id="aac043" key="申报人证件类型" collection="AAC043" labelWidth="130" />
				<ta:text id="aac044" key="申报人证件号码" maxLength="18" labelWidth="130" />
				<ta:text id="aac045" key="申报人电话" validType="mobile" labelWidth="130" />
				<ta:text id="aac046" key="申报人地址" labelWidth="130" />
				<ta:selectInput id="ala016" span="2" key="认定依据" value="107" required="true" collection="ALA016"
					onSelect="changeAla017"  labelWidth="130" />
				<ta:textarea id="alc006" span="3" key="伤害事件情况" maxLength="200" height="40px" labelWidth="130" />
				<ta:textarea id="alc014" span="3" key="诊断意见" maxLength="200" 	height="40px" labelWidth="130" />
			</ta:panel>
			<ta:panel key="劳动能力鉴定登记" id="ldnljdxx" cols="3" cssStyle="display:none">
				<ta:selectInput id="ala019" key="鉴定类别" labelWidth="130" collection="ALA019" required="true"  />
				<ta:date id="alc034" key="鉴定结论日期" labelWidth="130" validNowTime="left" showSelectPanel="true" required="true"  />
				<ta:text id="alc035" key="鉴定书编号" labelWidth="130" required="true" />
				<ta:selectInput id="ala040" key="伤残等级" labelWidth="130" collection="ALA040" required="true" filter="11" />
				<ta:selectInput id="alc060" key="护理依赖等级" labelWidth="130" collection="ALC060" required="true" />
				<ta:date id="ylc044" key="医疗终结期" labelWidth="130" showSelectPanel="true" display="false" />
				<ta:selectInput id="ylc025" key="鉴定发起方" labelWidth="130" required="true" value="2" collection="YLC025" />
				<ta:text id="alc049" key="申请人电话" labelWidth="130" validType="mobile" />
				<ta:date id="aae127" key="申请日期" labelWidth="130" validNowTime="left" showSelectPanel="true" />
				<ta:text id="alc152" key="申请人姓名" labelWidth="130" />
			</ta:panel>
			<ta:panel id="bglx" key="变更类型" cols="3"  columnWidth="0.2" cssStyle="display:none">
				<ta:selectInput key="生存状态变更类型" id="aae171" collection="AAE171"  labelWidth="120" value="2" readOnly="true" />
				<ta:text id="aac053" key="死亡证明" labelWidth="120"/>
				<ta:selectInput id="yac551" key="丧葬方式" collection="YAC551" labelWidth="120" />
				<ta:text id="aac051" key="火化证号" labelWidth="120"/>
				<ta:text id="aac052" key="状态变更原因" labelWidth="120" maxLength="200" required="true" />
				<ta:date id="aae138" key="变更日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAae138();"/> 
		    </ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
// 页面初始化
$(document).ready(function() {
	$("form").css("overflow", "auto");
	initializeSuggestFramework(4,"","aac001",1200,150,9,fnCheck,0,false);
});

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","oldworkinjuryCognizanceAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

function sfwQuery() {
	   suggestQuery(4,"<%=path %>/process/synthesis/suggestFrameworkAction!getAac001.do",{"dto['jstj']":Base.getValue("aac001")},true);
	}

//回调函数	
function fnCheck(){
	if (g_Suggest!=null){ 
	   var aac002 = g_Suggest[0];
	   var aac001 = g_Suggest[2];
       Base.setValue("aac002",g_Suggest[0]);
       Base.setValue("aac003",g_Suggest[1]);
       Base.setValue("aac001",g_Suggest[2]);
       Base.submit("aac001", "oldworkinjuryCognizanceAction!queryPersonInfo.do",null,null,false,null);
	}else{
      Base.setDisRequired("aac001");
      var aac002 =Base.getValue("aac001");
	  Base.setValue("aac001","");
	  Base.setValue("aac002",aac002);
	  if(fnCheckIdCard(aac002)){
      	Base.setEnable('saveBtn');
        Base.setEnable("aac003");
      }
    }
}

function fnCheckIdCard(idCard){
	var idCard = idCard;
	if(idCard.length==15){
		if(isValidityBrithBy15IdCard(idCard)){
		   var csrq = idCard.substring(6,12);
		   csrq = "19"+csrq.substring(0,2)+"-"+csrq.substring(2,4)+"-"+csrq.substring(4,6);
		   var sex = idCard.charAt(idCard.length - 1);
		   if(jioushu(sex)){
			   Base.setValue("aac004",1);
		   }else{
			   Base.setValue("aac004",2);
		   }
		   Base.setValue("aac006",csrq);
			   return true;
		   }
	}else if(idCard.length==18){
		if(isValidityBrithBy18IdCard(idCard)){
		   var csrq = idCard.substring(6,14);
		   var sex = idCard.charAt(idCard.length - 2);
		   csrq = csrq.substring(0,4)+"-"+csrq.substring(4,6)+"-"+csrq.substring(6,8);
		   if(jioushu(sex)){
			   Base.setValue("aac004",1);
		   }else{
			   Base.setValue("aac004",2);
		   }
		   Base.setValue("aac006",csrq);
			   return true;
		   }
	}else{
		return Base.alert('身份证录入有误','error'), Base.setDisabled('saveBtn'), false;
	}
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

//单位信息查询回调函数
function fn_ab01Info() {
	if (g_Suggest != "") {
		fn_setUnitBaseInfoData();
		timealert();
	}
}

//患职业病改变必录项
function changeAla017() {
	if (ala016 != "104") {
		Base._setIsRequired("ala017", false);//职业病
		Base._setIsRequired("aca111", false);//职业工种
		return false;
	} else{
		Base._setIsRequired("ala017", true);//职业病
		Base._setIsRequired("aca111", true);//职业工种
		return true;
	}
}

function changeAla016() {
	var ylc035 = Base.getValue("ylc035");//认定依据类别
	var ala016 = Base.getValue("ylc035");//认定依据类别
	if (ylc035 != "1" & ylc035 != "2") {
	    Base.setValue("ala016","104");
	} 	
}

function validateYLC035() {
    changeAla016();
}

//时间点是否参加工伤保险
function timealert() {
	var alc020 = Base.getValue("alc020");
	var alc040 = Base.getValue("alc040");
	var aab001 = Base.getValue("aab001");
	if (aab001 == null || aab001 == "") {
		return false;
	}
	if ((alc020 != null && alc020 != "") && (alc040 != null && alc040 != "")) {
		if (alc020 > alc040) {
			alert("工伤发生时间晚于失踪或死亡时间，请核实！")
			Base.setValue("alc040", "");
			Base.focus(alc040);
		}
	}
}

//伤害程度为受伤时工伤死亡、失踪时间，工亡类别不可录入(不能认定两次死亡)
function validateALC021() {
	var alc021 = Base.getValue("alc021");
	if ("2" == alc021 || "3" == alc021) {
		//展示劳动能力鉴定
		Base.hideObj("bglx");
		Base.showObj("ldnljdxx");
		Base.setValue("alc040", "");
		Base._setIsRequired("alc040", false);
		Base.setReadOnly("alc040");
		//Base._setIsRequired("alc022",false);
		Base._setReadOnly("alc022", false);
	} else {
		Base.hideObj("ldnljdxx");
		Base.showObj("bglx");
		//更改工伤亡时间可读
		Base._setIsRequired("alc040", true);
		Base._setReadOnly("alc040", false);
		//失踪没有伤害部位
		if ("4" == alc021) {
			Base.setValue("alc022", "");
			Base._setIsRequired("alc022", false);
			Base.setReadOnly("alc022");
		} else {
			Base._setReadOnly("alc022", false);
		}
		//判断操作不是更新
		var aaz127 = Base.getValue("aaz127");
		if (aaz127 != null && aaz127 != "") {
			return false;
		}
		//不能认定两次死亡或失踪，更新不判断
		var rowData = Base.getGridData("lc31Grid");
		for ( var i = 0; i < rowData.length; i++) {
			if (rowData[i].alc021 == "1" || rowData[i].alc021 == "4") {
				Base.alert("该人员已进行过失踪或死亡认定!");
				Base.setValue("alc021", "");
				return false;
			}
		}
	}
	//判断生存状态与工伤程度匹配
	var aac060 = Base.getValue("aac060");
	if (aac060 == null || aac060 == "") {
		return false;
	}
	if ("1" == aac060 || "3" == aac060) {
		if ("1" == alc021 || "4" == alc021) {
			Base.alert("该人员生存状态正常，不能认定死亡或失踪！");
			Base.setValue("alc021", "");
		}
	}
	if ("2" == aac060) {
		if ("1" != alc021) {
			Base.alert("该人员生存状态死亡，不能认定非死亡！");
			Base.setValue("alc021", "");
		}
	}
	if ("9" == aac060) {
		if ("4" != alc021) {
			Base.alert("该人员生存状态不明，不能认定非失踪！");
			Base.setValue("alc021", "");
		}
	}
}

function slrq_gstimepd() {
	var alc026 = Base.getValue("alc026");//受理日期
	var alc020 = Base.getValue("alc020"); //工伤发生日期
	if ((alc026 != null && alc026 != '') && (alc020 != null && alc020 != "")) {
		if (alc026 < alc020) {
			alert("工伤发生时间晚于申报时间，请核实！")
			Base.setValue("alc026", "");
			Base.focus(alc026);
		}
	}
}
function yhjb_gstimepd() {
	var alc031 = Base.getValue("alc031");
	var alc017 = Base.getValue("alc017");
	var alc020 = Base.getValue("alc020");
	if ((alc031 != null && alc031 != '') && (alc020 != null && alc020 != "")) {
		if (alc031 < alc020) {
			alert("工伤发生时间晚于工伤认定时间，请核实！")
			Base.setValue("alc031", "");
			Base.focus(alc031);
		}
	}
	if ((alc017 != null && alc017 != '') && (alc020 != null && alc020 != "")) {
		if (alc017 < alc020) {
			alert("工伤发生时间晚于受理时间，请核实！")
			Base.setValue("alc017", "");
			Base.focus(alc017);
		}
	}
	if ((alc031 != null && alc031 != '') && (alc017 != null && alc017 != "")) {
		if (alc031 < alc017) {
			alert("受理时间晚于工伤认定时间，请核实！")
			Base.setValue("alc031", "");
			Base.focus(alc031);
		}
	}
}

function yhjb_gsjdtimepd(){
	//判断时间
	var alc034 = Base.getValue("alc034");//取得劳动能力鉴定时间
	var alc017 = Base.getValue("alc017");
	var alc020 =  Base.getValue("alc020");//取得工伤事故时间
	if ((alc020 != null && alc020 != '')&&(alc034 != null && alc034 != '')){
	    if(alc020 >= alc034){
		  Base.alert("劳动能力鉴定时间早于事故发生时间,请核实！","warn");
		  Base.focus("alc034");
		  Base.setValue("alc034","");
		  return false;
	    }
	}
	if ((alc017 != null && alc017 != '')&&(alc034 != null && alc034 != '')){
	    if(alc017 > alc034){
		  Base.alert("劳动能力鉴定时间早于受理时间，请核实！","warn");
		  Base.focus("alc034");
		  Base.setValue("alc034","");
		  return false;
	    }
	}
	if ((alc017 != null && alc017 != '')&&(alc020 != null && alc020 != '')){
	    if(alc020 > alc017){
		  Base.alert("工伤发生时间晚于受理时间，请核实！","warn");
		  Base.focus("alc017");
		  Base.setValue("alc017","");
		  return false;
	    }
	}
}

//保存经办信息
function submitData() {
	if (!Base.validateForm("gsrdxx")) {
		Base.hideMask();
		return false;
	}
	//操作选择
	var aaz127 = Base.getValue("aaz127");
	if (aaz127 != null && aaz127 != "") {
		if (!confirm("确认更新？")) {
			return false;
		}
	}
	Base.submit("form1", "oldworkinjuryCognizanceAction!toSave.do");
}
</script>
<%@ include file="/ta/incfooter.jsp"%>