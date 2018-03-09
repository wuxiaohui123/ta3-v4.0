<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>YOURTITLE</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<div id='pageloading'></div>
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_queryArrearage()" asToolBarItem="true" />
		<ta:button id="saveBtn" key="保存 [S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="个人基本信息" cols="3" id="fltPerson" expanded="false" scalable="false">
			<ta:text id="aaz002" key="日志ID" display="false" />
			<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
		</ta:panel>
		<ta:panel key="单位基本信息" cols="3" id="fltUnit" expanded="false" scalable="false">
			<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
		</ta:panel>
		<%@ include file="/yhsi3/commonJSP/xzlx_dw4.jsp"%>
		<ta:panel key="补差类型和时间段" cols="3" id="fltBeginEndDate" expanded="false" scalable="false">
			<ta:selectInput id="yac558" key="补差类型" onSelect="fnSelect" collection="yac558" filter="23,27,28" reverseFilter="true" required="true" value="23" />
			<%@ include file="/yhsi3/commonJSP/qzxx.jsp"%>
		</ta:panel>
		<ta:panel id="pnl" fit="true" minHeight="240">
			<ta:tabs cols="2" fit="true">
				<ta:tab key="个人参保信息" id="tab1">
					<ta:datagrid id="ac20Grid" enableColumnMove="false" fit="true" snWidth="30" haveSn="true">
						<ta:datagridItem field="aab001" key="单位编号" align="center" dataAlign="left" />
						   <%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="实缴明细信息" id="tab2">
					<ta:datagrid id="ac43_ac44Grid" selectType="checkbox" forceFitColumns="true" enableColumnMove="false" fit="true" snWidth="30" haveSn="true">
						<ta:datagridItem field="yae567" key="人员核定事件ID" width="160" align="center" dataAlign="left" />
						<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="right" />
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="right" />
						<ta:datagridItem id="aae140" key="险种类型" maxChart="12" showDetailed="true" collection="aae140" align="center" dataAlign="left" />
						<ta:datagridItem id="aaa115" key="缴费类型" maxChart="6" collection="aaa115" align="center" dataAlign="left" />
						<ta:datagridItem id="aae003" key="缴费所属期" align="center" dataAlign="right" />
						<ta:datagridItem id="aae078" key="到账标志" maxChart="4" collection="aae078" align="center" dataAlign="left" />
						<ta:datagridItem field="aac040new" key="变更后工资" align="center" dataAlign="left" maxChart="5">
							<ta:datagridEditor type="number" precition="2" required="true" min="0" />
						</ta:datagridItem>
						<ta:datagridItem id="aac040" key="缴费工资" align="center" dataAlign="right" />
						<ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" />
						<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" />
						<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" />
						<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" />
						<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" />
						<ta:datagridItem field="aaz136" key="基数规则ID" collection="aaz136" maxChart="12" align="center" dataAlign="left" />
						<ta:datagridItem field="yaz289" key="征缴规则类型ID" collection="yaz289" maxChart="12" align="center" dataAlign="left" />
						<ta:datagridItem id="aaz159" key="人员参保关系ID" align="center" dataAlign="right" hiddenColumn="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="本次补收信息" id="tab3">
					<ta:datagrid id="ac43_ac44Grid1" enableColumnMove="false" forceFitColumns="true" fit="true" snWidth="30" haveSn="true">
						<ta:datagridItem field="aac001" key="个人ID" align="center" dataAlign="left" />
						<ta:datagridItem field="aab001" key="单位ID" align="center" dataAlign="left" />
						<ta:datagridItem field="aae140" key="险种类型" maxChart="10" collection="aae140" align="center" dataAlign="left" />
						<ta:datagridItem field="aaa115" key="缴费类型" maxChart="6" collection="aaa115" align="center" dataAlign="left" />
						<ta:datagridItem field="aac040" key="工资" align="center" dataAlign="right" tatalsTextShow="true" />
						<ta:datagridItem field="aae180" key="基数" align="center" dataAlign="right" />
						<ta:datagridItem field="aae003" key="所属期数" align="center" dataAlign="right" />
						<ta:datagridItem field="dwhtc" key="单位划统筹 " align="center" dataAlign="right" tatalsTextShow="true" />
						<ta:datagridItem field="dwhzh" key="单位划账户" align="center" dataAlign="right" tatalsTextShow="true" />
						<ta:datagridItem field="grhtc" key="个人划统筹" align="center" dataAlign="right" tatalsTextShow="true" />
						<ta:datagridItem field="grhzh" key="个人划账户 " align="center" dataAlign="right" tatalsTextShow="true" />
						<ta:datagridItem field="dwhtcbl" key="单位划统筹比例 " maxChart="7" align="center" dataAlign="right" />
						<ta:datagridItem field="dwhzhbl" key="单位划账户比例" maxChart="7" align="center" dataAlign="right" />
						<ta:datagridItem field="grhtcbl" key="个人划统筹比例" maxChart="7" align="center" dataAlign="right" />
						<ta:datagridItem field="grhzhbl" key="个人划账户比例" maxChart="7" align="center" dataAlign="right" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="事件流程记录" id="tab4">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
	     function() {
			$("body").taLayout();
			initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryUnitAndPeron, 0, false);
			initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_queryInfoUnit, 0, false);
			Base.hideObj("cb_110,cb_120,cb_210,cb_310,cb_410,cb_510");
			Base.setDisabled("cb_all");
	});
	
	function fn_setRyInfo(){
		Base.submit("fltPerson",
				"baseadjustmentRefundAction!toQueryPersonAndUnit.do", null,
				function() {
					return true;
				}, false, function() {
					Base.submit("fltPerson,fltUnit", "baseadjustmentRefundAction!toQueryUnit.do");
				});
	}
	//保存经办信息
	function submitData() {
		var ac43_ac44GridList = Base.getGridSelectedRows("ac43_ac44Grid");
		if (ac43_ac44GridList.length == 0) {
			Base.alert("请选择基数调整补收记录!", "warn");
		} else {
			var param = {};
			param.ac43_ac44GridList = Ta.util.obj2string(ac43_ac44GridList);
			Base.submit("form1", "baseadjustmentRefundAction!toSave.do", param,false, false, null);
		}
	}

	//个人回调函数 ：查询单位信息和个人信息  ，和参保信息
	function fn_queryUnitAndPeron() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.clearData("fltUnit");
		Base.clearGridData("ac20Grid");
		Base.clearGridData("tmp_grbs01FailGrid1");
		Base.clearGridData("tmp_grbs01FailGrid");
		Base.clearGridData("ae02a2Grid");
		if (g_Suggest != "") {
			Base.submit("fltPerson",
					"baseadjustmentRefundAction!toQueryPersonAndUnit.do", null,
					function() {
						return true;
					}, false, function() {
						Base.submit("fltPerson,fltUnit", "baseadjustmentRefundAction!toQueryUnit.do");
					});
		}
	}

	//单位回调函数:改变单位信息的时侯,重新查询单位信息
	function fn_queryInfoUnit() {
		Base.setValue("aab001", g_Suggest[1]);
		if (g_Suggest != "") {
			Base.submit("fltPerson,fltUnit","baseadjustmentRefundAction!toQueryUnit.do",
				null,function() {
					return true;
				},
				false,
				function() {
					Base.setEnable("aae041,aae042,cb_all");
				},
				function() {
					Base.clearData("fltUnit");
					Base.hideObj("cb_110,cb_120,cb_210,cb_310,cb_410,cb_510");
					Base.setReadOnly("aae041,aae042,cb_all");
				});
		}
	}
	//根据选择下拉框，生成aae140字符串格式：如 110,120,310
	function createAae140str() {
		var ary = [ "aae140_110", "aae140_120", "aae140_310", "aae140_410","aae140_510" ];
		var aae140str = "";
		for ( var i = 0; i < ary.length; i++) {
			if (Base.getObj(ary[i]).checked) {

				if (Base.getObj(ary[i]).hide) {
					continue;
				}
				if (Base.getObj(ary[i]).disabled) {
					continue;
				}
				aae140str = aae140str
						+ ary[i].substring(ary[i].indexOf("_") + 1) + ",";
			}

		}
		return aae140str.substring(0, aae140str.length - 1);
	}
	//查询个人欠费信息		
	function fn_queryArrearage() {
		Base.submit("fltPerson,fltUnit,fltBeginEndDate",
				"baseadjustmentRefundAction!toQueryArrearage.do", {
					"dto['aae140str']":createAae140str()
				});
	}

	function fn_dateValidate(id) {
		if (id == "aae041") {
			if (!Base.getValue("aae042") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月!", "warn");
				Base.setValue("aae041", "");
			}
		}

		if (id == "aae042") {
			if (!Base.getValue("aae041") == "" && Base.getValue("aae041") > Base.getValue("aae042")) {
				Base.alert("开始年月不能大于结束年月!", "warn");
				Base.setValue("aae042", "");
			}
		}
	}

	function fnSelect(value, key) {
		Base.clearGridData("ac43_ac44Grid");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>