<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>统筹报销比例维护弹出界面</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="saveKa12()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form2" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	
		<ta:box cols="3">
			<ta:text id="bclx" key="保存类型(1:新增,2:修改)"  maxLength="100" labelWidth="120" display="false"/>
			<ta:text id="aaz131" key="基金分段标准ID"  maxLength="100" labelWidth="120" display="false"/>
			<ta:date id="aae030" key="开始日期"  showSelectPanel="true" labelWidth="120" required="true"/>
			<ta:number id="aka047" key="基金支付比例"  labelWidth="120" precision="2"/>
			<ta:number id="aka048" key="上限金额" max="999999" labelWidth="120" required="true"/>
			<ta:number id="aka049" key="下限金额" max="999999" labelWidth="120" required="true"/>
			<ta:selectInput id="aae140" key="险种类型" reverseFilter="true" collection="yl140" labelWidth="120" readOnly="true" />

			<ta:selectInput id="aka130" key="医疗类别"  labelWidth="120"  readOnly="true"/>
			<ta:selectInput id="ykc007" key="居民待遇类别"  labelWidth="120" readOnly="true"/>
			<ta:selectInput id="yac084" key="险种离退休标志" labelWidth="120" readOnly="true"/>
			<ta:selectInput id="akb097" key="基金支付比例医院等级" labelWidth="160" readOnly="true"/>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fnSetRedBorder();
	});
	
	//保存新增或修改数据
	function saveKa12(){
		if (Base.validateForm("form2")) {
			Base.submit("form2", "tcReimbursementAction!saveKa12.do", null, null, false, function(){
				parent.Base.alert('保存成功');
	    		parent.Base.submit("", "tcReimbursementAction!queryKa12.do");
	    		parent.Base.closeWindow('userwin');
	    		
	   		}, null);
	   	}
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>