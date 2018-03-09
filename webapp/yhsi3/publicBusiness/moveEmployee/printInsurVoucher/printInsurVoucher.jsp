<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>打印参保凭证</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人基本信息" id="tab1">
				<ta:panel id="ryjbxx" key="个人基本信息" cols="3" scalable="false" expanded="false">
					<ta:box cols="2">
						<ta:text id="aac001" key="个人编号" labelWidth="130" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
						<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
							<ta:button id="showDwRPCBtn" key="?" onClick="showRyRPC()" />
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="130" />
					<ta:selectInput id="aac004" key="性别" collection="aac004" readOnly="true" labelWidth="130" />
					<ta:text id="aac002" key="身份证号" labelWidth="130" readOnly="true" />
					<ta:text id="aac010" key="户籍地地址" readOnly="true" span="2" labelWidth="130" />
					<ta:number id="aae041" key="本地缴费开始年月" readOnly="true" labelWidth="130" />
					<ta:number id="aae042" key="本地缴费结束年月" readOnly="true" labelWidth="130" />
					<ta:number id="aae201" key="本地缴费月数" readOnly="true" labelWidth="130" />
					<ta:number id="aae240" key="本地个人账户存储额" max="99999999999999.99" min="0" precision="2" readOnly="true" labelWidth="130" />
					<ta:selectInput id="aac005" key="民族" collection="aac005" readOnly="true" labelWidth="130" display="false" />
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="130" display="false" />
					<ta:text id="aaz159" key="人员参保关系ID（需要隐藏）" readOnly="true" labelWidth="130" display="false" />
					<ta:selectInput id="aae140" key="险种类型（需要隐藏）" collection="aae140" readOnly="true" labelWidth="130" display="false" />
				</ta:panel>
				<ta:panel id="sbjgxx" key="社保机构信息" cols="3" scalable="false" expanded="false">
					<ta:selectInput id="aab301" key="行政区划代码" collection="aab301" readOnly="true" labelWidth="130" />
					<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="130" />
					<ta:text id="aae007" key="邮政编码" readOnly="true" labelWidth="130" />
					<ta:text id="aae006_sb" key="地址" readOnly="true" span="2" labelWidth="130" />
					<ta:text id="aae005" key="电话" readOnly="true" labelWidth="130" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" haveSn="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="个人账户信息" id="tab2">
				<ta:panel key="（双击行查询个人账户详细信息）" id="pl1" fit="true" scalable="false" expanded="false">
					<ta:datagrid id="ac50list" enableColumnMove="true" haveSn="true" border="false" snWidth="20" onRowDBClick="fnClickAcount" fit="true">
						<ta:datagridItem key="账户编号" id="aaz116" align="center" dataAlign="left" width="100" />
						<ta:datagridItem key="个人编号" id="aac001" align="center" dataAlign="left" width="80" />
						<ta:datagridItem key="姓名" id="aac003" align="center" dataAlign="left" width="100" />
						<ta:datagridItem key="帐户类型" id="aaa119" align="center" collection="AAA119" dataAlign="left" width="200" />
						<ta:datagridItem key="建帐原因" id="aac062" align="center" width="100" dataAlign="left" collection="AAC062" />
						<ta:datagridItem key="建帐年月" id="aae206" align="center" width="80" dataAlign="center" />
						<ta:datagridItem key="本金" id="aae238" align="center" width="80" dataAlign="right" />
						<ta:datagridItem key="利息" id="aae239" align="center" width="80" dataAlign="right" />
						<ta:datagridItem key="支出" id="aae357" align="center" width="80" dataAlign="right" />
						<ta:datagridItem key="余额" id="aae240" align="center" width="100" dataAlign="right" />
						<ta:datagridItem key="有效标志" id="aae100" align="center" width="80" collection="AAE100" dataAlign="left" />
						<ta:datagridItem key="终结日期" id="aae237" align="center" width="80" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="缴费凭证信息" id="tab3">
				<ta:datagrid id="ac07list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true">
					<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="40" dataAlign="center" click="fnClick" />
					<ta:datagridItem id="yac196" key="缴费凭证编号" width="125" align="center" dataAlign="center" />
					<ta:datagridItem id="aac001" key="个人编号" width="80" align="center" dataAlign="center" />
					<ta:datagridItem id="aac003" key="姓名" width="90" align="center" dataAlign="center" />
					<ta:datagridItem id="aac002" key="公民身份证号码" width="140" align="center" dataAlign="center" />
					<ta:datagridItem id="aac004" key="性别" width="40" collection="aac004" align="center" dataAlign="center" />
					<ta:datagridItem id="aae041" key="本地开始年月" width="95" align="center" dataAlign="center" />
					<ta:datagridItem id="aae042" key="本地终止年月" width="95" align="center" dataAlign="right" />
					<ta:datagridItem id="yac123" key="本地缴费月数" width="95" align="center" dataAlign="right" />
					<ta:datagridItem id="aic099" key="个人账户总额" width="110" align="center" dataAlign="right" />
					<ta:datagridItem id="aac010" key="户籍地地址" width="300" align="center" dataAlign="center" />
					<ta:datagridItem field="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
					<ta:datagridItem field="aae036" key="经办时间" align="center" dataAlign="center" dataType="DateTime" width="160" sortable="true"></ta:datagridItem>
					<ta:datagridItem field="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" width="235"></ta:datagridItem>
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
		initializeSuggestFramework(1, null, "aac001", 990, 400, 10, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证
		var aac001 = Base.getValue('aac001');
		Base.submit("form1", "printInsurVoucherAction!getQueryInfo.do");
	}

	//弹出框
	function fnClickAcount(e, rowdata) {
		toUrl = myPath() + "/process/publicBusiness/moveEmployee/printInsurVoucher/printInsurVoucherAction!getAcountInfoDetail.do";
		Base.openWindow('acountlist', ">>个人账户详细信息", toUrl, {
			"dto['aaz116']" : rowdata.aaz116
		}, '95%', '90%', null, null, true);
	}

	//保存
	function toSave() {
		Base.submit("form1", "printInsurVoucherAction!toSave.do");
	}

	function changeLXBZ(value, key) {
		Base.submit("form1", "printInsurVoucherAction!getQueryInfo.do");
	}

	//打印
	function fnClick(data, e) {
		var prm = "prm_begin=" + data.aae041 + ";prm_end=" + data.aae042 + ";prm_yueshu=" + data.yac123 + ";prm_aae240=" + data.aic099 + ";prm_aac001=" + data.aac001 + ";prm_yab003=" + data.yab003 + ";prm_yac196=" + data.yac196; //多个参数的拼写方式
		fnPrintComm("zy_printInsurVoucher.raq", prm);
	}
	/***人员rpc***/
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		var aac001 = Base.getValue('aac001');
		Base.submit("form1", "printInsurVoucherAction!getQueryInfo.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>