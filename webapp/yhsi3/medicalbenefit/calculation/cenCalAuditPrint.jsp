<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心支付复审</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="Q" onClick="toQuery()" asToolBarItem="true" />
		<ta:toolbarItem id="printBtn" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint()"/>
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel1" key="查询条件" cols="3" >
			<ta:selectInput id="aae140" key="险种类型" collection="AAE140" labelWidth="150" display="false"/>
			<ta:text id="aac001" key="个人ID" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))" bpopTipMsg="输入个人ID、身份证号、姓名，可自动完成查询" labelWidth="150" display="false"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" display="false"/>
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="150" display="false"/>
			<ta:text  id="akb020" key="医疗机构编号" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构ID、名称，可自动完成查询" labelWidth="150" display="false"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" labelWidth="150" span="2" display="false"/>
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" labelWidth="150" display="false" filter="51,52,61,62,71,72"/> 
			<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="150" display="false" />
			<ta:text id="aab001" key="单位ID" readOnly="true" labelWidth="150" display="false" />
			<ta:text id="aab003" key="单位名称" readOnly="true" labelWidth="150" display="false" />
			
			<ta:selectInput id="aae011" key="经办人" collection="AAE011" labelWidth="150"/>
			<ta:date id="aae036_b" key="开始经办日期" showSelectPanel="true" labelWidth="150" onChange="fnChangeDate1(this)"/>
			<ta:date id="aae036_e" key="结束日期" showSelectPanel="true" labelWidth="150" onChange="fnChangeDate2(this)"/>
			<ta:number id="akb081_b" key="最低实际支付金额" labelWidth="150" min="0" max="9999999" precision="2" onChange="fnChangeAkb081_b()"/>
			<ta:number id="akb081_e" key="最高实际支付金额" labelWidth="150" min="0" max="9999999" precision="2" onChange="fnChangeAkb081_e()"/>
		</ta:panel>

		<ta:panel fit="true" id="panel2" key="结算信息(请先勾选，再打印)" >
			<ta:datagrid id="kc24List" fit="true"  haveSn="true" selectType="checkbox" >
				<ta:datagridItem id="aaz217" key="就诊事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="true" />
				<ta:datagridItem id="aac003" key="姓名" align="center" width="70" />
				<ta:datagridItem id="aac002" key="身份证号" align="center" width="140" />
				<ta:datagridItem id="aac066" key="参保身份" align="center" width="50" hiddenColumn="true" />
				<ta:datagridItem id="aae030" key="入院时间" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aae031" key="出院时间" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aka130" key="医疗类别" align="center" width="100" collection="AKA130" />
				<ta:datagridItem id="akc264" key="医疗费总额" align="center" width="80" dataAlign="right" />
				<ta:datagridItem id="akb081" key="实际支付金额" align="center" width="90" dataAlign="right" />
				<ta:datagridItem id="ake034" key="个人账户支出" align="center" width="90" dataAlign="right" />
				<ta:datagridItem id="ake039" key="基本医疗支出" align="center" width="100" dataAlign="right" />
				<ta:datagridItem id="ake029" key="大额医疗支出" align="center" width="100" dataAlign="right" />
				<ta:datagridItem id="ake035" key="公补医疗支出" align="center" width="100" dataAlign="right" />
				<ta:datagridItem id="ake043" key="特殊人员支出" align="center" width="90" dataAlign="right" />
				<ta:datagridItem id="ake041" key="居民医疗支出" align="center" dataAlign="right" width="100" />
			</ta:datagrid>
		</ta:panel>
				
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("body").css("overflow","hidden");
		Base.focus("aac001");
		
		if(Base.getValue('aae140') == '390'){
			Base.filterSelectInput('aka130', '13,21,25', true);
		}else{
			Base.filterSelectInput('aka130', '11,13,21,25', true);
		}
		
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
		initializeSuggestFramework(2,"", "akb020", 500, 300, 4, fn_getHospital, 0, false);
	});
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",
					{"dto['aac001']":Base.getValue("aac001")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("aac001",'');
							return true;
						 }
						 if(data &&  data.personInfoDto) {
							Base.setValue("aac002",data.personInfoDto.aac002);
							Base.setValue("aac003",data.personInfoDto.aac003);
							Base.setValue("aac004",data.personInfoDto.aac004);
							Base.setValue("aac006",data.personInfoDto.aac006);
							Base.setValue("aab001",data.personInfoDto.aab001);
							Base.setValue("aab003",data.personInfoDto.aab003);
							Base.setValue("aac066",data.personInfoDto.aac066);
							Base.setValue("yab139",data.personInfoDto.yab139);
						}
					});
	}
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("akb020","");
							return false;
						}
						if(data &&  data.hospitalInfoDto) {
							Base.setValue("akb023",data.hospitalInfoDto.akb023);
							Base.setValue("aka101",data.hospitalInfoDto.aka101);
							Base.setValue("akb021",data.hospitalInfoDto.akb021);
						}
					});
	}
	
	//查询
	function toQuery(){
		Base.submit("panel1","cenCalAuditPrintAction!toQuery.do");
	}
	
	//验证日期
	function fnChangeDate2(obj){
		var aae036_b = Base.getValue('aae036_b');//经办开始日期
		var aae036_e = Base.getValue('aae036_e');//经办结束日期
		if(aae036_b != '' && aae036_e != '' && aae036_e < aae036_b){
			obj.value = '';
			Base.alert('结束日期不能小于开始日期！','warn');
		}
	}
	function fnChangeDate1(obj){
		var aae036_b = Base.getValue('aae036_b');//经办开始日期
		var aae036_e = Base.getValue('aae036_e');//经办结束日期
		if(aae036_b != '' && aae036_e != '' && aae036_e < aae036_b){
			obj.value = '';
			Base.alert('开始日期不能大于结束日期！','warn');
		}
	}
	
	//验证输入的金额
	function fnChangeAkb081_b(){
		var akb081_b = Base.getValue('akb081_b');//最小实际支付金额
		var akb081_e = Base.getValue('akb081_e');//最大实际支付金额
		if(akb081_b != ''){
			if( akb081_e != ''){
				if((akb081_b-akb081_e) > 0 ){
					Base.setValue('akb081_b','');
					Base.alert('最低实际支付金额不能大于最高实际支付金额！','warn');
				}
			}
		}
	}
	function fnChangeAkb081_e(){
		var akb081_b = Base.getValue('akb081_b');//最小实际支付金额
		var akb081_e = Base.getValue('akb081_e');//最大实际支付金额
		if(akb081_b != ''){
			if(akb081_e != ''){
				if((akb081_b-akb081_e) > 0 ){
					Base.setValue('akb081_e','');
					Base.alert('最高实际支付金额不能小于最低实际支付金额！','warn');
				}
			}
		}
	}
	
	//打印
	function fnPrint(){
		//勾选的列表行
		var selectList = Base.getGridSelectedRows('kc24List');
		if(selectList.length == '' || selectList.length == null){
			Base.alert('请先勾选再打印','warn');
			return;
		}
		var arr = new Array();
		for(var i = 0; i < selectList.length; i ++){
			arr[i] = selectList[i].aaz217;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=cenCalAudit.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+arr);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>