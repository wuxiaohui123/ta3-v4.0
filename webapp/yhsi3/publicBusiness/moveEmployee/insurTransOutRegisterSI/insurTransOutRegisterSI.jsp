<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转出登记(省内)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转出申请[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="printDetailBtn" key="打印历史明细[P]" asToolBarItem="true" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrintDetail()" />
		<ta:button id="printBtn" key="打印转移单[P]" asToolBarItem="true" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint()" />
		<ta:button id="printBtn3" key="打印拨款单[P]" icon="icon-print" hotKey="P" onClick="fnPrint3()" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人详细信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aac001" key="个人编号" required="true" labelWidth="120" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))" bpopTipMsg="可输入身份证号、姓名及个人编号进行模糊查询）" />
					<ta:text id="aac002" key="身份证号" labelWidth="120" readOnly="true" display="true" />
					<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
					<ta:selectInput id="aac004" key="性别" collection="aac004" readOnly="true" labelWidth="120" />
					<ta:selectInput id="aac005" key="民族" collection="aac005" readOnly="true" labelWidth="120" />
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" />
					<ta:date id="aac007" key="参加工作日期" readOnly="true" labelWidth="120" />
					<ta:selectInput id="aae140" key="险种类型" readOnly="true" labelWidth="120" collection="aae140" />
					<ta:date id="aac049" key="养老参保日期" readOnly="true" labelWidth="120" />
					<ta:selectInput id="aac012" key="个人身份" readOnly="true" collection="aac012" labelWidth="120" />
					<ta:selectInput id="aac009" key="户口性质" readOnly="true" labelWidth="120" collection="aac009" />
					<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="120" />
					<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="120" span="2" />
					<ta:number id="bz_zqgz92" key="1992年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="120" />
					<ta:number id="bz_zqgz93" key="1993年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="120" />
					<ta:number id="bz_zqgz94" key="1994年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="120" />
					<ta:number id="bz_zqgz95" key="1995年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="120" />
					<ta:number id="bz_zqpjzs" key="四年平均缴费指数" max="9999.9999" min="0" precision="4" labelWidth="120" />
					<ta:text id="aaz159" key="人员参保关系ID" readOnly="true" labelWidth="120" display="false" />
					<ta:text id="aaz002" key="业务日志ID" labelWidth="120" display="false" />
					<ta:text id="aaa121" key="业务类型编码" labelWidth="120" display="false" />
					<ta:text id="fhjc" key="当前复核级次" labelWidth="120" display="false" />
					<ta:text id="yae099" key="业务流水号（复核通过的IC89）" readOnly="false" labelWidth="120" display="false" />
					<ta:text id="aaz160" key="转出事件ID" readOnly="true" labelWidth="120" display="false" />
					<ta:text id="aaz341" key="系统跟踪流水号" display="false" />
					<ta:text id="aae011" key="经办人" display="false" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" haveSn="true" border="true" snWidth="20" fit="true">
						<ta:datagridItem id="aac001" key="个人编号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac003" key="姓名" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" width="180" align="center" dataAlign="center" />
						<ta:datagridItem id="aac008" key="个人参保状态" collection="aac008" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac049" key="首次参保年月" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac030" key="系统参保年月" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae206" key="账户建立年月" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yae097" key="个人最大做账期号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yab139" key="参保所属机构" collection="yab003" width="180" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="缴费信息(实缴)" id="tab2">
				<ta:datagrid id="ac43a1list" enableColumnMove="true" haveSn="true" snWidth="30" fit="true">
					<ta:datagridItem id="aac001" key="人员ID" width="120" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位编号" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="aae002" key="做账期号" width="100" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae003" key="对应费款所属期" width="120" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae140" key="险种类型" width="200" align="center" dataAlign="center" collection="aae140" sortable="true" />
					<ta:datagridItem id="aac040" key="工资" width="80" align="center" dataAlign="right" />
					<ta:datagridItem id="aae180" key="人员缴费基数" width="100" align="center" dataAlign="right" />
					<ta:datagridItem id="yad003" key="实处理金额" width="80" align="center" dataAlign="right" totals="sum" />
					<ta:datagridItem id="aaa115" key="应缴类型" width="120" align="center" dataAlign="right" collection="aaa115" />
					<ta:datagridItem id="yab139" key="参保所属机构" collection="yab003" width="180" align="center" dataAlign="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="联系函信息" id="tab3">
				<ta:panel key="系统内联系函信息" cols="3" id="lxh" expanded="false" scalable="false">
					<ta:selectInput id="aac070" key="转移方向" labelWidth="170" collection="aac070" readOnly="true" display="false" />
					<ta:selectInput id="aae173" key="转移类型" labelWidth="170" collection="aae173" required="true" value="1" />
					<ta:text id="aae270" key="联系函编号" labelWidth="170" maxLength="50" required="true" />
					<ta:text id="yac519" key="原个人编号" labelWidth="170" maxLength="20" required="true" />
					<ta:selectInput id="yac250" key="原参保机构行政区划代码" labelWidth="170" collection="aab301" required="true" />
					<ta:text id="yac251" key="原参保机构名称" labelWidth="170" maxLength="50" span="2" required="true" />
					<ta:text id="yac252" key="原参保机构联系电话" labelWidth="170" maxLength="25" required="true" />
					<ta:text id="yac253" key="原参保机构地址" labelWidth="170" maxLength="100" span="2" required="true" />
					<ta:text id="yac254" key="原参保机构邮编" labelWidth="170" validType="zipcode" maxLength="6" required="true" />
					<ta:text id="yac256" key="原参保地区名称" labelWidth="170" maxLength="50" required="true" />
					<ta:text id="yac261" key="转入地参保机构名称" labelWidth="170" display="true" span="2" required="true" />
					<ta:selectInput id="yab301" key="转入地行政区划代码" labelWidth="170" collection="aab301" required="true" islevel="true" />
					<ta:text id="aac080" key="转入地社保开户银行行号" labelWidth="170" span="1" maxLength="20" />
					<ta:text id="aac155" key="转入地社保开户行名称" labelWidth="170" span="2" maxLength="50" />
					<ta:text id="aac078" key="转入地社保银行账号" labelWidth="170" span="2" maxLength="40" />
					<ta:text id="yae440" key="代办人姓名" labelWidth="170" maxLength="20" />
					<ta:text id="yae441" key="代办人与转移人员关系" labelWidth="170" maxLength="20" />
					<ta:text id="yae442" key="代办人电话" labelWidth="170" maxLength="20" />
					<ta:text id="yae444" key="代办人邮编" labelWidth="170" validType="zipcode" maxLength="6" />
					<ta:text id="yae443" key="代办人联系地址" labelWidth="170" maxLength="100" span="2" />
					<ta:text id="aaz161" key="人员参保关系转入事件ID" labelWidth="170" display="false" />
				</ta:panel>
				<ta:panel key="转移制度方向" id="zyzdfx" height="100" expanded="false" scalable="false" fit="true">
					<ta:radiogroup id="aic113" cols="2">
						<ta:radio key="企业养老保险转企业养老保险（制度内）" id="aic113_1" value="1" />
						<ta:radio key="机关事业养老保险转机关事业养老保险（制度内）" id="aic113_6" value="6" />
						<ta:radio key="企业养老保险转机关事业养老保险（制度间）" id="aic113_2" value="2" />
						<ta:radio key="机关事业养老保险转企业养老保险（制度间）" id="aic113_3" value="3" />
						<ta:radio key="城镇企业养老保险转城乡企业养老保险（制度间）" id="aic113_7" value="7" />
					</ta:radiogroup>
				</ta:panel>
			</ta:tab>
			<ta:tab key="转出申请信息" id="tab4">
				<ta:panel key="本年缴费明细" id="id_1" expanded="false" scalable="false">
					<ta:datagrid id="ic93bnmxList" enableColumnMove="true" snWidth="30" haveSn="true">
						<ta:datagridItem id="yae099" key="业务流水号" width="120" align="center" dataAlign="center" />
						<ta:box cols="2">
							<ta:text id="aac001" key="个人编号" labelWidth="130" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
							<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
								<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
							</ta:buttonLayout>
						</ta:box>
						<ta:datagridItem id="qsny" key="起始年月" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="zzny" key="终止年月" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="ys" key="月数" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="zgpjgz" key="在岗平均工资" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="jfgz" key="缴费工资" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="grjf" key="个人缴费" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="dwhb" key="单位划拨" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="zhxj" key="账户小计" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aab191" key="到账日期" width="120" align="center" dataAlign="center"></ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
				<ta:panel key="历年缴费明细" id="id_2" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="ic93gxList" enableColumnMove="true" snWidth="30" haveSn="true" fit="true">
						<ta:datagridItem id="yae099" key="业务流水号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac001" key="个人编号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae001" key="年度" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aaa015" key="岗平/社平" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_01" key="缴费基数(1月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_01" key="单位划账金额(1月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_01" key="个人实缴金额(1月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_01" key="实缴金额小计(1月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_02" key="缴费基数(2月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_02" key="单位划账金额(2月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_02" key="个人实缴金额(2月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_02" key="实缴金额小计(2月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_03" key="缴费基数(3月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_03" key="单位划账金额(3月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_03" key="个人实缴金额(3月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_03" key="实缴金额小计(3月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_04" key="缴费基数(4月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_04" key="单位划账金额(4月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_04" key="个人实缴金额(4月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_04" key="实缴金额小计(4月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_05" key="缴费基数(5月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_05" key="单位划账金额(5月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_05" key="个人实缴金额(5月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_05" key="实缴金额小计(5月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_06" key="缴费基数(6月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_06" key="单位划账金额(6月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_06" key="个人实缴金额(6月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_06" key="实缴金额小计(6月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_07" key="缴费基数(7月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_07" key="单位划账金额(7月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_07" key="个人实缴金额(7月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_07" key="实缴金额小计(7月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_08" key="缴费基数(8月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_08" key="单位划账金额(8月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_08" key="个人实缴金额(8月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_08" key="实缴金额小计(8月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_09" key="缴费基数(9月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_09" key="单位划账金额(9月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_09" key="个人实缴金额(9月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_09" key="实缴金额小计(9月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_10" key="缴费基数(10月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_10" key="单位划账金额(10月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_10" key="个人实缴金额(10月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_10" key="实缴金额小计(10月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_11" key="缴费基数(11月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_11" key="单位划账金额(11月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_11" key="个人实缴金额(11月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_11" key="实缴金额小计(11月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae180_12" key="缴费基数(12月份)" width="120" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae021_12" key="单位划账金额(12月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae022_12" key="个人实缴金额(12月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
						<ta:datagridItem id="aae156_12" key="实缴金额小计(12月份)" width="150" align="center" dataAlign="center"></ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus('aac001');
		initializeSuggestFramework(1, "ac01", "aac001", 990, 400, 10, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证	
		Base.submit("from1", "insurTransOutRegisterSIAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}

	//保存
	function toSave() {
		var aic113 = Base.getValue("aic113");
		if (aic113 == null || aic113 == '') {
			alert("请选择转移制度方向!");
			Base.setActiveTab("tab3");
			return;
		}
		Base.submit("form1", "insurTransOutRegisterSIAction!toSave.do");
	}

	//打印
	function fnPrint() {
		fnPrintComm("insurTransOutRegisterSI.raq", "prm_aaz002=" + Base.getValue("aaz002"));

	}

	function fnPrintDetail() {
		fnPrintComm("insurTransOutRegisterSIDetail.raq", "prm_aaz002=" + Base.getValue("aaz002"));
	}
	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//打印拨款单 
	function fnPrint3() {
		//通过日志表获取本次ic91和ac27中的信息
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var aae011 = Base.getValue("aae011");
		var fileName = "WZSTFD_ylsn.raq";
		var prm = "aac001=" + aac001 + ";aaz002=" + aaz002 + ";aae011=" + aae011;
		//通过传过去的aac001 和 aaz002进行打印数据
		fnPrintComm(fileName, prm);
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
		Base.submit("from1", "insurTransOutRegisterSIAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>