<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大额模拟结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="saveBtn" key="保存[S]" icon="xui-icon-query" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		
		<ta:panel id="panel1" key="查询条件" cols="3" >
			<ta:text id="aac001" key="个人ID" required="true" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))" bpopTipMsg="输入个人ID、身份证号、姓名，可自动完成查询" labelWidth="150"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150"/>
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="150" />
			<ta:text id="aaz217" key="人员医疗就诊事件ID" display="false" />
			<ta:text id="aaz216" key="人员医疗结算事件ID" display="false" />
		</ta:panel>
		
		<ta:panel id="panel2" key="待结算信息" fit="true">
			<ta:datagrid id="kc24List" fit="true" forceFitColumns="true" haveSn="true" selectType="radio">
				<ta:datagridItem id="aaz217" key="人员医疗就诊事件ID" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aaz216" key="人员医疗结算事件ID" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="人员ID" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aac003" key="姓名" align="center" width="35" />
				<ta:datagridItem id="aac002" key="身份证号" align="center" width="80" />
				<ta:datagridItem id="aka130" key="医疗类别" align="center" collection="AKA130" width="50" />
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center" />
				<ta:datagridItem id="aae030" key="开始日期" align="center" dataType="date" width="50" dataAlign="center" />
				<ta:datagridItem id="aae031" key="终止日期" align="center" dataType="date" width="50" dataAlign="center" />
				<ta:datagridItem id="akc264" key="医疗费总额" align="center" width="60" dataAlign="right" />
				<ta:datagridItem id="jbbxje" key="基本医疗报销金额" align="center" width="80" dataAlign="right" showDetailed="true"/>
				<ta:datagridItem id="ake034" key="账户支付金额" align="center" width="60" dataAlign="right" />
				<ta:datagridItem id="yka063" key="超封顶线金额" align="center" width="60" dataAlign="right" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
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
						}
						Base.submit("panel1","largeSimulationCalculationAction!toQuery.do");
					});
	}
	
	function toQuery(){
		Base.submit("panel1","largeSimulationCalculationAction!toQuery.do");
	}
	
	function toSave(){
		var kc24List = Base.getGridSelectedRows('kc24List');
		if(kc24List.length == 0){
			Base.alert('请选择要结算的记录！', 'warn');
			return false;
		}
		Base.setValue("aac001",kc24List[0].aac001);
		Base.setValue("aaz217",kc24List[0].aaz217);
		Base.setValue("aaz216",kc24List[0].aaz216);
		Base.submit("form1","largeSimulationCalculationAction!toSave.do");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>