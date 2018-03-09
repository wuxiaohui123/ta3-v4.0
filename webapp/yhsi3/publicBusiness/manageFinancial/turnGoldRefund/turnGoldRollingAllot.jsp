<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>待转金滚动分配</title>
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
		<ta:panel key="基金征集信息" cols="3" id="fltBushou" expanded="false" scalable="false">
			<ta:selectInput id="yae581" key="利息征收标志" collection="yae581" labelWidth="120" required="true" />
			<ta:selectInput id="yae579" key="滞纳金征收标志" collection="yae579" labelWidth="120" required="true" />
			<ta:date id="aae042" key="滞纳金结束日期" showSelectPanel="true" labelWidth="120" onChange="fnCheckDate()" />
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab key="欠费待分配信息">
				<ta:box height="100%" cols="2">
					<ta:box height="100%" columnWidth="0.2" cssStyle="margin-left:1px;">
						<ta:panel key="待转金与欠费对比信息" fit="true">
							<ta:datagrid id="dg_dzj" forceFitColumns="true" fit="true">
								<ta:datagridItem id="aae140" key="险种类型" align="center" showDetailed="true" collection="AAE140" dataAlign="left" maxChart="8" />
								<ta:datagridItem id="yae080" key="待转金余额" align="center" dataAlign="right" maxChart="4" />
								<ta:datagridItem id="aae120" key="欠费金额" align="center" dataAlign="right" maxChart="4" />
							</ta:datagrid>
						</ta:panel>
					</ta:box>
					<ta:box height="100%" columnWidth="0.8" cssStyle="margin-left:1px;">
						<ta:panel key="单位欠费信息" fit="true">
							<ta:buttonLayout align="left">
								<ta:button key="勾选确认[A]" icon="xui-icon-accept" hotKey="A" id="acceptBtn" onClick="fnSaveOrReset('1','dg_hd','yae518','0')" />
								<ta:button key="重新勾选[R]" icon="xui-icon-accept" hotKey="R" id="reAcceptBtn" onClick="fnSaveOrReset('0','dg_hd','yae518','0')" />
							</ta:buttonLayout>
							<ta:datagrid id="dg_hd" enableColumnMove="true" fit="true" snWidth="30" haveSn="true" selectType="checkbox">
								<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
								<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="170"></ta:datagridItem>
								<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="140"></ta:datagridItem>
								<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" width="100"></ta:datagridItem>
								<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" width="100"></ta:datagridItem>
								<ta:datagridItem id="aaa115" key="应缴类型" align="center" dataAlign="left" width="100" collection="AAA115"></ta:datagridItem>
								<ta:datagridItem id="yac084" key="离退休标志" align="center" dataAlign="left" width="100" collection="YAC084"></ta:datagridItem>
								<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" width="100"></ta:datagridItem>
								<ta:datagridItem id="aab084" key="工资总额" align="center" dataAlign="right" width="100"></ta:datagridItem>
								<ta:datagridItem id="yad001" key="处理金额" align="center" dataAlign="right" width="100"></ta:datagridItem>
								<ta:datagridItem id="yae518" key="当事人核定ID" align="center" dataAlign="left" width="160"></ta:datagridItem>
								<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
								<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="140" sortable="true"></ta:datagridItem>
								<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="AAB301" width="160"></ta:datagridItem>
							</ta:datagrid>
						</ta:panel>
					</ta:box>
				</ta:box>
			</ta:tab>
			<ta:tab key="基金征集信息" id="zjxx">
				<ta:datagrid id="dg_history" enableColumnMove="false" fit="true" forceFitColumns="true" snWidth="30" haveSn="true">
					<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="待转金支出记录">
				<ta:datagrid id="dg_mx" enableColumnMove="false" fit="true" forceFitColumns="true" snWidth="30" haveSn="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="170"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="140"></ta:datagridItem>
					<ta:datagridItem id="aaa028" key="当事人类别" align="center" dataAlign="center" width="100" collection="AAA028"></ta:datagridItem>
					<ta:datagridItem id="aaa117" key="收支类型" align="center" dataAlign="center" width="120" collection="AAA117"></ta:datagridItem>
					<ta:datagridItem id="yae080" key="余额" align="center" dataAlign="right" width="100" dataType="Number" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="yad003" key="实处理金额" align="center" dataAlign="right" width="100" dataType="Number" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="140" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="AAB301" width="160"></ta:datagridItem>
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
			Base.submit("flst1", "turnGoldRollingAllotAction!toQuery.do");
		}
	}
	//query
	function toQuery() {
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' || aab001 == null) {
			Base.alert("单位编号不能为空!", "warn");
			return;
		}
		Base.submit("flst1", "turnGoldRollingAllotAction!toQuery.do");
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
		var rowdata = Base.getGridSelectedRows("dg_hd");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要分配的征集信息!", "warn");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst1", "turnGoldRollingAllotAction!toAccept.do", param);
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
		var param = {};
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst1,fltBushou", "turnGoldRollingAllotAction!toSave.do", param);
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

	//打开新的窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			Base.submit("flst1", "turnGoldRollingAllotAction!toQuery.do");
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
