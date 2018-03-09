<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentLumpsumCheck1</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" hotKey="ctrl+S" key="保存[S]" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" hotKey="P" asToolBarItem="true" disabled="true" onClick="print();" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
			<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<ta:text id="fhjc" key="复核级次" labelWidth="130" readOnly="true" display="false" />
		</ta:panel>

		<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="单位编号" labelWidth="130" readOnly="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
		</ta:panel>
		<ta:panel id="sydjxx" key="手术登记信息" hasBorder="false" cols="3">
			<ta:text id="ymc035" key="计划生育手术登记ID" display="false" />
			<ta:text id="aaz106" key="医疗机构编码" required="true" labelWidth="130" />
			<ta:text id="aae0441" key="医疗机构名称" required="true" labelWidth="130" />
			<ta:selectInput id="ymc032" key="手术类别" collection="YMC032" required="true" labelWidth="130" />
			<ta:date id="aae127" key="申请日期" validNowTime="left" required="true" showSelectPanel="true" labelWidth="130" />
			<ta:date id="amc020" key="手术日期" validNowTime="left" required="true" showSelectPanel="true" onChange="checkpayfor();yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="aae005" key="联系电话" max="9999999999999" labelWidth="130" />
			<ta:date id="aae235" key="就诊开始日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:date id="aae236" key="就诊结束日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="yae150" key="新农合已支付医疗费" required="true" asAamount="true" precision="2" labelWidth="130" />
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
		<ta:box cols="2">
			<ta:panel id="dqdyxx" key="当前待遇信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataType="date">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="hisdyxx" key="历史报销信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="hisdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataType="date">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//RPC
	//流程流转
	function submitData() {
		Base.submit("form1", "medicalcalcheck1action!toSave.do", null, null, null, function(data) {
			Base.setDisabled("saveBtn");
		});
	};
	$(document).ready(function() {
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
	});
	
	//查看工伤医疗用药明细信息
	function ShowMedicalDetail(){
		Base.openWindow("medicalDetailInfo", ">>明细内容","<%=path%>/process/workinjurybenefit/medicalcalculatedetail/medicalCalculateDetailAction!showMedicalUseDetail.do", {
			"dto['aac001']":Base.getValue("aac001"),"dto['aka130']":"51,52"}, "95%", "90%", null, null, true);		
	}	
	
	function print(){			   
		var aaz002=Base.getValue('businessLogID');
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_zybxjsd_ylf.raq&"+
					"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=aaz002="+aaz002);		
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>