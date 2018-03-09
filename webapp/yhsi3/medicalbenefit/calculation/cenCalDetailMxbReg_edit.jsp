<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>结算信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	   <ta:toolbar id="ButtonLayout1">
            <ta:toolbarItem id="saveBtn"  key="保存[S]" icon="xui-icon-spotClose" hotKey="C" onClick="toSave()"  />
            <ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('win_reg');"  />
       </ta:toolbar>
       <ta:form id="form2" fit="true">
	    <ta:panel id="pnlReg" key="登记信息"  cols="3" fit="true"  expanded="false" scalable="false">
	        <ta:text id="aaz217"  key="流水号"  readOnly="true" labelWidth="120" />
	        <ta:text id="aac001"  key="个人ID"  readOnly="true" labelWidth="120" />
	        <ta:text id="aac003"  key="姓名"    readOnly="true" labelWidth="120" />
	        <ta:selectInput id="aka130" key="医疗类别" collection="AKA130" required="true" labelWidth="120" filter="13,13a,13b" reverseFilter="true" maxVisibleRows="8"  value="13b"/> 
			<ta:selectInput id="ake013" key="报销原因" collection="AKE013" value="10" filter="11,12,13" maxVisibleRows="6" required="true" labelWidth="120"/>
	    </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	// 保存
	function toSave()
	{
	   Base.submit("pnlReg","cenCalDetailMxbAction!toSaveReg.do");	
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>