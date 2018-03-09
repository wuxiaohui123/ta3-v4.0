<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心支付单据补打</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:buttonLayout id="ButtonLayout1">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()"  asToolBarItem="true"/>
		<ta:button id="printBtn1" key="打印汇总单" icon="xui-icon-print"        onClick="toPrintHZ('1')"  asToolBarItem="true"/>
		<ta:button id="printBtn" key="打印汇总单(财务)" icon="xui-icon-print"    onClick="toPrintHZ('0')"  asToolBarItem="true"/>
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		<ta:text id="printBz"  key="当前打印状态" display="false"/>
		<ta:panel id="panel1" key="查询条件,注:请至少输入一个查询条件!" cols="3" >
			<ta:selectInput id="aaa027" key="经办机构" display="false" />
			<ta:box id="bxDate" span="1" cols="2">
				<ta:date id="aae030" key="结算日期" labelWidth="100" showSelectPanel="true"  columnWidth="0.6"/>
				<ta:date id="aae031" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>
			<ta:text id="aac001" key="个人ID" labelWidth="100"/>
			<ta:text id="aac003" key="姓名"   labelWidth="100"/>
			<ta:box id="bxDateFh" span="1" cols="2">
				<ta:date id="yae051_s" key="审核日期" labelWidth="100" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="yae051_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>
			<ta:text id="aab001" key="单位编号" labelWidth="100" />
		    <ta:text id="aab003" key="单位名称" readOnly="true" labelWidth="100" />
			<ta:selectInput id="aae140" key="险种类型" collection="YL140" labelWidth="100" maxVisibleRows="8" />
			<ta:selectInput id="aaf002" key="银行类型" collection="AAF002" labelWidth="100" />
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" labelWidth="100" filter="51,52,61,62,71,72" maxVisibleRows="8"/>
			<ta:text  id="akb020"  key="医疗机构编号"  labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do?dto.sort=desc" popWinHeight="500" popWinWidth="950" />
			<ta:text id="akb021" key="医疗机构名称"   labelWidth="100"  readOnly="true" />
			<ta:selectInput id="aka078" key="支付类型" collection="AKA078" labelWidth="100"  maxVisibleRows="8" filter="4"/>
			<ta:selectInput id="shStuts" key="审核状态" data="[{'id':'1','name':'已审'},{'id':'0','name':'未审'}]"  labelWidth="100"/>
			<ta:selectInput id="printStuts" key="打印状态" data="[{'id':'1','name':'已汇总打印'},{'id':'0','name':'未汇总打印'}]"  labelWidth="100"/>
			<ta:selectInput id="aae011" key="结算人" collection="AAE011" maxVisibleRows="10"/>
		</ta:panel>
		<ta:panel id="panel1" key="结算信息(蓝色表示已打印汇总单)" fit="true">
			<ta:datagrid id="kc24List" fit="true" forceFitColumns="true" haveSn="true" selectType="checkbox"  >
				<ta:datagridItem id="aae013" key="打印状态"  hiddenColumn="true" />
				<ta:datagridItem id="print" key="打印结算单" icon="xui-icon-spotPrint" align="center" click="toPrint" maxChart="5" />
				<ta:datagridItem id="printCw" key="打印财务支付单" icon="xui-icon-spotPrint" align="center" click="toPrintCw" maxChart="8" />
				<ta:datagridItem id="aaz031" key="财务支付单据号"   align="center" dataAlign="left"  maxChart="10"   formatter="fnFormatter"/>
				<ta:datagridItem id="yke056" key="结算状态"   align="center" dataAlign="left"  maxChart="4"  collection="YKE056" formatter="fnFormatter"/>
				<ta:datagridItem id="aac001" key="人员ID"   align="center" dataAlign="left"  maxChart="7"   formatter="fnFormatter"/>
				<ta:datagridItem id="aac003" key="姓名"  align="center" dataAlign="left" showDetailed="true"  maxChart="3"  formatter="fnFormatter"/>
				<ta:datagridItem id="aac004" key="性别"  align="center" dataAlign="left" showDetailed="true"  maxChart="2"  collection="AAC004" formatter="fnFormatter"/>
				<ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="left" showDetailed="true"  maxChart="10" formatter="fnFormatter"/>
				<ta:datagridItem id="aab003" key="单位名称" align="center" dataAlign="left" showDetailed="true"  maxChart="10" formatter="fnFormatter"/>
				<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" showDetailed="true"  maxChart="5" collection="AAE140" formatter="fnFormatter"/>
				<ta:datagridItem id="akc021" key="人员性质" align="center" dataAlign="left" showDetailed="true"  maxChart="5" collection="AKC021" formatter="fnFormatter"/>
				<ta:datagridItem id="aka130" key="医疗类别" align="center" dataAlign="left" showDetailed="true"  maxChart="8" collection="AKA130" formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center" dataAlign="left" showDetailed="true"  maxChart="15"  formatter="fnFormatter"/>
				<ta:datagridItem id="aae030" key="入院日期" align="center" dataAlign="center" showDetailed="true"  maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="aae031" key="出院日期" align="center" dataAlign="center" showDetailed="true"  maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="akc264" key="医疗费总额" align="center" dataAlign="right" showDetailed="true"  maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb081" key="实际支付金额" align="center" dataAlign="right" showDetailed="true"  maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="ake053" key="年度统筹范围累计" align="center" dataAlign="right" showDetailed="true"  maxChart="9"  formatter="fnFormatter"/>
				<ta:datagridItem id="ykc022" key="年度累计住院次数" align="center" dataAlign="right" showDetailed="true"  maxChart="9"  formatter="fnFormatter"/>
				<ta:datagridItem id="yka436" key="年度统筹支付累计" align="center" dataAlign="right" showDetailed="true"  maxChart="9"  formatter="fnFormatter"/>
				<ta:datagridItem id="aka030" key="结算类别"   align="center" dataAlign="left"  maxChart="6"  collection="AKA030" formatter="fnFormatter"/>
				<ta:datagridItem id="ake013" key="报销原因"   align="center" dataAlign="left"  maxChart="6"  collection="AKE013" formatter="fnFormatter"/>
				<ta:datagridItem id="aae009" key="银行户名" align="center" dataAlign="center" showDetailed="true"  maxChart="4"  formatter="fnFormatter"/>
				<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="center" showDetailed="true"  maxChart="10"  formatter="fnFormatter"/>
				<ta:datagridItem id="aaf002" key="银行类型"   align="center" dataAlign="left"  maxChart="6"  collection="AAF002" formatter="fnFormatter"/>
				<ta:datagridItem id="yka547" key="拨付方式"   align="center" dataAlign="left"  maxChart="6"  collection="YKA547" formatter="fnFormatter"/>
				<ta:datagridItem id="aae011" key="结算人" align="center" dataAlign="center" showDetailed="true"  maxChart="5"  collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="aae036" key="结算时间" align="center" dataAlign="center" showDetailed="true"  maxChart="7"  formatter="fnFormatter"/>
				<ta:datagridItem id="yae041" key="审核人" align="center" dataAlign="center" showDetailed="true"  maxChart="5"  collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae051" key="审核时间" align="center" dataAlign="center" showDetailed="true"  maxChart="7"  formatter="fnFormatter"/>
				<ta:datagridItem id="aae011dj" key="登记人" align="center" dataAlign="center" showDetailed="true"  maxChart="5"  collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="aae036dj" key="登记时间" align="center" dataAlign="center" showDetailed="true"  maxChart="7"  formatter="fnFormatter"/>
				<ta:datagridItem id="yad006" key="财务处理标志"   align="center" dataAlign="left"  maxChart="6"  collection="YAD006" formatter="fnFormatter"/>
				<ta:datagridItem id="aaz217" key="就诊流水号" maxChart="6"/>
				<ta:datagridItem id="aaz216" key="结算流水号" maxChart="6" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ab01', 'aab001', 700, 200, 4, fnAb01Callback, 0, false);
	});
	// 单位信息suggestframe
	$("#aab001").change(function(){
       Base.setValue("aab003","");		
	   sfwQueryUtil(1,'getAab001_q',Base.getValue('aab001'));
	});
	// 单位信息回调 
	function fnAb01Callback()
	{
		Base.setValue("aab001",g_Suggest[1]);
		Base.setValue("aab003",g_Suggest[2]);
	}
	
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata)
	 {
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	// 已汇总打印的背景色改成红色
	function fnFormatter(row, cell, value, columnDef, dataContext) 
	{
		var aae013 = dataContext.aae013;
		if("1" == aae013){
			if("" == value || null == value)
				value = "";
			else
				value = "<span style='color:blue;'>"+value+"</span>";
		}
		return value;
	}

	// 检查必录入项
	function checkRequiredIDs() {
		var flg = true;
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		if ("" == aae030 || null == aae030) {
			flg = false;
			Base.alert("请输入结算时间!", "warn", function() {
				Base.focus("aae030");
			});
			return flg;
		}
		if ("" == aae031 || null == aae031) {
			flg = false;
			Base.alert("请输入结算时间!", "warn", function() {
				Base.focus("aae031");
			});
			return flg;
		}

		return flg;
	}

	//查询按钮方法
	function toQuery() {
		//if (checkRequiredIDs())
			Base.submit("form1", "centerCalPrintAction!toQuery.do");
	}

	//单条结算单打印
	function toPrint(data, e) {
		var aaz217 = data.aaz217;
		var aaz216 = data.aaz216;
		var aka130 = data.aka130;
		var aac001 = data.aac001;
		var aka030 = data.aka030;//
		var aae140 = data.aae140; // 险种类型
		var ake013 = data.ake013; // 报销原因
		var aae011 = Base.getValue("aae011");
		//var reportName = "centercal.raq";
		// 住院结算表
		var reportName = "centercal_zy.raq";
		if("14" == ake013) //停保人员补报销
			  reportName = "centercal_zy_tb.raq";
		// 门诊结算表,包括普通门诊和离休门诊
		if ("1" == aka130.substr(0, 1))
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
		// 厅级退休补报销
		if("8" == aka030)
			reportName = "centerCal_mz.raq";
		// 生育
		if("16" == aka130)
			reportName = "centerCal_sy.raq";
		// 打印报表
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aaz216="+aaz216+";aae011="+aae011+";aac001="+aac001);
		
		// 导出Excel
		//$("#report1_printIFrame").attr("src","/wzsb/reportServlet?action=3&file="+reportName+"&"+
		//		"srcType=file&columns=0&saveAsName="+"1573"+"&excelFormat=2003&"+
		//		"paramString=aaz217="+aaz217
		//		+";aaz216="+aaz216
		//		+";aae011="+aae011
		//		+";aac001="+aac001
		//);
		
		// 根据经办人是否在未打印状态下打印,设置自动隐藏表格数据
		var printBz = Base.getValue("printBz");
		// 未打印
		if("0" == printBz)
		{
			setTimeout(function(){
				Base.deleteGridRow("kc24List", data.row); // 删除页面数据
				Base.refreshGrid("kc24List");
			},3000);
		}
	}
	
	// 打印账务支付单
	function toPrintCw(data, e)
	{
		var aka130 = data.aka130;
		var yke056 = data.yke056; // 结算状态
		if("05" != yke056)
			return Base.alert("未复核核不能打印账务支付单!","warn");
		var aaz217 = data.aaz217; // 业务流水号
		var reportName = "FinancialPayment_centerCal.raq";
		if("16" == aka130)
			reportName = "FinancialPayment_centerCalSy.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217);
	}
	
	//汇总打印:lx:1表示财务联，0表示结算联
	function toPrintHZ(lx)
	{
		//需要打印的结算数据
		var kc24List = Base.getGridSelectedRows("kc24List");
		if(""==kc24List||kc24List.length < 1)
		  return Base.alert("请勾选需要打印的结算信息!","warn");
        var aae140 = Base.getValue("aae140"); //险种类型
        if("" == aae140 || null == aae140)
        	return Base.alert("请选择险种类型!","warn"); 
		//经办中心
		var aaa027 = Base.getValue("aaa027");
		//开始日期
		var aae030 = Base.getValue("aae030");
		//结算日期
		var aae031 = Base.getValue("aae031");
		// 经办人员
		var aae011 = Base.getValue("aae011");
		//结算事件ID数组
		var aaz216s = [];
		//结算事件ID
		var aaz216 = "";
		var aaz217s = "";
		var aaz217 = "";
		for(var i = kc24List.length;0 <= --i;)
		{
			aaz216 = kc24List[i].aaz216;
			if(""!=aaz216 && "undefined" != typeof aaz216)
			    if("1" == lx){
			       aaz216s.push(aaz216);
			    }else{
			       if("05" == kc24List[i].yke056)
				   aaz216s.push(aaz216);
				}
			aaz217 = kc24List[i].aaz217;
			if(""!=aaz217 && "undefined" != typeof aaz217)
			{
               if("" == aaz217s)	
            	   aaz217s = aaz217;
               else
                   aaz217s = aaz217s + ","+aaz217;
			}
		}
		Base.alert("aaz216s:"+aaz216s);
		// 异步更新kc19结算状态
		//Base.getJson("centerCalPrintAction!updateKc19.do", {"dto['aaz217s']":aaz217s});
		var reportName = "centercalHZ.raq";
		if("1"==lx)
		   reportName = "centercalHZ1.raq";
		//打印
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aae030="+aae030
			     +";aae031="+aae031
			     +";aae011="+aae011
			     +";aaa027="+aaa027
			     +";aae140="+aae140
			     +";aaz216s="+aaz216s);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>