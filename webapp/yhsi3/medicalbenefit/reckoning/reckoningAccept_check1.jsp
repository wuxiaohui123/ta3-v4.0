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
		<ta:toolbarItem id="queryBtn" key="关闭[C]"  icon="xui-icon-query" hotKey="C" onClick="toClose()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true">
		<ta:tab id="tabdgrdReckoning1" key="工伤基金支出">
		<ta:panel id="pnlReckoning1" key="工伤基金" fit="true" >
			<ta:datagrid id="dgrdReckoning1"  fit="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aab019" key="项目" align="center" />
				<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
				<ta:datagridItem id="yle001" key="医保负担金额" align="center" dataAlign="right" />
			</ta:datagrid> 
		</ta:panel>
		</ta:tab>
		<ta:tab id="tabdgrdReckoning2" key="生育基金支出">
		<ta:panel id="pnlReckoning2" key="生育基金" fit="true" >
			<ta:datagrid id="dgrdReckoning2"  fit="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aab019" key="项目" align="center" />
				<ta:datagridItem id="rc" key="次" align="center" dataAlign="right" />
				<ta:datagridItem id="ame001" key="医保负担金额" align="center" dataAlign="right" />
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
		parent.Base.closeWindow("toCheck1");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>