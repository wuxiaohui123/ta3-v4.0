<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构住院费用年度清算单据打印</title>
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
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:date id="aae001" key="年度"  dateYear="true" labelWidth="120" showSelectPanel="true"/>
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" filter="15,16" reverseFilter="true" labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="清算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdKf20Info" fit="true" haveSn="true" selectType="checkbox" headerColumnsRows="2">
				<ta:datagridItem id="aaz272" key="医疗待遇年度清算ID"  hiddenColumn="false"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="yka316" key="清算类别"  align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316" />
				<ta:datagridItem id="akb079" key="住院总人次" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzrc" key="普通病种住院总人次" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzrc" key="特殊病种住院人次"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzrc" key="单病种住院次数"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb065" key="住院总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzfy" key="普通病种住院总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzfy" key="特殊病种住院总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzfy" key="单病种住院总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb068" key="住院统筹支付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbztc" key="住院统筹支付(普通病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbztc" key="住院统筹支付(特殊病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbztc" key="住院统筹支付(单病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka059" key="住院统筹内个人支付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzgrzf" key="住院统筹内个人支付(普通病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzgrzf" key="住院统筹内个人支付(特殊病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzgrzf" key="住院统筹内个人支付(单病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akc228" key="住院个人自费"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzakc228" key="住院个人自费(普通病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzakc228" key="住院个人自费(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzakc228" key="住院个人自费(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka318" key="住院个人比例自付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzyka318" key="住院个人比例自付(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzyka318" key="住院个人比例自付(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzyka318" key="住院个人比例自付(单病种)"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka500" key="结算定额"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzyka500" key="结算定额(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzyka500" key="结算定额(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb081" key="住院应结算总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzyka500" key="住院应结算总费用(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzyka500" key="住院应结算总费用(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzakb081" key="住院应结算总费用(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb094" key="已支付结算费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="ptbzakb094" key="已支付结算费用(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="tsbzakb094" key="已支付结算费用(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="dbzakb094" key="已支付结算费用(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>					
				<ta:datagridItem id="akb090" key="待结算费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb069" key="扣款金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="sjzf" key="实际支付" align="center" showDetailed="true" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="yka501" key="结存或超支费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka503" key="可超支金额"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka504" key="机构负担"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka505" key="统筹基金负担"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka506" key="机构超10%负担"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka507" key="可节余金额"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka508" key="医疗机构节余"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka509" key="统筹基金节余"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka510" key="统筹基金滚存金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
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
							Base.submit("akb020","reckoningYearZYPrintAction!toQuery.do");
						}
					});
	}
		
	//查询
	function query(){
		Base.submit('form1','reckoningYearZYPrintAction!toQuery.do');
	}
	
	//打印
	function toPrint(i){
		var reportName ;
		if(i == "1"){
			reportName = "reckoningYearZY.raq";
		}else if(i == "2"){
			reportName = "reckoningYearCwjzd_ZY.raq";
		}else{
			reportName = "FinancialPaymentYear_ZY.raq";
		}
		
		var gridSelected=Base.getGridSelectedRows("dgrdKf20Info");//选中的表格数据
		if(gridSelected.length == 0){
			Base.alert("请勾选要审核信息!","warn");
			return false;
		}else if(gridSelected.length == 1){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=akb020="+gridSelected[0].akb020+
						   ";aae001="+gridSelected[0].aae001+
						   ";yka316="+gridSelected[0].yka316+
						   ";akb021="+gridSelected[0].akb021+
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