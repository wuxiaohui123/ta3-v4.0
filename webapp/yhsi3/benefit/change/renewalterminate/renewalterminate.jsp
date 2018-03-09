<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>供养亲属续期</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:1px;" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tld">
		<ta:button key="查询[Q]" id="queryBtn" icon="xui-icon-query" hotKey="Q" asToolBarItem="true" onClick="fn_queryInfoPerson();" />
		<ta:button key="待遇续期[S]" icon="xui-icon-spotSave" hotKey="S" asToolBarItem="true" disabled="false" id="saveBtn" onClick="toSave();" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="P" asToolBarItem="true" />
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" asToolBarItem="true" id="resetBtn" type="resetPage" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" />
	</ta:toolbar>
	<ta:panel key="查询条件" cols="4" id="cxtjpanel" columnWidth="0.2" scalable="false" expanded="false">
		<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" onChange="fn_queryInfoPerson();" />
		<ta:text id="aac002" key="身份证号码" labelWidth="120" onChange="fn_queryInfoPerson();" />
		<ta:text id="aac003" key="姓名" labelWidth="120" disabled="true" />
		<ta:selectInput id="aac004" key="姓别" labelWidth="120" collection="AAC004" disabled="true" />
		<ta:text id="aac111" key="死亡人员ID" labelWidth="120" onChange="fn_queryInfoPerson();" />
		<ta:text id="swaac002" key="死亡人员身份证" labelWidth="120" disabled="true" />
		<ta:text id="swaac003" key="死亡人员姓名" labelWidth="120" disabled="true" />
		<ta:selectInput id="swaac004" key="死亡人员姓别" labelWidth="120" collection="AAC004" disabled="true" />
	</ta:panel>
	<ta:form id="form1" fit="true">
		<ta:text id="aaa121" key="业务类型编码" display="false" />
		<ta:text id="aaz002" key="业务日志ID" display="false" />
		<ta:text id="yab003" labelWidth="130" key="经办所属机构" display="false" />
		<ta:text id="aae140" labelWidth="130" key="险种信息" display="false" />
		<ta:text id="aaz257" labelWidth="130" key="享受定期待遇人员ID" display="false" />
		<ta:panel id="ac62s" key="基本信息" bodyStyle="margin:0px" scalable="false" height="120px" expanded="false">
			<ta:datagrid id="ac62List" forceFitColumns="true" selectType="radio" fit="true">
				<ta:datagridItem id="aaz257" key="享受定期待遇人员ID" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="人员编号" dataAlign="right" align="center" />
				<ta:datagridItem id="aac111" key="死亡人员ID" hiddenColumn="true" />
				<ta:datagridItem id="aac003" key="姓名" dataAlign="left" align="center" />
				<ta:datagridItem id="aac002" key="身份证号码" dataAlign="right" align="center" />
				<ta:datagridItem id="aae210" key="待遇开始年月" dataAlign="center" align="center" />
				<ta:datagridItem id="aae042" key="待遇终止年月" dataAlign="center" align="center" />
				<ta:datagridItem id="aae144" key="供养关系" collection="AAE144" dataAlign="left" align="center" />
				<ta:datagridItem id="aae019" key="金额" dataAlign="right" align="center" formatter="formatCurrency" />
				<ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" dataAlign="left" align="center" />
			</ta:datagrid>
		</ta:panel>
		<ta:panel key="续期信息" cols="3" id="xqxxpanel" columnWidth="0.2">
			<ta:date id="aae042" key="续期终止日期" showSelectPanel="true" required="true" issue="true" labelWidth="120" onChange="checkTime();" />
			<ta:text id="yaz293" key="续期原因" span="2" maxLength="200" labelWidth="120" />
			<ta:text id="yaz294" key="学校" required="true" maxLength="200" labelWidth="120" />
			<ta:number id="yaz295" key="学制" required="true" max="100" min="0" labelWidth="120" />
			<ta:date id="yaz296" key="入学时间" required="true" showSelectPanel="true" labelWidth="120" onChange="checkTime();" />
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	function fn_queryInfoPerson() {
		var aac001 = Base.getValue("aac001");
		var aaa121 = Base.getValue("aaa121");
		var aac002 = Base.getValue("aac002");
		var aac111 = Base.getValue("aac111");
		if (aac001 != "" || aac002 != "" || aac111 != "") {
			if (aaa121 == "L10053") {
				Base.submit("cxtjpanel,form1", "renewalTerminate410Action!toQuery.do", null, null, false);
			} else if ("I80006" == aaa121) {
				Base.submit("cxtjpanel,form1", "renewalTerminate110Action!toQuery.do", null, null, false);
			} else if ("G80006" == aaa121) {
				Base.submit("cxtjpanel,form1", "renewalTerminate120Action!toQuery.do", null, null, false);
			}
		}
	}

	function checkTime() {
		var yaz296 = Base.getValue("yaz296");
		var yaz295 = Base.getValue("yaz295");
		var aae042 = Base.getValue("aae042");
		if (yaz296 != "" && yaz295 != "" && aae042 != "") {
			Base.submit("yaz296,yaz295,aae042", "renewalTerminateAction!checkTime.do");
		}
	}

	function toSave() {
		var aaa121 = Base.getValue("aaa121");
		var aae042 = Base.getValue("aae042");
		var selectRowAc62 = Base.getGridSelectedRows("ac62List");
		if (selectRowAc62.length == 0) {
			alert("请选择需要续期的数据！");
			return false;
		}
		if (aae042 == "") {
			alert("请填写续期终止日期！");
			Base.focus("aae042");
			return false;
		}
		if (aaa121 == "L10053") {
			Base.submit("ac62List,xqxxpanel", "renewalTerminate410Action!toSave.do");
		} else if ("I80006" == aaa121) {
			Base.submit("ac62List,xqxxpanel", "renewalTerminate110Action!toSave.do");
		} else if ("G80006" == aaa121) {
			Base.submit("ac62List,xqxxpanel", "renewalTerminate120Action!toSave.do");
		}
	}

	//金额格式
	function formatCurrency(row, cell, value, columnDef, dataContext) {
		var num = value;
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num)){
			num = "0";
		}
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		cents = num % 100;
		num = Math.floor(num / 100).toString();
		if (cents < 10){
			cents = "0" + cents;
		}
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++){
			num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
		}
		return (((sign) ? '' : '-') + num + '.' + cents);
	}

	function print() {
		var aaz002 = Base.getValue("aaz002");
		var aaz257 = Base.getValue("aaz257");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		if (aaz002 == "" && aaz002 == null) {
			Base.alert("业务日记为空,不能打印");
			return;
		}
		if (aaz257 == "" && aaz257 == null) {
			Base.alert("享受待遇人员ID为空,不能打印");
			return;
		}
		if (aae140 == "" && aae140 == null) {
			Base.alert("险种为空,不能打印");
			return;
		}
		$("#report1_printIFrame").attr("src","/yhsi3/reportServlet?action=2&name=report1&reportFileName=gyxsxq.raq&" 
				+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
				+ "serverPagedPrint=no&mirror=no&" + "paramString=aaz002=" + aaz002 + ";aaz257=" + aaz257
				+ ";aae140=" + aae140 + ";yab003=" + yab003);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>