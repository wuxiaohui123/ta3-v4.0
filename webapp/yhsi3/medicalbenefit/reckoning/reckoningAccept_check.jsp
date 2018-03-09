<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构结算申请接受查看</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="queryBtn" key="关闭[C]"  icon="xui-icon-spotClose" hotKey="C" onClick="toClose()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs fit="true">
			<ta:tab key="个人账户门诊支出" id="tabdgrdReckoning" >
				<ta:panel id="panel1" key="个人账户" fit="true">
				<ta:datagrid id="dgrdReckoning"  haveSn="true" forceFitColumns="true" fit="true" >
					<ta:datagridItem id="aab019" key="项目" align="center" />
					<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
					<ta:datagridItem id="ake034" key="医保负担金额" align="center" dataAlign="right" />
				</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="基本医疗支出" id="tabdgJb">
				<ta:panel id="panel2" key="基本医疗" fit="true">
				<ta:datagrid id="dgJb"  haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aab019" key="项目" align="center" />
					<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
					<ta:datagridItem id="ake039" key="医保负担金额" align="center" dataAlign="right" />
				</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="居民医疗支出" id="tabdgCz">
				<ta:panel id="panel3" key="居民医疗" fit="true">
				<ta:datagrid id="dgCz"  haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aab019" key="项目" align="center" />
					<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
					<ta:datagridItem id="ake041" key="医保负担金额" align="center" dataAlign="right" />
				</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="公务员医疗支出" id="tabdgGb">
				<ta:panel id="panel4" key="公务员医疗" fit="true">
				<ta:datagrid id="dgGb"  haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aab019" key="项目" align="center" />
					<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
					<ta:datagridItem id="ake035" key="医保负担金额" align="center" dataAlign="right" />
				</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="大额医疗支出" id="tabdgDe">
				<ta:panel id="panel5" key="大额医疗" fit="true">
				<ta:datagrid id="dgDe" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aab019" key="项目" align="center" />
					<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
					<ta:datagridItem id="ake029" key="医保负担金额" align="center" dataAlign="right" />
				</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="特殊医疗支出" id="tabdgTs">
				<ta:panel id="panel6" key="特殊医疗" fit="true">
				<ta:datagrid id="dgTs"   haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="aab019" key="项目" align="center" />
					<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
					<ta:datagridItem id="ts" key="医保负担金额" align="center" dataAlign="right" />
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
	function toClose(){
		parent.Base.closeWindow("toCheck");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>