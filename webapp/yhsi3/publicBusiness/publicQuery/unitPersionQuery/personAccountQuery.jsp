<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人账户信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box key=">>查询条件" cols="3" id="fltPerson" columnWidth="0.2">
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac003" key="姓名" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" />
		</ta:box>
		<ta:fieldset key=">>查询结果" columnWidth="0.8">
			<ta:tabs id="tabs" fit="true">
				<ta:tab id="tab1" key="个人账户信息">
					<ta:panel>
						<ta:datagrid id="datagrid41" haveSn="true" forceFitColumns="true" height="200px;">
							<ta:datagridItem key="帐户类型" id="aaa119" align="center" collection="AAA119" dataAlign="left" width="200" />
							<ta:datagridItem key="建帐原因" id="aac062" align="center" maxChart="10" dataAlign="left" collection="AAC062" />
							<ta:datagridItem key="建帐年月" id="aae206" align="center" width="80" dataAlign="center" />
							<ta:datagridItem key="本息和" id="hj" align="center" maxChart="4" dataAlign="right" />
							<ta:datagridItem key="本金" id="aae238" align="center" width="80" dataAlign="right" />
							<ta:datagridItem key="利息" id="aae239" align="center" width="80" dataAlign="right" />
							<ta:datagridItem key="支出" id="aae357" align="center" width="80" dataAlign="right" />
							<ta:datagridItem key="余额" id="aae240" align="center" width="100" dataAlign="right" />
							<ta:datagridItem key="有效标志" id="aae100" align="center" width="80" collection="AAE100" dataAlign="left" />
							<ta:datagridItem key="终结日期" id="aae237" align="center" width="80" dataAlign="center" dataType="date" />
						</ta:datagrid>
					</ta:panel>
					<ta:panel key="个人账户年度台账" fit="true">
						<ta:datagrid id="datagrid42" groupingBy="aaz116" haveSn="true" onRowDBClick="fnClick" forceFitColumns="true">
							<ta:datagridItem key="账户编号" id="aaz116" align="center" dataAlign="left" hiddenColumn="true" />
							<ta:datagridItem key="个人编号" id="aac001" align="center" dataAlign="left" width="80" hiddenColumn="true" />
							<ta:datagridItem key="年度" id="aae001" align="center" dataAlign="center" />
							<ta:datagridItem key="截至上年末累计存储额" id="aae252" align="center" dataAlign="right" maxChart="10" />
							<ta:datagridItem key="截至上年末单位划转累计本金" id="aae253" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末个人划转累计本金" id="aae254" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转累计利息" id="aae256" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末个人划转累计利息" id="aae257" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转本息在本年产生的利息" id="aae259" align="center" dataAlign="right" maxChart="19" />
							<ta:datagridItem key="截至上年末个人划转本息在本年产生的利息" id="aae260" align="center" dataAlign="right" maxChart="19" />
							<ta:datagridItem key="本年单位划转本金" id="aae262" align="center" dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年单位划转本金产生的利息" id="aae263" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="本年个人划转本金" id="aae264" align="center" dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年个人划转本金产生的利息" id="aae265" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转支出金额" id="aae285" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末个人划转支出金额" id="aae286" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转支出扣减利息" id="aae288" align="center" dataAlign="right" maxChart="15" />
							<ta:datagridItem key="截至上年末个人划转支出扣减利息" id="aae289" align="center" dataAlign="right" maxChart="15" />
							<ta:datagridItem key="截至上年末单位划转支出扣减利息在本年产生的利息" id="aae291" align="center" dataAlign="right" maxChart="23" />
							<ta:datagridItem key="截至上年末个人划转支出扣减利息在本年产生的利息" id="aae292" align="center" dataAlign="right" maxChart="23" />
							<ta:datagridItem key="本年单位支出本金" id="aae294" align="center" dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年单位支出本金产生的利息" id="aae295" align="center" dataAlign="right" maxChart="13" />
							<ta:datagridItem key="本年个人支出本金" id="aae296" align="center" dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年个人支出本金产生的利息" id="aae297" align="center" dataAlign="right" maxChart="13" />
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
				<ta:tab id="tab2" key="个人账户收支明细">
					<ta:panel id="fld_ac53" key="个人账户收入明细" columnWidth="0.8">
						<ta:datagrid id="ac53Grid" forceFitColumns="true" groupingBy="aaz116" height="200px;">
							<ta:datagridItem key="个人账户ID" id="aaz116" align="center" dataAlign="left" width="200px" />
							<ta:datagridItem key="险种类型" id="aae140" align="center" collection="AAE140" width="200px" dataAlign="left" />
							<ta:datagridItem key="对应费款所属期" id="aae003" align="center" width="100px" dataAlign="center" />
							<ta:datagridItem key="收入日期" id="aae228" align="center" width="200px" dataAlign="center" dataType="date" />
							<ta:datagridItem key="实处理金额" id="yad003" align="center" width="200px" dataAlign="right" />
							<ta:datagridItem key="计息开始时间" id="yae101" align="center" width="200px" dataAlign="center" dataType="date" />
						</ta:datagrid>
					</ta:panel>
					<ta:panel id="fld_ac55" key="个人账户支出明细" columnWidth="0.2">
						<ta:datagrid id="ac55Grid" groupingBy="aaz116" heightDiff="100" forceFitColumns="true">
							<ta:datagridItem key="个人账户ID" id="aaz116" align="center" dataAlign="left" width="200px" />
							<ta:datagridItem key="险种类型" id="aae140" width="200px" align="center" collection="AAE140" dataAlign="left" />
							<ta:datagridItem key="对应费款所属期" id="aae003" align="center" width="100px" dataAlign="center" />
							<ta:datagridItem key="支出日期" id="aae229" align="center" width="200px" dataAlign="center" dataType="date" />
							<ta:datagridItem key="总金额" id="aae058" align="center" dataAlign="right" width="200px" />
							<ta:datagridItem key="计息开始时间" id="yae101" align="center" width="200px" dataAlign="center" dataType="date" />
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
			</ta:tabs>
		</ta:fieldset>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
		Base.focus("aac001");
		Base.slideUpFieldset("fld_ac55");
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
		Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/personAccountQueryAction!toQuery.do"); //调用功能界面业务方法
	}

	function fnQuery() {
		Base.clearGridData("datagrid41");
		Base.clearGridData("datagrid42");
		Base.clearGridData("ac53Grid");
		Base.clearGridData("ac55Grid");
		if (g_Suggest != "") {
			Base.setValue("aac001", g_Suggest[2]);
			Base.setValue("aac003", g_Suggest[1]);
			Base.setValue("aac002", g_Suggest[0]);
			Base.submit("form1", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/personAccountQueryAction!toQuery.do");
			//
			//Base.slideDownFieldset("fld_ac53");
		}
	}

	function fnClick(e, rowdata) {
		Base.openWindow("info", rowdata.aae001 + "年度收入详细情况", "personAccountQueryAction!toOpen.do", {
			"dto['aae003']" : rowdata.aae001,
			"dto['aac001']" : Base.getValue("aac001")
		}, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>