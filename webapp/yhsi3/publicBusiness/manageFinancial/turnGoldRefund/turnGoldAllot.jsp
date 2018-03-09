<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>待转金指定单据分配</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" icon="xui-icon-query" hotKey="Q" id="queryBtn" asToolBarItem="true" onClick="toQuery();" />
		<ta:button key="保存[S]" icon="xui-icon-spotSave" hotKey="S" id="saveBtn" asToolBarItem="true" onClick="toSave();" />
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" id="resetBtn" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="frm" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="flst1" key="单位基本信息" cols="3" expanded="false" scalable="false">
			<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			<ta:text id="aaz002" key="业务日志ID" display="false" />
			<ta:text id="tmpString" key="临时数据" display="false" />
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab key="单据待分配信息">
				<ta:box height="100%" cols="2">
					<ta:box height="100%" columnWidth="0.2" cssStyle="margin-left:1px;">
						<ta:panel key="待转金与单据金额对比信息" fit="true">
							<ta:datagrid id="dg_dzj" forceFitColumns="true" enableColumnMove="false" fit="true">
								<ta:datagridItem id="aae140" key="险种类型" align="center" showDetailed="true" collection="AAE140" dataAlign="left" maxChart="5"></ta:datagridItem>
								<ta:datagridItem id="yae080" key="待转金余额" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
								<ta:datagridItem id="aae120" key="单据金额" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							</ta:datagrid>
						</ta:panel>
					</ta:box>
					<ta:box height="100%" columnWidth="0.8" cssStyle="margin-left:1px;">
						<ta:panel key="单位单据信息" fit="true">
							<ta:buttonLayout align="left">
								<ta:button key="勾选确认[A]" icon="xui-icon-accept" hotKey="A" id="acceptBtn" onClick="fnSaveOrReset('1','danjuGrid','aaz288','0')" />
								<ta:button key="重新勾选[R]" icon="xui-icon-accept" hotKey="R" id="reAcceptBtn" onClick="fnSaveOrReset('0','danjuGrid','aaz288','0')" />
							</ta:buttonLayout>
							<ta:datagrid id="danjuGrid" enableColumnMove="false" onRowDBClick="dbClick" snWidth="30" haveSn="true" fit="true" selectType="checkbox" forceFitColumns="true">
								<ta:datagridItem id="aaz288" key="征集通知ID" align="center" maxChart="6" dataAlign="center" />
								<ta:datagridItem id="aaz010" key="当事人ID" align="center" width="110" dataAlign="center" hiddenColumn="false" />
								<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" width="250" hiddenColumn="false" />
								<ta:datagridItem id="aab033" key="征收方式" align="center" collection="AAB033" maxChart="4" dataAlign="center" />
								<ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" showDetailed="true" totals="sum" tatalsTextShow="false" maxChart="6" />
								<ta:datagridItem id="aae041" key="开始期号" dataAlign="right" align="center" />
								<ta:datagridItem id="aae042" key="结束期号" dataAlign="right" align="center" />
								<ta:datagridItem id="aae281" key="征集通知单据号" hiddenColumn="true" />
							</ta:datagrid>
						</ta:panel>
					</ta:box>
				</ta:box>
			</ta:tab>
			<ta:tab key="待转金支出记录" id="zcjl">
				<ta:datagrid id="dg_mx" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120" hiddenColumn="false"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="170" hiddenColumn="false"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="7" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aaa117" key="收支类型" align="center" dataAlign="center" maxChart="5" collection="AAA117"></ta:datagridItem>
					<ta:datagridItem id="yae080" key="待转金金额" align="center" dataAlign="right" maxChart="6" dataType="Number" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="yad003" key="本次使用金额" align="center" dataAlign="right" maxChart="6" dataType="Number" totals="sum" tatalsTextShow="false"></ta:datagridItem>
					<ta:datagridItem id="aaa028" key="当事人类别" align="center" dataAlign="center" width="100" collection="AAA028" hiddenColumn="false"></ta:datagridItem>
					<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" maxChart="20" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" maxChart="3"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="6" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="AAB301" maxChart="7"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab24" key="事件流程信息">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Ta.autoPercentHeight();
		Base.activeTab("tab_dzj");
		Base.focus("aab001");
		Base.setDisabled("saveBtn");
		Base.setDisabled("acceptBtn");
		Base.setDisabled("reAcceptBtn");
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});
	//单位RPC回调
	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.submit("flst1", "turnGoldAllotAction!toQuery.do");
		}
	}
	//query
	function toQuery() {
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' || aab001 == null) {
			Base.alert("单位编号不能为空!", "warn");
			return;
		}
		Base.submit("flst1", "turnGoldAllotAction!toQuery.do");
	}
	//金额校验
	function fnJEChange(data, value) {
		Base.setEnable("saveBtn");
		var yae080 = data.item.yae080;
		var yad001 = data.item.yad001;
		if (yad001 > yae080) {
			Base.alert("退款金额不能大于待转金余额!", "warn");
			Base.setDisabled("saveBtn");
			return;
		}
	}
	//accept
	function toAccept() {
		var rowdata = Base.getGridSelectedRows("danjuGrid");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要分配的单据信息!", "warn");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst1", "turnGoldAllotAction!toAccept.do", param);
	}
	//reAccept
	function toReAccept() {
		var rowdata = '';
		var param = {};

		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst1", "turnGoldAllotAction!toAccept.do", param);
	}
	//save
	function toSave() {
		var rowdata = Base.getGridSelectedRows("dg_dzj");
		var rows = Base.getGridSelectedRows("danjuGrid");
		var param = {};
		param.d2List = Ta.util.obj2string(rowdata);
		param.d3List = Ta.util.obj2string(rows);
		Base.submit("flst1", "turnGoldAllotAction!toSave.do", param);
	}

	//bz='1'确认勾选,bz='0'取消 
	//ids 为所操作grid的id(只支持单个)
	//cel 为grid某列的id,只要不为空即可，最好为aab001，aac001 一类
	//flag 需要设置一个text隐藏域来设置选择标志 初始值为0
	function fnSaveOrReset(bz, ids, cel, flag) {
		var selectedRows = Base.getGridSelectedRows(ids);

		var temp = '[';
		var rows = Base.getObj(ids);//获取列表数据
		var celtemp;
		if (bz == 1) {
			for (var i = 0; i < selectedRows.length; i++) {
				celtemp = "selectedRows[" + i + "]." + cel;
				temp = temp + "{" + cel + ":" + eval(celtemp) + "},";
			}
			temp = temp.substring(0, temp.length - 1) + "]";
			Base.setValue(flag, "1");
			$("#" + ids).find("input[type='checkbox']").attr('disabled', 'disabled');
			toAccept();
			Base.setDisabled("acceptBtn");
			Base.setEnable("reAcceptBtn");
			Base.setEnable("saveBtn");
		} else {
			Base.setValue(flag, "0");
			for (var i = 0; i < selectedRows.length; i++) {
				celtemp = "selectedRows[" + i + "]." + cel;
				temp = temp + "{" + cel + ":" + eval(celtemp) + "},";
			}

			temp = temp.substring(0, temp.length - 1) + "]";
			rows.setSelectedRows([]);//将选中复选框全部清空
			toReAccept();
			Base.setEnable("acceptBtn");
			Base.setDisabled("saveBtn");
			Base.setDisabled("reAcceptBtn");
		}

	}

	function dbClick(e, row) {
		var aaz288 = row.aaz288;
		var sfxxgrmx = '1'; //显示个人征集明细
		Base.openWindow('userwin', "单据详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitInfoComQueryAction!dbClick.do", {
			"dto['aaz288']" : aaz288,
			"dto['sfxxgrmx']" : sfxxgrmx
		}, "95%", "90%", null, null, true);
	}

	//打开新的窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			Base.submit("flst1", "turnGoldAllotAction!toQuery.do");
		}, true);
	}
	//RPC方法调用
	function callRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
