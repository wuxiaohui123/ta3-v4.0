<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>maternityAfter</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query" hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		<ta:button id="printBtn" key="打印[P]" hotKey="ctrl+P" asToolBarItem="true" icon="xui-icon-spotPrint" onClick="print()" disabled="true" />
	</ta:toolbar>

	<ta:form id="form1" fit="true">

		<ta:panel id="jbxxfset" key="基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" span="2" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" labelWidth="130" readOnly="true" />
			<ta:selectInput id="ykc005" key="在编标识" collection="SFBZ" labelWidth="130" readOnly="true" />
			<ta:text id="aac060" key="生存状态" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			<ta:text id="yab003" key="经办机构" display="false" labelWidth="130" />
			<ta:text id="aaa121" display="false" />
		</ta:panel>

		<!-- 录入登记信息 -->
		<ta:panel id="sydjxx" key="生育登记信息" cols="3">
			<ta:text id="amc238" key="生育待遇资格认定ID" display="false" />
			<ta:selectInput id="amc026" key="生育类别" required="true" collection="AMC026" labelWidth="130" />
			<ta:date id="aae127" key="申请日期" validNowTime="left" required="true" showSelectPanel="true" labelWidth="130" />
			<ta:date id="amc020" key="生育日期" validNowTime="left" required="true" showSelectPanel="true" onChange="checkpayfor()" labelWidth="130" />
			<ta:text id="aaz106" key="医疗机构编码" required="true" onChange="sfwQueryUtil(3,'getLa05',Base.getValue('aaz106')+',1'+','+Base.getValue('aae140'));" labelWidth="130" />
			<ta:text id="aae0441" key="医疗机构名称" required="true" labelWidth="130" />
			<ta:number id="amc028" key="胎儿数" labelWidth="130" />
			<ta:number id="amc031" key="胎次" labelWidth="130" />
			<ta:text id="amc021" key="生育证号" labelWidth="130" />
			<ta:text id="amc022" key="出生证号" labelWidth="130" />
			<ta:text id="aae005" key="联系电话" validType="number" labelWidth="130" />
			<ta:date id="aae235" key="就诊开始日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:date id="aae236" key="就诊终止日期" validNowTime="left" showSelectPanel="true" onChange="yhjb_syjztimepd()" labelWidth="130" />
			<ta:number id="yae150" key="新农合已支付医疗费" required="true" asAamount="true" precision="2" labelWidth="130" />
			<ta:number id="aae198" key="实际医疗总费用" required="true" asAamount="true" precision="2" labelWidth="130" />
		</ta:panel>

		<!-- 历史工伤申报列表，可修改或删除选中项 -->
		<ta:panel key="生育历史登记信息" id="lsdjxx">
			<ta:datagrid id="mc01Grid" haveSn="true" snWidth="20">
				<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
				<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
				<ta:datagridItem key="单位名称" id="aae044" align="center" dataAlign="center" />
				<ta:datagridItem key="生育类别" id="amc026" collection="AMC026" align="center" dataAlign="center" />
				<ta:datagridItem key="申请日期" id="aae127" align="center" dataAlign="center" />
				<ta:datagridItem key="生育/手术日期" width="100" id="amc020" align="center" dataAlign="center" />
				<ta:datagridItem key="医疗机构编码" id="aaz107" align="center" hiddenColumn="true" dataAlign="center" />
				<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" width="120" dataAlign="center" />
				<ta:datagridItem key="生育津贴金" id="amc030" align="center" formatter="convertStateRed" dataAlign="center" />
				<ta:datagridItem key="医疗费金额" id="aae187" width="100" formatter="convertStateBlue" align="center" dataAlign="center" />
				<ta:datagridItem key="胎儿数" id="amc028" align="center" dataAlign="center" />
				<ta:datagridItem key="胎次" id="amc031" align="center" dataAlign="center" />
				<ta:datagridItem key="生育证号" id="amc021" showDetailed="true" align="center" dataAlign="center" />
				<ta:datagridItem key="出生证号" id="amc022" showDetailed="true" align="center" dataAlign="center" />
				<ta:datagridItem key="联系电话" id="aae005" showDetailed="true" align="center" dataAlign="center" />
				<ta:datagridItem key="就诊开始日期" id="aae235" align="center" width="120" dataAlign="center" />
				<ta:datagridItem key="就诊终止日期" id="aae236" align="center" width="120" dataAlign="center" />
				<ta:datagridItem key="新农合已支付医疗费" id="yae150" align="center" dataAlign="center" />
				<ta:datagridItem key="实际医疗总费用" id="aae198" align="center" dataAlign="center" />
				<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" dataAlign="center" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<br />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("body").css("overflow", "hidden");
		initializeSuggestFramework(3, "la05", "aaz106", 300, 200, 2, fn_la05, 0, false);
		fn_FfxxlrInitialization();
	});

	//回调函数 基本信息查询
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset", "maternityAfterAction!queryPersonInfo.do", null, null, fn_check());
		}
	}
	function fn_check() {
		var aac002 = Base.getValue("aac002");
		var aac003 = Base.getValue("aac003");
		Base.setValue("aae136", aac002);
		Base.setValue("aae133", aac003);
	}

	//回调函数 机构信息查询
	function fn_la05() {
		Base.setValue("aaz106", g_Suggest[0]);
		Base.setValue("aae0441", g_Suggest[1]);
	}

	//生育日期检查缴费
	function checkpayfor() {
		validatepayfor(Base.getValue("aac001"), Base.getValue("aab001"), Base.getValue("amc020"), Base.getValue("aae140"));
	}
	//验证缴费信息
	function validatepayfor(aac001, aab001, amc020, aae140) {
		if (aac001 == "" || aab001 == "" || amc020 == "") {
			return false;
		}
		var aaa121 = Base.getValue("aaa121");
		Base.submit("", "maternityAfterAction!validatePayfor.do", {
			"dto['amc020']" : amc020,
			"dto['aab001']" : aab001,
			"dto['aac001']" : aac001,
			"dto['aae140']" : aae140,
			"dto['aaa121']" : aaa121
		});
	}

	//修改认定信息
	function fnUpdate(data, e) {
		Base.setValue("amc238", data.amc238); //生育待遇资格认定ID
		Base.setValue("aae005", data.aae005); //联系电话
		Base.setValue("aae127", data.aae127); //申请日期
		Base.setValue("aaz106", data.aaz107); //定点医疗机构ID
		Base.setValue("aae0441", data.aae0441); //定点医疗机构名称
		Base.setValue("amc027", data.amc027); //晚育标志
		Base.setValue("amc026", data.amc026); //生育类别
		Base.setValue("ymc018", data.ymc018); //独生子女标志
		Base.setValue("ymc010", data.ymc010); //独生子女标志
		Base.setValue("aae235", data.aae235); //就诊开始日期
		Base.setValue("aae236", data.aae236); //就诊终止日期
		Base.setValue("amc020", data.amc020); //计划生育手术或生育日期
		Base.setValue("amc021", data.amc021); //生育证号
		Base.setValue("amc022", data.amc022); //出生证号
		Base.setValue("amc028", data.amc028); //胎儿数
		Base.setValue("amc031", data.amc031); //胎次
		Base.setValue("aab001", data.aab001);
		Base.setValue("aae044", data.aae044);
		Base.setValue("aab999", data.aab999);
		Base.setValue("yae150", data.yae150);
		Base.setValue("aae198", data.aae198);
		Base.setValue("businessLogID", data.aaz002);
	}

	//删除认定信息
	function fnDelRow(data, e) {
		var amc238 = data.amc238;
		var row = data.row;
		Base.confirm("确认要删除?", function(btn, callback, options) {
			if (btn) {
				Base.submit("jbxxfset", "maternityAfterAction!toSave.do", {
					"dto['amc238']" : amc238,
					"dto['yae587']" : "3"
				}, null, null, null);
			}
		});
	}

	//提交数据
	function submitData() {
		if (!Base.validateForm("form1")) {
			Base.hideMask();
			return false;
		}
		Base.submit("form1", "maternityAfterAction!toSave.do");
	}

	function convertStateRed(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;margin-top:4px'>" + value + "</div>";
	}

	function convertStateBlue(row, cell, value, columnDef, dataContext) {
		return "<div style='color:blue;margin-top:4px'>" + value + "</div>";
	}
	
	//打印
	function print(){
        var aaz002 = Base.getValue("businessLogID");	
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_syjt_shb.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz002="+aaz002);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
