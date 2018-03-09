<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无报盘文件回盘</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout id="button" align="center">
			<ta:button id="queryBtn" icon="xui-icon-query" hotKey="Q" key="查询[Q]" onClick="query()" asToolBarItem="true" />
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="回盘处理" onClick="fn_toSave()" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:hidden;" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		<ta:panel id="fieldset2" cols="3" key="报盘查询条件">
			<ta:date id="aae002" key="做账期号" issue="true" showSelectPanel="true" required="true" labelWidth="130" />
			<ta:text id="aaz031" key="拨付通知ID" labelWidth="130" />
			<ta:text id="yae025" key="报盘批次号" labelWidth="130" display="false" />
			<ta:selectInput id="aae145" key="发放方式" collection="aae145" filter="11,14" reverseFilter="true" labelWidth="130" />
			<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="130" />
		</ta:panel>
		<ta:panel key="报盘文件信息（双击列表数据下方展示报盘明细）" id="bpfile" height="100">
			<ta:datagrid id="ae60list" height="100" forceFitColumns="true" fit="true" onRowDBClick="fn_queryinfo" haveSn="true">
				<ta:datagridItem id="aaz031" key="拨付通知ID" width="100" align="center" dataAlign="center" />
				<ta:datagridItem id="yae025" key="报盘批次号" width="100" align="center" dataAlign="center" />
				<ta:datagridItem id="yad169" key="支付对象" collection="YAD169" sortable="true" width="100" align="center" dataAlign="center" />
				<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" sortable="true" width="100" align="center" dataAlign="center" />
				<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" sortable="true" width="100" align="center" dataAlign="center" />
				<ta:datagridItem id="aae169" key="金额" align="center" dataAlign="right" totals="sum" />
				<ta:datagridItem id="yae202" key="总记录数" align="center" dataAlign="center" width="100" />
			</ta:datagrid>
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab id="tab1" key="报盘明细信息">
				<ta:panel key="报盘明细信息(双击标识此条记录支付失败，并在失败明细列表录入失败原因)" id="bpfileinfo" fit="true">
					<ta:datagrid id="ae60a1list" height="250" forceFitColumns="true" columnFilter="true" fit="true" onRowDBClick="dbClickfn" haveSn="true">
						<ta:datagridItem id="yae602" key="报盘事件ID" hiddenColumn="fasle" />
						<ta:datagridItem id="yae605" key="导盘业务明细ID" hiddenColumn="fasle" />
						<ta:datagridItem id="aad053" key="财务接口流水号" hiddenColumn="fasle" />
						<ta:datagridItem id="yae238" key="失败原因" align="center" dataAlign="right" hiddenColumn="false" />
						<ta:datagridItem id="yae594" key="报盘文件名" align="center" />
						<ta:datagridItem id="aad055" key="户名" align="center" dataAlign="left" />
						<ta:datagridItem id="yae202" key="序号" align="center" dataAlign="right" width="60" />
						<ta:datagridItem id="aad057" key="银行账号" align="center" dataAlign="right" width="80" />
						<ta:datagridItem id="aad059" key="金额" width="60" align="center" dataAlign="right" totals="sum" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" key="失败明细信息">
				<ta:panel key="失败明细信息(双击撤销标识此条记录支付失败)" id="bpfileinfosb" fit="true">
					<ta:datagrid id="ae60a1listsb" height="250" forceFitColumns="true" columnFilter="true" fit="true" onRowDBClick="sbdbClickfn" haveSn="true">
						<ta:datagridItem id="yae602" key="报盘事件ID" hiddenColumn="fasle" />
						<ta:datagridItem id="yae605" key="导盘业务明细ID" hiddenColumn="fasle" />
						<ta:datagridItem id="aad053" key="财务接口流水号" hiddenColumn="fasle" />
						<ta:datagridItem id="yae594" key="报盘文件名" align="center" hiddenColumn="false" />
						<ta:datagridItem id="aad055" key="户名" align="center" dataAlign="left" />
						<ta:datagridItem id="yae202" key="序号" align="center" dataAlign="right" width="60" />
						<ta:datagridItem id="aad057" key="银行账号" align="center" dataAlign="right" width="120" />
						<ta:datagridItem id="aad059" key="金额" align="center" dataAlign="right" totals="sum" />
						<ta:datagridItem id="yae238" key="失败原因" align="center" dataAlign="right">
							<ta:datagridEditor type="text" />
						</ta:datagridItem>
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
	
	function query() {
		Base.submit("form1", "paymentfailureAction!query.do");
	}

	function fn_queryinfo(e, rowdata) {
		Base.clearGridData("ae60a1listsb");
		var yae025 = rowdata.yae025;
		Base.submit(null, "paymentfailureAction!queryList.do", {"dto['yae025']" : yae025});
		Base.setValue("yae025", yae025);
	}

	function fn_toSave() {
		if (!confirm("请再次确认回盘数据是否录入正确！！！")) {
			return false;
		}
		var param = {};
		var griddata = Base.getGridData('ae60a1listsb');
		param.ae60a1listsb = Ta.util.obj2string(griddata);
		Base.submit("form1", "paymentfailureAction!toSave.do", param);
	}

	function dbClickfn(e, rowdata) {
		var row = rowdata.row;
		var yae602 = rowdata.yae602;
		var aad053 = rowdata.aad053;
		var yae594 = rowdata.yae594;
		var yae202 = rowdata.yae202;
		var aad055 = rowdata.aad055;
		var aad057 = rowdata.aad057;
		var aad059 = rowdata.aad059;
		var yae238 = rowdata.yae238;
		var yae605 = rowdata.yae605;
		Base.addGridRow("ae60a1listsb", {
			"yae602" : yae602,
			"aad053" : aad053,
			"yae594" : yae594,
			"yae202" : yae202,
			"aad055" : aad055,
			"aad057" : aad057,
			"aad059" : aad059,
			"yae238" : yae238,
			"yae605" : yae605
		});
		Base.deleteGridRow("ae60a1list", row);
	}

	function sbdbClickfn(e, rowdata) {
		var row = rowdata.row;
		var yae602 = rowdata.yae602;
		var aad053 = rowdata.aad053;
		var yae594 = rowdata.yae594;
		var yae202 = rowdata.yae202;
		var aad055 = rowdata.aad055;
		var aad057 = rowdata.aad057;
		var aad059 = rowdata.aad059;
		var yae238 = rowdata.yae238;
		Base.addGridRow("ae60a1list", {
			"yae602" : yae602,
			"aad053" : aad053,
			"yae594" : yae594,
			"yae202" : yae202,
			"aad055" : aad055,
			"aad057" : aad057,
			"aad059" : aad059,
			"yae238" : yae238
		});
		Base.deleteGridRow("ae60a1listsb", row);
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>