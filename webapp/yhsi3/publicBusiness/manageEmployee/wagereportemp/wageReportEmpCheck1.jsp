<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>paymentDeclare</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading/>
	<ta:toolbar id="toolbarUnit">
		<ta:toolbarItem id="btnSave" key="保存[S]" hotKey="S" icon="xui-icon-spotSave" onClick="fnSave();"/>
		<ta:toolbarItem id="closeBtn" key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="closeUnitWin();"/>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>			
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次"/>
		<ta:tabs id="tabsPersonWage" fit="true">
			<ta:tab id="tabWageInfo" key="工资申报信息">
				<ta:datagrid id="gridWageInfo" fit="true" forceFitColumns="true" haveSn="true" height="250">
					<ta:datagridItem id="aac001" key="个人ID" width="90"/>
					<ta:datagridItem id="aac003" key="姓名" width="70"/>
					<ta:datagridItem id="aac002" key="证件号码" width="120" showDetailed="true"/>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" width="170"/>
					<ta:datagridItem id="aae041" key="开始年月" width="70" dataAlign="center"/>
					<ta:datagridItem id="aae042" key="结束年月" width="70" dataAlign="center"/>
					<ta:datagridItem id="aaz136" key="基数核定规则参数ID" width="130"/>
					<ta:datagridItem id="aac040" key="工资"/>
					<ta:datagridItem id="aab001" key="单位ID" showDetailed="true"/>
					<ta:datagridItem id="aae044" key="单位名称" width="180"/>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tabCaseRecord" key="事件流程记录">
			   <%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});
	
	//关闭窗口
	function closeUnitWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	//保存审核信息
	function fnSave(){
		var rows = Base.getGridData('gridWageInfo');
		var param = {};
		param.wageList = Ta.util.obj2string(rows);
		if(""==rows){
			Base.alert('没有需要审核的缴费工资申报信息！','warn');
			return;
		}else{
			Base.submit('form1','wageReportEmpCheck1Action!toSave.do',param);
			Base.setDisabled('btnSave');
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
