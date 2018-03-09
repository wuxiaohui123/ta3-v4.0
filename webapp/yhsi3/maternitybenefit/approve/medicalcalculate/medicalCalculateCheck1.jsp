<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗费用审批</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<ta:text id="fhjc" display="false" key="复核级次" />
		</ta:box>
		<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
			<ta:text id="aac001" key="人员ID" readOnly="true" />
			<ta:text id="aac003" key="姓 名" readOnly="true" />
			<ta:text id="aac002" key="身份证号码" readOnly="true" />
			<ta:text id="aab001" key="单位ID" readOnly="true" />
			<ta:text id="aae044" key="单位名称" span="2" readOnly="true" />
			<ta:text id="aab999" key="单位管理码" display="false" />
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			<ta:text id="amc238" key="生育待遇资格认定ID" display="false" />
		</ta:panel>
		<ta:panel id="syxx" key="生育信息">
			<ta:datagrid id="syxxList" forceFitColumns="true">
				<ta:datagridItem key="单位id" id="aab001" align="center" hiddenColumn="true" />
				<ta:datagridItem key="费用来源" id="ymc036" collection="YMC036" align="center" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" />
				<ta:datagridItem key="医疗机构名称" id="yljgmc" align="center" width="120" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" />
				<ta:datagridItem key="生育手术或生育日期" id="amc020" align="center" width="140" />
				<ta:datagridItem key="检查类型" id="ymc027" collection="ymc027" />
				<ta:datagridItem key="生育类别" id="amc026" collection="AMC026" align="center" />
				<ta:datagridItem key="手术类别" id="ymc032" align="center" collection="YMC032" width="120" />
				<ta:datagridItem key="就诊开始日期" id="aae235" align="center" width="120" />
				<ta:datagridItem key="就诊终止日期" id="aae236" align="center" width="120" />
				<ta:datagridItem key="联系电话" id="aae005" align="center" />
				<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" />
				<ta:datagridItem key="产前中后期检查登记ID" id="ymc031" align="center" hiddenColumn="true" />
				<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>

		<ta:box id="paymentInfo">
			<%@ include file="/yhsi3/benefit/common/paymentBaseInfoShow.jsp"%>
		</ta:box>
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
		$("form").css("overflow", "auto");
	});

	//提交
	function submitData() {

		Base.submit("form1", "medicalCalculateCheck1Action!toSave.do");
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
