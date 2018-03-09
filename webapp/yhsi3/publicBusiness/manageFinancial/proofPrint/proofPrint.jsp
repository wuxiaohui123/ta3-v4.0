<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>拨款凭证打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
			<ta:button id="printBtn" key="打印预览[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="false" scalable="false">
			<ta:text id="aaz010" key="当事人ID" maxLength="20" onChange="sfwQueryUtil(1,'getDSRXX',Base.getValue('aaz010'))" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" />
			<ta:text id="yaa030" key="当事人名称" readOnly="true" span="2" />
			<ta:text id="yad158" key="征集套账类型——dataGrid" display="false" />
			<ta:text id="aaz288" key="支付单ID" onChange="sfwQueryUtil(2,'getAAZ288',Base.getValue('aaz288'))" />
		</ta:panel>
		<ta:panel id="pnlPage" key="票据信息" cols="3" expanded="false" scalable="false" cssStyle="display:none">
			<ta:text id="yad163" key="开始编号" readOnly="true" />
			<ta:text id="yad164" key="结束编号" readOnly="true" />
			<ta:text id="yad165" key="当前编号" readOnly="true" />
			<ta:buttonLayout align="center" span="3">
				<ta:button id="zfBtn" key="作废[Z]" icon="xui-icon-spotDelete" hotKey="Z" onClick="fnZF();" />
			</ta:buttonLayout>
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="查询结果(请先勾选相同帐套类型的数据)">
				<ta:panel id="pel" fit="true">
					<ta:datagrid id="danjuGrid" fit="true" snWidth="30" haveSn="true" selectType="checkbox" onSelectChange="selectChage">
						<ta:datagridItem id="aaz288" key="征集通知ID" align="center" maxChart="7" />
						<ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="7" />
						<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" maxChart="20" />
						<ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" maxChart="6" totals="sum" />
						<ta:datagridItem id="yad158" key="征集帐套类型" align="center" collection="yad158" maxChart="6" />
						<ta:datagridItem id="yaf011" key="银行同城异地标志" align="center" collection="yaf011" maxChart="8" />
						<ta:datagridItem id="aae013" key="备注" align="center" maxChart="14" showDetailed="true" />
						<ta:datagridItem id="aae281" key="征集通知单据号" hiddenColumn="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.setDisabled("printBtn");
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
		initializeSuggestFramework(2, 'ad21', 'aaz288', 230, 200, 1, null, 0, false);
	});
	//当事人下拉回调
	function fnSelect1() {
		Base.setValue("aaz010", g_Suggest[1]);
		Base.setValue("yaa030", g_Suggest[2]);
		Base.clearGridData("danjuGrid");
		Base.submit("pnlJS", "proofPrintAction!toCheckAAZ010.do");
	}
	//查询
	function fnQuery() {
		Base.clearGridData("danjuGrid");
		Base.submit("pnlJS", "proofPrintAction!toCheckAAZ010.do");
	}
	//统计待处理金额总计
	function selectChage(rowsdata, n) {
		var rows = Base.getGridSelectedRows("danjuGrid");
		if (rows.length != 0) {
			var yad158 = rows[0].yad158;//征集帐套类型
			var isyad158 = true;
			//迭代比较征集帐套类型
			for (var i = 0; i < rows.length; i++) {
				if (yad158 != rows[i].yad158) {
					isyad158 = false;//征集帐套类型不一致 
				}
			}
			if (!isyad158) {
				Base.alert("征集帐套类型不一致！", "warn");
				Base.setDisabled("printBtn");
				return;
			} else {
				Base.setValue("yad158", yad158);
			}
			var yaf011 = rows[0].yaf011;//银行同城异地标志
			var isyaf011 = true;
			//迭代比较征集帐套类型
			for (var i = 0; i < rows.length; i++) {
				if (yaf011 != rows[i].yaf011) {
					isyaf011 = false;//银行同城异地标志不一致 
				}
			}
			if (!isyaf011) {
				Base.alert("银行同城异地标志不一致！", "warn");
				Base.setDisabled("printBtn");
				return;
			} else {
				Base.setEnable("printBtn");
			}
		} else {
			Base.setDisabled("printBtn");
		}
	}
	//打印预览
	function fnPrint() {
		var rows = Base.getGridSelectedRows("danjuGrid"); //获取表格选中行
		var yad158 = Base.getValue("yad158");
		if (rows.length == 0) {
			alert("请勾选要预览的单据！");
		} else {
			//判断处理单据是否为同一当事人
			var aaz010 = rows[0].aaz010;//
			var isTrue = true;
			for (var i = 0; i < rows.length; i++) {
				var yaa030 = rows[i].yaa030;
				rows[i].yaa030 = encodeURI(yaa030);
				if (aaz010 != rows[i].aaz010) {
					isTrue = false;
				}
			}
			if (!isTrue) {
				Base.alert("处理单据不属于同一当事人！", "warn");
				return;
			} else {
				var param = {};
				param.gridList = Ta.util.obj2string(rows);
				param["dto['yad158']"] = yad158;
				Base.openWindow("ourwin", "单据信息", "process/publicBusiness/manageFinancial/proofPrint/proofPrintAction!toPreview.do", param, "95%", "90%", null, function() {
					fnQuery();
				}, true);
			}
		}
	}
	//作废票据
	function fnZF() {
		Base.submit("pnlPages", "receiptSuperviseAction!toZF.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>