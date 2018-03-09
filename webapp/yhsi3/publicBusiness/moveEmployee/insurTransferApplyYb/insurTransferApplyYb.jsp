<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转移申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="printBtn" icon="icon-print" key="申请表打印" asToolBarItem="true" onClick="fnPrint()" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>
		<ta:box id="hideArea">
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" selectType="radio" haveSn="true" onSelectChange="getInfo" border="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续申请表和联系函" id="tab2">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb_edit.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" id="lxh_2" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="历史关系转移接续联系函" id="tab3">
				<ta:datagrid id="ic89list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true">
					<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="40" dataAlign="center" click="fnClick" />
					<%@ include file="/yhsi3/commonJSP/ic89List.jsp"%>
				</ta:datagrid>
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
		initializeSuggestFramework(1, "ac01", "aac001", 710, 400, 6, fn_getQuery, 0, false);
		initializeSuggestFramework(2, "ic89", "yac256", 710, 400, 4, fn_getYac256, 1, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证	
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransferApplyYbAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}

	function fnChangeYac256() {
		var outstring = "";
		var yac256 = Base.getValue('yac256');
		var url = myPath() + "/process/synthesis/suggestFrameworkAction!getYac256String.do";
		Base.submit(null, url, {
			"dto['inputString']" : yac256
		}, null, false, function(data) {
			if (data != null) {
				outstring = data.fieldData.data;
				var data1 = eval(outstring);
				if (data1.length > 1) {
					sfwSuggest(2, data1);
				} else {
					Base.setValue("yac250", '');
					Base.setValue("yac251", '');
					Base.setValue("yac252", '');
					Base.setValue("yac253", '');
					Base.setValue("yac254", '');
				}
			}
		});
	}
	//回调查询
	function fn_getYac256() {
		Base.setValue("yac256", g_Suggest[0]);
		Base.setValue("yac250", g_Suggest[1]);
		Base.setValue("yac251", g_Suggest[2]);
		Base.setValue("yac252", g_Suggest[3]);
		Base.setValue("yac253", g_Suggest[4]);
		Base.setValue("yac254", g_Suggest[5]);
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		Base.submit("form1", "insurTransferApplyYbAction!toSave.do");
	}

	//行打印
	function fnClick(data, e) {
		var aac001 = data.aac001;
		Base.submit(null, "insurTransferApplyYbAction!toSavePrint.do", {
			"dto['yae099']" : data.yae099,
			"dto['aac001']" : aac001
		}, null, null, function fnSuccess() {
			var prm = "aac001=" + aac001;
			fnPrintComm("zyjx_lxh.raq", prm);
		}, function fnFail() {
			Base.alert("打印有误，请联系管理员");
		});
	}

	function fnPrint() {
		var aac001 = Base.getValue("aac001");
		var yab139 = Base.getValue("yab139");
		var prm = "aac001=" + aac001 + ";yab139=" + yab139;
		fnPrintComm("zyjx_sqb.raq", prm);
	}

	// 根据选择的参保信息获取机构信息
	function getInfo(rowdata, n) {
		var aaz002 = Base.getValue('aaz002');
		if (aaz002 == '' || aaz002 == null) {
			Base.clearData("lxh");
			Base.clearData("lxh_2");
			if (n > 0) {
				var data = Base.getGridSelectedRows("insurlist");
				Base.submit(null, "insurTransferApplyYbAction!getJGXX.do", {
					"dto['dbclick']" : Base.getValue("dbclick"),
					"dto['aae140']" : data[0].aae140,
					"dto['aab001']" : data[0].aab001
				});
			} else {
				Base.submit(null, "insurTransferApplyYbAction!getJGXX.do", {
					"dto['dbclick']" : "no"
				});
			}
		}
	}

	function fn_setRyInfo() {
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransferApplyYbAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}

	//原参保机构信息
	function showYac256RPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow08.do", null, 1000, 450, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>