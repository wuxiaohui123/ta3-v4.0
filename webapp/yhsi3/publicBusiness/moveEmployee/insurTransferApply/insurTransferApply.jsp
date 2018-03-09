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
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">

			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="yhxx1" key="银行信息" cols="5" expanded="false" scalable="false">
					<ta:selectInput id="yhxx" key="开户行" span="2" required="true" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" onSelectChange="getInfo" selectType="radio" haveSn="true" border="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续申请表和联系函" id="tab2">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<ta:selectInput id="aae173" key="转移类型" required="true" labelWidth="200" collection="AAE173" readOnly="false" />
					<ta:selectInput id="aac070" key="转移方向" required="true" labelWidth="200" collection="AAC070" readOnly="true" />
					<ta:selectInput id="aae140" key="险种类型" labelWidth="200" collection="AAE140" readOnly="true" />
					<ta:text id="yac519" key="原个人编号" required="true" labelWidth="200" maxLength="20" readOnly="false" />
					<ta:box cols="2">
						<ta:text id="yac256" key="原参保所在地区名称" maxLength="100" labelWidth="200" columnWidth="0.9" required="true" onChange="fnChangeYac256()" bpopTipMsg="输入原参保所在地区名称，行政区划代码" />
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showYac256RPCBtn" key="?" onClick="showYac256RPC()" />
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="yac250" key="原参保地社保机构行政区划代码" required="true" labelWidth="200" readOnly="false" maxLength="6" bpopTipMsg="6位数字" />
					<ta:text id="yac251" key="原参保地社保机构名称" required="true" labelWidth="200" span="2" maxLength="50" readOnly="false" />
					<ta:text id="yac252" key="原参保地社保机构联系电话" required="true" labelWidth="200" maxLength="25" readOnly="false" />
					<ta:text id="yac253" key="原参保地社保机构地址" required="true" labelWidth="200" span="2" maxLength="100" readOnly="false" />
					<ta:text id="yac254" key="原参保地社保机构邮政编码" required="true" labelWidth="200" validType="zipcode" maxLength="6" readOnly="false" />
					<ta:text id="yae440" key="代办人姓名" labelWidth="200" maxLength="60" readOnly="false" />
					<ta:text id="yae442" key="代办人电话" labelWidth="200" maxLength="50" readOnly="false" />
					<ta:text id="yae441" key="代办人与转移人员关系" labelWidth="200" maxLength="20" readOnly="false" />
					<ta:text id="yae443" key="代办人联系地址" labelWidth="200" maxLength="100" readOnly="false" />
					<ta:text id="yae444" key="代办人邮编" labelWidth="200" validType="zipcode" maxLength="6" readOnly="false" />
				</ta:panel>
				<ta:panel key="关系转移接续联系函" id="lxh_2" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="历史关系转移接续联系函(双击打印)" id="tab3">
				<ta:datagrid id="ic89list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true" onRowDBClick="fnClick">
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
		initializeSuggestFramework(1, "ac01", "aac001", 710, 400, 3, fn_getQuery, 0, false);
		initializeSuggestFramework(2, "ic89", "yac256", 710, 400, 4, fn_getYac256, 1, false);
	});
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
	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证	
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransferApplyAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
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
		Base.submit("form1", "insurTransferApplyAction!toSave.do");
	}

	//行打印
	function fnClick(e, rowdata) {
		var yae099 = rowdata.yae099;
		if (yae099 == '' || yae099 == null) {
			alert("请选择需要打印的数据查询条件yae099！");
			return;
		}
		var prm = "prm_yae099=" + yae099;
		fnPrintComm("zy_lxh.raq", prm);
	}

	// 根据选择的参保信息获取机构信息
	function getInfo(rowdata, n) {
		var aaz002 = Base.getValue('aaz002');
		if (aaz002 == '' || aaz002 == null) {
			Base.clearData("lxh");
			Base.clearData("lxh_2");
			if (n > 0) {
				var data = Base.getGridSelectedRows("insurlist");
				Base.submit(null, "insurTransferApplyAction!getJGXX.do", {
					"dto['dbclick']" : Base.getValue("dbclick"),
					"dto['aae140']" : data[0].aae140,
					"dto['aab001']" : data[0].aab001,
					"dto['yhxx']" : Base.getValue('yhxx')
				});
			} else {
				Base.submit(null, "insurTransferApplyAction!getJGXX.do", {
					"dto['dbclick']" : "no"
				});
			}
		}
	}
	//原参保机构信息
	function showYac256RPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow08.do", null, 1000, 450, null, null, true);
	}
	function fn_setRyInfo() {
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransferApplyAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
		Base.setDisabled("showRyRPCBtn");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>