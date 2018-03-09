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
		<ta:button id="printBtn" key="打印复函" icon="icon-print" onClick="fnPrint();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" enctype="multipart/form-data" methord="post">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true" cssStyle="overflow:auto">
			<ta:tab key="人员基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="yab003" key="参保所属机构" labelWidth="150" display="false" />
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
				<ta:panel id="pnlDZXX" key="转移基金登帐信息" expanded="false" scalable="false" height="130">
					<ta:datagrid id="ad12List" enableColumnMove="true" haveSn="true" selectType="radio" border="true" snWidth="30" fit="true" onRowClick="fnChecked">
						<%@ include file="/yhsi3/commonJSP/ad12.jsp"%>
					</ta:datagrid>
				</ta:panel>

				<ta:panel id="pnlJBXX" key="人员转移信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aab004" key="转出单位名称" readOnly="true" labelWidth="150" required="true" />
					<ta:date id="aae035" key="转移时间" readOnly="true" labelWidth="150" showSelectPanel="true" issue="true" required="true" />
					<ta:number id="aic083" key="个人账户基金转移额" onChange="fncheckAic083()" labelWidth="150" value="0" precision="2" readOnly="true" required="true" />
					<ta:number id="aae240" key="个人账户存储存储额" labelWidth="150" value="0" precision="2" display="false" readOnly="true" />
					<ta:number id="aic102" key="转移基金总额" labelWidth="150" value="0" precision="2" display="false" readOnly="true" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="历年缴费及个人账户记账信息" id="tab4">
				<ta:panel id="pnl" key="" expanded="false" scalable="ture" fit="true">
					<ta:fieldset>
						<ta:box cols="2">
							<ta:box columnWidth="0.7" height="26">
								<ta:button id="addBtn" key="新增" icon="icon-table_add" onClick="Base.addGridRow('ic91List')" />
								<ta:button id="deleteBtn" key="删除" icon="icon-table_delete" onClick="Base.deleteGridSelectedRows('ic91List')" />
								<ta:fileupload key="上传" icon="icon-arrow_up" id="flie" url="insurTransInRegisterYbAction!upload.do" />
							</ta:box>
							<ta:box columnWidth="0.3" height="26">
								<div style="width: 15%; padding-left: 0%; padding-top: 7px">
									<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="insurTransInRegisterYbAction!download.do" style="color: rgb(161, 161, 161); width: 180px;"> <strong> <pre>  >>下载模板<< </pre>
									</strong>
									</a>
								</div>
							</ta:box>
						</ta:box>
					</ta:fieldset>
					<ta:datagrid id="ic91List" snWidth="30" haveSn="true" selectType="checkbox" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aab299" key="行政区划" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="text" onChange="fnSetAab300" />
						</ta:datagridItem>
						<ta:datagridItem id="aab300" key="地区名称" maxChart="5" align="center" dataAlign="left" />
						<ta:datagridItem id="aae001" key="年度" maxChart="2" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="2050" min="1950" />
						</ta:datagridItem>
						<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="205012" min="195001" />
						</ta:datagridItem>
						<ta:datagridItem id="aae042" key="终止年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="205012" min="195001" />
						</ta:datagridItem>
						<ta:datagridItem id="aae382" key="年末累计存储额" maxChart="7" align="center" dataAlign="right">
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
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus('aac001');
		Base.setDisabled("printBtn");
		initializeSuggestFramework(1, "ac01", "aac001", 710, 400, 6, fn_getQuery, 0, false);
		Base.setPanelTitle("pnl", "&nbsp;支持手工和文件两种方式</span>", true);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证		
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransInRegisterYbAction!getEmpInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}
	function fncheckAic083() {
		Base.setValue("aae240", Base.getValue("aic083"));
		Base.setValue("aic102", Base.getValue("aic083"));
	}

	//报盘导入
	function toInput() {
		Base.submit("form1", "insurTransInRegisterYbAction!check.do");
	}

	function fnChecked(e, rowsData) {
		Base.setValue("aic083", rowsData.yad003);
	}

	//保存
	function toSave() {
		var rowdata1 = Base.getGridSelectedRows("ad12List");
		var d1List = Ta.util.obj2string(rowdata1);
		var rowdata2 = Base.getGridSelectedRows("ic91List");
		if (rowdata2.length == 0) {
			Base.alert("请选择转移明细记录");
			return;
		}
		var d2List = Ta.util.obj2string(rowdata2);
		Base.submit("form1", "insurTransInRegisterYbAction!toSave.do", {
			"d1List" : d1List,
			"d2List" : d2List
		});
	}

	//通过行政区划代码自动获取参保地区名称
	function fnSetAab300(data, value) {
		var row = data.row + 1;
		var cell = data.cell + 1;
		Base.getJson("insurTransInRegisterYbAction!getAab300.do", {
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

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//打印复函
	function fnPrint() {
		var aac001 = Base.getValue("aac001");
		var yab003 = Base.getValue("yab003");
		var fileName = "ylzyfhPrint.raq";
		var prm = "aac001=" + aac001 + ";yab003=" + yab003
		if (aac001 == "" || aac001 == null || yab003 == "" || yab003 == null) {
			Base.alert("打印有误，请联系管理员");
		} else {
			fnPrintComm(fileName, prm);
		}
	}

	function fn_setRyInfo() {
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransInRegisterYbAction!getEmpInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>