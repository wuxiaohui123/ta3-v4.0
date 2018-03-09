<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>treamentQualifyPlan</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="认证计划[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="query" key="查询认证计划[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query();" asToolBarItem="true" />
		<ta:button id="resetbt" key="重置" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:panel cssStyle="margin:5px;" cols="3">
			<ta:number id="aae001" key="认证年度" required="true" max="9999" min="2000" bpopTipMsg="此处输入年度，如:2013" />
			<ta:selectInput id="yae019" key="认证次数" data="[{'id':'1','name':'1'},{'id':'2','name':'2'},{'id':'3','name':'3'},{'id':'4','name':'4'}]" required="true" value="1" display="false" />
			<ta:text id="aab999" key="单位编号" labelWidth="120" bpopTipMsg="单位名称、单位代码、单位ID" onChange="sfwQuery(2)" display="false" />
			<ta:text id="aae044" key="单位名称" cssStyle="margin-top:8px" labelWidth="120" span="2" readOnly="true" display="false" />
			<ta:text id="aab001" key="单位ID" cssStyle="margin-top:8px" readOnly="true" display="false" />
			<ta:text id="yab003" key="经办机构" cssStyle="margin-top:8px" readOnly="true" display="false" />
			<ta:text id="aae140" key="险种" cssStyle="margin-top:8px" labelWidth="120" display="false" />
		</ta:panel>
		<ta:panel id="ac90ListPanel" key="认证计划" fit="true" bodyStyle="margin:0px">
			<ta:datagrid id="ac90List" columnFilter="true" fit="true" haveSn="true" dblClickEdit="true">
				<ta:datagridItem id="aae044" key="单位名称" width="180" />
				<ta:datagridItem id="aac002" key="身份证号" width="180" />
				<ta:datagridItem id="aac003" key="姓名" width="130" />
				<ta:datagridItem id="aae005" key="联系电话" width="180">
					<ta:datagridEditor type="text" onChange="updateAae005" />
				</ta:datagridItem>
				<ta:datagridItem id="aae128" key="当前待遇" width="110" />
				<ta:datagridItem id="aae116" key="待遇发放状态" width="120" collection="AAE116" />
				<ta:datagridItem id="aic161" key="离退休类别" collection="AIC161" width="120" />
				<ta:datagridItem id="aic162" key="离退休日期" width="110" />
				<ta:datagridItem id="aae006" key="地址" width="110" />
				<ta:datagridItem id="aaz128" key="工伤申报ID" hiddenColumn="false" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
	});
	
	//流程流转
	function submitData() {
		Base.submit("form1,ac90List", "treamentQualifyPlanAction!transProcess.do");
	}

	function query() {
		Base.submit("form1", "treamentQualifyPlanAction!query.do");
	}

	function updateAae005(data, value) {
		var aaz128 = data.item.aaz128;
		var aae005 = value;
		Base.buttonsDialog("是否要修改电话号码?", 300, 150, [ {
			text : "确定",
			handler : function() {
				Base.submit("form1", "treamentQualifyPlanAction!UpdatePhone.do", {
					"dto['aaz128']" : aaz128,
					"dto['aae005']" : aae005
				}, null, false, function() {
					Base.submit("form1", "treamentQualifyPlanAction!query.do");
				});
			}
		}, {
			text : "取消",
			handler : function() {
				Base.submit("form1", "treamentQualifyPlanAction!query.do");
			}
		} ]);

	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
