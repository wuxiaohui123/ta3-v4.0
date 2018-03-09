<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转入登记复核(系统内)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入登记复核[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:panel key="查询条件" cols="3" id="keyid" expanded="false" scalable="false">
			<ta:text id="aac001" key="个人编号" labelWidth="150" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
			<ta:tab key="个人详细信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aac002" key="身份证号" labelWidth="150" readOnly="true" display="true" />
					<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aac004" key="性别" collection="aac004" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aac005" key="民族" collection="aac005" readOnly="true" labelWidth="150" />
					<ta:text id="aac006" key="出生日期" readOnly="true" labelWidth="150" />
					<ta:text id="aac007" key="参加工作日期" readOnly="true" labelWidth="150" />
					<ta:selectInput id="aae140" key="险种类型" readOnly="true" labelWidth="150" collection="aae140" />
					<ta:selectInput id="aac012" key="个人身份" readOnly="true" collection="aac012" labelWidth="150" />
					<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="150" />
					<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="150" span="2" />
					<ta:selectInput id="aac009" key="户口性质" readOnly="true" labelWidth="150" collection="aac009" />
					<ta:text id="aaz159" key="人员参保关系ID" readOnly="true" labelWidth="150" display="false" />
					<ta:text id="yae099" key="业务流水号" readOnly="true" labelWidth="150" display="false" />
					<ta:text id="aaz161" key="转入事件ID" readOnly="true" labelWidth="150" display="false" />
					<ta:text id="aaz002_ic89" key="联系函业务日志ID" labelWidth="170" maxLength="50" display="false" />
					<ta:text id="yae099_ic89" key="联系函业务流水号" labelWidth="170" maxLength="50" display="false" />
					<ta:text id="fhjc" key="当前复核级次" display="false" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" height="200" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" haveSn="true" border="true" snWidth="20" height="150">
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
			<ta:tab key="转移申请信息" id="tab2">
				<ta:panel key="联系函信息" cols="3" id="lxh" expanded="false" scalable="false" fit="true">
					<ta:selectInput id="aac070" key="转移方向" labelWidth="170" collection="AAC070" readOnly="true" />
					<ta:selectInput id="aae173" key="转移类型" labelWidth="170" collection="AAE173" readOnly="true" />
					<ta:text id="aae270" key="联系函编号" labelWidth="170" maxLength="50" readOnly="true" />
					<ta:text id="yac519" key="原个人编号" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:selectInput id="yac250" key="原参保机构行政区划代码" labelWidth="170" collection="AAB301" maxVisibleRows="10" readOnly="true" />
					<ta:text id="yac251" key="原参保机构名称" labelWidth="170" maxLength="50" readOnly="true" />
					<ta:text id="yac252" key="原参保机构联系电话" labelWidth="170" maxLength="25" readOnly="true" />
					<ta:text id="yac253" key="原参保机构地址" labelWidth="170" maxLength="100" readOnly="true" />
					<ta:text id="yac254" key="原参保机构邮编" labelWidth="170" validType="zipcode" maxLength="6" readOnly="true" />
					<ta:text id="yac256" key="原参保地区名称" labelWidth="170" maxLength="50" readOnly="true" />
					<ta:selectInput id="aab299" key="转入地行政区划代码" labelWidth="170" readOnly="true" collection="AAB301" />
					<ta:text id="yac261" key="转入地参保机构名称" labelWidth="170" readOnly="true" display="false" />
					<ta:text id="yae440" key="代办人姓名" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:text id="yae441" key="代办人与转移人员关系" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:text id="yae442" key="代办人电话" labelWidth="170" maxLength="20" readOnly="true" />
					<ta:text id="yae443" key="代办人联系地址" labelWidth="170" maxLength="100" readOnly="true" />
					<ta:text id="yae444" key="代办人邮编" labelWidth="170" validType="zipcode" maxLength="6" readOnly="true" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="转移接续信息" id="tab3">
				<ta:panel id="pnlJXXX" key="转入基金登记信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aac003_cw" key="姓名" labelWidth="150" readOnly="true" display="false" />
					<ta:text id="aac002_cw" key="证件号码" labelWidth="150" readOnly="true" display="false" />
					<ta:selectInput id="aae140_cw" key="险种类型" collection="aae140" labelWidth="150" readOnly="true" />
					<ta:text id="yad003" key="财务登帐金额" labelWidth="150" cssInput="color:red" readOnly="true" />
					<ta:date id="aad017" key="登帐时间" labelWidth="150" dateMonth="YYYY-MM-DD" readOnly="true" />
				</ta:panel>
				<ta:panel id="ycbdjxxx" key="原参保地转移接续信息" cols="3" expanded="false" scalable="false" height="250">
					<ta:date id="sccbsj" key="首次参保时间" bpopTipMsg="首次参保时间" showSelectPanel="true" issue="true" labelWidth="200" />
					<ta:date id="zcrq" key="转出日期" bpopTipMsg="转出日期" showSelectPanel="true" issue="true" labelWidth="200" />
					<ta:text id="grzhljje" key="个人账户累计金额" readOnly="true" labelWidth="200" />
					<ta:text id="grzhbj" key="个人账户本金" readOnly="true" labelWidth="200" />
					<ta:text id="grzhlx" key="个人账户利息" readOnly="true" labelWidth="200" />
					<ta:text id="zczje" key="转出总金额" readOnly="true" labelWidth="200" />
					<ta:text id="bz_yic093" key="1998年1月1日前账户中单位划入本金" readOnly="true" labelWidth="200" />
					<ta:text id="bz_yic094" key="1998年1月1日前账户中单位划入利息" readOnly="true" labelWidth="200" />
					<ta:text id="bz_yic095" key="1998年1月1日前账户中个人划入本金" readOnly="true" labelWidth="200" />
					<ta:text id="bz_yic096" key="1998年1月1日前账户中个人划入利息" readOnly="true" labelWidth="200" />
					<ta:text id="bz_grzqjfy" key="个人账户前缴费月数" readOnly="true" labelWidth="200" />
					<ta:text id="zc_mc" key="转入机构" readOnly="true" labelWidth="200" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="原参保地历年缴费及个人账户记账信息" id="tab4">
				<ta:panel id="pnl1" key="" expanded="false" scalable="false" height="280">
					<ta:datagrid id="dd" enableColumnMove="true" snWidth="30" haveSn="true" fit="true">
						<ta:datagridItem id="aab300" key="参保地名称" width="100" />
						<ta:datagridItem id="aae001" key="年度" width="60" />
						<ta:datagridItem id="aae041" key="开始年月" width="80" />
						<ta:datagridItem id="aae042" key="终止年月" width="80" />
						<ta:datagridItem id="aae202" key="月数" width="60" />
						<ta:datagridItem id="jfgz" key="人员缴费基数" width="120" />
						<ta:datagridItem id="aaa042" key="单位缴费比例" width="120" />
						<ta:datagridItem id="aaa043" key="划转个人账户比例" width="140" />
						<ta:datagridItem id="aaa041" key="个人缴费比例" width="120" />
						<ta:datagridItem id="aae381" key="当年记账金额" width="120" />
						<ta:datagridItem id="aae264" key="金额中个人缴费部分" width="180" />
						<ta:datagridItem id="aae269" key="当年记账利息" width="120" />
						<ta:datagridItem id="aae265" key="利息中个人缴费部分" width="180" />
						<ta:datagridItem id="aae382" key="年末累计存储额" width="140" />
						<ta:datagridItem id="aae273" key="存储额中个人缴费部分" width="180" />
						<ta:datagridItem id="aae013" key="备注" width="100" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		var rows = Base.getGridData("dd");
		var param = {};
		param.d2List = Ta.util.obj2string(rows);
		Base.submit("form1", "insurTransInRegSICheckAction!toSave.do", param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>