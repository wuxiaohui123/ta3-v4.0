<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报销结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="saveBtn" key="结算[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave('1')" />
		<ta:toolbarItem id="printBtn" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint()"/>
		<ta:toolbarItem id="historyBtn" key="查询历史结算信息" icon="xui-icon-query"  onClick="toQuery()"/>
		<ta:toolbarItem id="jiaofeiBtn" key="查询缴费信息" icon="xui-icon-query"   onClick="toQueryJiaoFei()"/>
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotReset"   hotKey="C" onClick="reset()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true" >
		<ta:text id="aka030" key="结算类别(厅级退休补报销)"  display="false"/>
		<ta:box id="pnlYhxx" key="银行信息" cols="4" >
			<ta:text id="aae009" key="银行户名" labelWidth="150" required="true" />
			<ta:text id="aae010" key="银行账号" labelWidth="150" required="true"  span="2"/>			
			<ta:selectInput id="yaf011" key="银行异地标志" collection="YAF011" labelWidth="150" required="true"/> 
			<ta:selectInput id="aaf002" key="银行类型" collection="AAF002" labelWidth="150" required="true"/> 
		    <ta:text id="yae597" key="银行名称"  labelWidth="150"  span="2"  />
			<ta:text id="aaz065" key="银行ID"    labelWidth="150"  readOnly="true"/>
		</ta:box>
		<%@ include file="../common/lxbxFee.jsp"%>
		<ta:box id="bxJsbl"  height="120"  cols="2" span="2">
			  <ta:box id="bxXxzf"    height="120" columnWidth="0.5">
				  <ta:datagrid id="dgXxzf"  forceFitColumns="true"  fit="true">
				    <ta:datagridItem id="zfmc"    key="支付名称"      align="center"  maxChart="5"/>
				    <ta:datagridItem id="aae019"  key="阶段金额"      align="center"  maxChart="5"   totals="sum"  tatalsTextShow="false"/>
				    <ta:datagridItem id="aka069"  key="自付比例"      align="center"  maxChart="5"/>
				    <ta:datagridItem id="yka318"  key="个人比例支付"   align="center"  maxChart="5"   totals="sum"  tatalsTextShow="false"/>
				    <ta:datagridItem id="yka319"  key="进入统筹支付范围"   align="center"  maxChart="8"  totals="sum"  tatalsTextShow="false"/>
				  </ta:datagrid>
			  </ta:box>
			 <ta:box id="bxJjzf"   height="120"  columnWidth="0.5">
				<ta:datagrid id="dgJjzf" forceFitColumns="true"  fit="true" >
				    <ta:datagridItem id="aae013"  key="累计支付阶段"     align="center"  maxChart="5"  showDetailed="true"/>
				    <ta:datagridItem id="yka112"  key="阶段结算金额"     align="center"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				    <ta:datagridItem id="grbl"    key="个人支付比例"     align="center"  maxChart="5"/>
				    <ta:datagridItem id="grje"    key="个人支付金额"     align="center"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				    <ta:datagridItem id="aka047"  key="统筹支付比例"     align="center"  maxChart="5"/>
				    <ta:datagridItem id="ake039"  key="统筹支付金额"     align="center"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				</ta:datagrid>
			 </ta:box>	
		</ta:box>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	initializeSuggestFramework(2,"","yae597",700,300,4,aaz065_callback,0,false);
});

//  银行ID  change事件
$("#yae597").change(function(){
	Base.setValue("aaz065");
	sfwQueryUtil(2,'getAf07ForYl',Base.getValue('aaz065'));
});

// 银行回调 方法
function aaz065_callback()
{
	Base.setValue("aaz065",g_Suggest[3]);
	Base.setValue("yae597",g_Suggest[0]);
}

//打印
function fnPrint(){
	var aaz217 = Base.getValue('aaz217'); // 医疗待遇申请事件ID
	var aaz216 = Base.getValue('aaz216'); // 医疗待遇结算事件ID
	var aae011 = Base.getValue('aae011'); // 经办人
	var aka130 = Base.getValue('aka130'); // 医疗支付类别
	var aae140 = Base.getValue('aae140'); // 险种类型
	var aac001 = Base.getValue('aac001'); // 人员ID
	var aka030 = Base.getValue('aka030'); // 结算类别:用于厅级退休补报销
    var ake013 = Base.getValue('ake013'); // 报销原因:用于慢性病休补报销
	//var reportName = "centercal.raq";
	var reportName = "centercal_zy.raq"; // 普通住院
	if("14" == ake013) //停保人员补报销
		reportName = "centercal_zy_tb.raq";
	// 门诊结算表,包括普通门诊和离休门诊
	if("1" == aka130.substr(0,1))
		reportName = "centerCal_mz.raq";
	// 门诊慢性病
	if (aka130 == "13" || "13a" == aka130 || "13b" == aka130){
		reportName = "centercalMxb_1.raq";
		if("11" == ake013) //慢性病中心补保报销
			reportName = "centercalMxb.raq";
	}
	// 离休
	if ("340" == aae140)
	{
		if ("1" == aka130.substr(0, 1))
			reportName = "centerCal_lxmz.raq";
		// 住院
		if(aka130.substr(0, 1) == "2")
		   reportName = "centerCal_lxzy.raq";
		// 离休 门诊补报销 
		if("15" == ake013) 
			  reportName = "centerCal_mz_lx.raq";
	}
	// 用于厅级退休补报销
	if(aka030 == "8")
		reportName = "centerCal_mz.raq";
	// 生育
	if("16" == aka130)
		reportName = "centerCal_sy.raq";
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aaz216="+aaz216+";aae011="+aae011+";aac001="+aac001);
}
//结算保存:0表示预结算.1表示正式结算
function toSave(jslb)
{  
	if(validateData())
	{
		Base.submit('form1', 'centerCalculationAction!toSave.do?dto.jslb='+jslb);
	} 
}
// 查询历史结算信息
function toQuery()
{
	var parameter = {};
	parameter["dto['aac001']"] = Base.getValue("aac001");
	var  width = window.screen.width;
	var  height = window.screen.height;
	width = width*0.9;
	height = height*0.8;
	Base.openWindow("win_hitory", "历史结算信息", "<%=path%>/medicalbenefit/calculation/centerCalculationAction!toQueryHistory.do", parameter, width, height, null, null, true, "", ""); 
}
// 查询缴费信息
function toQueryJiaoFei()
{
	var parameter = {};
	parameter["dto['aac001']"] = Base.getValue("aac001");
	var  width = window.screen.width;
	var  height = window.screen.height;
	width = width*0.9;
	height = height*0.8;
	Base.openWindow("win_jf", "人员缴费信息", "<%=path%>/medicalbenefit/calculation/centerCalculationAction!toQueryJiaoFei.do", parameter, width, height, null, null, true, "", ""); 
}

//数据验证
 function validateData()
 {
	var aaf002 = Base.getValue("aaf002"); // 银行类型
	var aae009 = Base.getValue("aae009"); // 银行户名
	var aae010 = Base.getValue("aae010"); // 银行账号
	var yaf011 = Base.getValue("yaf011"); // 银行同城异地标志
	if("" == aaf002 ||null == aaf002)
	{
		 Base.alert("请输入银行类型!","warn",function(){
			Base.focus("aaf002");
			});
		 return false;
	}
	if("" == aae009 ||null == aae009)
	{
		 Base.alert("请输入银行户名!","warn",function(){
			Base.focus("aae009");
			});
		 return false;
	}
	if("" == aae010 ||null == aae010)
	{
		 Base.alert("请输入银行账号!","warn",function(){
			Base.focus("aae010");
			});
		 return false;
	}
	if("" == yaf011 ||null == yaf011)
	{
		 Base.alert("请输入银行异地标志!","warn",function(){
			Base.focus("yaf011");
			});
		 return false;
	}
		 return true;
 }
 
 //查询人员信息
function fn_getPerson(){
	Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",
				{"dto['aac001']":Base.getValue("aac001")},
				function(data){
					if (data.errMsg != null && data.errMsg != ''){
						Base.alert(data.errMsg);
						Base.setValue("aac001",'');
						return true;
					}
					if(data &&  data.personInfoDto) {
						Base.setValue("yac084",data.personInfoDto.yac084);
						Base.setValue("ykc005",data.personInfoDto.ykc005);
						Base.setValue("aac008",data.personInfoDto.aac008);
						Base.setValue("aac066",data.personInfoDto.aac066);
					}
				});
}
 
 // 金额机构选择时触发事件
 function fnSelect(key,value)
 {
	 Base.setValue("yae597", Base.getValue("aaf002_desc"));
 }

function reset()
{  
	Base.submitForm("form1", null, false, "centerCalculationAction!toReset.do");
}
</script>
<%@ include file="/ta/incfooter.jsp"%>
