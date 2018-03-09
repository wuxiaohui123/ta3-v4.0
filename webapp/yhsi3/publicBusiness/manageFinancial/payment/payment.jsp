<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>基金支付登帐</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:panel id="pnlJS" key="查询条件" cols="3">
			<ta:box cols="2">
				<ta:text id="aaz010" key="当事人ID" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callDsrRPC()" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyDsrBtn" key="?" onClick="showDsrRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="yaa030" key="当事人名称" labelWidth="140" readOnly="true" span="2" />
			<ta:box cols="2">
				<ta:text id="aaz288" key="支付单ID" labelWidth="120" columnWidth="0.9" required="true" onChange="callZfdRPC()" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showZfdBtn" key="?" onClick="showZfdRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:date id="aae036_b" key="结算开始时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" />
			<ta:date id="aae036_e" key="结算截止时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" />
			<ta:number id="aae019" key="金额" labelWidth="120" min="0" precision="2" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="查询结果(请先勾选相同帐套类型的数据)">
				<ta:panel id="pel" fit="true" heightDiff="160">
					<ta:datagrid id="danjuGrid" forceFitColumns="true" fit="true" snWidth="30" haveSn="true" selectType="checkbox" columnFilter="true" onSelectChange="selectChage">
						<ta:datagridItem id="aaz288" key="拨付通知ID" align="center" width="150" />
						<ta:datagridItem id="aaz010" key="当事人ID" align="center" width="100" />
						<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" width="350" />
						<ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" width="100" totals="sum" tatalsTextShow="false" />
						<ta:datagridItem id="yad158" key="征集帐套类型" align="center" collection="yad158" width="100" />
						<ta:datagridItem id="aae036" key="结算时间" align="center" maxChart="4" showDetailed="true" />
						<ta:datagridItem id="aae013" key="备注" align="center" width="230" showDetailed="true" />
						<ta:datagridItem id="aae281" key="征集通知单据号" hiddenColumn="true" />
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="pnlFina" key="登帐信息" cols="3" height="155">
					<ta:box cols="2">
						<ta:text id="yaf010" key="社保机构银行帐号ID" required="true" maxLength="40" labelWidth="140" columnWidth="0.9" onChange="callBankRPC()" />
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showBankBtn" key="?" onClick="showBankRPC()" />
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
					<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" maxLength="60" readOnly="true" />
					<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" maxLength="60" readOnly="true" />
					<ta:selectInput id="aaa158" key="支付结算类型" labelWidth="140" collection="aaa158" required="true" />
					<ta:date id="aad017" key="支付时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" />
					<ta:number id="yad003" key="支付金额" alignLeft="true" required="true" precision="2" labelWidth="140" max="999999999999.99" />
					<ta:text id="aad009" key="支付票据编号" labelWidth="140" maxLength="20" />
					<ta:text id="aae008" key="银行编号" display="false" />
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:text id="heji" key="合计" display="false" />
					<ta:text id="yad158" key="征集套账类型-dataGrid" display="false" />
					<ta:text id="yad158_m" key="征集套账类型-rpc" display="false" />
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
		$("#yad003").css({
			"color" : "red",
			"font-weight" : "bold"
		});
		Base.setDisabled("saveBtn");
		Base.setReadOnly("yaf010,aae009,aae010,aaa158,aad017,yad003,aad009,aad127");
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
		initializeSuggestFramework(2, 'ad21', 'aaz288', 230, 200, 1, fnSelect2, 0, false);
		initializeSuggestFramework(3, null, 'yaf010', 600, 100, 4, fnSelect3, 0, false);
	});
	//当事人ID RPC
	function callDsrRPC() {
		sfwQueryUtil_newRPC(1, 'getDSRXXString', {
			"dto['inputString']" : Base.getValue('aaz010')
		});
	}
	function showDsrRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow06.do", null, 1000, 450, null, fn_setDsrData, true);
	}
	function fn_setDsrData() {
		Base.submit("pnlJS", "paymentAction!toCheckAAZ010.do");
	}
	//支付单RPC
	function callZfdRPC() {
		sfwQueryUtil(2, 'getAAZ288String', Base.getValue('aaz288'));
	}
	function showZfdRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow07.do", null, 1000, 450, null, fn_setZfdData, true);
	}
	function fn_setZfdData() {
		Base.submit("pnlJS", "paymentAction!toCheckAAZ010.do");
	}

	//当事人ID回调
	function fnSelect1() {
		Base.setValue("aaz010", g_Suggest[1]);
		Base.setValue("yaa030", g_Suggest[2]);
		Base.clearGridData("danjuGrid");
		Base.clearData("pnlFina");
		Base.submit("pnlJS", "paymentAction!toCheckAAZ010.do");
	}

	//征集ID回调
	function fnSelect2() {
		Base.clearGridData("danjuGrid");
		Base.clearData("pnlFina");
		Base.submit("pnlJS", "paymentAction!toCheckAAZ010.do");
	}

	//银行信息
	function fnSelect3() {
		Base.setValue("yaf010", g_Suggest[5]);
		Base.setValue("yae597", g_Suggest[0]);
		Base.setValue("aae009", g_Suggest[1]);
		Base.setValue("aae010", g_Suggest[2]);
		Base.setValue("yad158_m", g_Suggest[4]);
		Base.setValue("aae008", g_Suggest[6]);
		Base.focus("aaa158");
	}

	//查询
	function fnQuery() {
		Base.clearGridData("danjuGrid");
		Base.clearData("pnlFina");
		Base.submit("pnlJS", "paymentAction!toCheckAAZ010.do");
	}

	//保存
	function submitData() {
		var rows = Base.getGridSelectedRows("danjuGrid"); //获取表格选中行
		if (rows.length == 0) {
			Base.alert("请勾选要处理的单据！", "warn");
		} else {
			//判断处理单据是否为同一当事人
			var aaz010 = rows[0].aaz010; //当事人ID
			var yad158 = rows[0].yad158; //征集帐套类型
			var isTrue = true;
			var isyad158 = true;
			for (var i = 0; i < rows.length; i++) {
				if (aaz010 != rows[i].aaz010) {
					isTrue = false;
				}
				if (yad158 != rows[i].yad158) {
					isyad158 = false;
				}
			}
			if (!isTrue) {
				Base.alert("处理单据不属于同一当事人！", "warn");
				return;
			} else if (!isyad158) {
				Base.alert("征集帐套类型不一致！", "warn");
				return;
			} else if (Base.getValue("yad003") != Base.getValue("heji")) {
				Base.alert("处理金额不一致！", "warn");
				Base.setValue("yad003", "");
				Base.focus("yad003");
				return;
			} else if (Base.getValue("yad158") != Base.getValue("yad158_m")) {
				Base.alert("银行信息套账类型和征集单据的套账类型不一致", "warn");
				Base.setValue("yad158", "");
				Base.setValue("yaf010", "");
				Base.setValue("yae597", "");
				Base.setValue("aae010", "");
				Base.setValue("aae009", "");
				Base.focus("yaf010");
				return;
			} else {
				var param = {};
				param.gridList = Ta.util.obj2string(rows);
				Base.submit('form1', 'paymentAction!toSave.do', param);
			}
		}
	}

	//统计待处理金额总计
	function selectChage(rowsdata, n) {
		var rows = Base.getGridSelectedRows("danjuGrid");
		if (rows.length != 0) {
			var yad158 = rows[0].yad158; //征集帐套类型
			var isyad158 = true;
			//迭代比较征集帐套类型
			for (var i = 0; i < rows.length; i++) {
				if (yad158 != rows[i].yad158) {
					isyad158 = false; //征集帐套类型不一致 
				}
			}
			if (!isyad158) {
				Base.alert("征集帐套类型不一致！", "warn");
				Base.setValue("yad158", "");
				Base.setValue("yaf010", "");
				Base.setValue("yae597", "");
				Base.setValue("aae010", "");
				Base.setValue("aae009", "");
				Base.setDisabled("saveBtn");
				Base.setReadOnly("yaf010,aaa158,aad017,yad003,aad009,aad127");
				return;
			} else {
				Base.setValue("yad158", yad158);
				Base.setEnable("saveBtn,yaf010,aaa158,aad017,yad003,aad009,aad127");
			}
		} else {
			Base.setDisabled("saveBtn");
			Base.setReadOnly("yaf010,aaa158,aad017,yad003,aad009,aad127");
		}

		if ("0" != n) {
			var aae019 = 0;
			for ( var i in rowsdata) {
				aae019 += rowsdata[i].aae019;
			}
			aae019 = Math.round(aae019 * 100) / 100;
			Base.setValue("heji", aae019);
			Base.setValue("yad003", aae019);
		} else {
			Base.setValue("heji", "0");
			Base.setValue("yad003", "0");
		}
	}

	//多参数检索下拉框数据
	function callBankRPC() {
		suggestQuery(3, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
			"dto['inputString']" : Base.getValue('yaf010'),
			"dto['aae140']" : Base.getValue('yad158'),
			"dto['aaa082']" : "2"
		});
	}
	function showBankRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow05.do", {
			"dto['aae140']" : Base.getValue('yad158')
		}, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>