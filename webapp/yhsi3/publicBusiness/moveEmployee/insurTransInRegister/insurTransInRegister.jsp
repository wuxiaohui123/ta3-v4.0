<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转入登记</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入登记[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" methord="post" enctype="multipart/form-data">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true" cssStyle="overflow:auto">
			<ta:tab key="人员基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" haveSn="true" border="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续申请表和联系函" id="tab2">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="人员基本信息和基金转移信息" id="tab3" cssStyle="overflow:auto">
				<ta:panel id="pnlDZXX" key="转移基金登帐信息" expanded="false" scalable="false" height="92">
					<ta:datagrid id="ad12List" enableColumnMove="true" haveSn="true" selectType="radio" border="true" snWidth="30" fit="true">
						<%@ include file="/yhsi3/commonJSP/ad12.jsp"%>
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="pnlJBXX" key="人员基本信息" cols="2" height="133" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic90_jbxx.jsp"%>
				</ta:panel>
				<ta:panel id="pnlJJXX" key="基金转移信息" height="82" cols="2" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic90_jjxx.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="历年缴费及个人账户记账信息" id="tab4">
				<ta:panel id="pnl" key="" expanded="false" scalable="ture" fit="true">
					<ta:fieldset>
						<ta:box cols="2">
							<ta:box columnWidth="0.7" height="26">
								<ta:button id="addBtn" key="新增" icon="icon-table_add" onClick="addRow()" />
								<ta:button id="deleteBtn" key="删除" icon="icon-table_delete" onClick="Base.deleteGridSelectedRows('ic91List')" />
								<ta:fileupload key="上传" icon="icon-arrow_up" id="file" submitIds="" url="insurTransInRegisterAction!upload.do" />
							</ta:box>
							<ta:box columnWidth="0.3" height="26">
								<div style="width: 15%; padding-left: 0%; padding-top: 7px">
									<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="insurTransInRegisterAction!download.do" style="color: rgb(161, 161, 161); width: 180px;"> <strong> <pre>  >>下载模板<< </pre>
									</strong>
									</a>
								</div>
							</ta:box>
						</ta:box>
					</ta:fieldset>
					<ta:datagrid id="ic91List" snWidth="30" haveSn="true" selectType="checkbox" fit="true">
						<ta:datagridItem id="aab299" key="行政区划" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="text" />
						</ta:datagridItem>
						<ta:datagridItem id="aab300" key="地区名称" maxChart="5" align="center" dataAlign="left" />
						<ta:datagridItem id="aae001" key="年度" maxChart="2" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="2050" min="1950" />
						</ta:datagridItem>
						<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="205012" min="195001" />
						</ta:datagridItem>
						<ta:datagridItem id="aae042" key="终止年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="205012" min="195001" onChange="fnChangeAae042" />
						</ta:datagridItem>
						<ta:datagridItem id="aae202" key="月数" maxChart="2" align="center" dataAlign="right">
							<ta:datagridEditor type="number" max="12" min="0" />
						</ta:datagridItem>
						<ta:datagridItem id="aae180" key="月缴费基数" maxChart="5" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aaa042" key="单位缴费比例" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="4" max="9999999999.9999" />
						</ta:datagridItem>
						<ta:datagridItem id="aaa043" key="划入账户比例" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="4" max="9999999999.9999" />
						</ta:datagridItem>
						<ta:datagridItem id="aaa041" key="个人缴费比例" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="4" max="9999999999.9999" />
						</ta:datagridItem>
						<ta:datagridItem id="aae381" key="当年记账金额" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae264" key="其中个人部分" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae269" key="当年记账利息" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae265" key="其中个人部分" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae382" key="年末累计存储额" maxChart="7" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae273" key="其中个人部分" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae013" key="备注" maxChart="8" align="center" dataAlign="left" showDetailed="true">
							<ta:datagridEditor type="text" />
						</ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus('aac001');
		initializeSuggestFramework(1, "ac01", "aac001", 710, 400, 3, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证		
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransInRegisterAction!getEmpInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}

	//aic102 转移基金总额
	function fnAdd(o) {
		var aic093 = parseFloat(Base.getValue('aic093'), 2);
		var aic089 = parseFloat(Base.getValue('aic089'), 2);
		var aic082 = parseFloat(Base.getValue('aic082'), 2);
		var aic084 = parseFloat(Base.getValue('aic084'), 2);
		var zhnum = aic093 + aic089 + aic082;
		var allnum = aic093 + aic089 + aic082 + aic084;
		Base.setValue('aic083', zhnum);
		Base.setValue('aic102', allnum);
	}

	//报盘导入
	function toInput() {
		Base.submit("form1", "insurTransInRegisterAction!check.do");
	}

	//保存
	function toSave() {
		var rowdata1 = Base.getGridSelectedRows("ad12List");
		if (rowdata1 == '' || rowdata1 == null) {
			Base.alert("请选择转移基金信息");
			return;
		}
		var d1List = Ta.util.obj2string(rowdata1);
		var rowdata2 = Base.getGridSelectedRows("ic91List");
		if (rowdata2 == '' || rowdata2 == null) {
			Base.alert("请选择转移明细记录");
			return;
		}
		var d2List = Ta.util.obj2string(rowdata2);
		Base.submit("form1", "insurTransInRegisterAction!toSave.do", {
			"d1List" : d1List,
			"d2List" : d2List
		});
	}

	//通过行政区划代码自动获取参保地区名称
	function fnSetAab300(data, value) {
		var row = data.row + 1;
		var cell = data.cell + 1;
		Base.getJson("insurTransInRegisterAction!getAab300.do", {
			"dto['aab301']" : value
		}, function updateText(data) {
			try {
				var aab300 = data.fieldData.mydata;
				Base.setGridCellData("ic91List", row, cell, aab300);
			} catch (e) {
				alert(e.message);
			}
		});
	}

	//新增记录
	function addRow() {
		// 检查险种类型、开始年月、结束年月
		Base.addGridRowDown("ic91List", {
			"aab299" : Base.getValue("yac250"),
			"aab300" : Base.getValue("yac256")
		});
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	function fnChangeAae042(data, value) {
		var row = data.row + 1;
		var cell = data.cell + 1;
		var rowData = Base.getGridData("ic91List");
		var aae041 = rowData[row - 1].aae041;
		var aae042 = value;

		if ("" == aae041) {
			Base.alert("开始年月不能为空", "warn");
		} else if (aae042.substr(0, 4) != aae041.substr(0, 4)) {
			Base.alert("开始年月和结束年月必须在同一年中", "warn");
		} else {
			if (aae042 < aae041) {
				Base.alert("开始年月不小于结束年月", "warn");
			}
			var months = aae042 - aae041 + 1;
			var para = {
				"aae202" : months
			};
			Base.setGridRowData("ic91List", row, para);
		}
	}
	function fn_setRyInfo() {
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransInRegisterAction!getEmpInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>