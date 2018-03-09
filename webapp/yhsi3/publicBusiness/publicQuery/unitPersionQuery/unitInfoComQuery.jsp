<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位信息综合查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body cssStyle="min-width:800px">
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="打印[P]" hotKey="P" icon="xui-icon-print" onClick="fnPrint()" asToolBarItem="true" id="fnPrint" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel0" key=">>单位信息" expanded="false" cols="3">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="125" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="150" />
		</ta:panel>
		<ta:panel id="panel1" key=">>单位综合信息" expanded="false" fit="true">
			<ta:tabs id="tabs" fit="true">
				<ta:tab id="tab1" key="单位基本信息">
					<ta:box id="box1" cols="3" fit="true">
						<ta:text id="aae053" key="组织机构代码" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aab020" key="经济类型" collection="AAB020" readOnly="true" labelWidth="150" />
						<ta:selectInput id="yab019" key="单位管理类型" collection="YAB019" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aab022" key="单位行业" collection="AAB022" disabled="false" labelWidth="150" />
						<ta:selectInput id="aab021" key="隶属关系" collection="AAB021" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aab019" key="单位类型" collection="AAB019" disabled="false" labelWidth="150" />
						<ta:text id="aae007" key="邮政编码" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aab006" key="工商登记执照种类" collection="AAB006" disabled="false" labelWidth="150" />
						<!-- span="2" -->
						<ta:date id="aab008" key="工商登记发照日期" readOnly="true" labelWidth="150" />
						<ta:text id="aae006" key="地址" readOnly="true" span="2" labelWidth="150" />
						<ta:text id="aab007" key="工商登记执照号码" readOnly="true" labelWidth="150" />
						<ta:text id="yab243" key="单位所在地" readOnly="true" span="2" labelWidth="150" />
						<ta:text id="aab009" key="工商登记有效期限" readOnly="true" labelWidth="150" />
						<ta:text id="aae048" key="批准成立部门" readOnly="true" labelWidth="150" />
						<ta:date id="aae049" key="批准成立日期" readOnly="true" labelWidth="150" />
						<ta:text id="aae051" key="批准成立文号" readOnly="true" labelWidth="150" />
						<ta:text id="aae045" key="法定代表人姓名" readOnly="true" labelWidth="150" />
						<ta:text id="aae046" key="法定代表人身份号码" readOnly="true" labelWidth="150" />
						<ta:text id="aae005" key="单位电话" readOnly="true" labelWidth="150" />
						<ta:text id="aae004" key="单位联系人" readOnly="true" labelWidth="150" />
						<ta:text id="aae159" key="电子邮箱" readOnly="true" labelWidth="150" />
						<ta:text id="aab016" key="专管员姓名" readOnly="true" labelWidth="150" />
						<ta:text id="aab018" key="专管员联系电话" readOnly="true" labelWidth="150" />
						<ta:text id="yab239" key="主管部门代码" readOnly="true" labelWidth="150" />
						<ta:text id="aab030" key="税号" readOnly="true" labelWidth="150" />
						<ta:text id="aaz066" key="税务机构ID" readOnly="true" labelWidth="150" />
						<ta:text id="yae433" key="税务机构名称" readOnly="true" labelWidth="150" />
						<ta:text id="yae561" key="财政离退休拨款预算科目" readOnly="true" labelWidth="150" />
						<ta:text id="yab559" key="单位档案编号" readOnly="true" labelWidth="150" />
						<ta:text id="yae560" key="单位是否参照公务员管理" readOnly="true" labelWidth="150" />
						<ta:text id="yae562" key="地税代码" readOnly="true" labelWidth="150" />
						<ta:text id="yae563" key="是否高风险行业" readOnly="true" labelWidth="150" />
						<ta:text id="yae564" key="财政供给政策" readOnly="true" labelWidth="150" />
						<ta:text id="yae565" key="财政供给机构" readOnly="true" labelWidth="150" />
						<ta:text id="yae566" key="财政对应单位编码" readOnly="true" labelWidth="150" />
						<ta:text id="yae567" key="财政归口科室" readOnly="true" labelWidth="150" />
						<ta:text id="aae013" key="备注" readOnly="true" labelWidth="150" />
					</ta:box>
				</ta:tab>
				<ta:tab id="tab2" key="单位参保信息">
					<ta:datagrid id="datagrid1" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" hiddenColumn="true" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="180" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" width="180" collection="AAE140" maxChart="5" />
						<ta:datagridItem id="aab051" key="参保状态" align="center" dataAlign="left" width="80" collection="AAB051" />
						<ta:datagridItem id="aab066" key="暂停缴费标志" align="center" dataAlign="left" width="100" collection="AAB066" />
						<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="center" dataType="date" />
						<ta:datagridItem id="yae097" key="最大做账期号" align="center" width="100" dataAlign="center" maxChart="5" />
						<ta:datagridItem id="jfz" key="缴费至" align="center" dataAlign="left" maxChart="4" />
						<ta:datagridItem id="zzrs" key="在职人数" align="center" dataAlign="left" maxChart="4" />
						<ta:datagridItem id="txrs" key="退休人数" align="center" dataAlign="left" maxChart="4" />
						<ta:datagridItem id="hjrs" key="合计人数" align="center" dataAlign="left" maxChart="4" />
						<ta:datagridItem id="yaz289" key="征缴核定规则" align="center" dataAlign="left" width="220" collection="YAZ289" />
						<ta:datagridItem id="akc022" key="参保类型" align="center" dataAlign="left" maxChart="8" collection="AKC022" />
						<ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="left" width="80" collection="AAB033" />
						<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" maxChart="10" collection="YAB003" />
						<ta:datagridItem id="aaz136" key="基数核定规则" align="center" dataAlign="left" width="130" collection="AAZ136" />
						<ta:datagridItem id="yae102" key="协议ID" align="center" dataAlign="left" width="140" />
						<ta:datagridItem id="aaz066" key="税务机构ID" align="center" dataAlign="left" width="140" />
						<ta:datagridItem id="aaz113" key="浮动费率参数ID" align="center" dataAlign="left" width="140" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab5" key="单位协议信息">
					<ta:datagrid id="datagrid4" haveSn="true" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" hiddenColumn="true" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="200" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" width="100" />
						<ta:datagridItem id="yae597" key="单位银行名称" align="center" dataAlign="left" maxChart="10" />
						<ta:datagridItem id="aae009" key="单位银行户名" align="center" dataAlign="left" width="180" />
						<ta:datagridItem id="aae010" key="单位银行账号" align="center" dataAlign="left" width="140" />
						<ta:datagridItem id="yae106" key="协议号" align="center" dataAlign="left" width="200" />
						<ta:datagridItem id="yae102" key="协议ID" align="center" dataAlign="left" width="140" hiddenColumn="true" />
						<ta:datagridItem id="jbjgyhjc" key="社保机构银行简称" align="center" dataAlign="left" width="140" />
						<ta:datagridItem id="jbjgyhhm" key="社保机构户名" align="center" dataAlign="left" width="140" />
						<ta:datagridItem id="jbjgyhzh" key="社保机构银行账号" align="center" dataAlign="left" maxChart="10" />
						<ta:datagridItem id="yaf011" key="同城异地标志" align="center" dataAlign="left" width="100" collection="YAF011" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab7" key="单位征集信息">
					<ta:datagrid id="datagrid6" haveSn="true" fit="true" onRowDBClick="dbClick" forceFitColumns="true" columnFilter="true">
						<ta:datagridItem id="aaz288" key="征集单ID" align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
						<ta:datagridItem id="aaz010" key="单位编号" align="center" dataAlign="left" width="70" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="150" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="xz" key="险种" align="center" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yad060" key="业务类型" align="center" dataAlign="left" width="80" collection="YAD060" maxChart="5"></ta:datagridItem>
						<ta:datagridItem id="yad001" key="金额" align="center" dataAlign="right" totals="sum" maxChart="4"></ta:datagridItem>
						<ta:datagridItem id="xq" key="单据信息概要" align="center" dataAlign="left" maxChart="16" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="left" collection="AAB033" maxChart="5"></ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
						<ta:datagridItem id="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
						<ta:datagridItem id="cpsj" key="出盘时间" align="center" dataType="date" dataAlign="left" maxChart="5"></ta:datagridItem>
						<ta:datagridItem id="mcdysj" key="银行托收单末次打印时间" align="center" dataAlign="left" width="250"></ta:datagridItem>
						<ta:datagridItem id="aab191" key="到账日期" align="center" dataType="date" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yad009" key="收支类型" align="center" dataAlign="left" width="70" collection="YAD009"></ta:datagridItem>
						<ta:datagridItem id="yad005" key="业务处理标志" align="center" dataAlign="left" width="90" collection="YAD005"></ta:datagridItem>
						<ta:datagridItem id="yad006" key="财务处理金额" align="center" dataAlign="left" width="90" collection="YAD006"></ta:datagridItem>
						<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" maxChart="10"></ta:datagridItem>
						<ta:datagridItem id="aaz022" key="征集单批次" align="center" dataAlign="left" width="100"></ta:datagridItem>

					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab6" key="单位核定信息">
					<ta:datagrid id="datagrid5" haveSn="true" fit="true" onRowDBClick="fnHdInfoClick" columnFilter="true">
						<ta:datagridItem id="yae518" key="核定ID" align="center" dataAlign="left" width="115" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="70" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="150" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" sortable="true" maxChart="5"></ta:datagridItem>
						<ta:datagridItem id="yac084" key="离退休" align="center" dataAlign="left" collection="YAC084" maxChart="3"></ta:datagridItem>
						<ta:datagridItem id="yae591" key="退收类型" align="center" dataAlign="left" width="65" collection="YAE591" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aaa115" key="应缴类型" align="center" dataAlign="left" collection="AAA115" sortable="true" maxChart="4"></ta:datagridItem>
						<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" maxChart="4" sortable="true"></ta:datagridItem>
						<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" maxChart="5" sortable="true"></ta:datagridItem>
						<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" maxChart="3" sortable="true"></ta:datagridItem>
						<ta:datagridItem id="aab084" key="工资" align="center" dataAlign="right" width="65"></ta:datagridItem>
						<ta:datagridItem id="yad001" key="金额" align="center" dataAlign="right" totals="sum" sortable="true" maxChart="4"></ta:datagridItem>
						<ta:datagridItem id="zjbz" key="征集标志" align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
						<ta:datagridItem id="aae011" key="经办人员" align="center" dataAlign="left" collection="AAE011" maxChart="4"></ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="6" sortable="true"></ta:datagridItem>
						<ta:datagridItem id="aab191" key="到账日期" align="center" dataAlign="left" maxChart="5"></ta:datagridItem>
						<ta:datagridItem id="yad005" key="业务处理标志" align="center" collection="YAD005" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yad006" key="财务处理标志" align="center" collection="YAD006" dataAlign="left" width="90"></ta:datagridItem>
						<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" maxChart="10"></ta:datagridItem>
						<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" collection="AAE016" width="80" hiddenColumn="true"></ta:datagridItem>
						<%-- 
							<ta:datagridItem id="aaz288" key="征集单ID" align="center" dataAlign="left" width="110"></ta:datagridItem>
							--%>
						<ta:datagridItem id="aad008" key="实收凭证编号" align="center" dataAlign="left" width="120" hiddenColumn="false"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab8" key="单位待转金信息">
					<ta:datagrid id="datagrid7" haveSn="true" fit="true" onRowDBClick="fnClick">
						<ta:datagridItem id="aab001" key="单位编号" width="80" align="center" dataAlign="left" sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" width="200" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" width="180" align="center" dataAlign="left" sortable="true" collection="AAE140" maxChart="5" />
						<ta:datagridItem id="yae080" key="余额" width="140" align="center" dataAlign="right" sortable="true" dataType="Number" maxChart="5" />
						<ta:datagridItem id="aaa093" key="承担缴费主体类型" width="140" align="center" dataAlign="left" sortable="true" collection="AAA093" maxChart="8" />
						<ta:datagridItem id="aae341" key="筹资项目 " collection="AAE341" width="100" align="center" dataAlign="left" sortable="true" maxChart="6" />
						<ta:datagridItem id="yae081" key="自动使用标志" width="100" align="center" dataAlign="left" sortable="true" collection="YAE081" maxChart="6" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab3" key="单位基本信息变更">
					<ta:datagrid id="datagrid3" haveSn="true" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" hiddenColumn="true" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="180" hiddenColumn="true" />
						<ta:datagridItem id="aaa058" key="变更类型" align="center" dataAlign="left" collection="AAA058" maxChart="5" />
						<ta:datagridItem id="aae123" key="变更前信息" align="center" dataAlign="left" width="90" />
						<ta:datagridItem id="aae124" key="变更后信息" align="center" dataAlign="left" width="90" />
						<ta:datagridItem id="aae155" key="变更项中文含义" align="center" dataAlign="left" width="100" />
						<ta:datagridItem id="aae122" key="变更项目" align="center" dataAlign="left" collection="AAE122" width="70" />
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="aae011" width="100" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="Datetime" width="100" />
						<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" maxChart="10" />
						<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" width="70" collection="AAE016" hiddenColumn="true" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab4" key="单位参保信息变更">
					<ta:datagrid id="datagrid2" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="80" hiddenColumn="true" />
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="180" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" maxChart="5" />
						<ta:datagridItem id="aab100" key="变更类型" align="center" dataAlign="left" collection="AAB100" width="100" />
						<ta:datagridItem id="aae123" key="变更前信息" align="center" dataAlign="left" width="100" />
						<ta:datagridItem id="aae124" key="变更后信息" align="center" dataAlign="left" width="130" />
						<ta:datagridItem id="aae155" key="变更项中文含义" align="center" dataAlign="left" maxChart="8" />
						<ta:datagridItem id="aae122" key="变更项目" align="center" dataAlign="left" collection="AAE122" width="70" />
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="aae011" maxChart="4" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" dataType="Datetime" maxChart="6" />
						<ta:datagridItem id="yab003" key="经办所属机构" align="center" dataAlign="left" collection="YAB003" maxChart="10" />
						<ta:datagridItem id="aae035" key="变更日期" align="center" dataType="date" dataAlign="center" width="80" />
						<ta:datagridItem id="aae160" key="变更原因" align="center" dataAlign="left" width="80" />
						<ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="left" width="70" collection="AAE016" />

					</ta:datagrid>
				</ta:tab>




			</ta:tabs>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("body").taLayout();
		Base.focus("aab001");
		Base.setDisabled("fnPrint");
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});

	function fnQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
		}
		Base.submit("panel0", "unitInfoComQueryAction!toQuery.do");
	}
	function fnQueryInfo() {
		var aab001 = Base.getValue('aab001');
		if (aab001 == null || aab001 == '') {
			alert('单位编号为空');
			Base.activeTab('tab1');
			Base.focus('aab001', 0);
			return;
		}
		Base.submit("panel0", "unitInfoComQueryAction!toQuery.do");
	}
	function fnPrint() {
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' || aab001 == null) {
			alert("没有获取到单位编号");
			return;
		}
		var fileName = "SHBXBGDZTable.raq";
		var prm = "aab001=" + aab001;
		fnPrintComm(fileName, prm);
	}
	function fnHdInfoClick(e, rowdata) {
		Base.openWindow("hdWindow", "单位核定详情", "unitInfoComQueryAction!toEditHD.do", {
			"dto['aab001']" : rowdata.aab001,
			"dto['aae140']" : rowdata.aae140,
			"dto['aae003']" : rowdata.aae003,
			"dto['aaa115']" : rowdata.aaa115,
			"dto['yab139']" : rowdata.yab003
		}, "95%", "90%", null, null, true);
	}
	function fnZjInfoClick(e, rowdata) {
		Base.openWindow("zjWindow", "单位征集详情", "unitInfoComQueryAction!toEditZJ.do", {
			"dto['aaz288']" : rowdata.aaz288
		}, "95%", "90%", null, null, true);
	}
	function fnClick(e, rowdata) {
		Base.openWindow("detailWindow", "单位待转金详情", myPath() + "/process/publicBusiness/publicQuery/unitQuery/unitUntransferFundsAction!queryDetail.do", {
			"dto['aaz010']" : rowdata.aab001,
			"dto['aae140']" : rowdata.aae140
		}, "95%", "90%", null);
	}

	function dbClick(e, rowdata) {
		var aaz288 = rowdata.aaz288;
		var sfxxgrmx = '1'; //显示个人征集明细
		Base.openWindow('userwin', "单据详细信息", myPath() + "/process/publicBusiness/manageFinancial/billQuery/billQueryAction!dbClick.do", {
			"dto['aaz288']" : aaz288,
			"dto['sfxxgrmx']" : sfxxgrmx
		}, "95%", "90%", null, null, true);
	}

	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02_1.do", null, 1000, 450, null, function() {
			Base.submit("panel0", "unitInfoComQueryAction!toQuery.do");
		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(1, "getAb01String_q", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>