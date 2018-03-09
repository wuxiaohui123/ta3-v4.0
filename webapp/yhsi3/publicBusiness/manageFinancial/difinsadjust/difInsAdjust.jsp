<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>同当事人不同险种之间调账</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:tabs id="tabs1" fit="true">
		<ta:tab id="tab1" key="单个处理方式">
			<ta:toolbar id="tlb1">
				<ta:button id="btnQuery" key="查询[Q]" icon="xui-icon-query" hotKey="alt+Q" asToolBarItem="true" onClick="fnQuery()" />
				<ta:button id="btnAdd" key="新增[A]" icon="xui-icon-spotAdd" hotKey="alt+A" asToolBarItem="true" onClick="fnAddGridApp1()" />
				<ta:button id="btnDel" key="删除[D]" icon="xui-icon-spotDelete" hotKey="alt+D" asToolBarItem="true" onClick="fnDeleteRow()" />
				<ta:button id="btnSave1" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" asToolBarItem="true" onClick="fnSaveGridApp(1)" />
				<ta:button id="btnReset1" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" type="resetPage" asToolBarItem="true" />
				<ta:button id="btnClose1" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="fnClose()" asToolBarItem="true" />
			</ta:toolbar>

			<ta:panel key="当事人信息" cols="3" expanded="false" scalable="false">
				<ta:box cols="2">
					<ta:text id="aaz010" key="单位编号" labelWidth="120" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" onChange="callDwRyRPC()" columnWidth="0.9" />
					<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
						<ta:button id="showDwRPCBtn" key="?" onClick="showDwRyRPC()" />
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="yae030" key="当事人名称" readOnly="true" span="2" labelWidth="120" />
				<ta:text id="aaz010type" key="当事人类型" readOnly="true" labelWidth="120" display="false" />
			</ta:panel>

			<ta:form id="frmFund">
				<ta:panel key="调帐信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aaa018_zc" key="支出险种" required="true" labelWidth="120" collection="AAE140" onSelect="fnSelectAaa018" />
					<ta:selectInput id="aaa093_zc" key="支出主体类型" required="true" labelWidth="120" collection="AAA093" value="2" onSelect="fnSelectAaa093" />
					<ta:text id="yad001_zc" key="支出金额" required="true" labelWidth="120" onChange="checkYad001()" />
					<ta:selectInput id="aaa019_sr" key="收入险种" required="true" labelWidth="120" collection="AAE140" onSelect="fnSelectAaa019" />
					<ta:selectInput id="yaa339_sr" key="收入主体类型" required="true" labelWidth="120" collection="AAA093" value="2" onSelect="fnSelectYaa339" />
					<ta:text id="aae013" key="备注" span="3" labelWidth="120" />
					<ta:text id="aaz002" key="日志记录id" span="1" labelWidth="120" display="false" />
				</ta:panel>
			</ta:form>

			<ta:tabs id="tabs2" fit="true">
				<ta:tab id="tab21" key="单位参保信息">
					<ta:datagrid id="gridEmployer" forceFitColumns="true" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="50"></ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="120" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" width="100"></ta:datagridItem>
						<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aab051" key="参保状态" align="center" dataAlign="left" collection="AAB051" width="50"></ta:datagridItem>
						<ta:datagridItem id="yae097" key="最大做帐期号" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aaz136" key="基数核定规则ID" align="center" dataAlign="left" collection="AAZ136" width="80"></ta:datagridItem>
						<ta:datagridItem id="yaz289" key="缴费核定规则ID" align="center" dataAlign="left" collection="YAZ289" width="100"></ta:datagridItem>
						<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" collection="AAB301"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab22" key="待转金信息">
					<ta:datagrid id="gridFund" forceFitColumns="true" fit="true" haveSn="true">
						<ta:datagridItem id="aaz010" key="当事人ID" width="100" align="center" dataAlign="left"></ta:datagridItem>
						<ta:datagridItem id="yae030" key="当事人名称" width="180" align="center" dataAlign="left" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaa028" key="当事人类别" width="120" align="center" dataAlign="left" collection="AAA028"></ta:datagridItem>
						<ta:datagridItem id="aae140" key="险种类型" width="180" align="center" dataAlign="left" collection="AAE140"></ta:datagridItem>
						<ta:datagridItem id="aaa093" key="承担缴费主体类型" width="120" align="center" dataAlign="left" collection="AAA093"></ta:datagridItem>
						<ta:datagridItem id="yae080" key="金额" width="120" align="center" dataAlign="right"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab23" key="本次申请信息">
					<ta:datagrid id="gridApp1" selectType="checkbox" fit="true">
						<ta:datagridItem id="aaz010" key="(支)当事人ID" align="center" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="aaz010type" key="(支)当事人类型" align="center" dataAlign="left" width="100" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="yae030_zc" key="(支)当事人名称" align="center" dataAlign="left" width="150" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaa018" key="(支)险种类型" align="center" dataAlign="left" width="150" collection="AAE140" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaa093" key="(支)主体类型" align="center" dataAlign="left" width="120" collection="AAA093"></ta:datagridItem>
						<ta:datagridItem id="yad001" key="金额" align="center" dataAlign="right" width="90"></ta:datagridItem>
						<ta:datagridItem id="aaz085" key="(收)当事人ID" align="center" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yae030_sr" key="(收)当事人名称" align="center" dataAlign="left" width="150" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaa019" key="(收)险种类型" align="center" dataAlign="left" width="150" collection="AAE140" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="yaa339" key="(收)主体类型" align="center" dataAlign="left" width="120" collection="AAA093"></ta:datagridItem>
						<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" showDetailed="true" width="150"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab24" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:tab>
		<ta:tab id="tab2" key="批量处理方式">
			<ta:toolbar id="tlb2">
				<ta:button id="btnDel2" key="删除[D]" icon="xui-icon-spotDelete" hotKey="alt+D" asToolBarItem="true" onClick="fnDeleteRow1()" />
				<ta:button id="btnSave2" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" asToolBarItem="true" onClick="fnSaveGridApp(2)" />
			</ta:toolbar>

			<ta:form id="frmFile" fit="true">
				<ta:panel key="数据文件选择" cols="6" expanded="false" scalable="false">
					<ta:fileupload key="上传文件" id="theFile" submitIds="frmFile" url="difInsAdjustAction!upload.do" />
					<div style="padding-top:10px;padding-left:0px">
						<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="difInsAdjustAction!download.do" style="color:rgb(161,161,161);width:200px;"> <strong> <pre> >>下载模板<< </pre>
						</strong>
						</a>
					</div>
				</ta:panel>

				<ta:panel id="tab31" key="本次申请信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="gridApp2" selectType="checkbox" fit="true">
						<ta:datagridItem id="aaz010" key="(支)当事人ID" align="center" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yae030_zc" key="(支)当事人名称" align="center" dataAlign="left" width="150" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaz010type" key="(支)当事人类型" align="center" dataAlign="left" width="100" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aaa018" key="(支)险种类型" align="center" dataAlign="left" width="120" collection="AAE140" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaa093" key="(支)主体类型" align="center" dataAlign="left" width="120" collection="AAA093"></ta:datagridItem>
						<ta:datagridItem id="yad001" key="金额" align="center" dataAlign="right" width="90"></ta:datagridItem>
						<ta:datagridItem id="aaz085" key="(收)当事人ID" align="center" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yae030_sr" key="(收)当事人名称" align="center" dataAlign="left" width="150" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aaa019" key="(收)险种类型" align="center" dataAlign="left" width="120" collection="AAE140" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="yaa339" key="(收)主体类型" align="center" dataAlign="left" width="120" collection="AAA093"></ta:datagridItem>
						<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" showDetailed="true" width="150"></ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:form>
		</ta:tab>
	</ta:tabs>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		//置灰按钮
		Base.setDisabled("btnAdd,btnDel,btnDel2,btnSave1,btnSave2");
		//聚焦第一个输入框
		Base.focus("aaz010");
		Base.hideObj("btnClose1");
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 3, fn_getAb01, 0, false);
	});
	//rpc回调函数,获取待转金额度大于0的信息
	function fn_getAb01() {
		if (!g_Suggest != null) {
			//设置显示当事人id、名称、类别
			Base.setValue("aaz010", g_Suggest[1]);
			Base.setValue("yae030", g_Suggest[2]);
			Base.setValue("aaz010type", g_Suggest[0]);
			Base.setValue("yad001_zc", "");
			Base.clearGridData("gridEmployer");
			Base.clearGridData("gridFund");
			Base.clearGridData("gridApp1");
			Base.clearGridData("ae02Grid");
			Base.setValue("aae016", "");
			Base.setValue("aae416", "");
			Base.setValue("aae419", "");
			//提交请求查询该当事人是否有未复核的记录,如果有则显示未复核的所有信息
			Base.submit("aaz010,yae030,aaz010type", "difInsAdjustAction!toCheckAAZ010.do", "", function() {
				return true
			}, false, fnSuccess, fnFailure);
		}
	}

	function fnSuccess(data) {
		//提交请求查询待转金额度大于0的支出险种类型列表、当事人已参保收入险种类型列表
		Base.submit("aaz010,yae030,aaz010type", "difInsAdjustAction!getAe28.do", "", function() {
			return true
		}, false, function() {
			Base.setEnable("btnAdd,btnSave1");
		}, function() {
			Base.setDisabled("btnAdd,btnSave1");
			Base.clearData("frmFund");
			Base.clearGridData("gridEmployer");
			Base.clearGridData("gridFund");
			Base.clearGridData("gridApp1");
			Base.activeTab("tab21");
			//清空事件流程记录
			Base.setValue("aae016", "");
			Base.setValue("aae419", "");
			Base.setValue("aae416", "");
			Base.clearGridData("ae02Grid");
		});
		//提交请求查询当事人单位所有参保信息
		Base.submit("aaz010,aaz010type", "difInsAdjustAction!getAb02.do");
	}

	function fnFailure(data) {

	}

	//选择支出险种类型时获取支出主体类型
	function fnSelectAaa018(value, key) {
		var param = {
			"dto['aaz010']" : Base.getValue("aaz010"),
			"dto['aae140']" : key,
			"dto['type']" : "1"
		};
		Base.submit("", "difInsAdjustAction!getAe28_.do", param);
		var sr = Base.getValue("aaa019_sr");
		if (sr != '') {
			if (sr == key) {
				Base.alert("支出险种和收入险种不能相同,请重新选择!", "warn");
				Base.setValue("aaa018_zc", "");
				return;
			}
		}
	}

	function fnSelectAaa093(value, key) {
		Base.setValue("yaa339_sr", key);
	}

	function fnSelectYaa339(value, key) {
		var sr = Base.getValue("yaa339_sr");
		var zc = Base.getValue("aaa093_zc");
		if (sr != zc) {
			Base.alert("收入方主体类型必须跟支出方主体类型保持一致,请重新选择收入方主题类型!", "warn", function() {
				Base.focus("yaa339_sr");
			});
		}
	}

	//检查收入险种跟支出险种是否不一致
	function fnSelectAaa019(value, key) {
		var zc = Base.getValue("aaa018_zc");
		if (zc == key) {
			Base.alert("收入险种和支出险种不能相同,请重新选择!", "warn");
			Base.setValue("aaa019_sr", "");
			return;
		}
	}

	//添加一行到表格gridApp1
	function fnAddGridApp1() {
		//检查输入和支出险种是否一致
		var zc = Base.getValue("aaa018_zc");
		var sr = Base.getValue("aaa019_sr");
		if (zc == null || zc == "") {
			Base.alert("支出险种必须选择!", "warn", function() {
				Base.focus("aaa018_zc")
			});
			return;
		}
		if (sr == null || sr == "") {
			Base.alert("收入险种必须选择!", "warn", function() {
				Base.focus("aaa019_sr")
			});
			return;
		}
		if (zc == sr) {
			Base.alert("收入险种和支出险种不能一样,请重新输入!", "warn", Base.focus("aaa018_zc"));
			return;
		}

		Base.activeTab("tab23");
		//获取录入信息
		var aaz010 = Base.getValue("aaz010");
		var yae030 = Base.getValue("yae030");
		var aaa018 = Base.getValue("aaa018_zc");
		var aaa093 = Base.getValue("aaa093_zc");
		var yad001 = Base.getValue("yad001_zc");
		var aaa019 = Base.getValue("aaa019_sr");
		var yaa339 = Base.getValue("yaa339_sr");
		var aae013 = Base.getValue("aae013");
		var aaz010type = Base.getValue("aaz010type");

		if (yad001 == null || yad001 == "") {
			Base.alert("支出金额不能为空!", "warn", function() {
				Base.focus("yad001_zc")
			});
			return;
		}

		//检查同一当事人同一支出险种待转金额度相加是否超过待转金总额
		var data = Base.getGridData("gridApp1");
		var sum = yad001;
		if (data != null && data.length != 0) {
			for (var i = 0; i < data.length; i++) {
				sum = Number(sum) + Number(data[i]["yad001"]);
			}
		}
		var fund = 0;
		var dataFund = Base.getGridData("gridFund");
		for (var i = 0; i < dataFund.length; i++) {
			//利用当事人id、支出险种、支出险种主体类型判定获取待转金余额
			if (dataFund[i]["aaz010"] == aaz010 && dataFund[i]["aae140"] == aaa018 && dataFund[i]["aaa093"] == aaa093) {
				fund = dataFund[i]["yae080"];
				break;
			}
		}

		if (sum > fund) {
			Base.alert("调帐记录金额总数已经大于待转金余额,请重新填写调帐金额!", "warn", Base.focus("yad001_zc"));
			if (data == null || data.length == 0) {
				Base.activeTab("tab22");
			}
			return;
		}

		//设置表格列数据
		var data = {
			"aaz010" : aaz010,
			"aaz010type" : aaz010type,
			"yae030_zc" : yae030,
			"aaa018" : aaa018,
			"aaa093" : aaa093,
			"aaz085" : aaz010,
			"yae030_sr" : yae030,
			"yad001" : yad001,
			"aaa019" : aaa019,
			"yaa339" : yaa339,
			"aae013" : aae013
		};
		//将数据添加至表格
		Base.addGridRow("gridApp1", data);
		Base.setEnable("btnDel");
	}

	//检查调帐金额不能大于账户余额
	function checkYad001() {
		var yad001 = Base.getValue("yad001_zc");
		var aaa018 = Base.getValue("aaa018_zc");

		if (aaa018 == null || aaa018 == "") {
			Base.alert("请选择支出险种", "warn", function() {
				Base.focus("aaa018_zc");
			});
			return;
		}

		var fundData = Base.getGridData("gridFund");
		for (var i = 0; i < fundData.length; i++) {
			if (fundData[0]["aaa018"] == aaa018) {
				var fund = eval(fundData)[0]["yae080"];
				if (yad001 > fund) {
					Base.alert("调帐金额不能大于账户余额!", "error", function() {
						Base.setValue("yad001_zc", "");
						Base.focus("yad001_zc");
					});
				}
			}
		}

	}

	//删除待转金调帐记录
	function fnDeleteRow() {
		var rows = Base.getGridSelectedRows("gridApp1"); //获取表格选中行
		if (rows.length > 0) {
			Base.confirm("确定删除该记录吗?", function(yes) {
				if (yes) {
					Base.deleteGridSelectedRows("gridApp1");
				}
			});
		} else {
			Base.alert("请勾选要删除的数据!", "warn");
		}
	}

	//删除待转金调帐记录
	function fnDeleteRow1(data, e) {
		var rows = Base.getGridSelectedRows("gridApp2"); //获取表格选中行
		if (rows.length > 0) {
			Base.confirm("确定删除该记录吗?", function(yes) {
				if (yes) {
					Base.deleteGridSelectedRows("gridApp2");
				}
			});
		} else {
			Base.alert("请勾选要删除的数据!", "warn");
		}
	}
	//保存gridApp1表格的调帐记录
	function fnSaveGridApp(x) {
		var gridData = null;
		if (x == 1) {
			gridData = Base.getGridData("gridApp1");
		}
		if (x == 2) {
			gridData = Base.getGridData("gridApp2");
		}
		//判断提交数据是否为空
		if (gridData == null || gridData.length == 0) {
			Base.alert("本次申请记录为空,请勾选调帐申请信息!", "warn");
			return;
		}
		var param = {};
		param.app1List = Ta.util.obj2string(gridData);
		Base.submit("frmFund", "difInsAdjustAction!toSaveGridApp.do", param, function() {
			return true;
		}, false, fnSaveSuccessCallback);
	}

	function fnSaveSuccessCallback() {
		//Base.alert("save success callback");
	}
	//查询
	function fnQuery() {
		var aaz010 = Base.getValue("aaz010");
		if (aaz010 == null || aaz010 == "") {
			Base.alert("当事人ID不能为空,请输入值!", function() {
				Base.focus("aaz010")
			});
			return;
		}
		Base.submit("aaz010,yae030,aaz010type", "difInsAdjustAction!toCheckAAZ010.do", "", function() {
			return true
		}, false, fnSuccess, fnFailure);
	}
	//关闭编辑窗口
	function fnClose() {
		parent.Base.closeWindow("userwin");
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
			Base.setValue("yad001_zc", "");
			Base.clearGridData("gridEmployer");
			Base.clearGridData("gridFund");
			Base.clearGridData("gridApp1");
			Base.clearGridData("ae02Grid");
			Base.setValue("aae016", "");
			Base.setValue("aae416", "");
			Base.setValue("aae419", "");
			//提交请求查询该当事人是否有未复核的记录,如果有则显示未复核的所有信息
			Base.submit("aaz010,yae030,aaz010type", "difInsAdjustAction!toCheckAAZ010.do", "", function() {
				return true
			}, false, fnSuccess, fnFailure);
		}, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>