<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="ta" uri="/ta3" %>
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
		<ta:toolbarItemSeperator />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="closeUnitWin();"/>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>			
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次"/>
		<ta:text id="aaz083" display="false" key="当事人征缴计划事件ID"/>
		<ta:text id="aac001" display="false" key="个人ID"/>
		<ta:tabs id="tabsPersonbushou" fit="true">
			<ta:tab id="bushouInfo" key="个人基数补差明细">
				<ta:datagrid id="interruptInfo" haveSn="true" fit="true">
			        <ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" />
			        <ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" />
					<ta:datagridItem id="aae140" key="险种类型" width="170" collection="aae140" align="center" dataAlign="left" />
					<ta:datagridItem id="aaa115" key="缴费类型" width="160" collection="aaa115" align="center" dataAlign="left" />
					<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" />
					<ta:datagridItem id="aae180" key="基数" align="center" dataAlign="right" />
					<ta:datagridItem id="aae003" key="所属期数" align="center" dataAlign="right" />
					<ta:datagridItem id="aae016" key="复核标志 " align="center" dataAlign="left" />
					<ta:datagridItem id="dwhtc" key="单位划统筹 " align="center" dataAlign="right" />
					<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" />
					<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" />
					<ta:datagridItem id="grhzh" key="个人划账户 " align="center" dataAlign="right" />
					<ta:datagridItem id="dwhtcbl" key="单位划统筹比例 " width="120" align="center" dataAlign="right" />
					<ta:datagridItem id="dwhzhbl" key="单位划账户比例" width="120" align="center" dataAlign="right" />
					<ta:datagridItem id="grhtcbl" key="个人划统筹比例" width="120" align="center" dataAlign="right" />
					<ta:datagridItem id="grhzhbl" key="个人划账户比例" width="120" align="center" dataAlign="right" />
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
		var rows = Base.getGridData('interruptInfo');
		var param = {};
		param.interruptList = Ta.util.obj2string(rows);
		if(""==rows){
			Base.alert('没有需要审核的个人基数调整补收信息!','warn');
			return;
		}else{
			Base.submit('form1','baseadjustmentRefundCheckAction!toSave.do',param);
			Base.setDisabled('btnSave');
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
