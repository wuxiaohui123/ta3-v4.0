<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AdministrativeApproval</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" style="padding: 0px; margin: 0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]"
				hotKey="S" onClick="toSave();" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]"
				hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120"
				required="true" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))"
				bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="aac004"
				labelWidth="120" readOnly="true" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" />
			<ta:date id="aac007" key="参加工作日期" labelWidth="120" readOnly="true" />
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false"
				labelWidth="120" />
			<ta:text id="aab001" key="单位编号" labelWidth="120" readOnly="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="120"
				span="2" />
		</ta:panel>
		<ta:panel id="rytxxx" cols="3" key="人员退休信息">
			<ta:selectInput id="aic161" key="离退休类别" labelWidth="120"
				collection="aic161" required="true" value="2" />
			<ta:date id="yac597" key="退休审批时间" bpopTipMsg="退休审批时间不能大于系统时间"
				labelWidth="120" showSelectPanel="true" required="true" datetime="false"/>
			<ta:date id="aic162" key="退休划账开始时间" bpopTipMsg="退休划账开始时间不能大于系统时间"
				labelWidth="120" showSelectPanel="true" required="true" datetime="false"/>
			<ta:number id="aac040" key="退休工资" asAamount="true" amountPre="￥"
				precision="2" labelWidth="120" required="true"/>
			<ta:number id="aae200" key="视同缴费月数" labelWidth="120" readOnly="true"
				max="999" min="0" alignLeft="true" />
			<ta:number id="aae201" key="实际缴费月数" labelWidth="120" readOnly="true"
				max="999" min="0" alignLeft="true" />
			<ta:number id="zrys" key="转入月数" labelWidth="120" readOnly="true"
				max="999" min="0" alignLeft="true" />
			<ta:text id="aae013" key="备注" labelWidth="120" maxLength="100" span="2" />
		</ta:panel>
		<ta:tabs id="tab_all" fit="true">
			<ta:tab id="tab_1" key="个人参保信息">
				<ta:datagrid id="ac20Grid" fit="true" haveSn="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center"
						dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true"
						align="center" dataAlign="left" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="aac001" key="个人编号" align="center"
						dataAlign="left" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac003" key="姓名" showDetailed="true"
						align="center" dataAlign="left" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种" showDetailed="true"
						align="center" dataAlign="left" collection="aae140" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="yac084" key="离退休标志" showDetailed="true"
						align="center" dataAlign="left" collection="YAC084" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true"
						align="center" dataAlign="left" collection="YKC005" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true"
						align="center" dataAlign="left" collection="YKC006" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aac030" key="参保日期" align="center"
						dataAlign="center" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aae041" key="开始年月" align="center"
						dataAlign="center" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aae042" key="结束年月" align="center"
						dataAlign="center" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aaz136" key="基数规则" showDetailed="true"
						align="center" dataAlign="left" collection="aaz136" maxChart="10"></ta:datagridItem>
					<ta:datagridItem id="yaz289" key="缴费规则" showDetailed="true"
						align="center" dataAlign="left" collection="yaz289" maxChart="16"></ta:datagridItem>
					<ta:datagridItem id="yae097" key="最大做账期号" align="center"
						dataAlign="right" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="jfz" key="缴费至" align="center"
						dataAlign="right" maxChart="4"></ta:datagridItem>
					<ta:datagridItem id="jfy" key="缴费月" align="center"
						dataAlign="right" maxChart="3"></ta:datagridItem>
					<ta:datagridItem id="djjfy" key="单建缴费月" align="center"
						dataAlign="right" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="tzjfy" key="统帐缴费月" align="center"
						dataAlign="right" maxChart="5"></ta:datagridItem>
					<ta:datagridItem id="yab139" key="参保所属机构" align="center"
						dataAlign="left" collection="yab003" maxChart="6"></ta:datagridItem>
					<ta:datagridItem id="aaz159" key="参保关系ID" align="center"
						dataAlign="left" maxChart="6"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_4" key="视同缴费信息">
				<ta:datagrid id="dg_rdxx" forceFitColumns="true" fit="true"
					haveSn="true">
					<ta:datagridItem id="aaz185" key="人员工作经历ID" align="center"
						dataAlign="center" hiddenColumn="false" />
					<ta:datagridItem id="aab004" key="单位名称" align="center"
						dataAlign="center" width="200" />
					<ta:datagridItem id="aae041" key="开始年月" align="center"
						dataAlign="center" />
					<ta:datagridItem id="aae042" key="终止年月" align="center"
						dataAlign="center" />
					<ta:datagridItem id="yae599" key="月数" align="center"
						dataAlign="center" />
					<ta:datagridItem id="aae140" key="险种" align="center"
						dataAlign="center" />
					<ta:datagridItem id="aae013" key="原因" align="center"
						dataAlign="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_2" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
$(document).ready(
function() {
	$("body").taLayout();
	Base.focus("aac001");
	initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10,fn_queryAc01, 0, false);
});
//回调函数	
function fn_queryAc01(){
   if (g_Suggest!=""){ 
        Base.setValue("aac001",g_Suggest[2]);
        Base.setValue("aac002",g_Suggest[0]);
        Base.setValue("aac003",g_Suggest[1]);
        Base.submit("fld_emp","medicalApprovalAction!toQuery.do");
	}
}

function toSave(){
	Base.submit("form1","medicalApprovalAction!toSave.do");
}
</script>
<%@ include file="/ta/incfooter.jsp"%>