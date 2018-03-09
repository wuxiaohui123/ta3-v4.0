<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>工伤待遇审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇审批[S]" icon="icon-save" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印确认" asToolBarItem="true" disabled="true" onClick="print()" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:fieldset key="审核信息" cols="4" id="fltjb">
			<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" span="2" />
			<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" value="1" span="2" readOnly="true" />
			<ta:textarea id="aae013" span="2" key="审核意见" height="40px" />
			<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="40px" readOnly="true" />
			<ta:buttonLayout span="2">
				<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
			</ta:buttonLayout>
			<ta:buttonLayout span="2">
				<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
			</ta:buttonLayout>
		</ta:fieldset>

		<ta:panel id="jbxxfset" key="人员基本信息" cols="3" cssStyle="margin-left:3px">
			<ta:text id="aac001" key="人员ID" readOnly="true" />
			<ta:text id="aac003" key="姓 名" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" />
			<ta:selectInput id="aac004" key="性别" readOnly="true" collection="AAC004" />
			<ta:text id="aac006" key="出生年月" readOnly="true" />
			<ta:text id="aac005" key="民族" readOnly="true" />
			<ta:text id="aab001" key="单位ID" readOnly="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:text id="aab999" key="单位管理码" display="false" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
		</ta:panel>
		<ta:tabs>
			<ta:tab id="tab1" key="本次生育基本信息">
				<ta:panel id="sydjxx" key="" cols="3" hasBorder="false" height="160">
					<ta:text id="amc238" key="生育待遇资格认定ID" display="false" />
					<ta:selectInput id="amc026" key="生育类别" required="true" collection="AMC026" labelWidth="130" readOnly="true" />
					<ta:date id="aae127" key="申请日期" validNowTime="left" showSelectPanel="true" labelWidth="130" readOnly="true" />
					<ta:date id="amc020" key="生育日期" validNowTime="left" showSelectPanel="true" labelWidth="130" readOnly="true" />
					<ta:selectInput id="ymc006" key="仅报销男职工津贴" required="true" value="0" collection="SFBZ" labelWidth="130" readOnly="true" />
					<ta:text id="aaz106" key="医疗机构编码" required="true" labelWidth="130" readOnly="true" />
					<ta:text id="aae0441" key="医疗机构名称" readOnly="true" labelWidth="130" readOnly="true" />
					<ta:text id="amc028" key="胎儿数" readOnly="true" labelWidth="130" />
					<ta:text id="amc031" key="胎次" readOnly="true" labelWidth="130" />
					<ta:text id="amc021" key="生育证号" labelWidth="130" readOnly="true" />
					<ta:text id="amc022" key="出生证号" labelWidth="130" readOnly="true" />
					<ta:text id="aae005" key="联系电话" validType="mobile" labelWidth="130" readOnly="true" />
					<ta:date id="aae235" key="就诊开始日期" validNowTime="left" labelWidth="130" readOnly="true" />
					<ta:date id="aae236" key="就诊终止日期" validNowTime="left" labelWidth="130" readOnly="true" />
					<ta:text id="yae150" key="新农合已支付医疗费" required="true" asAamount="true" precision="2" labelWidth="130" readOnly="true" alignLeft="true" />
					<ta:number id="aae198" key="实际医疗总费用" required="true" asAamount="true" precision="2" labelWidth="130" />
					<ta:selectInput id="yad169" key="支付对象" required="true" labelWidth="130" collection="YAD169" readOnly="true" />
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" key="生育历史登记信息">
				<ta:datagrid id="syxxList" fit="true" selectType="radio">
					<ta:datagridItem key="单位名称" id="aae044" align="center" />
					<ta:datagridItem key="生育类别" id="amc026" collection="AMC026" align="center" />
					<ta:datagridItem key="申请日期" id="aae127" align="center" />
					<ta:datagridItem key="生育/手术日期" id="amc020" align="center" />
					<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" />
					<ta:datagridItem key="医疗机构名称" id="yljgmc" align="center" width="120" />
					<ta:datagridItem key="胎儿数" id="amc028" align="center" />
					<ta:datagridItem key="胎次" id="amc031" align="center" />
					<ta:datagridItem key="生育证号" id="amc021" align="center" />
					<ta:datagridItem key="出生证号" id="amc022" align="center" />
					<ta:datagridItem key="联系电话" id="aae005" align="center" />
					<ta:datagridItem key="就诊开始日期" id="aae235" align="center" width="120" />
					<ta:datagridItem key="就诊终止日期" id="aae236" align="center" width="120" />
					<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
		<ta:box cols="2">
			<ta:panel id="dqdyxx" key="当前待遇信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true">
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
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
	});

	//开始流转(指定"开始流转"按钮的Action方法)
	function submitData() {

		Base.submit("form1", "treatmentCalculateCheck2Action!toSave.do", null, null, null, function() {
			Base.setEnable("printBtn");
		});
	}

	function checkRequired() {
		var aac002 = Base.getValue("aac002");
		var aac003 = Base.getValue("aac003");
		var aae145 = Base.getValue("aae145");
		Base.setValue("aae136", aac002);
		Base.setValue("aae133", aac003);
		if (aae145 == "11") {
			Base.setDisRequired([ "aae006", "aae007" ]);
			Base.setRequired([ "aae010", "aaf002", ]);
			Base._setReadOnly([ "aae010", "aaf002" ], false);
			Base._setReadOnly([ "aae006", "aae007" ], true);
		} else if (aae145 == "12") {
			Base.setDisRequired([ "aae010", , "aaf002" ]);
			Base.setRequired([ "aae006", "aae007" ]);
			Base._setReadOnly([ "aae006", "aae007" ], false);
			Base._setReadOnly([ "aae010", "aaf002" ], true);
		} else if (aae145 == "31" || aae145 == "21" || aae145 == "22") {
			Base.setDisRequired([ "aae006", "aae007", "aae010", "aaf002" ]);
			Base._setReadOnly([ "aae006", "aae007", "aae010", "aaf002" ], false);
			Base.setValue("aae006", "");
			Base.setValue("aae010", "");
			Base.setValue("aaf002", "");
			Base.setValue("aae007", "");
		}
	}
	
	//查看工伤医疗用药明细信息
	function ShowMedicalDetail(){
		Base.openWindow("medicalDetailInfo", ">>明细内容","<%=path%>/process/workinjurybenefit/medicalcalculatedetail/medicalCalculateDetailAction!showMedicalUseDetail.do", {
			"dto['aac001']":Base.getValue("aac001"),"dto['aka130']":"51,52"}, "95%", "90%", null, null, true);		
	}	
	function print(){
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("businessLogID");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYylbxfbx.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz002="+aaz002);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>