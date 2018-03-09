<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗费用审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="医疗待遇审批[S]" icon="icon-save" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" disabled="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
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

		<ta:fieldset id="jbxxfset" key="人员基本信息" cols="4" cssStyle="margin:5px auto;padding-bottom:10px;padding-right:20px">
			<ta:text id="aac003" key="姓名" required="true" cssStyle="margin-top:8px" readOnly="true" />
			<ta:text id="aac002" key="公民身份证号码" cssStyle="margin-top:8px" required="true" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="aac001" key="人员ID" required="true" cssStyle="margin-top:8px" readOnly="true" display="false" />
			<ta:selectInput id="aac060" key="生存状态" cssStyle="margin-top:8px" collection="AAC060" readOnly="true" />
			<ta:text id="aab999" key="单位管理码" cssStyle="margin-top:8px" readOnly="true" />
			<ta:text id="aae044" key="单位名称" cssStyle="margin-top:8px" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="aab001" key="单位ID" cssStyle="margin-top:8px" readOnly="true" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" cssStyle="margin-top:8px" readOnly="true" />
		</ta:fieldset>

		<!-- 初始化工伤认定信息 -->
		<ta:panel id="syxx" key="生育信息">
			<ta:datagrid id="syxxList">
				<ta:datagridItem key="生育医疗费用来源" id="ymc036" collection="YMC036" align="center" />
				<ta:datagridItem key="单位id" id="aab001" align="center" />
				<ta:datagridItem key="定点医疗机构id" id="aaz107" align="center" />
				<ta:datagridItem key="定点医疗机构名称" id="yljgmc" align="center" />
				<ta:datagridItem key="就诊开始日期" id="aae235" align="center" />
				<ta:datagridItem key="就诊终止日期" id="aae236" align="center" />
				<ta:datagridItem key="计划生育手术或生育日期" id="amc020" align="center" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" />
				<ta:datagridItem key="联系电话" id="aae005" align="center" />
				<ta:datagridItem key="计划生育手术类别" id="ymc032" align="center" />
				<ta:datagridItem key="单位管理码" id="aab999" align="center" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" />
				<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" />
				<ta:datagridItem key="产前中后期检查登记ID" id="ymc031" align="center" hiddenColumn="true" />
				<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>

		<ta:fieldset id="ffxxlr" key="一次性发放信息录入" cols="3" cssStyle="margin-left:3px">
			<ta:selectInput id="aae145" key="支付方式 " required="true" collection="AAE145" value="11" onSelect="checkRequired" filter="13,21,22,41" labelWidth="120" />
			<ta:selectInput id="aac059" key="领取人证件类型 " required="true" collection="AAC059" value="1" labelWidth="120" />
			<ta:text id="aae136" key="领取人证件号" required="true" labelWidth="120" />
			<ta:text id="aae133" key="领取人姓名  " required="true" labelWidth="120" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" required="true" labelWidth="120" />
			<ta:text id="aae010" key="银行账号" required="true" labelWidth="120" />
			<ta:text id="aae007" key="邮政编码" labelWidth="120" />
			<ta:text id="aae006" key="详细地址" span="2" labelWidth="120" />
		</ta:fieldset>

		<ta:panel id="dqdyxx" key="当前报销信息">
			<ta:datagrid id="dqdyxxList" forceFitColumns="true" haveSn="true">
				<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
				</ta:datagridItem>
				<ta:datagridItem id="aae128" key="核发金额">
				</ta:datagridItem>
				<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
				</ta:datagridItem>
				<ta:datagridItem id="aae036" key="经办时间">
				</ta:datagridItem>
			</ta:datagrid>
		</ta:panel>

	</ta:form>
</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
		checkRequired();
	});

	//提交
	function submitData() {

		Base.submit("form1", "medicalCalculateCheck2Action!toSave.do");
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
</script>
<%@ include file="/ta/incfooter.jsp"%>