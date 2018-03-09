<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>integrativeQuery</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="个人基本信息" cssStyle="overflow:auto;" selected="true">
				<ta:panel id="jbxx" cols="3" key="基本信息">
					<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
					<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
					<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
					<ta:selectInput id="aac011" key="学历" labelWidth="130" collection="AAC011" readOnly="true" />
					<ta:date id="aac007" key="参加工作时间" labelWidth="130" readOnly="true" />
					<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="AAC012" readOnly="true" />
					<ta:text id="aab001" key="单位编号" labelWidth="130" readOnly="true" />
					<ta:text id="aae044" key="单位名称" labelWidth="130" readOnly="true" span="2" />
					<ta:number id="aae200" key="视同缴费月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="aae201" key="实际缴费月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="ljjfnx" key="累计缴费年限" labelWidth="130" readOnly="true" precision="2" alignLeft="true" />
					<ta:number id="aae204" key="特殊工种折算月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:selectInput id="aac014" key="专业技术职务等级" labelWidth="130" collection="AAC014" readOnly="true" />
					<ta:selectInput id="aac015" key="工人技术等级" labelWidth="130" collection="AAC015" readOnly="true" />
					<ta:selectInput id="aac020" key="行政职务(级别)" labelWidth="130" collection="AAC020" readOnly="true" />
					<ta:selectInput id="aac081" key="建国前老工人标志" labelWidth="130" collection="AAC081" readOnly="true" />
					<ta:selectInput id="aac085" key="原工商业者标志" labelWidth="130" collection="AAC085" readOnly="true" />
					<ta:selectInput id="aac064" key="退役军人类别" labelWidth="130" collection="AAC064" readOnly="true" />
					<ta:selectInput id="aac065" key="退役军衔级别" labelWidth="130" collection="AAC065" readOnly="true" />
					<ta:selectInput id="aac093" key="最高荣誉称号级别" labelWidth="130" collection="AAC093" readOnly="true" />
					<ta:date id="aac055" key="参加革命工作日期" labelWidth="130" showSelectPanel="true" readOnly="true" />
					<ta:number id="aac056" key="军龄(月)" labelWidth="130" max="999" min="0" alignLeft="true" readOnly="true" />
					<ta:number id="aae203" key="军龄折算月数" labelWidth="130" max="999" min="0" alignLeft="true" readOnly="true" />
					<ta:selectInput id="yic006" key="退休后工资职级" labelWidth="130" collection="YIC006" readOnly="true" />
					<ta:selectInput id="yic007" key="退休后津贴职级" labelWidth="130" collection="YIC007" readOnly="true" />
					<ta:number id="aic165" key="离退休时个人帐户总金额" precision="2" labelWidth="160" readOnly="true" alignLeft="true" />
					<ta:number id="aic167" key="退休时个人帐户中个人缴费划账户所占比例" precision="4" labelWidth="260" readOnly="true" alignLeft="true" />
					<ta:selectInput id="aic161" key="离退休类别" labelWidth="130" collection="AIC161" readOnly="true" />
					<ta:date id="aic162" key="离退休日期" labelWidth="130" showSelectPanel="true" readOnly="true" />
					<ta:date id="aae211" key="待遇核定年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:date id="aae210" key="待遇享受开始年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:number id="yac009" key="初次待遇" labelWidth="130" readOnly="true" alignLeft="true" precision="2" />
					<ta:number id="aic166" key="离退休时个人账户养老金占基本养老金比例" precision="4" labelWidth="260" readOnly="true" alignLeft="true" />
					<ta:selectInput id="aae116" key="待遇发放状态" labelWidth="130" collection="aae116" readOnly="true" />
					<ta:text id="yac001" key="个人最大发放期号" labelWidth="130" readOnly="true" />
					<ta:text id="yab001" key="单位最大发放期号" labelWidth="130" readOnly="true" />
					<ta:text id="aae007_1" key="邮政编码" labelWidth="130" readOnly="true" />
					<ta:text id="aae005_1" key="联系电话" labelWidth="130" readOnly="true" />
					<ta:text id="aae006_1" key="地址" labelWidth="130" readOnly="true" span="2" />
					<ta:text id="aab073" key="所属街道社区" labelWidth="130" readOnly="true" />
					<ta:selectInput id="yic009" key="特殊贡献表彰类型" collection="yic009" labelWidth="130" readOnly="true" />
					<ta:selectInput id="yic010" key="计划生育类型" collection="yic010" labelWidth="130" readOnly="true" />
					<ta:date id="yac516" key="档案出生日期" labelWidth="130" readOnly="true" />
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
				<ta:panel id="zjycbdxx" cols="3" key="最近一次变动信息">
					<ta:selectInput id="aaa099" key="停续标志" labelWidth="130" collection="AAA099" readOnly="true" />
					<ta:date id="aae041" key="变更年月" labelWidth="130" readOnly="true" issue="true" />
					<ta:selectInput id="aae160" key="变更原因" labelWidth="130" collection="AAE160" readOnly="true" />
					<ta:selectInput id="aaa074" key="待遇终止类型" labelWidth="130" collection="AAA074" readOnly="true" display="false" />
					<ta:date id="aae235" key="终止年月" labelWidth="130" readOnly="true" issue="true" display="false" />
					<ta:selectInput id="aae160_1" key="终止原因" labelWidth="130" collection="AAE160" readOnly="true" display="false" />
				</ta:panel>
				<ta:panel id="scztbg" key="生存状态变更信息" fit="true" height="45px">
					<ta:datagrid id="ac26List" fit="true" forceFitColumns="true" haveSn="true">
						<ta:datagridItem id="aac001" key="个人编号" showDetailed="true" />
						<ta:datagridItem id="aae138" key="状态变更日期" showDetailed="true" />
						<ta:datagridItem id="aac052" key="状态变更原因" collection="AAC052" showDetailed="true" />
						<ta:datagridItem id="aae171" key="生存状态变更类型" collection="AAE171" showDetailed="true" />
						<ta:datagridItem id="aac053" key="死亡证明" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" cssStyle="overflow:hidden;" key="发放期支付记录">
				<ta:panel id="zfxx" key="待遇支付信息" fit="true">
					<ta:datagrid id="ac82Aae002List" fit="true" haveSn="true" enableColumnMove="false" onRowDBClick="showAc83" columnFilter="true">
						<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" dataAlign="center" />
						<ta:datagridItem id="aae145" key="发放方式" sortable="true" collection="AAE145" width="170" showDetailed="true" />
						<ta:datagridItem id="aae133" key="领取人姓名" sortable="true" showDetailed="true" width="150" dataAlign="center" />
						<ta:datagridItem id="aaf002" key="银行类别" sortable="true" collection="AAF002" width="150" showDetailed="true" />
						<ta:datagridItem id="aae010" key="银行账号" width="150" showDetailed="true" dataAlign="right" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" dataAlign="right" width="130" />
						<ta:datagridItem id="yae112" key="统筹外待遇类别" sortable="true" collection="AAA036" width="130" showDetailed="true" />
						<ta:datagridItem id="aae117" key="支付标志" sortable="true" collection="AAE117" width="130" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" dataAlign="center" width="150" />
						<ta:datagridItem id="yad019" key="失败原因" sortable="true" collection="AAE357" showDetailed="true" />
						<ta:datagridItem id="aae006" key="邮寄地址" width="200" showDetailed="true" />
						<ta:datagridItem id="aaz220" key="人员应付计划事件ID" hiddenColumn="true" showDetailed="true" />
						<ta:datagridItem id="aac001" key="个人编号" hiddenColumn="true" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab3" key="所属期支付记录" cssStyle="overflow:hidden;">
				<ta:panel id="zfxxmx" key="待遇支付明细信息" fit="true">
					<ta:datagrid id="ac82Aae003List" haveSn="true" fit="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" dataAlign="center" width="200" />
						<ta:datagridItem id="aae003" key="对应费款所属期" sortable="true" width="240" showDetailed="true" dataAlign="center" />
						<ta:datagridItem id="aaa088" key="发放类型" sortable="true" collection="AAA088" width="200" showDetailed="true" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" dataAlign="right" width="200" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab4" key="待遇信息" cssStyle="overflow:hidden;">
				<ta:panel id="dyxx" key="当前待遇信息" fit="true">
					<ta:datagrid id="ac61List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aaa036" key="待遇项目" sortable="true" collection="AAA036" width="300" showDetailed="true" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" dataAlign="right" width="180" />
						<ta:datagridItem id="aae041" key="开始年月" sortable="true" showDetailed="true" dataAlign="center" width="200" />
						<ta:datagridItem id="aae042" key="结束年月" sortable="true" showDetailed="true" dataAlign="center" width="200" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" dataAlign="center" width="200" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab5" key="补退信息" cssStyle="overflow:auto;">
				<ta:panel id="btxx" key="补退信息" height="150">
					<ta:datagrid id="ac75List" fit="true" haveSn="true" enableColumnMove="false" onRowClick="showAc76">
						<ta:datagridItem id="aaa077" key="补扣发业务类型" sortable="true" collection="AAA077" width="150" showDetailed="true" />
						<ta:datagridItem id="aae161" key="补扣原因" width="150" showDetailed="true" />
						<ta:datagridItem id="aae041" key="开始年月" sortable="true" showDetailed="true" dataAlign="center" width="130" />
						<ta:datagridItem id="aae042" key="结束年月" sortable="true" showDetailed="true" dataAlign="center" width="130" />
						<ta:datagridItem id="aae058" key="金额" totals="sum" showDetailed="true" dataAlign="right" width="130" />
						<ta:datagridItem id="aae016" key="复核标志" sortable="true" collection="AAE016" showDetailed="true" width="150" />
						<ta:datagridItem id="aae110" key="核定标志" sortable="true" collection="AAE110" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" hiddenColumn="false" width="150" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" dataAlign="center" width="150" />
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="btmxxx" key="补退明细信息" fit="true" cssStyle="overflow:auto;">
					<ta:datagrid id="ac76List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aaa036" key="调整待遇项目" sortable="true" collection="AAA036" width="300" showDetailed="true" />
						<ta:datagridItem id="aaa078" key="补扣标志" sortable="true" collection="AAA078" width="200" showDetailed="true" />
						<ta:datagridItem id="aae003" key="对应费款所属期" sortable="true" width="240" showDetailed="true" dataAlign="center" />
						<ta:datagridItem id="aae129" key="金额" sortable="true" totals="sum" showDetailed="true" dataAlign="right" width="200" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab6" key="停续发信息">
				<ta:panel id="txxx" key="停续发信息" fit="true">
					<ta:datagrid id="ac77List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aaa099" key="停续标志" sortable="true" collection="AAA099" showDetailed="true" width="150" />
						<ta:datagridItem id="aae160" key="变更原因" sortable="true" collection="AAE160" width="250" showDetailed="true" />
						<ta:datagridItem id="aae041" key="变更年月" sortable="true" showDetailed="true" dataAlign="center" width="150" />
						<ta:datagridItem id="aae013" key="备注" width="200" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" width="150" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" dataAlign="center" width="150" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab7" key="增资信息">
				<ta:panel id="tzxx" key="增资信息" fit="true">
					<ta:datagrid id="ac78List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aaz095" key="增资文号编号" sortable="true" collection="AAA099" width="120" showDetailed="true" />
						<ta:datagridItem id="aaa134" key="增资文号名称" sortable="true" width="250" showDetailed="true" />
						<ta:datagridItem id="aaa036" key="调整待遇项目" sortable="true" collection="AAA036" width="150" showDetailed="true" />
						<ta:datagridItem id="aae212" key="增资生效期号" sortable="true" width="120" showDetailed="true" dataAlign="center" />
						<ta:datagridItem id="aae188" key="增发金额" totals="sum" showDetailed="true" dataAlign="right" width="150" />
						<ta:datagridItem id="aae036" key="经办时间" width="150" showDetailed="true" />
						<ta:datagridItem id="aae013" key="备注" width="150" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab8" cols="3" key="帐户信息">
				<ta:date id="aae206" key="帐户建立年月" labelWidth="130" readOnly="true" issue="true" />
				<ta:selectInput id="aae100" key="当前有效标志" labelWidth="130" collection="AAE100" readOnly="true" />
				<ta:number id="aae238" key="本金" precision="2" labelWidth="130" readOnly="true" alignLeft="true" />
				<ta:number id="aae239" key="利息" precision="2" labelWidth="130" readOnly="true" alignLeft="true" />
				<ta:number id="aae357" key="帐户支出总额" precision="2" labelWidth="130" readOnly="true" alignLeft="true" />
				<ta:panel key="账户支出明细" span="3" fit="true" scalable="false">
					<ta:datagrid id="ac55List" haveSn="true" height="400" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aac002" key="身份证号码" sortable="true" width="250" showDetailed="true" />
						<ta:datagridItem id="aae229" key="支出日期" sortable="true" showDetailed="true" width="200" dataAlign="center" />
						<ta:datagridItem id="aae058" key="支出金额" sortable="true" totals="sum" showDetailed="true" dataAlign="right" width="200" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab9" key="基本信息变更记录">
				<ta:panel id="bgxx" key="基本信息变更记录" fit="true">
					<ta:datagrid id="ac30a1List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aae155" key="变更项目" width="150" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae123" key="变更前信息" width="150" showDetailed="true" />
						<ta:datagridItem id="aae301" key="变更前值描述" width="150" showDetailed="true" />
						<ta:datagridItem id="aae124" key="变更后信息" width="150" showDetailed="true" />
						<ta:datagridItem id="aae302" key="变更后值描述" width="150" showDetailed="true" />
						<ta:datagridItem id="aae016" key="复核标志" sortable="true" collection="AAE016" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" width="150" />
						<ta:datagridItem id="aae013" key="备注" width="160" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="rynjfzsxxL" key="四年指数">
				<ta:panel id="101jfzs" key="四年指数" fit="true">
					<ta:datagrid id="rynzsxxGridL" haveSn="true" forceFitColumns="true" fit="true">
						<ta:datagridItem id="yic066" key="计算办法" collection="yic066" sortable="true" align="center" />
						<ta:datagridItem id="aae001" key="年度" sortable="true" align="center" dataAlign="center" />
						<ta:datagridItem id="aic078" key="本年应缴月数" align="center" dataAlign="center" />
						<ta:datagridItem id="aic079" key="本年实缴月数" align="center" dataAlign="center" />
						<ta:datagridItem id="yic182" key="基数" align="center" dataAlign="right" />
						<ta:datagridItem id="yic181" key="工资" align="center" dataAlign="right" />
						<ta:datagridItem id="yic183" key="缴费指数" totals="avg" align="center" dataAlign="right" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="rynjfzsxxX" key="历年指数">
				<ta:panel id="54jfzs" key="历年指数" fit="true">
					<ta:datagrid id="rynzsxxGridX" haveSn="true" fit="true">
						<ta:datagridItem id="aae001" key="年度" sortable="true" align="center" dataAlign="center" />
						<ta:datagridItem id="yic182" key="基数" align="center" dataAlign="right" />
						<ta:datagridItem id="yic181" key="全区社平工资" align="center" dataAlign="right" />
						<ta:datagridItem id="yic183" key="缴费指数" totals="avg" align="center" dataAlign="right" width="120" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){ 
	});	
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001","<%=path%>/pensionbenefit/query/integrativequery/integrativequery110Action!queryBaseInfo.do",null,null,null,fn_check);
		}, true);
	}
	
	//回调函数	
	function fn_queryInfo(){
	   if (g_Suggest!=""){ 
			fn_setPersonBaseInfoData();
			Base.submit("aac001","<%=path%>/pensionbenefit/query/integrativequery/integrativequery110Action!queryBaseInfo.do",null,null,null,fn_check);   
	   }
	}
	
	function fn_check(){
			fn_setPaymentInfoReadOnlyPage();
		}
	
	function showAc83(e, rowdata){
		var toUrl="<%=path%>/process/pensionbenefit/query/integrativequery/showAc83ListAction.do";
		Base.openWindow('ac83List',"支付明细",toUrl,{"dto['aac001']":rowdata.aac001,"dto['aaz220']":rowdata.aaz220},800,500,null,null,true);
	}
	
	function showAc76(e, rowdata){
		Base.submit("ac76List","<%=path%>/pensionbenefit/query/integrativequery/integrativequery110Action!queryAc76List.do", {"dto['aaz166']" : rowdata.aaz166}, null, function(data) {});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>