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
		<ta:toolbarItemSeperator />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeUnitWin();"/>
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
			<ta:tab id="bushouInfo" key="退账信息">
				<ta:datagrid id="tuizhangInfo" haveSn="true" fit="true">
				   <ta:datagridItem field="yae567" key="人员核定事件ID"  width="180" align="center" dataAlign="left" />
				   <%@ include file="/yhsi3/commonJSP/v_ac43ac44.jsp"%>	 
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
	});
	
	//关闭窗口
	function closeUnitWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	//保存审核信息
	function fnSave(){
		var rows = Base.getGridData('tuizhangInfo');
		var param = {};
		param.tuizhangInfo = Ta.util.obj2string(rows);
		if(""==rows){
			Base.alert('没有需要审核的个人欠款退账信息!", "warn");
			return;
		}else{
			Base.submit('form1','arrearsRebatesCheckAction!toSave.do',param);
			Base.setDisabled('btnSave');
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
