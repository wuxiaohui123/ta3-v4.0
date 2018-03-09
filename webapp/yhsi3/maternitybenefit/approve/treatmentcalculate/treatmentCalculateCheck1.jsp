<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>工伤待遇审核</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" hotKey="ctrl+P" onClick="print();" asToolBarItem="true" disabled="false" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:text id="fhjc" display="false" key="复核级次" />
		</ta:box>
		<ta:panel id="jbxxfset" key="人员基本信息" cols="3" cssStyle="margin-left:3px">
			<ta:text id="aac001" key="人员ID" readOnly="true" labelWidth="130" />
			<ta:text id="aac003" key="姓 名" readOnly="true" labelWidth="130" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aac004" key="性别" readOnly="true" collection="AAC004" labelWidth="130" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aac005" key="民族" readOnly="true" collection="AAC005" labelWidth="130" />
			<ta:text id="aab001" key="单位ID" readOnly="true" labelWidth="130" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:text id="aab999" key="单位管理码" display="false" labelWidth="130" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" labelWidth="130" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" labelWidth="130" />
		</ta:panel>
		<ta:panel id="sydjxx" key="本次生育基本信息" cols="3" hasBorder="false">
			<ta:text id="amc238" key="生育待遇资格认定ID" display="false" />
			<ta:selectInput id="amc026" key="生育类别" collection="AMC026" labelWidth="130" readOnly="true" />
			<ta:date id="aae127" key="申请日期" labelWidth="130" readOnly="true" />
			<ta:date id="amc020" key="生育日期" labelWidth="130" readOnly="true" />
			<ta:text id="aaz106" key="医疗机构编码" labelWidth="130" readOnly="true" />
			<ta:text id="aae0441" key="医疗机构名称" labelWidth="130" readOnly="true" />
			<ta:number id="amc028" key="胎儿数" required="false" labelWidth="130" readOnly="true" />
			<ta:number id="amc031" key="胎次" required="false" labelWidth="130" readOnly="true" />
			<ta:text id="amc021" key="生育证号" labelWidth="130" readOnly="true" />
			<ta:text id="amc022" key="出生证号" labelWidth="130" readOnly="true" />
			<ta:number id="aae005" key="联系电话" labelWidth="130" readOnly="true" />
			<ta:date id="aae235" key="就诊开始日期" labelWidth="130" readOnly="true" />
			<ta:date id="aae236" key="就诊终止日期" labelWidth="130" readOnly="true" />
			<ta:number id="yae150" key="新农合已支付医疗费" readOnly="true" asAamount="true" precision="2" labelWidth="130" />
			<ta:number id="aae198" key="实际医疗总费用" readOnly="true" asAamount="true" precision="2" labelWidth="130" />
			<ta:box span="1" cols="2">
				<ta:number id="amc030" key="生育津贴金" readOnly="true" asAamount="true" precision="2" labelWidth="130" columnWidth="0.55" />
				<ta:number id="aae187" key="报销医疗费" readOnly="true" asAamount="true" precision="2" labelWidth="80" columnWidth="0.44" />
			</ta:box>
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
					<ta:datagridItem id="aae036" key="经办时间" align="center">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//开始流转(指定"开始流转"按钮的Action方法)
	function submitData(){
		Base.submit("form1","treatmentCalculateCheck1Action!toSave.do",null,null,function(){
			Base.setEnable("printBtn");
		});
	}
	
	function print(){			   
		var aaz002=Base.getValue('businessLogID');
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_zybxjsd.raq&"+
					"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=aaz002="+aaz002);		
	}
	
	//页面布局控制
	$(document).ready(function() {
		$("form").css("overflow","auto");
		var fhjc=Base.getValue("fhjc");
		if(fhjc=="1"){
			Base.showObj("printBtn");
		}
	});
	
	//查看工伤医疗用药明细信息
	function ShowMedicalDetail(){
		Base.openWindow("medicalDetailInfo", ">>明细内容","<%=path%>/process/workinjurybenefit/medicalcalculatedetail/medicalCalculateDetailAction!showMedicalUseDetail.do", {
			"dto['aac001']":Base.getValue("aac001"),"dto['aka130']":"51,52"}, "95%", "90%", null, null, true);		
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
