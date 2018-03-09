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
	<ta:form id="from1" cssStyle="overflow:auto;" fit="true">
		<ta:toolbar id="tlb">
			<ta:buttonLayout id="button" align="center">
				<ta:button id="queryBtn" icon="xui-icon-query" hotKey="Q" key="查询[Q]" onClick="toQuery()" asToolBarItem="true" />
				<ta:button id="saveBtn" icon="xui-icon-spotSave" key="回盘处理" onClick="fn_toSave()" asToolBarItem="true" />
				<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:panel id="fieldset2" cols="3" key="报盘查询条件">
			<ta:date id="aae036_b" key="经办开始时间" showSelectPanel="true" labelWidth="130" datetime="false" validNowTime="left" />
			<ta:date id="aae036_e" key="经办结束时间" showSelectPanel="true" labelWidth="130" datetime="false" validNowTime="left" />
			<ta:text id="yae594" key="报盘文件名" labelWidth="130" />
		</ta:panel>
		<ta:panel key="报盘文件信息（双击列表数据下方展示报盘明细）" id="bpfile" height="120">
			<ta:datagrid id="ae60list" height="100" forceFitColumns="true" fit="true" onRowDBClick="fn_queryinfo" haveSn="true">
				<ta:datagridItem id="yad158" key="征集帐套类型" align="center" collection="yad158" width="100" />
				<ta:datagridItem id="yae602" key="导盘事件ID" align="center" dataAlign="left" hiddenColumn="false" />
				<ta:datagridItem id="aaz002" key="业务日志ID" align="center" dataAlign="left" hiddenColumn="false" />
				<ta:datagridItem id="yae594" key="导盘文件名" align="center" dataAlign="left" maxChart="10" />
				<ta:datagridItem id="wbf_rs" key="还未退款人数" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="wbf_aae019" key="还未退款金额" align="center" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="ybf_rs" key="已退款人数" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="ybf_aae019" key="已退款金额" align="center" dataAlign="right" maxChart="5" />
				<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" maxChart="4" collection="AAE011" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="left" maxChart="8" />
				<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" maxChart="6" collection="YAB003" />
			</ta:datagrid>
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab id="tab1" key="报盘明细信息">
				<ta:panel key="报盘明细信息(双击标识此条记录支付失败)" id="bpfileinfo" fit="true">
					<ta:datagrid id="ad21List" forceFitColumns="true" fit="true" haveSn="true" onRowDBClick="dbClickfn">
						<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" key="失败明细信息">
				<ta:panel key="失败明细信息(双击撤销标识此条记录支付失败)" id="bpfileinfosb" fit="true">
					<ta:datagrid id="ad21Listsb" forceFitColumns="true" fit="true" haveSn="true" onRowDBClick="sbdbClickfn">
						<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab3" key="登帐信息">
				<ta:panel id="pnlFina" key="登帐信息" cols="3" expanded="false" scalable="false">
					<ta:text id="yaf010" key="社保机构银行帐号ID" required="true" labelWidth="140" maxLength="40" onChange="fnBankXX()" />
					<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
					<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" maxLength="60" readOnly="true" />
					<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" maxLength="60" readOnly="true" />
					<ta:selectInput id="aaa158" key="支付结算类型" labelWidth="140" collection="aaa158" required="true" />
					<ta:date id="aad017" key="支付时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" />
					<ta:number id="yad003" key="支付金额" alignLeft="true" required="true" precision="2" labelWidth="140" max="999999999999.99" />
					<ta:text id="aad009" key="支付票据编号" labelWidth="140" maxLength="20" />
					<ta:text id="aae008" key="银行编号" display="false" />
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:number id="heji" key="合计" display="false" precision="2" labelWidth="140" max="999999999999.99" />
					<ta:text id="yad158" key="征集套账类型——dataGrid" display="false" />
					<ta:text id="yad158_m" key="征集套账类型——rpc" display="false" />
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("#yad003").css({
			"color" : "red",
			"font-weight" : "bold"
		})
		initializeSuggestFramework(3, null, 'yaf010', 600, 100, 4, fnSelect3, 0, false);
	});
	//银行信息
	function fnSelect3() {
		Base.setValue("yaf010", g_Suggest[5]);
		Base.setValue("yae597", g_Suggest[0]);
		Base.setValue("aae009", g_Suggest[1]);
		Base.setValue("aae010", g_Suggest[2]);
		Base.setValue("yad158_m", g_Suggest[4]);
		Base.setValue("aae008", g_Suggest[6]);
	}

	//多参数检索下拉框数据
	function fnBankXX() {
		suggestQuery(3, myPath() + "/process/comm/suggestFrameworkAction!getBankInjb_JJSZ.do", {
			"dto['jstj']" : Base.getValue('yaf010'),
			"dto['yad158']" : Base.getValue('yad158'),
			"dto['aaa082']" : "2"
		});
	}

	function toQuery() {
		Base.submit("fieldset2", "fundTkfileHpPaymentAction!toQuery.do");
	}

	function fn_queryinfo(e, rowdata) {
		Base.clearGridData("ad21List");
		Base.clearGridData("ad21Listsb");
		var yae602 = rowdata.yae602;
		Base.submit("", "fundTkfileHpPaymentAction!queryAD21List.do", {
			"dto['yae602']" : yae602
		});
		Base.setValue("yad158", rowdata.yad158);
		Base.setValue("heji", rowdata.wbf_aae019);
		Base.setValue("yad003", rowdata.wbf_aae019);
	}

	function dbClickfn(e, rowdata) {
		var row = rowdata.row;
		var aaz288 = rowdata.aaz288;
		var aaz010 = rowdata.aaz010;
		var aae044 = rowdata.aae044;
		var yad009 = rowdata.yad009;
		var yad001 = rowdata.yad001;
		var aab033 = rowdata.aab033;
		var yad005 = rowdata.yad005;
		var yad006 = rowdata.yad006;
		var aaz022 = rowdata.aaz022;
		var aae011 = rowdata.aae011;
		var aae036 = rowdata.aae036;
		var yab003 = rowdata.yab003;
		var aae019 = Math.round(Base.getValue("heji") * 100) / 100 - Math.round(yad001 * 100) / 100;
		Base.setValue("heji", aae019);
		Base.setValue("yad003", aae019);
		Base.addGridRow("ad21Listsb", {
			"aaz288" : aaz288,
			"aaz010" : aaz010,
			"aae044" : aae044,
			"yad009" : yad009,
			"yad001" : yad001,
			"aab033" : aab033,
			"yad005" : yad005,
			"yad006" : yad006,
			"aaz022" : aaz022,
			"aae011" : aae011,
			"aae036" : aae036,
			"yab003" : yab003
		});
		Base.deleteGridRow("ad21List", row);
	}

	function sbdbClickfn(e, rowdata) {
		var row = rowdata.row;
		var aaz288 = rowdata.aaz288;
		var aaz010 = rowdata.aaz010;
		var aae044 = rowdata.aae044;
		var yad009 = rowdata.yad009;
		var yad001 = rowdata.yad001;
		var aab033 = rowdata.aab033;
		var yad005 = rowdata.yad005;
		var yad006 = rowdata.yad006;
		var aaz022 = rowdata.aaz022;
		var aae011 = rowdata.aae011;
		var aae036 = rowdata.aae036;
		var yab003 = rowdata.yab003;
		var aae019 = Math.round(Base.getValue("heji") * 100) / 100 + Math.round(yad001 * 100) / 100;
		Base.setValue("heji", aae019);
		Base.setValue("yad003", aae019);
		Base.addGridRow("ad21List", {
			"aaz288" : aaz288,
			"aaz010" : aaz010,
			"aae044" : aae044,
			"yad009" : yad009,
			"yad001" : yad001,
			"aab033" : aab033,
			"yad005" : yad005,
			"yad006" : yad006,
			"aaz022" : aaz022,
			"aae011" : aae011,
			"aae036" : aae036,
			"yab003" : yab003
		});
		Base.deleteGridRow("ad21Listsb", row);
	}

	function fn_toSave() {
		var yad158 = Base.getValue("yad158");//征集帐套类型
		Base.activeTab("tab3");
		if (yad158 != Base.getValue("yad158_m")) {
			Base.alert("银行信息套账类型和征集单据的套账类型不一致", "warn");
			Base.setValue("yad158", "");
			Base.setValue("yaf010", "");
			Base.setValue("yae597", "");
			Base.setValue("aae010", "");
			Base.setValue("aae009", "");
			Base.focus("yaf010");
			return;
		}

		if (Base.getValue("yad003") != Base.getValue("heji")) {
			Base.alert("处理金额不一致！", "warn");
			Base.setValue("yad003", "");
			Base.focus("yad003");
			return;
		}

		var ad21List = Base.getGridData('ad21List');
		var size = ad21List.length;
		if (size == 0) {
			alert("没有需要回盘的数据，请确认!");
			return;
		}
		if (!confirm("本次回盘 " + size + "条记录，请确认！")) {
			return false;
		}
		var param = {};
		param.ad21List = Ta.util.obj2string(ad21List);
		Base.submit("from1", "fundTkfileHpPaymentAction!toSave.do", param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>