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
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotReset" type="resetPage"  hotKey="C" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<%@ include file="../common/lxbxFee.jsp"%>
		<ta:panel id="pnlYhxx" key="银行信息" cols="3"  fit="true">
			<ta:text id="aka030" key="结算类别"  display="false"/>
			<ta:text id="aaz216tb" key="结算类别"  display="false"/>
			<ta:selectInput id="aaf002" key="金融行业机构" collection="AAF002" labelWidth="150" readOnly="true" required="true" onSelect="fnSelect"/> 
			<ta:text id="yae597" key="开户银行" labelWidth="150" readOnly="true" required="true" />
			<ta:text id="aae009" key="银行户名" labelWidth="150" readOnly="true" required="true" />
			<ta:text id="aae010" key="银行账号" labelWidth="150" readOnly="true" required="true" />
			<ta:selectInput id="yaf011" key="银行异地标志" collection="YAF011" labelWidth="150" readOnly="true" required="true"/> 
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
});
//打印
function fnPrint(){
	var aaz217 = Base.getValue('aaz217'); // 医疗待遇申请事件ID
	var aaz216 = Base.getValue('aaz216'); // 医疗待遇结算事件ID
	var aae011 = Base.getValue('aae011'); // 经办人
	var aka130 = Base.getValue('aka130'); // 医疗支付类别
	var aac001 = Base.getValue('aac001'); // 人员ID
	var aka030 = Base.getValue('aka030'); // 结算类别:用于厅级退休补报销
	//var reportName = "centercal.raq";
	var reportName = "centercal_zy.raq"; // 普通住院
	// 门诊结算表,包括普通门诊和离休门诊
	if("1" == aka130.substr(0,1))
		reportName = "centerCal_mz.raq";
	// 门诊慢性病
	if(aka130 == "13" || aka130 == "13a" ||aka130 == "13b")
		reportName = "centercalMxb.raq";
	// 离休住院
	var ykc005 = Base.getValue("ykc005"); // 人员类型
	if(aka130.substr(0,1) == "2" && ("3401" == ykc005 || "3402" == ykc005))
		reportName = "centerCal_lxzy.raq";
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
	if(!validateData()) return;
	Base.submit('form1', 'stopPersonCalAction!toSave.do?dto.jslb='+jslb);
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
	var aaf002 = Base.getValue("aaf002"); // 金融行业机构编码
	var yae597 = Base.getValue("yae597"); // 开户银行
	var aae009 = Base.getValue("aae009"); // 银行户名
	var aae010 = Base.getValue("aae010"); // 银行账号
	var yaf011 = Base.getValue("yaf011"); // 银行同城异地标志
	if("" == aaf002 ||null == aaf002)
	{
		 Base.alert("请输入金融行业机构!","warn",function(){
			Base.focus("aaf002");
			});
		 return false;
	}
	if("" == yae597 ||null == yae597)
	{
		 Base.alert("请输入开户银行!","warn",function(){
			Base.focus("yae597");
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
</script>
<%@ include file="/ta/incfooter.jsp"%>
