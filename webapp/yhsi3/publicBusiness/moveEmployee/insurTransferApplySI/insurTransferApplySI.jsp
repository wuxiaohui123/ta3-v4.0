<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转移申请(系统内)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入申请[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" height="560">
			<ta:tab key="转入申请信息" id="tab1">
				<ta:panel key="联系函申请信息" cols="3" id="lxh" expanded="false" scalable="false">
					<ta:selectInput id="aac070" key="转移方向" labelWidth="120" collection="aac070" required="true" value="1" readOnly="true" display="fasle" />
					<ta:selectInput id="aae173" key="转移类型" labelWidth="120" collection="aae173" required="true" value="1" />
					<ta:text id="aae270" key="联系函编号" labelWidth="120" maxLength="20" required="true" />
					<ta:box cols="2">
						<ta:text id="yac519" key="个人编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
						<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
							<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="aac001" key="原个人编号" labelWidth="120" maxLength="20" required="true" bpopTipMsg="转出地个人编号" />
					<ta:text id="aac003" key="姓名" labelWidth="120" maxLength="20" required="true" />
					<ta:text id="aac002" key="证件号码" labelWidth="120" maxLength="20" required="true" />
					<ta:selectInput id="aac004" key="性别" collection="AAC004" display="false" />
					<ta:selectInput id="yac250" key="原行政区划代码" labelWidth="120" collection="AAB301" islevel="true" isMustLeaf="false" maxVisibleRows="10" />
					<ta:text id="yac256" key="原参保地区名称" labelWidth="120" maxLength="50" required="true" />
					<ta:text id="yac251" key="原参保机构名称" labelWidth="120" required="true" maxLength="50" span="2" />
					<ta:text id="yac252" key="原机构联系电话" labelWidth="120" maxLength="50" required="true" />
					<ta:text id="yac253" key="原参保机构地址" labelWidth="120" maxLength="100" span="2" required="true" />
					<ta:text id="yac254" key="原参保机构邮编" labelWidth="120" validType="zipcode" maxLength="6" required="true" />
					<ta:text id="yac261" key="转入地机构名称" labelWidth="120" readOnly="true" display="true" />
					<ta:selectInput id="aab299" key="转入地行政区划" labelWidth="120" readOnly="true" collection="aab301" />
					<ta:selectInput id="sfslxq" key="是否是龙圩区" data="[{'id':'0','name':'否'},{'id':'1','name':'是'}]" value="0" labelWidth="120" />
					<ta:text id="yae440" key="代办人姓名" labelWidth="120" maxLength="30" />
					<ta:text id="yae441" key="与转移人员关系" labelWidth="120" maxLength="10" />
					<ta:text id="yae442" key="代办人电话" labelWidth="120" validType="number" maxLength="50" />
					<ta:text id="yae444" key="代办人邮编" labelWidth="120" validType="zipcode" maxLength="6" />
					<ta:text id="yae443" key="代办人联系地址" labelWidth="120" maxLength="50" span="2" />
					<ta:text id="aaz161" key="人员参保关系转入事件ID" labelWidth="120" display="false" />
					<ta:text id="yae099" key="业务流水号" labelWidth="120" readOnly="true" display="false" />
					<ta:text id="aaz002" key="业务日志ID" labelWidth="120" display="false" />
				</ta:panel>
				<ta:panel key="转入单位信息" cols="3" id="fltUnit" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
				</ta:panel>
				<ta:panel key="转移制度方向" id="zyzdfx" height="90" expanded="false" scalable="false">
					<ta:radiogroup id="aic113" cols="2">
						<ta:radio key="企业养老保险转企业养老保险（制度内）" id="aic113_1" value="1" />
						<ta:radio key="机关事业养老保险转机关事业养老保险（制度内）" id="aic113_6" value="6" />
						<ta:radio key="企业养老保险转机关事业养老保险（制度间）" id="aic113_2" value="2" />
						<ta:radio key="机关事业养老保险转企业养老保险（制度间）" id="aic113_3" value="3" />
						<ta:radio key="城乡企业职工养老保险转城镇企业职工养老保险（制度间）" id="aic113_8" value="8" />
					</ta:radiogroup>
				</ta:panel>
				<ta:panel id="bankInfo" key="银行信息" cols="3" height="60">
					<ta:selectInput id="bankInfo" key="银行信息" displayValue="aae009" hiddenValue="aaz003" onSelect="getBankInfo" />
					<ta:text id="aae009" key="户名" readOnly="true" />
					<ta:text id="aae010" key="银行账号" readOnly="true" />
					<ta:text id="aae008" key="银行行号" readOnly="true" />
					<ta:text id="aac155" key="银行名称" readOnly="true" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="已经办的系统内联系函信息" id="tab3">
				<ta:datagrid id="ic89list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true">
					<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="50" dataAlign="center" click="fnClick" />
					<ta:datagridItem id="aaz002" key="业务日志ID" width="180" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="yae099" key="业务流水号" width="180" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="aae270" key="联系函编号" width="120" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="yac519" key="原个人编号" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="yac250" key="原参保机构行政区划代码" width="200" align="center" dataAlign="center" collection="yab003" />
					<ta:datagridItem id="yac251" key="原参保机构名称" width="170" align="center" dataAlign="center" showDetailed="true" />
					<ta:datagridItem id="yac252" key="原参保机构联系电话" width="180" collection="aac004" align="center" dataAlign="center" />
					<ta:datagridItem id="yac253" key="原参保机构地址" width="250" align="center" dataAlign="center" showDetailed="true" />
					<ta:datagridItem id="yac254" key="原参保机构邮编" width="180" align="center" dataAlign="center" />
					<ta:datagridItem id="yac256" key="原参保地区名称" width="180" align="center" dataAlign="center" showDetailed="true" />
					<ta:datagridItem id="aab299" key="转入地行政区划代码" width="200" align="center" dataAlign="center" collection="yab003" />
					<ta:datagridItem id="yae440" key="代办人姓名" width="300" align="center" dataAlign="center" />
					<ta:datagridItem id="yae441" key="代办人与转移人员关系" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="yae442" key="代办人电话" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="yae444" key="代办人邮编" width="250" collection="yab003" align="center" dataAlign="right" />
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
		Base.focus('aae173');
		initializeSuggestFramework(1, "ac01", "yac519", 600, 400, 3, fn_getQuery, 0, false);
		initializeSuggestFramework(2, "ab01", "aab001", 600, 400, 3, fn_getQueryUnit, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("yac519", g_Suggest[2]); //1 姓名 2个人编号 3 身份证	
		Base.setReadOnly("yac519");
		Base.submit("from1", "insurTransferApplySIAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('yac519')
		});
		Base.setEnable("yac519");
	}
	function fn_getQueryUnit() {
		Base.setValue("aab001", g_Suggest[1]);
		if (g_Suggest != "") {
			Base.submit("from1", "insurTransferApplySIAction!getQueryInfoUnit.do", {
				"dto['aab001']" : Base.getValue('aab001')
			});
		}
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		if ((Base.getValue('aic113_1') == '' || Base.getValue('aic113_1') == null) && (Base.getValue('aic113_2') == '' || Base.getValue('aic113_2') == null) && (Base.getValue('aic113_3') == '' || Base.getValue('aic113_3') == null) && (Base.getValue('aic113_6') == '' || Base.getValue('aic113_6') == null) && (Base.getValue('aic113_8') == '' || Base.getValue('aic113_8') == null)) {
			alert('请勾选转移制度方向！');
			Base.focus('');
			return;
		}
		Base.submit("form1", "insurTransferApplySIAction!toSave.do");
	}

	//行打印
	function fnClick(data, e) {
		var yae099 = data.yae099;
		if (yae099 == '' || yae099 == null) {
			alert("请选择需要打印的数据查询条件yae099！");
			return;
		}
		var prm = "prm_yae099=" + yae099;
		fnPrintComm("insurTransferApplySI.raq", prm);
	}

	//获取银行信息
	function getBankInfo() {
		Base.submit("bankInfo", "insurTransferApplySIAction!getBankInfo.do");
	}
	/*******单位********/
	function fn_setDwInfo() {
		Base.submit("from1", "insurTransferApplySIAction!getQueryInfoUnit.do", {
			"dto['aab001']" : Base.getValue('aab001')
		});
	}
	/********个人*******/
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {
			"dto['inputString']" : Base.getValue('yac519')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		Base.setReadOnly("yac519");
		Base.submit("from1", "insurTransferApplySIAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('yac519')
		});
		Base.setEnable("yac519");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>