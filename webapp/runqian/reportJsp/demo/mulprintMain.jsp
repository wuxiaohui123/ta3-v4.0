<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
	<head>
		<title>批量打印</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body style="margin:0px;padding:0px;" class="no-scrollbar" >
		<ta:pageloading />
		<ta:panel id="pnl" key="批量打印" fit="true">
			<ta:fieldset id="flt" key="请至少选择两个报表">
				<ta:checkboxgroup id="chkg" key="选择报表" cols="4" cssStyle="padding-top:20px;height:60px;">
				<ta:checkbox key="补足空白行报表" id="buzu" onClick="fnSet()" value="buzukongbai.raq"/>
				<ta:checkbox key="套打报表" id="taod" onClick="fnSet()" value="taoda.raq"/>
				<ta:checkbox key="锁定表头报表" id="suod" onClick="fnSet()" value="suoding.raq"/>
				</ta:checkboxgroup>
				<ta:buttonLayout align="left" cssStyle="padding-left:30px;">
					<ta:button id="btnPrint" key="批量打印" onClick="fnPrint()" disabled="true"/>
				</ta:buttonLayout>
			</ta:fieldset>
		</ta:panel>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
	});
	//?report={buzukongbai.raq}{taoda.raq}
	function fnSet(){
		var ckdVals = Base.getValue("chkg");
		if(ckdVals.length>=2){
			Base.setEnable("btnPrint");
		}else{
			Base.setDisabled("btnPrint");
		}
	}
	
	var url = "<%=basePath%>runqian/reportJsp/demo/mulprint.jsp?prompt=no&report=";
	
	function fnPrint(){
		var vals = Base.getValue("chkg");
		for(var i=0;i<vals.length;i++){
			url = url + "{"+ vals[i] +"}";
		}
		Base.openWindow("main","批量打印",url,null,500,300,null,null,true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
