<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>不同当事人同险种之间调账</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:tabs id="tabs1" fit="true">
		<ta:tab id="tab1" key="单个处理方式">
			<ta:toolbar id="toolbar">
				<ta:button id="btnQuery" key="查询[Q]" icon="xui-icon-query" hotKey="alt+q" asToolBarItem="true" onClick="fnQuery()" />
				<ta:button id="btnAdd" key="新增[A]" icon="xui-icon-spotAdd" hotKey="alt+a" asToolBarItem="true" onClick="fnAddRow()" />
				<ta:button id="btnDel" key="删除[D]" icon="xui-icon-spotDelete" hotKey="alt+D" asToolBarItem="true" onClick="fnDeleteRow()" />
				<ta:button key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+s" asToolBarItem="true" disabled="false" id="saveBtn" onClick="toSave(1);" />
				<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+r" id="resetBtn" asToolBarItem="true" type="resetPage" />
				<ta:button id="btnClose1" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="fnClose()" asToolBarItem="true" />
			</ta:toolbar>
			<ta:panel key="支出单位信息" cols="3" id="fltUnit1" expanded="false" scalable="false">
				<ta:box cols="2">
					<ta:text id="aaz010" key="单位编号" labelWidth="120" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" onChange="callDwRyRPC()" columnWidth="0.9" />
					<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
						<ta:button id="showDwRyRPCBtn" key="?" onClick="showDwRyRPC()" />
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="yae030" key="单位名称" readOnly="true" span="2" labelWidth="120" />
				<ta:text id="aaz010type" key="当事人类型" readOnly="true" labelWidth="120" display="false" />
			</ta:panel>
			<ta:panel key="收入单位信息" cols="3" id="fltUnit2" expanded="false" scalable="false">
				<ta:box cols="2">
					<ta:text id="aab001_s" key="单位编号" labelWidth="125" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
					<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
						<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="aae044_s" key="单位名称" readOnly="true" span="2" labelWidth="120" />
			</ta:panel>
			<ta:panel cols="1" key="调账备注" expanded="false" scalable="false">
				<ta:text id="aae013" key="备注" span="3" labelWidth="120" />
			</ta:panel>
			<ta:tabs id="tabs2" fit="true">
				<ta:tab id="tab21" key="单位参保信息">
					<ta:datagrid id="fundGrid1" forceFitColumns="true" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位ID" width="120" align="center" />
						<ta:datagridItem id="aae044" key="单位名称" width="160" align="center" />
						<ta:datagridItem id="aae140" key="险种类型" width="160" collection="AAE140" align="center" />
						<ta:datagridItem id="aab050" key="参保日期" width="100" align="center" dataType="date" />
						<ta:datagridItem id="aab051" key="参保状态" width="100" collection="AAB051" align="center" />
						<ta:datagridItem id="yae097" key="最大做账期号" width="100" align="center" />
						<ta:datagridItem id="aaz136" key="基数核定规则ID" width="130" collection="AAZ136" align="center" />
						<ta:datagridItem id="yaz289" key="缴费核定规则ID" collection="YAZ289" width="160" align="center" />
						<ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" width="100" align="center" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab22" key="待转金信息">
					<ta:datagrid id="fundGrid2" forceFitColumns="true" fit="true" snWidth="30" haveSn="true" selectType="checkbox">
						<ta:datagridItem id="aaz010" key="当事人ID" width="100" align="center" />
						<ta:datagridItem id="yae030" key="当事人名称" width="120" align="center" />
						<ta:datagridItem id="aae140" key="险种类型" width="120" collection="AAE140" align="center" />
						<ta:datagridItem id="aaa093" key="承担缴费主体类型" collection="AAA093" width="175" align="center" />
						<ta:datagridItem id="yae080" key="金额" width="100" dataAlign="right" align="center" />
						<ta:datagridItem id="yad001" key="调帐金额" width="120" dataAlign="right" align="center">
							<ta:datagridEditor type="text" onChange="fnJEChange" />
						</ta:datagridItem>
						<ta:datagridItem id="yaa339" key="(收)主体类型" width="120" align="center">
							<ta:datagridEditor type="selectInput" collection="AAA093" />
						</ta:datagridItem>
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab23" key="本次申请信息">
					<ta:datagrid id="fundGrid3" forceFitColumns="true" selectType="checkbox" fit="true">
						<ta:datagridItem id="aaz010" key="(支)当事人ID" width="100" align="center" />
						<ta:datagridItem id="yae030_zc" key="(支)当事人名称" width="150" align="center" />
						<ta:datagridItem id="aaa018" key="(支)险种类型" width="150" collection="AAE140" align="center" />
						<ta:datagridItem id="aaa093" key="(支)主体类型" collection="AAA093" width="120" align="center" />
						<ta:datagridItem id="yad001" key="金额" width="80" align="center" dataAlign="right" />
						<ta:datagridItem id="aaz085" key="(收)当事人ID" width="100" align="center" />
						<ta:datagridItem id="yae030_sr" key="(收)当事人名称" width="120" align="center" />
						<ta:datagridItem id="aaa019" key="(收)险种类型" width="120" collection="AAE140" align="center" />
						<ta:datagridItem id="yaa339" key="(收)主体类型" width="120" collection="AAA093" align="center" />
						<ta:datagridItem id="aae013" key="备注" width="120" align="center" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab24" key="事件流程信息">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:tab>
		<ta:tab id="tab2" key="批量处理方式">
			<ta:toolbar id="tlb1">
				<ta:button id="btnDel2" key="删除[D]" icon="xui-icon-spotDelete" hotKey="alt+D" asToolBarItem="true" onClick="fnDeleteRow1()" />
				<ta:button key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" asToolBarItem="true" disabled="false" id="saveBtn1" onClick="toSave(2);" />
				<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" id="resetBtn1" asToolBarItem="true" type="resetPage" />
			</ta:toolbar>
			<ta:panel key="数据文件选择" id="fltftp1" cols="3" expanded="false" scalable="false">
				<ta:fileupload key="上传文件" id="file" url="sameInsAdjustAction!upload.do" />
				<div style="padding-top:10px;padding-left:0px">
					<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="sameInsAdjustAction!download.do" style="color:rgb(161,161,161);width:200px;"> <strong> <pre> >>下载模板<< </pre>
					</strong>
					</a>
				</div>
			</ta:panel>
			<ta:panel id="tab31" key="本次申报信息" fit="true" expanded="false" scalable="false">
				<ta:datagrid id="fundGrid4" forceFitColumns="true" selectType="checkbox" fit="true">
					<ta:datagridItem id="aaz010" key="(支)当事人ID" width="100" align="center" />
					<ta:datagridItem id="yae030_zc" key="(支)当事人名称" width="120" align="center" />
					<ta:datagridItem id="aaa018" key="(支)险种类型" width="120" collection="AAE140" align="center" />
					<ta:datagridItem id="aaa093" key="(支)主体类型" collection="AAA093" width="120" align="center" />
					<ta:datagridItem id="yad001" key="金额" width="80" align="center" dataAlign="right" />
					<ta:datagridItem id="aaz085" key="(收)当事人ID" width="100" align="center" />
					<ta:datagridItem id="yae030_sr" key="(收)当事人名称" width="120" align="center" />
					<ta:datagridItem id="aaa019" key="(收)险种类型" width="120" collection="AAE140" align="center" />
					<ta:datagridItem id="yaa339" key="(收)主体类型" width="120" collection="AAA093" align="center" />
					<ta:datagridItem id="aae013" key="备注" width="100" align="center" />
				</ta:datagrid>
			</ta:panel>
		</ta:tab>
	</ta:tabs>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aaz010");
		Base.setDisabled("btnAdd,btnDel");
		Base.hideObj("btnClose1");
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, getAaz010, 0, false);
		initializeSuggestFramework(3, 'ab01', 'aab001_s', 500, 200, 3, getAab01_s, 0, false);
	});
	var aae341 = '010101';
	//当事人信息回调函数
	function getAaz010() {
		Base.setValue('aaz010', g_Suggest[1]);
		aaz010 = g_Suggest[1];
		Base.setValue('yae030', g_Suggest[2]);
		yae030 = g_Suggest[2];
		Base.setValue('aaz010type', g_Suggest[0]);
		Base.clearGridData("fundGrid1");
		Base.clearGridData("fundGrid2");
		Base.clearGridData("fundGrid3");
		Base.clearGridData("ae02Grid");
		Base.setValue("aae016", "");
		Base.setValue("aae416", "");
		Base.setValue("aae419", "");
		Base.submit("fltUnit1", "sameInsAdjustAction!toCheckAAZ010.do", "", function() {
			return true
		}, false, fnSuccess, fnFailure);
	}

	//删除待转金调帐记录
	function fnDeleteRow() {
		var rows = Base.getGridSelectedRows("fundGrid3"); //获取表格选中行
		if (rows.length > 0) {
			Base.confirm("确定删除该记录吗?", function(yes) {
				if (yes) {
					Base.deleteGridSelectedRows("fundGrid3");
				}
			});
		} else {
			Base.alert("请勾选要删除的数据!", "warn");
		}
	}

	//删除待转金调帐记录
	function fnDeleteRow1(data, e) {
		var rows = Base.getGridSelectedRows("fundGrid4"); //获取表格选中行
		if (rows.length > 0) {
			Base.confirm("确定删除该记录吗?", function(yes) {
				if (yes) {
					Base.deleteGridSelectedRows("fundGrid4");
				}
			});
		} else {
			Base.alert("请勾选要删除的数据!", "warn");
		}
	}
	//单位信息回调函数
	function getAab01_s() {
		if (g_Suggest[1] == aaz010) {
			Base.alert("你输入的两个单位相同!", "warn");
			Base.setValue('aab001_s', "");
			return;
		} else {
			Base.setValue('aab001_s', g_Suggest[1]);
			aae044_s = g_Suggest[2];
			if (g_Suggest != "") {
				Base.submit("fltUnit2", "sameInsAdjustAction!getAab001_s.do");
			}
			Base.setEnable("btnAdd");
		}
	}

	function fnSuccess() {
		Base.submit("aaz010", "sameInsAdjustAction!getAb02.do");
		Base.submit("aaz010,yae030,aaz010type", "sameInsAdjustAction!getAe28.do");
	}

	function fnFailure(data) {
		Base.submit("aaz010,yae030,aaz010type", "sameInsAdjustAction!getAb02.do");
	}

	function fnJEChange(data, value) {
		var yae080 = data.item.yae080;
		var yad001 = data.item.yad001;
		if (yad001 > yae080) {
			Base.alert("调帐金额不能大于待转金余额!", "warn");
			Base.setDisabled("btnAdd");
			Base.setDisabled("saveBtn");
			return;
		}
	}

	//列表添加一行
	function fnAddRow(data) {
		aaz010 = Base.getValue("aaz010");
		aab001_s = Base.getValue("aab001_s");
		aae013 = Base.getValue("aae013");
		aae044_s = Base.getValue("aae044_s");
		if (aaz010 == aab001_s) {
			Base.alert("同当事人不能进行险种调帐!", "warn", focus("aab001_s"));
			Base.setValue('aab001_s', "");
			return;
		}
		if (aab001_s == "" && aab001_s.length == 0) {
			Base.alert("请输入收入单位信息!", "warn", Base.focus("aab001_s"));
			return;
		}

		var data = Base.getGridSelectedRows("fundGrid2");
		if (data.length == 0) {
			Base.alert("请勾选有效的信息进行新增!", "warn");
			return;
		}

		var aae140;
		var yad001;
		var yaa339;
		var aaa093;
		var yae030;
		for (var i = 0; i < data.length; i++) {
			aae140 = data[i].aae140;
			yad001 = data[i].yad001;
			yaa339 = data[i].yaa339;
			if (yaa339 == '' || yaa339 == undefined) {
				Base.alert("请先填写（收）主体类型!", "warn");
				Base.activeTab("tab22");
				return;
			}
			aaa093 = data[i].aaa093;
			yae030 = data[i].yae030;
			if (yad001 != null && yad001 != "") {
				Base.addGridRowDown("fundGrid3", {
					"yae030_zc" : yae030,
					"aaz010" : aaz010,
					"aaa018" : aae140,
					"aaa093" : aaa093,
					"yad001" : yad001,
					"aaz085" : aab001_s,
					"yae030_sr" : aae044_s,
					"aaa019" : aae140,
					"yaa339" : yaa339,
					"aae013" : aae013,
				});
			}
		}
		Base.setEnable("btnDel");
		Base.activeTab("tab23");
	}
	function fnDelRow(gridId) {
		Base.deleteGridSelectedRows(gridId);
	}
	function toSave(x) {
		var gridData = null;
		if (x == 1) {
			gridData = Base.getGridData("fundGrid3");
		}
		if (x == 2) {
			gridData = Base.getGridData("fundGrid4");
		}
		//判断提交数据是否为空
		if (gridData == null || gridData.length == 0) {
			Base.alert("本次申请记录为空,请勾选调帐申请信息!", "warn");
			return;
		}
		var param = {};
		if (gridData == '' || gridData == null) {
			Base.alert("没有数据需要保存!", "warn");
			return;
		}
		param.d2List = Ta.util.obj2string(gridData);
		if (gridData.length == 1) {
			Base.submit("", "sameInsAdjustAction!toSave.do", param);
		} else {
			Base.submit("", "sameInsAdjustAction!toSaveBatch.do", param);
		}
	}

	function fnQuery() {
		var aaz010 = Base.getValue("aaz010");
		if (aaz010 == null || aaz010 == "") {
			Base.alert("当事人ID不能为空,请输入值!", "warn", function() {
				Base.focus("aaz010");
			});
			return;
		}
		Base.submit("aaz010,yae030,aaz010type", "sameInsAdjustAction!toCheckAAZ010.do", "", function() {
			return true
		}, false, fnSuccess, fnFailure);
	}
	//关闭编辑窗口
	function fnClose() {
		parent.Base.closeWindow("userwin");
	}
	/***单位***/
	//打开单位RPC弹出窗口
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			alert(parent.getValue('aab001'));
			Base.setValue("aab001_s", parent.getValue('aab001'));
		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(3, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001_s")
		});
	}
	/***单位个人***/
	//打开个人单位的RPC
	function callDwRyRPC() {
		sfwQueryUtil_newRPC(1, 'getDSRXXString', {
			"dto['inputString']" : Base.getValue('aaz010')
		});
	}

	function showDwRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow06.do", null, 1000, 450, null, function() {
			Base.clearGridData("fundGrid1");
			Base.clearGridData("fundGrid2");
			Base.clearGridData("fundGrid3");
			Base.clearGridData("ae02Grid");
			Base.setValue("aae016", "");
			Base.setValue("aae416", "");
			Base.setValue("aae419", "");
			Base.submit("fltUnit1", "sameInsAdjustAction!toCheckAAZ010.do", "", function() {
				return true
			}, false, fnSuccess, fnFailure);
		}, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>