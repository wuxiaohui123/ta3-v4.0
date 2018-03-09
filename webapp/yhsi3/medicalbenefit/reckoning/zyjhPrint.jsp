<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构审核_病种</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="btnQuery"   key="开始统计" icon="xui-icon-query"        onClick="toQuery()"/>
			<ta:toolbarItem id="btnPrint"   key="打印"    icon="xui-icon-spotPrint"     onClick="toPrint()"/>
			<ta:toolbarItem id="btnClose"   key="退出"    icon="xui-icon-spotClose"     onClick="parent.Base.closeWindow('w_jh')" />
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aaa027" key="分中心"  display="false"/>
		<ta:text id="aae011" key="经办人"  display="false"/>
		<ta:panel id="fltCxtj" key="查询条件" cols="3" >
		    <ta:text id="akb020" key="医疗机构编码"  display="false"/>
			<ta:text id="akb021" key="医疗机构名称" labelWidth="120" required="true"  popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:box span="1" cols="2" cssStyle="padding:0px;">
				<ta:date id="aae036_s" key="结算日期"   required="true" showSelectPanel="true" labelWidth="100"  columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至"  showSelectPanel="true" labelWidth="15"  columnWidth="0.4"/>
			</ta:box>
			 <ta:selectInput id="yka316" key="人员类型"  labelWidth="120" collection="YKA316"  maxVisibleRows="10" required="true"  filter="15,16,18,24" reverseFilter="true"/>
			 <ta:selectInput id="aka122"  key="病种类型" collection="AKA122" filter="2" labelWidth="120" required="true"/>
			 <ta:text id="aae013" key="备注" span="2" labelWidth="100"/>
		</ta:panel>
		<ta:panel id="pnlJssj"  key="人员结算记录" fit="true">
			<ta:datagrid id="dgRYJS" fit="true" haveSn="true" forceFitColumns="true">
			     <ta:datagridItem id="aac003" key="姓名"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4"  sortable="true"/>
				 <ta:datagridItem id="aae030" key="入院日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9" dataType="date"  sortable="true"/>
				 <ta:datagridItem id="aae031" key="出院日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9" dataType="date"  sortable="true"/>
				 <ta:datagridItem id="aka122" key="出院病种类型"  align="center" dataAlign="left"  showDetailed="true"  maxChart="9"  collection="AKA122"  sortable="true"/>
				 <ta:datagridItem id="aka121" key="出院病种"  align="center" dataAlign="left"  showDetailed="true"  maxChart="12"  sortable="true"/>
				 <ta:datagridItem id="yka095" key="审核病种类型"  align="center" dataAlign="left"  showDetailed="true"  maxChart="9"  collection="AKA122"  sortable="true"/>
				 <ta:datagridItem id="akc197" key="审核病种"  align="center" dataAlign="left"  showDetailed="true"  maxChart="12"  sortable="true"/>
				 <ta:datagridItem id="akc264" key="总费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="yka318" key="个人比例自付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="akc228" key="自费费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="akc268" key="超限额自费"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="yka319" key="医保范围内费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="7"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="ake034" key="个人账户支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="yka115" key="起付线"  align="center" dataAlign="right"  showDetailed="true"  maxChart="4"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="yka059" key="统筹内个人支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="7"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="tczf" key="统筹支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="yka063" key="本次超封顶线金额"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
				 <ta:datagridItem id="ake053" key="年度医保支付范围内累计"  align="center" dataAlign="right"  showDetailed="true"  maxChart="12" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	// 回调方法
	function fnKb01MagifierBack(rowdata){
		   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
		   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	// 查询条件
	function checkCxData()
	{
		var akb020 = Base.getValue("akb020"); // 医疗机构编码
		var aka122 = Base.getValue("aka122"); // 病种类型
		var yka316 = Base.getValue("yka316"); // 结算类型
		if("" == akb020 || null == akb020)
		{
			Base.alert("请输入医疗机构编码!","warn",function(){
				Base.focus("akb020");
			});
			return false;
		}
		if("" == aka122 || null == aka122)
		{
			Base.alert("请输入病种类型!","warn",function(){
				Base.focus("aka122");
			});
			return false;
		}
		if("" == yka316 || null == yka316)
		{
			Base.alert("请输入人员类型!","warn",function(){
				Base.focus("yka316");
			});
			return false;
		}
    	var aae036_s = Base.getValue("aae036_s");
    	var aae036_e = Base.getValue("aae036_e");
    	if("" == aae036_s || "" == aae036_e){
    		Base.alert("结算时间段不能为空!","warn");
    		return false;
    	}
      return true;		
	}
	//查询
	function toQuery()
	{
		if(checkCxData()){
			Base.submit("fltCxtj",'detailAuditZYAction!printQuery.do');
		}
	}

	// 打印
	function toPrint(){
		if(checkCxData()){
			var aka122 = Base.getValue("aka122"); // 病种类型
			var printName = "HosptialMonthAduit_PTBZ.raq";
			if("3" == aka122)
				printName = "HosptialMonthAduit_TSBZ.raq";
			if("4" == aka122)
				printName = "HosptialMonthAduit_DBZ.raq";
			var akb020 = Base.getValue("akb020"); // 医疗机构编码
			var aaa027 = Base.getValue("aaa027"); // 分中心
			var aae011 = Base.getValue("aae011"); // 经办人
			var aae030 = Base.getValue("aae036_s"); // 结算开始日期
			var aae031 = Base.getValue("aae036_e"); // 结算结束日期
			var yka316 = Base.getValue("yka316"); // 清算类型
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+printName+"&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=akb020="+akb020+";yka316="+yka316+";aaa027="+aaa027+";aae011="+aae011+";aae030="+aae030+";aae031="+aae031);
		}
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>