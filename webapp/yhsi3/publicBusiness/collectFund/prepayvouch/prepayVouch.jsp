<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>单位预缴核定</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="frm" methord="post" enctype="multipart/form-data" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab_unit" key="单个预缴方式">
				<ta:toolbar>
					<ta:button id="btnQueryunit" key="查询[Q]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" />
					<ta:button id="btnSaveunit" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" />
					<ta:button id="btnResetunit" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
				</ta:toolbar>
				<ta:panel id="flst1" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
				</ta:panel>
				<ta:tabs id="tabs_unit" fit="true">
					<ta:tab id="tab_unitthis" key="单位参保信息">
						<ta:datagrid id="dg_unitthis" haveSn="true" forceFitColumns="true" fit="true" selectType="checkbox">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="15"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" maxChart="10" collection="AAE140"></ta:datagridItem>
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" maxChart="10" collection="AAA093">
								<ta:datagridEditor collection="AAA093" type="selectInput" />
							</ta:datagridItem>
							<ta:datagridItem id="yad001" key="预缴金额" align="center" dataAlign="right" maxChart="8" dataType="Number">
								<ta:datagridEditor type="number" precition="2" min="0" max="999999999999.99" />
							</ta:datagridItem>
							<ta:datagridItem id="aae013" key="预缴原因" align="center" dataAlign="left" maxChart="15">
								<ta:datagridEditor type="text" max="150" onChange="fnCheckLength" />
							</ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_unithisThis" key="本次预缴信息">
						<ta:datagrid id="dg_unithisThis" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5" hiddenColumn="false"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" maxChart="10" collection="AAE140"></ta:datagridItem>
							<ta:datagridItem id="aae002" key="做账年月" align="center" dataAlign="left" maxChart="3"></ta:datagridItem>
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" maxChart="10" collection="AAA093"></ta:datagridItem>
							<ta:datagridItem id="yad001" key="预缴金额" align="center" dataAlign="right" maxChart="6"></ta:datagridItem>
							<ta:datagridItem id="aae013" key="预缴原因" align="center" dataAlign="left" maxChart="8"></ta:datagridItem>
							<%@ include file="/yhsi3/commonJSP/aae011_1.jsp"%>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_unithistory" key="历史预缴信息">
						<ta:datagrid id="dg_unithistory" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5" hiddenColumn="false"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" maxChart="10" collection="AAE140"></ta:datagridItem>
							<ta:datagridItem id="aae002" key="做账年月" align="center" dataAlign="left" maxChart="3"></ta:datagridItem>
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" maxChart="10" collection="AAA093"></ta:datagridItem>
							<ta:datagridItem id="yad001" key="预缴金额" align="center" dataAlign="right" maxChart="6"></ta:datagridItem>
							<ta:datagridItem id="aae013" key="预缴原因" align="center" dataAlign="left" maxChart="8"></ta:datagridItem>
							<%@ include file="/yhsi3/commonJSP/aae011_1.jsp"%>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
			<ta:tab id="tab_batch" key="批量预缴方式">
				<ta:toolbar>
					<ta:button id="btnQuerybatch" key="查询[Q]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQueryBatch()" />
					<ta:button id="btnCheckbatch" key="核定[C]" asToolBarItem="true" icon="xui-icon-spotCheck" hotKey="C" onClick="fnCheckBatch()" />
					<ta:button id="btnSavebatch" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSaveBatch()" />
					<ta:button id="btnResetbatch" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" onClick="fnResetBatch()" />
				</ta:toolbar>
				<ta:text id="aaz002_batch" key="业务日志ID" display="false" />
				<ta:tabs id="tabs_batch" fit="true">
					<ta:tab id="tab_checkInfo" key="单位参保信息">
						<ta:datagrid id="dg_checkInfo" haveSn="true" fit="true" selectType="checkbox" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120" />
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="220" />
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" width="180" collection="AAE140" />
							<ta:datagridItem id="yae097" key="最大做帐期" align="center" dataAlign="center" width="80" />
							<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="center" width="100" dataType="date" />
							<ta:datagridItem id="aab066" key="暂停缴费标志" align="center" dataAlign="left" width="100" collection="AAB066" />
							<ta:datagridItem id="aab051" key="参保状态" align="center" dataAlign="left" width="100" collection="AAB051" />
							<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" width="160" collection="YAB003" />
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_batchthis" key="本次预缴信息">
						<ta:datagrid id="dg_batchthis" haveSn="true" fit="true" selectType="checkbox" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="160" />
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="220" />
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" width="180" collection="AAE140" />
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" width="160" collection="AAA093">
								<ta:datagridEditor collection="AAA093" required="true" type="selectInput" />
							</ta:datagridItem>
							<ta:datagridItem id="yad001" key="预缴金额" align="center" dataAlign="right" width="140" dataType="Number" totals="sum" />
							<ta:datagridItem id="aae013" key="预缴原因" align="center" dataAlign="left" width="200" />
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
			<ta:tab id="tab_file" key="文件预缴方式">
				<ta:toolbar>
					<ta:button id="btnSavefile" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSaveFile()" />
					<ta:button id="btnResetfile" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" onClick="fnResetFile()" />
				</ta:toolbar>
				<ta:panel id="fltname" key="导入文件" cols="3" expanded="false" scalable="false">
					<ta:fileupload key="导入并校验" id="flie" url="prepayVouchAction!upload.do" />
					<div style="width: 15%; padding-left: 150px">
						<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="prepayVouchAction!download.do" style="color: rgb(161, 161, 161); width: 200px;"> <strong> <pre> >>下载模板<< </pre>
						</strong>
						</a>
					</div>
					<ta:text id="aaz002_file" key="业务日志ID" display="false" />
				</ta:panel>
				<ta:tabs id="tabs_file" fit="true">
					<ta:tab id="tab_success" key="数据成功信息">
						<ta:datagrid id="dg_success" haveSn="true" selectType="checkbox" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="160"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="220"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" width="180" collection="AAE140"></ta:datagridItem>
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" width="160" collection="AAA093"></ta:datagridItem>
							<ta:datagridItem id="yad001" key="预缴金额" align="center" dataAlign="right" width="140" dataType="Number"></ta:datagridItem>
							<ta:datagridItem id="aae013" key="预缴原因" align="center" dataAlign="left" width="200"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_fail" key="数据失败信息">
						<ta:datagrid id="dg_fail" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="100"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" width="180" collection="AAE140"></ta:datagridItem>
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" width="160" collection="AAA093"></ta:datagridItem>
							<ta:datagridItem id="yad001" key="预缴金额" align="center" dataAlign="left" width="100" dataType="Number"></ta:datagridItem>
							<ta:datagridItem id="aae013" key="预缴原因" align="center" dataAlign="left" width="100"></ta:datagridItem>
							<ta:datagridItem id="bz" key="错误原因" align="center" dataAlign="left" width="300" showDetailed="true"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
			<ta:tab id="tab25" key="事件流程信息">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aab001");
		Base.setDisabled("btnSaveunit,btnCheckbatch,btnSavefile,btnSavebatch");
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});
	//单个预缴方式 单位RPC回调
	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.setValue("aab019", "");
			Base.setValue("yab019", "");
			Base.clearGridData("dg_unitthis");
			Base.clearGridData("dg_unithistory");
			Base.submit("flst1", "prepayVouchAction!toQuery.do", null, null, false, function fnCheck() {
				Base.submit('aab001', 'prepayVouchAction!toCheckAAb001.do');
			});
			Base.focus("aae044");
		}
	}
	function fnCheckLength(data, value) {
		Base.setEnable("btnSaveunit");
		if (value.length > 150) {
			Base.alert("填写的预缴原因不能超过150个字符！", "warn");
			Base.setDisabled("btnSaveunit");
			return;
		}
	}
	//单个预缴方式 保存
	function fnSave() {
		var rowdata = Base.getGridSelectedRows("dg_unitthis");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst1", "prepayVouchAction!toSave.do", param);
	}

	//批量预缴查询
	function fnQueryBatch() {
		Base.submit("frm", "prepayVouchAction!toQueryBatch.do");
	}
	//批量预缴核定
	function fnCheckBatch() {
		var rowdata = Base.getGridSelectedRows("dg_checkInfo");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		Base.submit("dg_checkInfo", "prepayVouchAction!toCheckBatch.do");
	}
	//批量预缴保存
	function fnSaveBatch() {
		var rowdata = Base.getGridSelectedRows("dg_batchthis");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("frm", "prepayVouchAction!toSaveBatch.do", param);
	}
	//批量预缴重置
	function fnResetBatch() {
		Base.setEnable("btnQuerybatch");
		Base.setDisabled("btnCheckbatch,btnSavebatch");
		Base.clearGridData("dg_checkInfo");
		Base.clearGridData("dg_batchthis");
		Base.clearGridData("dg_batchhistory");
		Base.activeTab("tab_checkInfo");
	}
	// 文件预缴方式 保存
	function fnSaveFile() {
		var rowdata = Base.getGridSelectedRows("dg_success");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！", "warn");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("fltname", "prepayVouchAction!toSaveFile.do", param);
	}
	// 文件预缴方式 重置
	function fnResetFile() {
		Base.setValue("aaz002_file", "");
		Base.setDisabled("btnSavefile");
		Base.clearGridData("dg_success");
		Base.clearGridData("dg_fail");
		Base.activeTab("tab_success");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>