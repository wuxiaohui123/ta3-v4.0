<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pensionpaid</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="queryrfBtn" icon="xui-icon-query" key="查看补退信息" onClick="QueryPensionpaidRefund()" asToolBarItem="true" />
		<ta:button id="querymxBtn" icon="xui-icon-query" key="查看发放明细信息" onClick="QueryPensionpaidInfoDetail()" asToolBarItem="true" />
		<ta:button id="querylxtwjbBtn" icon="xui-icon-query" key="查看离休人员统筹外津补" onClick="QueryRetiredExterSub()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:date id="aae002" key="拨付期号" issue="true" showSelectPanel="true" required="true" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" />
		</ta:panel>
		<ta:panel id="pensionpaidPanel" key="拨付基本信息（双击查看变动明细）" fit="true">
			<ta:datagrid id="pensionpaidGrid" fit="true" columnFilter="true" haveSn="true" onRowDBClick="QueryPensionpaidDtail" selectType="radio">
				<ta:datagridItem id="aab001" key="单位编号" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" width="170" dataAlign="left" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aab019" key="单位类型" width="120" dataAlign="left" align="center" collection="AAB019">
				</ta:datagridItem>
				<ta:datagridItem id="aae002" key="月份" width="50" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="txrs" key="离退人数" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="txrs_s" key="离退人数（上月）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="swrs" key="死亡人数" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="grrs" key="供养人数" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="grrs_s" key="供养人数（上月）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="qtrs" key="其他人员人数" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="txf" key="离退费用" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="txf_s" key="离退费用（上月）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="zhfh" key="账户继承" totals="sum" width="100" collection="AAC063" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="ycxylj" key="一次性养老金" totals="sum" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="szf" key="丧葬费" totals="sum" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="ycxknbz" key="困难补助" totals="sum" width="120" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="knbz" key="困难补助" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="dqfxj" key="抚恤救济" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="dqfxj_s" key="抚恤救济（上月）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="bthj" key="补发费用不含企业发" totals="sum" width="120" dataAlign="right" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="fxj" key="一次性抚恤金" totals="sum" width="120" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="lxtcwjbtrs" key="离休人员统筹外津补贴人数" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="lxtcwjbt" key="离休人员统筹外津补贴" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="lxtcwjbtrs_s" key="离休人员统筹外津补贴人数（上月）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="lxtcwjbt_s" key="离休人员统筹外津补贴（上月）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="zfhj" key="支付合计" totals="sum" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="grzf" key="支付对象（个人）" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="dwzf" key="支付对象（单位）" totals="sum" width="160" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
	});
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function query(){
		Base.submit("form1", Base.getValue("qxkzAction")+"!query.do");
	}
	
	function QueryPensionpaidDtail(e, rowdata){
		Base.openWindow("pensionpaidDtail", ">>变动信息","pensionPaidInfoAction!queryDetail.do", {
			"dto['aab001']" : rowdata.aab001,
			"dto['aae002']" : rowdata.aae002,
			"dto['aae140']" : Base.getValue("aae140")
			}, "95%", "90%", null, null, true);	
	}
	
	function QueryPensionpaidRefund(){
	    var rowdata = Base.getGridSelectedRows("pensionpaidGrid");
	    if(rowdata==''||rowdata==null){
				 Base.alert("请选择一条数据！","warn");
				 return;
			 }
		Base.openWindow("pensionpaidRefund", ">>补退信息","pensionPaidInfoAction!queryRefund.do", {
			"dto['aab001']" : rowdata[0].aab001,
			"dto['aae002']" : rowdata[0].aae002,
			"dto['aae140']" : Base.getValue("aae140")
			}, "95%", "90%", null, null, true);	
	}
	
	function QueryPensionpaidInfoDetail(){
	    var rowdata = Base.getGridSelectedRows("pensionpaidGrid");
	    if(rowdata==''||rowdata==null){
				 Base.alert("请选择一条数据！","warn");
				 return;
			 }
		Base.openWindow("pensionpaidInfo",">>拨付明细信息","pensionPaidInfoAction!queryPensionpaidInfoDetail.do", {
			"dto['aab001']" : rowdata[0].aab001,
			"dto['aae002']" : rowdata[0].aae002,
			"dto['aae140']" : Base.getValue("aae140")
			}, "95%", "90%", null, null, true);	
	}
	
	function QueryRetiredExterSub(){
	    Base.openWindow("retiredExterSub",">>离休人员统筹外津补贴","<%=path%>/pensionbenefit/query/pensionpaidinfo/retiredExterSubAction.do", null, "95%", "90%", null, null, true);	
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>