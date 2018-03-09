<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>unemployIntegrativeQuery</title>
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
					<ta:selectInput id="aac004" key="性别" labelWidth="130" collection="AAC004" readOnly="true" />
					<ta:date id="aac006" key="出生日期" labelWidth="130" readOnly="true" />
					<ta:selectInput id="aac005" key="民族" labelWidth="130" collection="AAC005" readOnly="true" />
					<ta:selectInput id="aac011" key="学历" labelWidth="130" collection="AAC011" readOnly="true" />
					<ta:date id="aac007" key="参加工作时间" labelWidth="130" readOnly="true" />
					<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="AAC012" readOnly="true" />
					<ta:text id="aab999" key="单位代码" labelWidth="130" readOnly="true" />
					<ta:text id="aae044" key="单位名称" labelWidth="130" readOnly="true" span="2" />
					<ta:text id="aaz001" key="原单位ID" labelWidth="130" readOnly="true" />
					<ta:text id="aae044_y" key="原单位名称" labelWidth="130" readOnly="true" span="2" />
					<ta:selectInput id="aac028" key="农民工标志" labelWidth="130" collection="AAC028" readOnly="true" />
					<ta:number id="ajc001" key="视同缴费月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="ajc071" key="实际缴费月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="ajc072" key="累计缴费年限" labelWidth="130" readOnly="true" precision="2" alignLeft="true" />
					<ta:number id="yjc059" key="农民工本次缴费月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="yjc060" key="农民工本次享受月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:text id="yje004" key="失业证号" labelWidth="130" readOnly="true" />
					<ta:date id="ajc090" key="失业时间" labelWidth="130" readOnly="true" />
					<ta:selectInput id="ajc093" key="失业原因" labelWidth="130" collection="AJC093" readOnly="true" />
					<ta:number id="ajc058" key="本次缴费可享受月数" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="ajc059" key="上次结转至本次剩余享受月数" labelWidth="205" readOnly="true" alignLeft="true" />
					<ta:number id="ajc097" key="应享受失业保险待遇月数" labelWidth="205" readOnly="true" alignLeft="true" />
					<ta:number id="ajc098" key="已享受失业保险待遇月数" labelWidth="205" readOnly="true" alignLeft="true" />
					<ta:number id="ajc099" key="本次剩余可享受失业保险待遇月数" labelWidth="205" readOnly="true" alignLeft="true" />
					<ta:date id="aae211" key="待遇核定年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:date id="aae210" key="待遇享受开始年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:selectInput id="aae116" key="待遇发放状态" labelWidth="130" collection="AAE116" readOnly="true" />
					<ta:text id="yac001" key="个人最大发放期号" labelWidth="130" readOnly="true" />
					<ta:text id="yab001" key="单位最大发放期号" labelWidth="130" readOnly="true" />
					<ta:text id="aae005_1" key="联系电话" labelWidth="130" readOnly="true" />
					<ta:text id="aae007_1" key="邮政编码" labelWidth="130" readOnly="true" />
					<ta:text id="aae006_1" key="地址" labelWidth="130" readOnly="true" span="2" />
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
				<ta:panel id="zjycbdxx" cols="3" key="最近一次变动信息" fit="true">
					<ta:selectInput id="aaa099" key="停续标志" labelWidth="130" collection="AAA099" readOnly="true" />
					<ta:date id="aae041" key="变更年月" labelWidth="130" readOnly="true" issue="true" />
					<ta:selectInput id="aae160" key="变更原因" labelWidth="130" collection="AAE160" readOnly="true" />
					<ta:selectInput id="aaa074" key="待遇终止类型" labelWidth="130" collection="AAA074" readOnly="true" display="false" />
					<ta:date id="aae235" key="终止年月" labelWidth="130" readOnly="true" issue="true" display="false" />
					<ta:selectInput id="aae160_1" key="终止原因" labelWidth="130" collection="AAE160" readOnly="true" display="false" />
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" key="发放期支付记录" cssStyle="overflow:hidden;">
				<ta:panel id="zfxx" key="待遇支付信息" fit="true">
					<ta:datagrid id="ac82Aae002List" height="450" haveSn="true" enableColumnMove="false" onRowDBClick="showAc83" columnFilter="true">
						<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae003" key="对应费款所属期" width="120" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae145" key="发放方式" sortable="true" collection="AAE145" width="150" showDetailed="true" />
						<ta:datagridItem id="aaf002" key="银行类别" sortable="true" collection="AAF002" width="150" showDetailed="true" />
						<ta:datagridItem id="aae010" key="银行账号" width="150" showDetailed="true" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" width="120" />
						<ta:datagridItem id="aae117" key="支付标志" sortable="true" collection="AAE117" width="150" showDetailed="true" />
						<ta:datagridItem id="aae357" key="失败原因" sortable="true" collection="AAE357" showDetailed="true" />
						<ta:datagridItem id="aae006" key="邮寄地址" width="200" showDetailed="true" />
						<ta:datagridItem id="aaz220" key="人员应付计划事件ID" hiddenColumn="true" showDetailed="true" />
						<ta:datagridItem id="aac001" key="个人编号" hiddenColumn="true" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab3" key="所属期支付记录" cssStyle="overflow:hidden;">
				<ta:panel id="zfxxmx" key="待遇支付明细信息" fit="true">
					<ta:datagrid id="ac82Aae003List" haveSn="true" height="450" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" width="200" />
						<ta:datagridItem id="aae003" key="对应费款所属期" sortable="true" width="240" showDetailed="true" />
						<ta:datagridItem id="aaa088" key="发放类型" sortable="true" collection="AAA088" width="200" showDetailed="true" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" width="200" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab4" key="待遇信息" cssStyle="overflow:hidden;">
				<ta:panel id="dyxx" key="当前待遇信息" fit="true">
					<ta:datagrid id="ac61List" height="450" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aaa036" key="待遇项目" sortable="true" collection="AAA036" width="300" showDetailed="true" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" width="180" />
						<ta:datagridItem id="aae041" key="开始年月" sortable="true" showDetailed="true" width="200" />
						<ta:datagridItem id="aae042" key="结束年月" sortable="true" showDetailed="true" width="200" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" width="200" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab5" key="补退信息" cssStyle="overflow:auto;">
				<ta:panel id="btxx" key="补退信息" height="150">
					<ta:datagrid id="ac75List" fit="true" haveSn="true" enableColumnMove="false" onRowClick="showAc76" columnFilter="true" defaultColumnWidth="110">
						<ta:datagridItem id="aaa077" key="补扣发业务类型" sortable="true" collection="AAA077" width="150" showDetailed="true" />
						<ta:datagridItem id="aae161" key="补扣原因" showDetailed="true" />
						<ta:datagridItem id="aae041" key="开始年月" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae042" key="结束年月" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae058" key="金额" totals="sum" showDetailed="true" />
						<ta:datagridItem id="aae016" key="复核标志" sortable="true" collection="AAE016" showDetailed="true" />
						<ta:datagridItem id="aae110" key="核定标志" sortable="true" collection="AAE110" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="btmxxx" key="补退明细信息" cssStyle="overflow:auto;" fit="true">
					<ta:datagrid id="ac76List" height="250" haveSn="true" enableColumnMove="false" columnFilter="true" defaultColumnWidth="200">
						<ta:datagridItem id="aaa036" key="调整待遇项目" sortable="true" collection="AAA036" width="300" showDetailed="true" />
						<ta:datagridItem id="aaa078" key="补扣标志" sortable="true" collection="AAA078" showDetailed="true" />
						<ta:datagridItem id="aae003" key="对应费款所属期" sortable="true" width="240" showDetailed="true" />
						<ta:datagridItem id="aae129" key="金额" sortable="true" totals="sum" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab6" key="待遇变更(停续发、终止)信息">
				<ta:panel id="txxx" key="停续发信息">
					<ta:datagrid id="ac77List" haveSn="true" enableColumnMove="false" columnFilter="true" defaultColumnWidth="150">
						<ta:datagridItem id="aaa099" key="停续标志" sortable="true" collection="AAA099" showDetailed="true" />
						<ta:datagridItem id="aae160" key="变更原因" sortable="true" collection="AAE160" width="250" showDetailed="true" />
						<ta:datagridItem id="aae041" key="变更年月" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae013" key="备注" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="zzxx" key="终止信息" fit="true">
					<ta:datagrid id="ac81List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true" defaultColumnWidth="150">
						<ta:datagridItem id="aaa074" key="待遇终止类型" sortable="true" collection="AAA074" showDetailed="true" hiddenColumn="true" />
						<ta:datagridItem id="aae160" key="变更原因" sortable="true" collection="AAE160" width="250" showDetailed="true" />
						<ta:datagridItem id="aae235" key="待遇享受终止年月" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae013" key="备注" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab7" key="增资信息">
				<ta:panel id="tzxx" key="增资信息" fit="true">
					<ta:datagrid id="ac78List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true" defaultColumnWidth="130">
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
			<ta:tab id="tab8" key="基本信息变更记录">
				<ta:panel id="bgxx" key="基本信息变更记录" fit="true">
					<ta:datagrid id="ac30a1List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aae155" key="变更项目" width="150" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae123" key="变更前信息" width="150" showDetailed="true" />
						<ta:datagridItem id="aae301" key="变更前值描述" width="150" showDetailed="true" />
						<ta:datagridItem id="aae124" key="变更后信息" width="150" showDetailed="true" />
						<ta:datagridItem id="aae302" key="变更后值描述" width="150" showDetailed="true" />
						<ta:datagridItem id="aae016" key="复核标志" sortable="true" collection="AAE016" showDetailed="true" />
						<ta:datagridItem id="aac003" key="经办人" sortable="true" collection="AAE011" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" />
						<ta:datagridItem id="aae013" key="备注" width="160" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").css("overflow","auto");
	    $("body").css("overflow","hidden");
	    Base.hideObj("aae006");
	    Base.hideObj("aae007");
		initializeSuggestFramework(1,"ac01","aac001",700,200,4,fn_queryInfo,1,false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)				
	});	
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow13.do", null, 1000, 450, null, function() {
			Base.submit("aac001","<%=path%>/unemployedbenefit/query/integrativequery/unemployIntegrativeQueryAction!queryBaseInfo.do",null,null,null);
		}, true);
	}
	
	//回调函数	
	function fn_queryInfo(){
	   if (g_Suggest!=""){ 
	        fn_setPersonBaseInfoData();
			Base.submit("aac001","<%=path%>/unemployedbenefit/query/integrativequery/unemployIntegrativeQueryAction!queryBaseInfo.do",null,null,null);   
	   }
	}
	
	function showAc83(e, rowdata){
		var toUrl="<%=path%>/process/pensionbenefit/query/integrativequery/showAc83ListAction.do";
		Base.openWindow('ac83List',"支付明细",toUrl,{"dto['aac001']":rowdata.aac001,"dto['aaz220']":rowdata.aaz220},800,500,null,null,true);
	}
	function showAc76(e, rowdata){
		Base.submit("ac76List","<%=path%>/unemployedbenefit/query/integrativequery/unemployIntegrativeQueryAction!queryAc76List.do", 
				{"dto['aaz166']" : rowdata.aaz166}, null, function(data) {null;});
	}
	</script>
<%@ include file="/ta/incfooter.jsp"%>