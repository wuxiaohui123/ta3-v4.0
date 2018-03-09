<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>registerEmployeePl</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:button id="btnQuery" key="查询[Q]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" />
		<ta:button id="btnSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" />
		<ta:button id="btnAdd" key="新增[A]" asToolBarItem="true" icon="xui-icon-add" hotKey="Q" onClick="fnAdd()" />
		<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
		<ta:button id="btnClose" key="关闭[C]" asToolBarItem="true" icon="xui-icon-spotClose" hotKey="C" onClick="fnClose()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" methord="post" enctype="multipart/form-data" cssStyle="overflow:auto;">
		<ta:panel id="flst1" key="单位基本信息" cols="3" expanded="false" scalable="false">
			<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			<ta:text id="aaz002" key="业务日志ID" display="false" />
		</ta:panel>
		<ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">
			<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" onChange="fnonChange()" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="120" />
		</ta:panel>

		<ta:panel key="明细信息" cols="3" id="mingxi" expanded="false" scalable="false">
			<ta:selectInput id="aae140" key="险种类型" collection="aae140" labelWidth="120" />
			<ta:number id="aae020" key="特殊核定金额(单位)" labelWidth="120" precision="2" min="1" />
			<ta:number id="aae022" key="特殊核定金额(个人)" labelWidth="120" precision="2" min="1" />
			<ta:text id="aae013" key="特殊核定原因" labelWidth="120" span="3" />
		</ta:panel>

		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab_this" key="本次补收信息">
				<ta:datagrid id="dg_this" haveSn="true" fit="true" selectType="checkbox" forceFitColumns="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="8"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="14"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" maxChart="14"></ta:datagridItem>
					<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="center" maxChart="8">
						<ta:datagridEditor collection="AAA093" type="selectInput" />
					</ta:datagridItem>
					<ta:datagridItem id="aae020" key="单位缴费" align="center" dataAlign="right" maxChart="10">
						<ta:datagridEditor precition="2" type="number" max="999999999999.99" min="-999999999.99" onChange="fnCheckYad001" />
					</ta:datagridItem>
					<ta:datagridItem id="aae022" key="个人缴费" align="center" dataAlign="right" maxChart="10">
						<ta:datagridEditor precition="2" type="number" max="999999999999.99" min="-999999999.99" onChange="fnCheckYad001" />
					</ta:datagridItem>
					<ta:datagridItem id="aae013" key="特殊核定原因" align="center" dataAlign="center" maxChart="10">
						<ta:datagridEditor type="text" max="200" onChange="fnCheckAae013" />
					</ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_detail" key="本次补收明细">
				<ta:panel id="flst2" key="明细新增" cols="3" expanded="false" scalable="false">
					<ta:fileupload key="导入并校验" icon="xui-icon-spotAdd" submitIds="flst1" id="file" url="specialVouchAction!upload.do" />
					<div style="width:15%;padding-left:150px">
						<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="specialVouchAction!download.do" style="color:rgb(161,161,161);width:200px;"> <strong> <pre>  >>下载模板<< </pre>
						</strong>
						</a>
					</div>
				</ta:panel>
				<ta:datagrid id="dg_detail" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem click="fnDelete" icon="icon-table_delete" key="删除" width="50" align="center" />
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="160"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" width="160"></ta:datagridItem>
					<ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" width="120" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" width="100"></ta:datagridItem>
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" width="140"></ta:datagridItem>
					<ta:datagridItem id="aae020" key="单位缴费" align="center" dataAlign="right" width="100" dataType="number" />
					<ta:datagridItem id="aae022" key="个人缴费" align="center" dataAlign="right" width="100" dataType="number" />
					<ta:datagridItem id="aae013" key="原因" align="center" dataAlign="left" width="120" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_fail" key="导入校验失败明细">
				<ta:datagrid id="dg_fail" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="180"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" width="160"></ta:datagridItem>
					<ta:datagridItem id="aac001" key="个人ID" align="center" dataAlign="left" width="120" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" width="100"></ta:datagridItem>
					<ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" width="140"></ta:datagridItem>
					<ta:datagridItem id="aae020" key="单位缴费" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="aae022" key="个人缴费" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="sbxx" key="校验失败原因" align="center" dataAlign="left" width="140" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_history" key="历史补收信息">
				<ta:datagrid id="dg_history" fit="true" forceFitColumns="true" onRowDBClick="fnClick2">
					<ta:datagridItem id="yae518" key="核定ID" align="center" dataAlign="left"></ta:datagridItem>
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="80"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="140"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" width="160"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="核定期号" align="center" dataAlign="left" width="70"></ta:datagridItem>
					<ta:datagridItem id="aaa093" key="特殊核定类型" align="center" dataAlign="left" collection="AAA093" width="130"></ta:datagridItem>
					<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" width="110" dataType="Number" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" width="110" dataType="Number" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="yad001" key="特殊核定总金额" align="center" dataAlign="right" width="110" dataType="Number" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="bz" key="是否存在人员明细" align="center" dataAlign="left" maxChart="8" dataType="center"></ta:datagridItem>
					<ta:datagridItem id="aae013" key="特殊核定原因" align="center" dataAlign="left" width="100"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" width="100"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="100" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" width="100"></ta:datagridItem>
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
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_getAb01, 1, false);
		initializeSuggestFramework(1, 'ac01', 'aac001', 500, 200, 4, fn_setAc01, 0, false);
		Base.setDisabled("btnSave");
		Base.hideObj("tab_fail,btnClose");
		Base.focus("aab001");
	});
	function fnonChange() {
		sfwQueryUtil(1, 'getAac001Byaab001', Base.getValue('aac001') + "@" + Base.getValue('aab001'));
	}
	function fnAdd() {
		var aab001 = Base.getValue("aab001");
		var aae044 = Base.getValue("aae044");
		var aae140 = Base.getValue("aae140");
		var aac001 = Base.getValue("aac001");
		var aac003 = Base.getValue("aac003");
		var aac002 = Base.getValue("aac002");
		var aae020 = Base.getValue("aae020");
		var aae022 = Base.getValue("aae022");
		var aae013 = Base.getValue("aae013");
		if (aab001 == "" || aae044 == "" || aae140 == "" || aac001 == "" || aac003 == "" || aac002 == "") {
			Base.alert("请填写完全明细信息!", "warn");
			return;
		}
		if (aae020 == "" && aae022 == "") {
			Base.alert("核定金额不能都为空!", "warn");
			return;
		}
		//检查一个人不能同险种2次录入
		var detil = Base.getGridData("dg_detail");
		for (var i = 0; i < detil.length; i++) {
			if (aac001 == detil[i].aac001 && aae140 == detil[i].aae140) {
				Base.alert("已经录入该人员该险种明细信息!", "warn");
				return;
			}
		}
		if (aae020 == null || aae020 == "") {
			aae020 = 0;
		}
		if (aae022 == null || aae022 == "") {
			aae022 = 0;
		}
		Base.activeTab("tab_detail");
		Base.addGridRowDown("dg_detail", {
			"aab001" : Base.getValue("aab001"),
			"aae044" : Base.getValue("aae044"),
			"aae140" : Base.getValue("aae140"),
			"aac001" : Base.getValue("aac001"),
			"aac003" : Base.getValue("aac003"),
			"aac002" : Base.getValue("aac002"),
			"aae020" : aae020,
			"aae022" : aae022,
			"aae013" : Base.getValue("aae013")
		});

		//计算单位缴费金额总和
		var moneyDw = returnMoney(aae140, "dw");
		//计算个人缴费金额总和
		var moneyGr = returnMoney(aae140, "gr");
		//获取单位参保信息并赋值
		var dataGrid = Base.getGridData("dg_this");
		for (var i = 0; i < dataGrid.length; i++) {
			var aae140Grid = dataGrid[i].aae140;
			if (aae140 == aae140Grid) {
				Base.setGridCellData('dg_this', i + 1, 6, moneyDw);
				Base.setGridCellData('dg_this', i + 1, 7, moneyGr);
				break;
			}
		}
	}

	function fnDelete(data) {

		Base.deleteGridRow('dg_detail', data.row);
		//计算单位缴费金额总和
		var moneyDw = returnMoney(data.aae140, "dw");
		//计算个人缴费金额总和
		var moneyGr = returnMoney(data.aae140, "gr");

		var dataGrid = Base.getGridData("dg_this");
		for (var i = 0; i < dataGrid.length; i++) {
			var aae140Grid = dataGrid[i].aae140;
			if (data.aae140 == aae140Grid) {
				Base.setGridCellData('dg_this', i + 1, 6, moneyDw);
				Base.setGridCellData('dg_this', i + 1, 7, moneyGr);
				break;
			}
		}
	}

	//汇总新增之后单位和个人缴费总额
	function returnMoney(aae140, flag) {
		var moneyType = "";
		var dataAddGrid = Base.getGridData("dg_detail");
		var money = 0;
		for (var k = 0; k < dataAddGrid.length; k++) {
			var aae140AddGrid = dataAddGrid[k].aae140;
			if (aae140 == aae140AddGrid) {
				if ("dw" == flag) {
					moneyTpy = dataAddGrid[k].aae020;
				} else if ("gr" == flag) {
					moneyTpy = dataAddGrid[k].aae022;
				} else {
					Base.alert("计算单位或者个人金额出错!", "warn");
					return false;
				}
				if (moneyTpy == "" || moneyTpy == null) {
					moneyTpy = 0;
				}
				money += Number(moneyTpy);
			}
		}
		return money;
	}

	//回调函数
	function fn_getAb01() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.clearGridData("dg_this");
			Base.clearGridData("dg_detail");
			Base.clearGridData("dg_history");
			Base.activeTab("tab_this");
			Base.submit("flst1", "specialVouchAction!toQuery.do", null, null, null, function fnCheck() {
				/*
				Base.submit('aab001','specialVouchAction!toCheckAAb001.do');
				 */
			});
		}
	}
	function fn_setAc01() {
		Base.clearData("fltPerson");
		Base.submit('frm', 'specialVouchAction!toCheckAAC001.do', {
			"dto['aac001']" : g_Suggest[2]
		});

		if (g_Suggest != "") {
			Base.setValue("aac002", g_Suggest[0]);
			Base.setValue("aac003", g_Suggest[1]);
			Base.setValue("aac001", g_Suggest[2]);
		}
	}
	//查询单位基本信息和参保信息
	function fnQuery() {
		Base.clearGridData("dg_this");
		Base.clearGridData("dg_detail");
		Base.clearGridData("dg_history");
		Base.activeTab("tab_this");
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' || aab001 == null) {
			Base.alert("单位编号不能为空,请确认!", "warn");
			return;
		}
		Base.submit("flst1", "specialVouchAction!toQuery.do", null, null, false, function fnCheck() {
			/*
			Base.submit('aab001','specialVouchAction!toCheckAAb001.do');
			 */
		});
	}
	//校验金额
	function fnCheckYad001(date, value) {
		if (value.length > 13) {
			Base.alert("金额过大!", "warn");
			Base.setDisabled("btnSave");
			return;
		}
	}
	//检验备注
	function fnCheckAae013(date, value) {
		Base.setEnable("btnSave");
		if (value.length > 13) {
			Base.alert("特殊核定原因字符过长!", "warn");
			Base.setDisabled("btnSave");
			return;
		}
	}
	//保存
	function fnSave() {
		var rowdata = Base.getGridSelectedRows("dg_this");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的本次补收信息!", "warn");
			return;
		}
		var detail = Base.getGridData("dg_detail");
		param.d2List = Ta.util.obj2string(rowdata);
		param.detail = Ta.util.obj2string(detail);
		Base.submit("form1", "specialVouchAction!toSave.do", param);
	}
	// 行双击事件
	function fnClick2(e, rowdata) {
		if ("是" == rowdata.bz) {
			Base.openWindow("HDInfo", "核定详情", myPath() + "/process/publicBusiness/collectFund/receivableVouch/receivableVouchAction!showMX.do", {
				"dto['yae518']" : rowdata.yae518
			}, "95%", "90%", null, null, true);
		}
	}
	//close
	function fnClose() {
		parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>