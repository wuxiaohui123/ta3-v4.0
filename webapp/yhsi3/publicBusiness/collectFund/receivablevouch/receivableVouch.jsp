<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位应收核定</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="frm" fit="true">
		<ta:tabs fit="true">
			<ta:tab id="tab_unit" key="单个核定方式">
				<ta:toolbar id="ButtonLayout1">
					<ta:button id="btnQuery" key="查询[S]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" />
					<ta:button id="btnSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" />
					<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
				</ta:toolbar>
				<ta:panel id="flst1" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:text id="aaa121" key="业务编码" display="false" />
				</ta:panel>
				<ta:panel id="flst2" key="核定信息" cols="3" expanded="false" scalable="false">
					<ta:date id="aae042" key="开始年月" labelWidth="120" showSelectPanel="true" issue="true" required="true" onChange="fnChange1()" />
					<ta:date id="aae043" key="结束年月" labelWidth="120" showSelectPanel="true" issue="true" required="true" onChange="fnChange2()" />
				</ta:panel>
				<ta:tabs id="tabs" fit="true">
					<ta:tab id="tab_cb" key="单位参保信息">
						<ta:datagrid id="dg_cb" haveSn="true" fit="true" selectType="checkbox" onRowDBClick="fnClick" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
							<ta:datagridItem id="aae044" key="单位名称" align="center" showDetailed="true" maxChart="10" />
							<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" showDetailed="true" align="center" maxChart="12" />
							<ta:datagridItem id="aab050" key="参保日期" align="center" maxChart="6" />
							<ta:datagridItem id="aab051" key="参保状态" collection="AAB051" align="center" maxChart="3" />
							<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="5" />
							<ta:datagridItem id="zzrs" key="在职人数" align="center" maxChart="3" dataAlign="right" totals="sum" tatalsTextShow="false" />
							<ta:datagridItem id="txrs" key="退休人数" align="center" maxChart="3" dataAlign="right" totals="sum" tatalsTextShow="false" />
							<ta:datagridItem id="hjrs" key="合计人数" align="center" maxChart="3" dataAlign="right" totals="sum" tatalsTextShow="false" />
							<ta:datagridItem id="zbrs" key="在编人数" align="center" maxChart="3" dataAlign="right" totals="sum" tatalsTextShow="false" />
							<ta:datagridItem id="fzbrs" key="非在编人数" align="center" maxChart="4" dataAlign="right" totals="sum" tatalsTextShow="false" />
							<ta:datagridItem id="aab066" key="暂停缴费标志" collection="AAB066" align="center" maxChart="5" />
							<ta:datagridItem id="aaz136" key="基数核定规则" collection="AAZ136" align="center" showDetailed="true" maxChart="10" />
							<ta:datagridItem id="yaz289" key="缴费核定规则" collection="YAZ289" align="center" showDetailed="true" maxChart="12" />
							<ta:datagridItem id="aab033" key="征收方式" collection="AAB033" align="center" maxChart="4" />
							<ta:datagridItem id="yab139" key="参保所属机构" collection="YAB003" align="center" showDetailed="true" maxChart="9" />
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_this" key="本次核定信息">
						<ta:datagrid id="dg_this" haveSn="true" fit="true" onRowDBClick="fnClick2">
							<ta:datagridItem id="yae518" key="当事人核定ID" hiddenColumn="true"></ta:datagridItem>
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4"></ta:datagridItem>
							<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5"></ta:datagridItem>
							<ta:datagridItem id="aaa115" key="应缴类型" align="center" dataAlign="left" maxChart="5" collection="AAA115"></ta:datagridItem>
							<ta:datagridItem id="yac084" key="离退休标志" align="center" dataAlign="left" maxChart="5" collection="YAC084"></ta:datagridItem>
							<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" maxChart="2" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="aab084" key="工资总额" align="center" dataAlign="right" maxChart="4"></ta:datagridItem>
							<ta:datagridItem id="hj" key="合计缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="hjjf" key="合计缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
							<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9" sortable="true"></ta:datagridItem>
							<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" maxChart="9"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_error" key="本次核定失败信息">
						<ta:button key="导出本次核定失败信息" id="btnOut" icon="icon-output" onClick="fnExpFile('dg_error');" />
						<ta:datagrid id="dg_error" haveSn="true" fit="true">
							<ta:datagridItem id="errormsg" key="失败信息" align="center" dataAlign="left" width="1200" showDetailed="true"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_history" key="历史核定信息">
						<ta:datagrid id="dg_history" haveSn="true" fit="true" onRowDBClick="fnClick2" columnFilter="true">
							<ta:datagridItem id="yae518" key="当事人核定ID" hiddenColumn="false"></ta:datagridItem>
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="12" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4"></ta:datagridItem>
							<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5"></ta:datagridItem>
							<ta:datagridItem id="aaa115" key="应缴类型" align="center" dataAlign="left" maxChart="5" collection="AAA115"></ta:datagridItem>
							<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
							<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" maxChart="2" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="aab084" key="工资总额" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="hjjf" key="合计缴费" align="center" dataAlign="right" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
							<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
							<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9" sortable="true"></ta:datagridItem>
							<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" maxChart="9"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
			<ta:tab id="tab_batch" key="批量核定方式">
				<ta:toolbar id="ButtonLayout2">
					<ta:button id="btnBatchQuery" key="查询[S]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnBatchQuery()" />
					<ta:button id="btnBatchSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnBatchSave()" />
					<ta:button id="btnBatchReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
				</ta:toolbar>
				<%@include file="/yhsi3/publicBusiness/collectFund/batchmakeupvouch/aae140ckbx_dw.jsp"%>
				<ta:panel id="flst3" key="核定信息" cols="3" expanded="false" scalable="false">
					<ta:date id="aae042_1" key="开始年月" showSelectPanel="true" issue="true" required="true" onChange="fnChange_1()" />
					<ta:date id="aae043_1" key="结束年月" showSelectPanel="true" issue="true" required="true" onChange="fnChange_2()" />
					<ta:date id="zxsj" key="执行时间" datetime="true" validNowTime="right" showSelectPanel="true" bpopTipMsg="未输入执行时间信息则下一分钟执行" />
					<ta:text id="aae013" key="备注" maxLength="50" span="3" />
				</ta:panel>
				<ta:tabs id="tab_batch" fit="true">
					<ta:tab id="tab_batchcb" key="单位参保信息">
						<ta:datagrid id="dg_batchcb" haveSn="true" selectType="checkbox" onRowDBClick="fnClick" fit="true" columnFilter="true" forceFitColumns="true">
							<%@ include file="/yhsi3/commonJSP/dwcbxx.jsp"%>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_successBatch" key="定时服务创建成功信息">
						<ta:datagrid id="dg_successBatch" haveSn="true" fit="true">
							<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" width="150" showDetailed="true" />
							<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" width="600" showDetailed="true" />
							<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" width="300" showDetailed="true" />
							<ta:datagridItem id="successmsg" key="成功信息" align="center" dataAlign="left" width="200" showDetailed="true" />
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_errorBatch" key="定时服务创建失败信息">
						<ta:datagrid id="dg_errorBatch" haveSn="true" fit="true">
							<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" width="150" showDetailed="true" />
							<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" width="600" showDetailed="true" />
							<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" width="300" showDetailed="true" />
							<ta:datagridItem id="errormsg" key="失败信息" align="center" dataAlign="left" width="200" showDetailed="true" />
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
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
		Base.focus("aab001");
		Base.setDisabled("btnSave");
		Base.hideObj("tab_fail");
		Base.activeTab("tab_unit");
		Base.hideObj("tab_error");
		Base.hideObj("tab_successBatch");
		Base.hideObj("tab_errorBatch");

		Base.setDisabled("btnBatchSave");
		Base.activeTab("tab_batchcb");

		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_getAb01, 0, false);

	});
	//回调函数
	function fn_getAb01() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[0]);
			Base.setValue("aae044", g_Suggest[1]);
			Base.setValue("aab999", g_Suggest[2]);
			Base.setValue("aab019", g_Suggest[3]);
			Base.setValue("yab019", g_Suggest[4]);
			Base.setValue("aae042", "");
			Base.setValue("aae043", "");
			Base.clearGridData("dg_this");
			Base.clearGridData("dg_cb");
			Base.clearGridData("dg_history");
			Base.clearGridData("dg_error");
			Base.activeTab("tab_cb");
			Base.hideObj("tab_error");
			Base.submit("flst1", "receivableVouchAction!toQuery.do", null, null, false, function fnCheck() {
				Base.submit('aab001', 'receivableVouchAction!toCheckAAb001.do');
			});
		}
	}

	//子窗口调用主页面业务方法
	function fn_setDwInfo() {
		Base.submit("flst1", "receivableVouchAction!toQuery.do", null, null, false, function fnCheck() {
			Base.submit('aab001', 'receivableVouchAction!toCheckAAb001.do');
		});
	}

	//查询单位基本信息和参保信息
	function fnQuery() {
		Base.setValue("aae042", "");
		Base.setValue("aae043", "");
		Base.clearGridData("dg_this");
		Base.clearGridData("dg_detail");
		Base.clearGridData("dg_history");
		Base.clearGridData("dg_error");
		Base.activeTab("tab_cb");
		Base.hideObj("tab_error");
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' || aab001 == null) {
			alert("单位编号不能为空，请确认！");
			return;
		}
		Base.submit("flst1", "receivableVouchAction!toQuery.do", null, null, false, function fnCheck() {
			Base.submit('aab001', 'receivableVouchAction!toCheckAAb001.do');
		});
	}
	function fnChange1() {
		var aae042 = Base.getValue("aae042");//开始
		var aae043 = Base.getValue("aae043");//结束	    
		if (aae042 == '' || aae042 == null) {
			return true;
		}
		if (aae043 == '' || aae043 == null) {
			return true;
		}
		if (aae042 > aae043) {
			Base.alert("开始年月不能大于结束年月");
			Base.setValue("aae042", "");
			return;
		}
	}
	function fnChange2() {
		var aae042 = Base.getValue("aae042");//开始
		var aae043 = Base.getValue("aae043");//结束	    
		if (aae042 == '' || aae042 == null) {
			return true;
		}
		if (aae043 == '' || aae043 == null) {
			return true;
		}
		if (aae043 < aae042) {
			Base.setValue("aae043", "");
			Base.alert("结束年月不能小于开始年月!", "warn");
			return;
		}
	}
	//行双击事件
	function fnClick(e, rowdata) {
		var yae097 = rowdata.yae097;
		var hjrs = rowdata.hjrs;
		if (hjrs == '0') {
			alert((yae097 + 1) + "期，该单位没有符合要求的参保人员");
			return;
		}
		Base.openWindow("CBInfo", "单位参保详情", myPath() + "/process/publicBusiness/collectFund/receivableVouch/receivableVouchAction!toEdit.do", {
			"dto['aab001']" : rowdata.aab001,
			"dto['aae140']" : rowdata.aae140,
			"dto['yae097']" : yae097
		}, "95%", "90%", null, null, true);
	}
	//保存
	function fnSave() {
		var rowdata = Base.getGridSelectedRows("dg_cb");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("frm", "receivableVouchAction!toSave.do", param);
	}

	// 行双击事件
	function fnClick2(e, rowdata) {
		Base.openWindow("HDInfo", "核定详情", myPath() + "/process/publicBusiness/collectFund/receivableVouch/receivableVouchAction!showMX.do", {
			"dto['yae518']" : rowdata.yae518
		}, "95%", "90%", null, null, true);
	}

	//批量
	//checkbox险种选择
	//选择险种类型
	function fnSelect() {
		var aae140_110 = Base.getObj("aae140_110").checked;
		var aae140_120 = Base.getObj("aae140_120").checked;
		if (aae140_110 == false || aae140_120 == false) {
			Base.getObj("aae140_110").checked = true;
			Base.getObj("aae140_120").checked = true;
		} else {
			Base.getObj("aae140_110").checked = false;
			Base.getObj("aae140_120").checked = false;
		}
	}

	function fnSelect1() {
		var aae140_110 = Base.getObj("aae140_110").checked;
		var aae140_120 = Base.getObj("aae140_120").checked;
		if (aae140_110 == false || aae140_120 == false) {
			Base.getObj("qx").checked = false;
		} else {
			Base.getObj("qx").checked = true;
		}
	}
	//开始结束期号验证
	function fnChange_1() {
		var aae042 = Base.getValue("aae042_1");
		var aae043 = Base.getValue("aae043_1");
		if (!(aae043 == '') && !(aae043 == null)) {
			if (aae042 > aae043) {
				Base.alert("开始年月不能大于结束年月");
				return;
			}
		}
	}
	function fnChange_2() {
		var aae042 = Base.getValue("aae042_1");
		var aae043 = Base.getValue("aae043_1");
		if (!(aae042 == '') && !(aae042 == null)) {
			if (aae042 > aae043) {
				Base.alert("开始年月不能大于结束年月");
				return;
			}
		}
	}
	//批量查询
	function fnBatchQuery() {
		Base.clearGridData("dg_batchcb");
		Base.clearGridData("dg_batchhistory");
		var aae042_1 = Base.getValue("aae042_1");
		var aae043_1 = Base.getValue("aae043_1");
		if (aae042_1 == '' || aae042_1 == null || aae043_1 == '' || aae043_1 == null) {
			Base.alert("请输入开始年月和结束年月后再查询！");
			return;
		}
		Base.submit("flst3", "receivableVouchAction!toQueryBatch.do", {
			"dto['aae140str']" : createAae140str()
		});
	}
	//批量保存
	function fnBatchSave() {
		var rowdata = Base.getGridSelectedRows("dg_batchcb");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst3", "receivableVouchAction!toSaveBatch.do", param);
	}

	function createAae140str() {
		var ary = [ "aae140_110", "aae140_210", "aae140_310", "aae140_330", "aae140_320", "aae140_370", "aae140_340", "aae140_410", "aae140_510" ];
		var aae140str = "";
		for (var i = 0; i < ary.length; i++) {
			if (Base.getObj(ary[i]).checked) {

				if (Base.getObj(ary[i]).hide) {
					continue;
				}
				if (Base.getObj(ary[i]).disabled) {
					continue;
				}
				aae140str = aae140str + ary[i].substring(ary[i].indexOf("_") + 1) + ",";
			}

		}
		return aae140str.substring(0, aae140str.length - 1);
	}

	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有错误数据需要导出,请确认!", "warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>