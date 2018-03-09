<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ei2</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="fn_queryInfo()" asToolBarItem="true" />
				<ta:button id="btnPrint" icon="xui-icon-spotPrint" key="打印[P]" hotKey="ctrl+P" onClick="fn_print()" asToolBarItem="true" />
				<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fn_printbc()" asToolBarItem="true" />
				<ta:button id="resetBtn" key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:date id="aae041" key="开始期号" issue="true" showSelectPanel="true" />
			<ta:date id="aae042" key="结束期号" issue="true" showSelectPanel="true" />
			<ta:text id="yab003" key="经办所属机构" display="false" />
		</ta:panel>
		<ta:panel id="bbxx" key="企业养老转移情况" fit="true">
			<ta:datagrid id="dg_bbxx" fit="true" forceFitColumns="true">
				<ta:datagridItem id="czzrrc" key="城镇转入人次" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="tyjrrc" key="其中退役军人人次" align="center" dataAlign="right" maxChart="7" />
				<ta:datagridItem id="zrnmrc" key="其中农民工人次" align="center" dataAlign="right" maxChart="7" />
				<ta:datagridItem id="czzcrc" key="城镇转出人次" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="zcnmrc" key="其中农民工人次" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="czzrje" key="城镇转入金额" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="jrbzje" key="其中军人补助金" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="czzcje" key="城镇转出金额" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="lszhrs" key="建立临时账户人数" align="center" dataAlign="right" maxChart="7" />
				<ta:datagridItem id="cxzrrc" key="城乡转入人次" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="cxzcrc" key="城乡转出人次" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="cxzrje" key="城乡转入金额" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="cxzcje" key="城乡转出金额" align="center" dataAlign="right" maxChart="5" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	//查询基本信息
	function fn_queryInfo() {
		Base.submit("jstj", "pensionTransferQueryAction!toQuery.do");
	}
	function fn_printbc() {
		var prm_aae041 = Base.getValue("aae041"); //期号
		var prm_aae042 = Base.getValue("aae042");
		var prm_yab003 = Base.getValue("yab003");
		var prm_aae140 = '110';
		$("#report1_printIFrame").attr("src", myPath() + "/reportServlet?action=3&file=ylzytj.raq&" + "srcType=file&columns=0&excelFormat=2003&" + "paramString=prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab003=" + prm_yab003 + ";prm_aae140=" + prm_aae140);
	}

	function fn_print() {
		var prm_aae041 = Base.getValue("aae041"); //期号
		var prm_aae042 = Base.getValue("aae042");
		var prm_yab003 = Base.getValue("yab003");
		var prm_aae140 = '110';
		var fileName = 'ylzytj.raq';
		var prm = "prm_aae041=" + prm_aae041 + ";prm_aae042=" + prm_aae042 + ";prm_yab003=" + prm_yab003 + ";prm_aae140=" + prm_aae140;
		fnPrintComm(fileName, prm);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>