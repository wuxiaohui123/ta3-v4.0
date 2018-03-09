<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人转移信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="box1" cols="3">
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
		</ta:box>
		<ta:panel id="panel" key="个人转移信息" expanded="false" fit="true">
			<ta:tabs id="tabs" fit="true">
				<ta:tab id="tab1" key="缴费凭证信息">
					<ta:datagrid id="ac07list" haveSn="true" fit="true">
						<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="40" dataAlign="center" click="fnClick_pz" />
						<ta:datagridItem id="yac196" key="缴费凭证编号" width="125" align="center" dataAlign="center" />
						<ta:datagridItem id="aac001" key="个人编号" width="80" align="center" dataAlign="center" />
						<ta:datagridItem id="aac003" key="姓名" width="90" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" width="180" align="center" dataAlign="center" showDetailed="true" collection="aae140" />
						<ta:datagridItem id="aac002" key="公民身份证号码" width="140" align="center" dataAlign="center" />
						<ta:datagridItem id="aac004" key="性别" width="40" collection="aac004" align="center" dataAlign="center" />
						<ta:datagridItem id="aae041" key="本地开始年月" width="95" align="center" dataAlign="center" />
						<ta:datagridItem id="aae042" key="本地终止年月" width="95" align="center" dataAlign="right" />
						<ta:datagridItem id="yac123" key="本地缴费月数" width="95" align="center" dataAlign="right" />
						<ta:datagridItem id="aic099" key="个人账户总额" width="110" align="center" dataAlign="right" />
						<ta:datagridItem id="aac010" key="户籍地地址" width="300" align="center" dataAlign="center" />
						<ta:datagridItem id="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" width="80" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="DateTime" width="160" sortable="true" />
						<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" width="235" />
						<ta:datagridItem id="aae016" key="复核标志" width="190px" align="center" dataAlign="center" collection="AAE016" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab2" key="联系函信息">
					<ta:datagrid id="ic89list" haveSn="true" snWidth="20" fit="true">
						<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="40" dataAlign="center" click="fnClick_lxh" />
						<ta:datagridItem id="aaz002" key="业务日志ID" width="180" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="yae099" key="业务流水号" width="180" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aae270" key="联系函编号" width="120" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="yac519" key="原个人编号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" width="180" align="center" dataAlign="center" showDetailed="true" collection="aae140" />
						<ta:datagridItem id="yac250" key="原参保机构行政区划代码" width="180" align="center" dataAlign="center" collection="aab301" />
						<ta:datagridItem id="yac251" key="原参保机构名称" width="170" align="center" dataAlign="center" showDetailed="true" />
						<ta:datagridItem id="yac252" key="原参保机构联系电话" width="180" collection="aac004" align="center" dataAlign="center" />
						<ta:datagridItem id="yac253" key="原参保机构地址" width="250" align="center" dataAlign="center" showDetailed="true" />
						<ta:datagridItem id="yac254" key="原参保机构邮编" width="180" align="center" dataAlign="center" />
						<ta:datagridItem id="yac256" key="原参保地区名称" width="180" align="center" dataAlign="center" showDetailed="true" />
						<ta:datagridItem id="aab299" key="转入地行政区划代码" width="180" align="center" dataAlign="center" collection="aab301" />
						<ta:datagridItem id="yae440" key="代办人姓名" width="300" align="center" dataAlign="center" />
						<ta:datagridItem id="yae441" key="代办人与转移人员关系" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yae442" key="代办人电话" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yae444" key="代办人邮编" width="250" collection="yab003" align="center" dataAlign="right" />
						<ta:datagridItem id="aae016" key="复核标志" width="190px" align="center" dataAlign="center" collection="AAE016" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab3" key="转移接续信息">
					<ta:datagrid id="ic90list" snWidth="30" haveSn="true" fit="true">
						<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="40" dataAlign="center" click="fnClick_zyb" />
						<ta:datagridItem id="yae099" key="业务流水号" width="120" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac001" key="个人编号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac002" key="证件号码" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aac003" key="姓名" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aab004" key="参保单位名称" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aac007" key="参加工作时间" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae030" key="开始时间" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae031" key="终止时间" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae201" key="缴费月数" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aic083" key="个人账户转移金额" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aic102" key="转移基金总金额" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aae270" key="联系函编号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aae035" key="变更日期" width="120" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab4" key="历年缴费及个人账户记账信息">
					<ta:box>
						<ta:button id="print" key="打印" icon="icon-print" onClick="fnClick_jz()" />
					</ta:box>
					<ta:datagrid id="ic91list" snWidth="30" haveSn="true" fit="true">
						<ta:datagridItem id="yae099" key="业务流水号" width="120" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aab299" key="行政区划代码" width="120" collection="aab301" align="center" dataAlign="center" />
						<ta:datagridItem id="aab300" key="参保地名称" width="100" collection="aab301" align="center" dataAlign="center" />
						<ta:datagridItem id="aae001" key="年度" width="60" align="center" dataAlign="center" />
						<ta:datagridItem id="aae041" key="开始年月" width="80" align="center" dataAlign="center" />
						<ta:datagridItem id="aae042" key="终止年月" width="80" align="center" dataAlign="center" />
						<ta:datagridItem id="aae202" key="月数" width="60" align="center" dataAlign="center" />
						<ta:datagridItem id="aae180" key="人员缴费基数" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aaa042" key="单位缴费比例" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aaa043" key="划转个人账户比例" width="140" align="center" dataAlign="right" />
						<ta:datagridItem id="aaa041" key="个人缴费比例" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aae381" key="当年记账金额" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aae264" key="金额中个人缴费部分" width="180" align="center" dataAlign="right" />
						<ta:datagridItem id="aae269" key="当年记账利息" width="120" align="center" dataAlign="right" />
						<ta:datagridItem id="aae265" key="利息中个人缴费部分" width="180" align="center" dataAlign="right" />
						<ta:datagridItem id="aae382" key="年末累计存储额" width="140" align="center" dataAlign="right" />
						<ta:datagridItem id="aae273" key="存储额中个人缴费部分" width="180" align="center" dataAlign="right" />
						<ta:datagridItem id="aae013" key="备注" width="100" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		Base.focus("aac001");
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fnQuery, 0, false);
	});

	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001_c', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/transferQuery/transferQueryAction!toQuery.do"); //调用功能界面业务方法
	}

	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aac001", g_Suggest[2]);
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/transferQuery/transferQueryAction!toQuery.do");
		}
	}
	function fnClick_pz(data, e) {
		var yac196 = data.yac196;
		if (yac196 == '' || yac196 == null) {
			alert("请选择需要打印的数据查询条件！");
			return;
		}
		var prm = "yac196=" + yac196;
		if (data.aae140 == '310') {
			fnPrintComm("InsurVoucher.raq", prm);
		}
		if (data.aae140 == '110' || data.aae140 == '120') {

			fnPrintComm("zy_printInsurVoucher.raq", "YAC196=" + yac196);
		}

	}

	function fnClick_lxh(data, e) {
		var yae099 = data.yae099;
		if (yae099 == '' || yae099 == null) {
			alert("请选择需要打印的数据查询条件！");
			return;
		}
		var prm = "yae099=" + yae099;
		if (data.aae140 == '310') {
			fnPrintComm("yl_lxh.raq", prm);
		}
		if (data.aae140 == '110' || data.aae140 == '120') {
			fnPrintComm("zy_lxh.raq", prm);
		}

	}

	function fnClick_zyb(data, e) {
		var aac001 = data.aac001;
		if (aac001 == '' || aac001 == null) {
			alert("请选择需要打印的数据查询条件！");
			return;
		}
		var prm = "aac001=" + aac001;

		if (data.aae140 == '310') {
			fnPrintComm("yl_zyb.raq", prm);
		}
		if (data.aae140 == '110' || data.aae140 == '120') {
			fnPrintComm("zy_jxb.raq", prm);
		}
	}

	function fnClick_jz() {
		var rowdata = Base.getGridData("ic90list");

		var aac001 = "";
		var aae140 = "";
		if (rowdata.length > 0) {
			aac001 = rowdata[0].aac001;
			aae140 = rowdata[0].aae140;
		}
		if (aae140 == '110' || aae140 == '120') {
			alert("转移养老险种无需打印本表！");
			return;
		}
		if (aac001 == "") {
			alert("请选择需要打印的数据查询条件！");
			return;
		}
		var prm = "aac001=" + aac001;
		fnPrintComm("yl_bgxx.raq", prm);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>