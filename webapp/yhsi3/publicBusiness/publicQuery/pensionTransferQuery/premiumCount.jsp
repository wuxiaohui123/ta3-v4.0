<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社会保险费试算器</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button id="btnAdd" icon="xui-icon-spotAdd" key="新增[A]" hotKey="A" onClick="fnAddGridApp1()" asToolBarItem="true" />
		<ta:button id="btnDel" key="删除[D]" icon="xui-icon-spotDelete" hotKey="alt+D" asToolBarItem="true" onClick="fnDeleteRow()" />
		<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="fnSave()" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="icon-reload" hotKey="R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form" fit="true">
		<ta:box id="hideArea">
			<ta:text id="yae099" key="业务日志ID" display="false" />
		</ta:box>

		<ta:panel id="jstj" key="计算条件" cols="4">
			<ta:selectInput id="aae140" key="险种类型" collection="aae140" required="true" onSelect="toQuery" filter="110,310,330" reverseFilter="true" />
			<ta:selectInput id="aaz136" key="基数核定规则" labelWidth="120" required="true" collection="aaz136" onSelect="fnClear_yaz289" />
			<ta:selectInput id="yaz289" key="征缴规则" required="true" labelWidth="120" collection="yaz289" span="2" />
			<ta:date id="aae041" key="开始年月" showSelectPanel="true" issue="true" required="true" onChange="fn_dateValidate('aae041')" />
			<ta:date id="aae042" key="结束年月" showSelectPanel="true" issue="true" required="true" onChange="fn_dateValidate('aae042')" />
			<ta:text id="aac040" key="工资" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" collection="ykc005" labelWidth="120" required="true" onSelect="fnClear_ykc005" />
			<ta:selectInput id="ykc006" key="人员类别" collection="ykc006" labelWidth="100" required="true" />
			<ta:selectInput id="yac084" key="退休标志" collection="yac084" labelWidth="100" />
			<ta:selectInput id="yae581" key="利息征收标志" collection="yae581" labelWidth="120" />
			<ta:selectInput id="yae579" key="滞纳金征收标志" collection="yae579" labelWidth="120" />
			<ta:date id="yae580" key="滞纳金截止日期" showSelectPanel="true" labelWidth="100" />
			<ta:selectInput id="yaz138" key="征缴规则模式" labelWidth="100" collection="yaz138" />
			<ta:selectInput id="yaz137" key="基数核定规则模式" labelWidth="120" collection="yaz137" />
		</ta:panel>

		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="计算条件信息列表">
				<ta:panel id="pnlJstj" key="计算条件信息列表" fit="true">
					<ta:datagrid id="unitSIGrid" forceFitColumns="true" fit="true" haveSn="true" selectType="checkbox">
						<%--   <ta:datagridItem id="yab019" key="单位管理类型" align="center" totalsAlign="center" maxChart="6" collection="yab019"/>	--%>
						<ta:datagridItem id="aae140" key="险种类型" align="center" totalsAlign="center" maxChart="7" collection="aae140" />
						<ta:datagridItem id="yaz289" key="征缴规则" align="center" totalsAlign="center" maxChart="6" collection="yaz289" />
						<ta:datagridItem id="aaz136" key="基数核定规则" align="center" totalsAlign="center" maxChart="6" collection="aaz136" />
						<ta:datagridItem id="aae041" key="开始年月" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="aae042" key="结束年月" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="aac040" key="工资" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="ykc005" key="人员类型" align="center" totalsAlign="center" maxChart="4" collection="ykc005" />
						<ta:datagridItem id="ykc006" key="人员类别" align="center" totalsAlign="center" maxChart="4" collection="ykc006" />
						<ta:datagridItem id="yac084" key="退休标志" align="center" totalsAlign="center" maxChart="4" collection="yac084" />
						<ta:datagridItem id="yae581" key="利息征收标志" align="center" totalsAlign="center" maxChart="6" collection="yae581" />
						<ta:datagridItem id="yae579" key="滞纳金征收标志" align="center" totalsAlign="center" maxChart="6" collection="yae579" />
						<ta:datagridItem id="yae580" key="滞纳金截止日期" align="center" totalsAlign="center" maxChart="6" />
						<ta:datagridItem id="yaz138" key="征缴规则模式" align="center" totalsAlign="center" maxChart="6" collection="yaz138" />
						<ta:datagridItem id="yaz137" key="基数核定规则模式" align="center" totalsAlign="center" maxChart="7" collection="yaz137" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>

			<ta:tab id="infoTb2" key="计算结果信息列表">
				<ta:panel id="pnlJsjg" key="计算结果信息列表" fit="true">
					<ta:datagrid id="unitJsjg" forceFitColumns="true" fit="true" haveSn="true">
						<ta:datagridItem id="aae140" key="险种类型" align="center" totalsAlign="center" maxChart="7" collection="aae140" />
						<ta:datagridItem id="aae003" key="费款所属期" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="yaz138" key="征缴规则模式" align="center" totalsAlign="center" maxChart="6" collection="yaz138" />
						<ta:datagridItem id="yaz289" key="征缴规则" align="center" totalsAlign="center" maxChart="6" collection="yaz289" />
						<ta:datagridItem id="yaz137" key="基数核定规则模式" align="center" totalsAlign="center" maxChart="7" collection="yaz137" />
						<ta:datagridItem id="aaz136" key="基数核定规则" align="center" totalsAlign="center" maxChart="6" collection="aaz136" />
						<ta:datagridItem id="aac040" key="工资" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="aae180" key="基数" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="bl_dwhtc" key="单位划统筹比例" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="bl_dwhzh" key="单位划账户比例" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="bl_grhtc" key="个人划统筹比例" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="bl_grhzh" key="个人划账户比例" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="bl_qt" key="X比例" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="dwhzh" key="单位划账户" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="grhtc" key="个人划统筹" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="grhzh" key="个人划账户" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="qt" key="qt比例" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="lx" key="利息" align="center" totalsAlign="center" maxChart="4" />
						<ta:datagridItem id="ykc005" key="人员类型" align="center" totalsAlign="center" maxChart="4" collection="ykc005" />
						<ta:datagridItem id="ykc006" key="人员类别" align="center" totalsAlign="center" maxChart="4" collection="ykc006" />
						<ta:datagridItem id="yac084" key="退休标志" align="center" totalsAlign="center" maxChart="4" collection="yac084" />
						<ta:datagridItem id="yae581" key="利息征收标志" align="center" totalsAlign="center" maxChart="6" collection="yae581" />
						<ta:datagridItem id="yae579" key="滞纳金征收标志" align="center" totalsAlign="center" maxChart="6" collection="yae579" />
						<ta:datagridItem id="yae580" key="滞纳金截止日期" align="center" totalsAlign="center" maxChart="6" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();//"aae140,yaz289,yae581,aae041,aae042,yae579,aaz136"
		Base.setReadOnly("jstj");
		Base.setEnable("aae140");
		Base.setDisabled("btnDel,btnSave");
	});
	//查询险种信息
	function toQuery(key, value) {
		Base.submit("aae140", "premiumCountAction!toQueryYaz289.do");
		Base.setEnable("jstj");
	}
	//控制时间	
	function fn_dateValidate(id) {
		if (id == "aae041") {
			if (!Base.getValue("aae042") == "" && !Base.getValue("aae041") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae041", "");
			}
		}
		if (id == "aae042") {
			if (!Base.getValue("aae042") == "" && !Base.getValue("aae041") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月");
				Base.setValue("aae042", "");
			}
		}
	}
	//单选定单位管理类型时，不可更改
	//function fnFinal(){
	//Base.setEnable("jstj");
	//Base.setReadOnly("yab019");
	//}

	function fnAddGridApp1() {

		var aae140 = Base.getValue("aae140");
		var yaz289 = Base.getValue("yaz289");
		var aaz136 = Base.getValue("aaz136");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		var aac040 = Base.getValue("aac040");
		var ykc005 = Base.getValue("ykc005");
		var ykc006 = Base.getValue("ykc006");
		var yac084 = Base.getValue("yac084");
		var yae581 = Base.getValue("yae581");
		var yae579 = Base.getValue("yae579");
		var yae580 = Base.getValue("yae580");
		var yaz138 = Base.getValue("yaz138");
		var yaz137 = Base.getValue("yaz137");
		//设置表格列数据
		var data = {
			"aae140" : aae140,
			"yaz289" : yaz289,
			"aaz136" : aaz136,
			"aae041" : aae041,
			"aae042" : aae042,
			"aac040" : aac040,
			"ykc005" : ykc005,
			"ykc006" : ykc006,
			"yac084" : yac084,
			"yae581" : yae581,
			"yae579" : yae579,
			"yae580" : yae580,
			"yaz138" : yaz138,
			"yaz137" : yaz137
		};
		if (aae140 == "" || aae140 == null || yaz289 == "" || yaz289 == null || aae041 == "" || aae041 == null || aae042 == "" || aae042 == null || aaz136 == "" || aaz136 == null || ykc005 == "" || ykc005 == null || ykc006 == "" || ykc006 == null) {
			Base.alert("计算条件未填写完整！");
			return false;
		}
		//将数据添加至表格
		Base.addGridRow("unitSIGrid", data);
		Base.setEnable("btnDel,btnSave");

	}

	//删除待转金调帐记录
	function fnDeleteRow() {
		var rows = Base.getGridSelectedRows("unitSIGrid"); //获取表格选中行
		if (rows.length > 0) {
			Base.confirm("确定删除该记录吗？", function(yes) {
				if (yes) {
					Base.deleteGridSelectedRows("unitSIGrid");
				}
			});
		} else {
			Base.alert("请勾选要删除的数据！");
		}
	}

	function fnSave() {
		var parm = {};
		var unitSIGrid = Base.getGridSelectedRows("unitSIGrid");
		parm.unitSIGrid = Ta.util.obj2string(unitSIGrid);
		if (unitSIGrid.length > 0) {
			Base.submit("", "premiumCountAction!toSave.do", parm);
		} else {
			Base.alert("请勾选需要保存的数据！");
		}
	}

	//当基数核定规则发生改变时，清空征缴规则
	function fnClear_yaz289() {
		Base.setValue("yaz289", "");
	}

	//当基数核定规则发生改变时，清空征缴规则
	function fnClear_ykc005() {
		Base.setValue("ykc006", "");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
