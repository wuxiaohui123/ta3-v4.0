<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>check1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]"
				hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
		    <ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output"   onClick="fnExpFile('list');" asToolBarItem="true"/>
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]"
				hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fld_emp" cols="4" key="查询条件" scalable="false">
			<ta:date id="aad017_b" key="到账开始日期" showSelectPanel="true" labelWidth="120"/>
			<ta:date id="aad017_e" key="到账结束日期" showSelectPanel="true" labelWidth="120"/>
			<ta:date id="aae036_b" key="经办开始日期" showSelectPanel="true" labelWidth="120"/>
			<ta:date id="aae036_e" key="经办结束日期" showSelectPanel="true" labelWidth="120"/>
			<ta:text id="aaz010" key="当事人ID" labelWidth="120" maxLength="20" onChange="sfwQueryUtil(1,'getDSRXX',Base.getValue('aaz010'))" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" />
			<ta:selectInput id="aaa028" key="当事人类别" labelWidth="120" collection="AAA028"/>
			<ta:selectInput id="aaf002" key="银行类别" labelWidth="120" collection="AAF002"/>
			<ta:selectInput id="aae011" key="登帐经办人员" labelWidth="120"/>
			<ta:text id="aaz288" key="业务单ID" labelWidth="120"/>
			<ta:selectInput id="aab033" key="征收方式" labelWidth="120" collection="AAB033"/>
			<ta:selectInput id="yad009" key="收支类型" labelWidth="120" collection="YAD009"/>
			<ta:selectInput id="aad016" key="结算方式" labelWidth="120"/>
			<ta:text id="yae594" key="文件名称" labelWidth="120"/>
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="详细信息">
				<ta:datagrid id="list" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true" onRowDBClick="dbClick">
					<ta:datagridItem id="aaz002" key="业务流水ID" align="center" dataAlign="center" width="120"/>
					<ta:datagridItem id="yad012" key="登帐事件ID" align="center" dataAlign="center"/>
					<ta:datagridItem id="aad017" key="收/付款时间" align="center" dataAlign="center" maxChart="6"/>
					<ta:datagridItem id="aae044" key="当事人名称" align="center" dataAlign="center" showDetailed="true" width="120"/>
					<ta:datagridItem id="yad003" key="金额" align="center" dataAlign="center" totals="sum" tatalsTextShow="false"/>
					<ta:datagridItem id="djxx" key="单据信息" align="center" dataAlign="center" showDetailed="true" width="160"/>
					<ta:datagridItem id="aaf002" key="银行类别" align="center" dataAlign="center" maxChart="6" collection="AAF002" showDetailed="true"/>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="center" collection="AAE011"/>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="140"/>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="center" collection="YAB003" width="140"/>
					<ta:datagridItem id="aad009" key="凭证编号" align="center" dataAlign="center" width="120"/>
					<ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="center" width="100" collection="AAB033"/>
					<ta:datagridItem id="aad016" key="结算方式" align="center" dataAlign="center" width="100" showDetailed="true"/>
					<ta:datagridItem id="yad009" key="收支类型" align="center" dataAlign="center" collection ="YAD009"/>
					<ta:datagridItem id="aae009" key="户名" align="center" dataAlign="center" width="160" hiddenColumn="true"/>
					<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="center" width="120" hiddenColumn="true"/>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key = "汇总信息">
				<ta:datagrid id="countList" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="dzbs" key="登帐笔数" align="center" dataAlign="center"/>
					<ta:datagridItem id="djbs" key="业务单据笔数" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae019" key="单据总金额" align="center" dataAlign="center"/>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	function queryData() {
		Base.submit("form1", "financeQueryAction!toQuery.do", null, null, null,null);
	}
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
	});
	
	function fnSelect1(){
	    Base.setValue("aaz010",g_Suggest[1]);
	}
	
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有数据需要导出,请确认!", "warn");
		}
	}
	
	function dbClick(e,row){
		var yad012 = row.yad012;
		Base.openWindow('userwin',"单据详细信息",myPath()
				+ "/process/publicBusiness/manageFinancial/billQuery/billQueryAction!dbClickbyYAD012.do",
						{"dto['yad012']" : yad012}, "95%", "90%", null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>