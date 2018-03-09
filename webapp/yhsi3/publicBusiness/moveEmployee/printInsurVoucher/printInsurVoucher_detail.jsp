<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人账户详细信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:box id="procInc">
		<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
	</ta:box>
	<ta:form id="acountlist" fit="true">
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人账户总览" id="tab1">
				<ta:box height="90px">
					<ta:datagrid id="grzhList" fit="true" haveSn="true" fit="true">
						<ta:datagridItem key="账户编号" id="aaz116" align="center" dataAlign="left" width="100" />
						<ta:datagridItem key="个人编号" id="aac001" align="center" dataAlign="left" width="80" />
						<ta:datagridItem key="姓名" id="aac003" align="center" dataAlign="left" width="100" />
						<ta:datagridItem key="帐户类型" id="aaa119" align="center" collection="AAA119" dataAlign="left" width="200" />
						<ta:datagridItem key="建帐原因" id="aac062" align="center" width="100" dataAlign="left" collection="AAC062" />
						<ta:datagridItem key="建帐年月" id="aae206" align="center" width="80" dataAlign="center" />
						<ta:datagridItem key="本金" id="aae238" align="center" width="80" dataAlign="right" />
						<ta:datagridItem key="利息" id="aae239" align="center" width="80" dataAlign="right" />
						<ta:datagridItem key="支出" id="aae357" align="center" width="80" dataAlign="right" />
						<ta:datagridItem key="余额" id="yae417" align="center" width="100" dataAlign="right" />
						<ta:datagridItem key="有效标志" id="aae100" align="center" width="80" collection="AAE100" dataAlign="left" />
						<ta:datagridItem key="终结日期" id="aae237" align="center" width="80" dataAlign="center" />
					</ta:datagrid>
				</ta:box>
				<ta:box key="个人账户年度台账" fit="true">
					<ta:datagrid id="ndtzList" fit="true" groupingBy="aaz116" haveSn="true" fit="true">
						<ta:datagridItem key="账户编号" id="aaz116" align="center" dataAlign="left" />
						<ta:datagridItem key="个人编号" id="aac001" align="center" dataAlign="left" width="80" />
						<ta:datagridItem key="年度" id="aae001" align="center" dataAlign="center" />
						<ta:datagridItem key="截至上年末累计存储额" id="aae252" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末单位划转累计本金" id="aae253" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末个人划转累计本金" id="aae254" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末单位划转累计利息" id="aae256" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末个人划转累计利息" id="aae257" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末单位划转本息在本年产生的利息" id="aae259" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末个人划转本息在本年产生的利息" id="aae260" align="center" dataAlign="right" />
						<ta:datagridItem key="本年单位划转本金" id="aae262" align="center" dataAlign="right" />
						<ta:datagridItem key="本年单位划转本金产生的利息" id="aae263" align="center" dataAlign="right" />
						<ta:datagridItem key="本年个人划转本金" id="aae264" align="center" dataAlign="right" />
						<ta:datagridItem key="本年个人划转本金产生的利息" id="aae265" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末单位划转支出金额" id="aae285" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末个人划转支出金额" id="aae286" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末单位划转支出扣减利息" id="aae288" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末个人划转支出扣减利息" id="aae289" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末单位划转支出扣减利息在本年产生的利息" id="aae291" align="center" dataAlign="right" />
						<ta:datagridItem key="截至上年末个人划转支出扣减利息在本年产生的利息" id="aae292" align="center" dataAlign="right" />
						<ta:datagridItem key="本年单位支出本金" id="aae294" align="center" dataAlign="right" />
						<ta:datagridItem key="本年单位支出本金产生的利息" id="aae295" align="center" dataAlign="right" />
						<ta:datagridItem key="本年个人支出本金" id="aae296" align="center" dataAlign="right" />
						<ta:datagridItem key="本年个人支出本金产生的利息" id="aae297" align="center" dataAlign="right" />
					</ta:datagrid>
				</ta:box>
			</ta:tab>
			<ta:tab key="个人账户收支明细" id="tab2">
				<ta:panel id="pnlsr" key="个人账户收入明细" height="50%" expanded="false" scalable="false">
					<ta:datagrid id="ac53list" enableColumnMove="true" haveSn="true" border="true" snWidth="20">
						<ta:datagridItem id="aac001" key="个人编号" width="130" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aae341" key="筹资项目" collection="aae341" width="130" align="center" dataAlign="center" />
						<ta:datagridItem id="yad003" key="实处理金额" width="100" align="center" dataAlign="right" totals="sum" />
						<ta:datagridItem id="aae228" key="收入日期" width="130" align="center" dataAlign="center" />
						<ta:datagridItem id="yae101" key="计息开始时间" width="130" align="center" dataAlign="center" />
						<ta:datagridItem id="aae003" key="对应费款所属期" width="130" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="pnlzc" key="个人账户支出明细" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="ac55list" haveSn="true" snWidth="20">
						<ta:datagridItem id="aaz116" key="个人账户ID" width="120" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac001" key="人员ID" width="120" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="aae058" key="总金额" width="200" align="center" dataAlign="right" totals="sum" sortable="true" />
						<ta:datagridItem id="aae229" key="支出日期" width="200" align="center" dataAlign="center" sortable="true" />
						<ta:datagridItem id="aae003" key="对应费款所属期" width="200" align="center" dataAlign="center" sortable="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>