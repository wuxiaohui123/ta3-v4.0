<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>费用月度清算单据打印(住院)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnJsd" key="结算单[A]" icon="xui-icon-spotSave" hotKey="A" onClick="toPrint('1')" />
		<ta:toolbarItem id="btnCwjzd" key="财务记账单[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toPrint('2')" />
		<ta:toolbarItem id="btnJszfd" key="结算支付单[D]" icon="xui-icon-spotSave" hotKey="D" onClick="toPrint('3')" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" labelWidth="120" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:box id="bxAae209" span="1" cols="2">
				<ta:date id="aae209_k" key="结算年月"  showSelectPanel="true" labelWidth="120" issue="true" columnWidth="0.65" required="true"/>
				<ta:date id="aae209_j" key="至"  showSelectPanel="true" labelWidth="15" issue="true" columnWidth="0.35"/>
			</ta:box>	
			<ta:selectInput id="yka316" key="人员类别" labelWidth="120" collection="YKA316" filter="15,16" reverseFilter="true"/>
			<ta:selectInput id="shStuts"  key="审核状态"  data="[{'id':'0','name':'未审'},{'id':'1','name':'已审'}]" labelWidth="120" />
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="结算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdKf20Info" fit="true" haveSn="true" selectType="radio" headerColumnsRows="2">
				<ta:datagridItem id="aaz272" key="流水号" hiddenColumn="false"/>
				<ta:datagridItem id="akb020" key="医疗机构编码" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="yka316" key="清算类别"     align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316"/>
				<ta:datagridItem id="aae209" key="年月"        align="center" showDetailed="true" dataAlign="center" maxChart="2"/>
				<ta:datagridItem id="aka122" key="病种类型"    align="center" showDetailed="true" dataAlign="left" maxChart="4"  collection="AKA122"/>
				<ta:datagridItem id="aka121" key="病种名称"     align="center" showDetailed="true" dataAlign="left" maxChart="7"  />
				<ta:datagridItem id="akb079" key="核准主记录数" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb065" key="核准总费用"   align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akc228" key="全自费" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akc268" key="超限额自费" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka318" key="先比例自付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka319" key="核准医保费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka059" key="统筹比例自费" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb068" key="统筹支付金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ake034" key="核准个人账户支付总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb081" key="本月实际应结算金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb069" key="拒付费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb090" key="其中待结算金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb094" key="本月实际结算金额" align="center" showDetailed="true" dataAlign="right" maxChart="4"/>
				<ta:datagridItem id="qyzzzh" key="企业在职个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="jgzzzh" key="机关事业在职个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qtzzzh" key="其它单位在职个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qytxzh" key="企业退休个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="jgtxzh" key="机关事业退休个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qttxzh" key="其它单位退休个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yae041" key="审核人"  align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011" />
				<ta:datagridItem id="yae051" key="审核日期" align="center" showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
				<ta:datagridItem id="yae042" key="结算人"  align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011" />
				<ta:datagridItem id="yae052" key="结算日期" align="center" showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
				<ta:datagridItem id="aka018" key="审核状态" align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AKA018" />
				<ta:datagridItem id="yae043" key="领导签字" align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011"/>
				<ta:datagridItem id="yae053" key="领导签字日期" align="center" showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//医疗机构回调函数
	function fnKb01MagifierBack(rowdata){
		   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
		   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
		
	//查询
	function query(){
		var aae209_k = Base.getValue("aae209_k");
		var aae209_j = Base.getValue("aae209_j");
		if("" == aae209_k || null == aae209_k)
			return Base.alert("请输入结算年月!","warn",function(){
				Base.focus("aae209_k");
			});
		if("" == aae209_j || null == aae209_j)
			return Base.alert("请输入结算年月!","warn",function(){
				Base.focus("aae209_j");
			});
		Base.clearGridData("dgrdKf20Info");
		Base.submit('form1','reckoningMonthZYPrintAction!toQueryHospitalInfo.do');
	}
	
	//打印
	function toPrint(i){
		var reportName ;
		var gridSelected=Base.getGridSelectedRows("dgrdKf20Info");//选中的表格数据
		if(gridSelected.length == 0){
			Base.alert("请勾选要打印信息!","warn");
			return false;
		}
		var aka122 = gridSelected[0].aka122;
		if(i == "1"){//结算单
			reportName = "ReckoningMonthZY_PTTSBZ.raq";//普通病种和特殊病种
			if("4"==aka122)
			  reportName = "ReckoningMonthZY_DBZ.raq";//单病种
		}else if(i == "2"){//财务记账单
			reportName = "MonthFinancialZY_PTTSBZ.raq";//普通病种和特殊病种
			if("4"==aka122)
			  reportName = "MonthFinancialZY_DBZ.raq";//单病种
		}else{//结算支付单
			reportName = "FinancialPaymentMonthZY_PTBZ.raq";
			if("4"==aka122)
			  reportName = "FinancialPaymentMonthZY_DBZ.raq";
		}
			
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
			"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aaz272="+gridSelected[0].aaz272 );
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>