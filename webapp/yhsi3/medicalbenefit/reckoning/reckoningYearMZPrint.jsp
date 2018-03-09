<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构门诊（购药）费用年度清算单据打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnPrint1" key="结算单[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toPrint('1')" />
		<ta:toolbarItem id="btnPrint2" key="财务记账单[P]" icon="xui-icon-spotSave" hotKey="P" onClick="toPrint('2')" />
		<ta:toolbarItem id="btnPrint3" key="结算支付单[O]" icon="xui-icon-spotSave" hotKey="O" onClick="toPrint('3')" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="查询条件" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:date id="aae001" key="年度"  dateYear="true" labelWidth="120" showSelectPanel="true" />
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" filter="10,11,12,13,14,19" reverseFilter="true" labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="清算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdKf20Info" fit="true" haveSn="true" selectType="checkbox" headerColumnsRows="2">
				<ta:datagridItem id="aaz272" key="医疗机构结算ID"  hiddenColumn="false"/>
				<ta:datagridItem id="akb020" key="医院编号"  align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="akb021" key="医院名称"  align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="aae001" key="年度"  align="center" showDetailed="true" dataAlign="center" maxChart="2"/>
				<ta:datagridItem id="yka316" key="门诊类型"  align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316"/>
				<ta:datagridItem id="akb079" key="核准主记录数" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb065" key="核准总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb068" key="核准医保费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ake034" key="核准个人账户支付总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb067" key="自费费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="cjje" key="冲减费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="cjyy" key="冲减原因"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb069" key="拒付费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb081" key="实际应结算金额"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb090" key="其中待结算金额"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb094" key="实际结算金额"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qyzzzh" key="企业在职个人账户支付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="jgzzzh" key="机关事业在职个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qtzzzh" key="其它单位在职个人账户支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qytxzh" key="企业退休个人账户支付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="jgtxzh" key="机关事业退休个人账户支付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="qttxzh" key="其它单位退休个人账户支付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yae042" key="结算人" align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011"/>
				<ta:datagridItem id="yae052" key="结算日期" align="center" showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
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
		initializeSuggestFramework(1,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
	});
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("akb020","");
							return false;
						}
						if(data && data.hospitalInfoDto) {
							Base.setValue("akb021",data.hospitalInfoDto.akb021);
							Base.clearGridData("dgrdKf20Info");
						}
					});
	}
		
	//查询
	function query(){
		Base.submit('form1','reckoningYearMZPrintAction!toQuery.do');
	}
	
	//打印
	function toPrint(i){
		var reportName ;
		if(i == "1"){
			reportName = "reckoningYearMZ.raq";
		}else if(i == "2"){
			reportName = "reckoningYearCwjzd_mz.raq";
		}else{
			reportName = "FinancialPaymentYear_MZ.raq";
		}
		
		var gridSelected=Base.getGridSelectedRows("dgrdKf20Info");//选中的表格数据
		if(gridSelected.length == 0){
			Base.alert("请勾选要审核信息!","warn");
			return false;
		}
		if(gridSelected.length == 1){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=akb020="+gridSelected[0].akb020+
						   ";aae001="+gridSelected[0].aae001+
						   ";yka316="+gridSelected[0].yka316+
						   ";aaz272="+gridSelected[0].aaz272+
						   ";aaa027="+gridSelected[0].aaa027 );
		}else{
			var url = "<%=basePath%>runqian/reportJsp/mulprint.jsp?prompt=no&report=";

			for(var i=0;i<gridSelected.length;i++){
				url = url + "{"+ reportName 
						  + "(akb020="+gridSelected[0].akb020
						  +	";aae001="+gridSelected[0].aae001
						  + ";yka316="+gridSelected[0].yka316
						  + ";aaz272="+gridSelected[0].aaz272
						  + ";aaa027="+gridSelected[0].aaa027 
					  	  + ")}";
			}
			Base.openWindow("main","批量打印",url,null,500,300,null,null,true);
		}
		
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>