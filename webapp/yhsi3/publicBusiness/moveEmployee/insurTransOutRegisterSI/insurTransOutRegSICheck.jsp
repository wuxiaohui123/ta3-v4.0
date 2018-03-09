<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转出登记复核(系统内)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:toolbarItem id="saveBtn" key="转出复核[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" />
		<ta:toolbarItem id="printBtn" key="单据打印[P]" icon="xui-icon-spotPrint" hotKey="ctrl+P" onClick="toPrint();" />
		<ta:toolbarItem id="outputBtn" key="导出[O]" icon="icon-output" hotKey="O" onClick="toExport();" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人详细信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aac001" key="个人编号" labelWidth="150" readOnly="true" />
					<ta:text id="aac002" key="身份证号" labelWidth="150" readOnly="true" display="true" />
					<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aac004" key="性别" collection="aac004" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aac005" key="民族" collection="aac005" readOnly="true" labelWidth="150" />
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="150" />
					<ta:date id="aac007" key="参加工作日期" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aae140" key="险种类型" readOnly="true" labelWidth="150" collection="aae140" />
					<ta:date id="aac049" key="养老参保日期" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aac012" key="个人身份" readOnly="true" collection="aac012" labelWidth="150" />
					<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="150" />
					<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="150" span="2" />
					<ta:selectInput id="aac009" key="户口性质" readOnly="true" labelWidth="150" collection="aac009" />
					<ta:text id="yae099" key="业务流水号" readOnly="true" labelWidth="150" display="true" />
					<ta:text id="aaz159" key="人员参保关系ID" readOnly="true" labelWidth="150" display="false" />
					<ta:text id="fhjc" key="当前复核级次" labelWidth="120" display="false" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" haveSn="true" border="true" snWidth="20" fit="true">
						<ta:datagridItem id="aac001" key="个人编号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac003" key="姓名" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" width="180" align="center" dataAlign="center" />
						<ta:datagridItem id="aac008" key="个人参保状态" collection="aac008" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac049" key="首次参保年月" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac030" key="系统参保年月" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aae206" key="账户建立年月" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yae097" key="个人最大做账期号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yab139" key="参保所属机构" collection="yab003" width="250" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="缴费信息(实缴)" id="tab2">
				<ta:datagrid id="ac43a1list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aac001" key="人员ID" width="120" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位编号" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="aae002" key="做账期号" width="120" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae003" key="对应费款所属期" width="120" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae140" key="险种类型" width="200" align="center" dataAlign="center" collection="aae140" sortable="true" />
					<ta:datagridItem id="aac040" key="工资" width="120" align="center" dataAlign="right" />
					<ta:datagridItem id="aae180" key="人员缴费基数" width="120" align="center" dataAlign="right" />
					<ta:datagridItem id="yad003" key="实处理金额" width="120" align="center" dataAlign="right" totals="sum" />
					<ta:datagridItem id="aaa115" key="应缴类型" width="180" align="center" dataAlign="center" collection="aaa115" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="联系函信息" id="tab3">
				<ta:panel key="联系函信息" cols="3" id="lxh" expanded="false" scalable="false" fit="true">
					<ta:selectInput id="aac070" key="转移方向" labelWidth="170" collection="aac070" required="true" value="1" readOnly="true" display="false" />
					<ta:selectInput id="aae173" key="转移类型" labelWidth="170" collection="aae173" required="true" readOnly="true" />
					<ta:text id="aae270" key="联系函编号" labelWidth="170" maxLength="50" required="true" readOnly="true" />
					<ta:text id="yac519" key="原个人编号" labelWidth="170" maxLength="20" required="true" readOnly="true" />
					<ta:selectInput id="yac250" key="原参保机构行政区划代码" labelWidth="170" collection="aab301" required="true" readOnly="true" />
					<ta:text id="yac251" key="原参保机构名称" labelWidth="170" maxLength="50" span="2" required="true" readOnly="true" />
					<ta:text id="yac252" key="原参保机构联系电话" labelWidth="170" maxLength="25" required="true" readOnly="true" />
					<ta:text id="yac253" key="原参保机构地址" labelWidth="170" maxLength="100" span="2" required="true" readOnly="true" />
					<ta:text id="yac254" key="原参保机构邮编" labelWidth="170" validType="zipcode" maxLength="6" required="true" readOnly="true" />
					<ta:text id="yac256" key="原参保地区名称" labelWidth="170" maxLength="50" required="true" readOnly="true" />
					<ta:text id="aic113" key="养老转移制度方向" readOnly="true" labelWidth="170" bpopTipMsg="true" />
					<ta:selectInput id="yac261" key="转入地参保机构名称" labelWidth="170" display="true" span="2" required="true" readOnly="true" />
					<ta:selectInput id="yab301" key="转入地行政区划代码" labelWidth="170" collection="aab301" required="true" readOnly="true" />
					<ta:text id="aac080" key="转入地社保机构开户银行行号" labelWidth="170" display="true" span="1" maxLength="20" required="true" readOnly="true" />
					<ta:text id="aac155" key="转入地社保机构开户行名称" labelWidth="170" display="true" span="2" maxLength="50" required="true" readOnly="true" />
					<ta:text id="aac078" key="转入地社保机构银行账号" labelWidth="170" display="true" span="2" maxLength="40" required="true" readOnly="true" />
					<ta:text id="yae440" key="代办人姓名" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:text id="yae441" key="代办人与转移人员关系" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:text id="yae442" key="代办人电话" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:text id="yae444" key="代办人邮编" labelWidth="170" validType="zipcode" maxLength="6" readOnly="true" />
					<ta:text id="yae443" key="代办人联系地址" labelWidth="170" maxLength="100" span="2" readOnly="true" />
					<ta:text id="aaz161" key="人员参保关系转入事件ID" display="false" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="转出申请信息" id="tab4">
				<ta:panel key="本年缴费明细" id="id_1" expanded="false" scalable="false">
					<ta:datagrid id="ic93bnmxList" enableColumnMove="true" snWidth="30" haveSn="true">
						<ta:datagridItem id="yae099" key="业务流水号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="aac001" key="个人编号" width="120" align="center" dataAlign="center" />
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
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, "ac01", "aac002", 600, 400, 3, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.submit("from1", "insurTransOutRegSICheckAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		Base.submit("form1", "insurTransOutRegSICheckAction!toSave.do");
	}

	//按钮打印
	function toPrint() {
		var yae099 = Base.getValue('yae099');
		alert(yae099);
		if (yae099 == '' || yae099 == null) {
			alert("请获取到yae099,请检查过程传出值！");
			return;
		}
		var prm = "yae099=" + yae099;
		fnPrintComm("contactLetter.raq", prm);
	}

	//导出
	function toExport() {
		var aac001 = Base.getValue('aac001');
		location.href = myPath() + "/process/publicBusiness/moveEmployee/insurTransOutRegisterSI/insurTransOutRegSICheckAction!toExport.do?dto.aac001=" + aac001;
	}

	//行打印
	function fnClick(data, e) {
		var yac196 = data.yac196;
		if (yac196 == '' || yac196 == null) {
			alert("请选择需要打印的数据！");
			return;
		}
		var prm = "yac196=" + yac196;
		fnPrintComm("contactLetter.raq", prm);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>