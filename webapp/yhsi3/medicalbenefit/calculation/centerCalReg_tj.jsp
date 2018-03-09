<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>零星报销登记(厅级)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="saveBtn" key="保存" icon="xui-icon-spotSave"  onClick="toSave()"  />
		<ta:toolbarItem id="printBtn" key="打印审核表" icon="xui-icon-spotPrint" onClick="toPrint()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<ta:text id="aaz217" key="人员医疗就诊事件ID"  display="false" labelWidth="120" />
			<ta:text id="aaz216" key="医疗待遇结算事件ID" display="false" labelWidth="120" />
			<ta:text id="aaz002" key="业务日志ID" display="false" labelWidth="120" />
			<ta:text id="aaa027" key="经办分中心" display="false" labelWidth="120" />
			<ta:text id="aae011" key="经办人" display="false" labelWidth="120" />
		</ta:box>
		<ta:panel id="panel1" key="基本信息" cols="3">
			<ta:text id="aac001"  key="个人ID"  required="true" labelWidth="120"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" />
			<ta:selectInput id="yac084" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" readOnly="true" collection="YKC005" labelWidth="120" />
			<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
			<ta:selectInput id="aac008" key="参保状态" readOnly="true" collection="AAC008" labelWidth="120" />
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" />
			<ta:text id="aae240" key="账户余额" readOnly="true"  labelWidth="120" />
		</ta:panel>
		<ta:panel id="panel2" key="就诊信息" cols="3"> 
			<ta:text id="akb020"  key="医疗机构编号"  required="true" labelWidth="120" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" required="true" span="2" labelWidth="120" />
			<ta:selectInput id="akb097" collection="AKB096" key="医疗机构等级" readOnly="true" labelWidth="120"/>
			<ta:date id="aae030" key="开始日期" showSelectPanel="true" required="true"  onChange="fnDate(this)" labelWidth="120"/>
			<ta:date id="aae031" key="结束日期" showSelectPanel="true" required="true" onChange="fnDate(this)" labelWidth="120"/>
			<ta:number id="akc264"  key="总费用"    min="0"  precision="2"  labelWidth="120" required="true"/>
			<ta:number id="akc228"  key="自费费用"  min="0"  precision="2"  labelWidth="120" required="true"/>
			<ta:number id="ake029"  key="大额保险费用"  min="0"  precision="2"  labelWidth="120" required="true"/>
		</ta:panel>
		</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 500, 300, 5, fn_getPerson, 0, false);
	});
	// 个人ID change事件
	$("#aac001").change(function(){
		sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'));
	});
	// 医疗人员回调方法
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",
					{"dto['aac001']":Base.getValue("aac001")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg, 'warn');
							Base.setValue("aac001",'');
							return true;
						}
						if(data &&  data.personInfoDto) {
							if(data.personInfoDto.yab139 != Base.getValue('aaa027')){
								Base.setValue("aac001",'');
								Base.alert('非本经办机构的参保人员,不能办理登记!', 'warn');
								return false;
							}
							
							Base.setValue("aac002",data.personInfoDto.aac002);
							Base.setValue("aac003",data.personInfoDto.aac003);
							Base.setValue("aac004",data.personInfoDto.aac004);
							Base.setValue("aac006",data.personInfoDto.aac006);
							Base.setValue("aab003",data.personInfoDto.aab003);
							Base.setValue("aac066",data.personInfoDto.aac066);
							Base.setValue("yac084",data.personInfoDto.yac084);
							Base.setValue("ykc005",data.personInfoDto.ykc005);
							Base.setValue("ykc006",data.personInfoDto.ykc006);
							Base.setValue("yke112",data.personInfoDto.yke112);
							Base.setValue("aae140",data.personInfoDto.aae140);
							Base.setValue("aac008",data.personInfoDto.aac008);
							Base.setValue("aae003",data.personInfoDto.aae003);
							Base.setValue("aae240",data.personInfoDto.aae240);
							getBaseInfo ();
						}
					});
	}
	
	function getBaseInfo (){
		Base.submit("aac001,aae140","centerCalRegTJAction!getBaseInfo.do");
	}
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	   Base.setValue("akb097",rowdata.akb097); // 医疗机构名称
	}
	 
	// 医疗机构回调方法 
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg, 'warn');
							Base.setValue("akb020","");
							return false;
						}
						if(data &&  data.hospitalInfoDto) {
							Base.setValue("akb097",data.hospitalInfoDto.akb097); // 医疗机构等级
							Base.setValue("akb021",data.hospitalInfoDto.akb021); // 医疗机构名称
						}
					});
	}
	
	//开始日期和结束日期的验证
	function fnDate(o)
	{
		var id = o.id;
		var value = o.value;
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		if("" == aae030 || null == aae030||
		   "" == aae031 || null == aae031)
			return ;
		if(aae030 > aae031)
		{
			if("aae030" == id)   // 如果开始日期比结束日期大,且当前事件ID为开始日期,则清空结束日期,否则弹出提示框
			   Base.setValue("aae031","");
			else{
			   Base.alert("结束日期不能小于开始日期!","warn",function(){Base.focus(id);});
			   return false;
			}
		}
	}
		
	// 保存
	function toSave() 
	{
			var aac001 = Base.getValue("aac001");
			var aae030 = Base.getValue("aae030");
			var aae031 = Base.getValue("aae031");
			var akb020 = Base.getValue("akb020");
			var akb021 = Base.getValue("akb021");
			var ake013 = Base.getValue("ake013");
			if("" == aac001 || null == aac001)
				return Base.alert("请输入人员ID!","warn",function(){Base.focus("aac001");});
			if("" == aae030 || null == aae030)
				return Base.alert("请输入开始日期!","warn",function(){Base.focus("aae030");});
			if("" == aae031 || null == aae031)
				return Base.alert("请输入结束日期!","warn",function(){Base.focus("aae031");});
			//开始日期不能大于结束日期 		
			if(aae030 > aae031){
				Base.setValue("aae031","");
				Base.alert("结束日期不能小于开始日期!","warn",function(){Base.focus("aae031");});
				return false;
			}
			if("" == akb020 || null == akb020)
				return Base.alert("请输入医疗机构编号!","warn",function(){Base.focus("akb020");});
			if("" == akb021 || null == akb021)
				return Base.alert("请输入医疗机构名称!","warn",function(){Base.focus("akb021");});
			//保存
			Base.submit("form1","centerCalRegTJAction!toSave.do");
	}
	
	//打印审核表
	function toPrint()
	{
		var aaz217 = Base.getValue("aaz217");
		var aae011 = Base.getValue("aae011");
		var aac001 = Base.getValue("aac001");
		var	reportName = "centerBxMxsh_sy.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011+";aac001="+aac001);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>