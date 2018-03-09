<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>起付线维护弹出界面</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="saveKa11()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form2" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	
		<ta:box cols="3">
			<ta:text id="bclx" key="保存类型(1:新增,2:修改)"  maxLength="100" labelWidth="120" display="false"/>
			<ta:text id="aaz156_c" key="起付标准ID"  maxLength="100" labelWidth="120" display="false"/>
			<ta:selectInput id="aae140_c" key="险种类型" reverseFilter="true" collection="yl140" labelWidth="120" />
			<ta:selectInput id="ykc007_c" key="人员类别"  labelWidth="120"/>
			<ta:selectInput id="aka130_c" key="医疗类别" collection="aka130" labelWidth="120" />
			<ta:selectInput id="akb096_c" key="起付线医院等级"  labelWidth="120" />
			<ta:date id="aae030_c" key="开始日期"  showSelectPanel="true" labelWidth="120" required="true"/>
			<ta:date id="aae031_c" key="终止日期"  showSelectPanel="true" labelWidth="120"/>
			<ta:number id="aka151_c" key="起付标准额" max="999999" labelWidth="120" required="true"/>
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
	function saveKa11(){
		if (Base.validateForm("form2")) {
			Base.submit("form2", "maintainQifubiaozhunAction!saveKa11.do", null, null, false, function(){
				parent.Base.alert('保存成功');
	    		parent.Base.submit("", "maintainQifubiaozhunAction!queryKa11.do");
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