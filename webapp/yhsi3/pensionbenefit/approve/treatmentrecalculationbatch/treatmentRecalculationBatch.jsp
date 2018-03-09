<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentRecalculationBatch</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
			<ta:button id="btnSave" icon="xui-icon-spotSave" hotKey="ctrl+S" key="保存[S]" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="querySet" key="检索条件" cols="4">
			<ta:box id="aae036box" cols="2" span="2">
				<ta:date id="aae036b" key="经办时间≥" required="true" labelWidth="120" showSelectPanel="true" />
				<ta:date id="aae036e" key="经办时间≤" required="true" labelWidth="120" showSelectPanel="true" />
			</ta:box>
			<ta:box id="aae036box" cols="2" span="2">
				<ta:date id="aic162b" key="离退休时间≥" required="true" labelWidth="120" showSelectPanel="true" />
				<ta:date id="aic162e" key="离退休时间≤" required="true" labelWidth="120" showSelectPanel="true" />
			</ta:box>
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab key="需要重算待遇的人员清单" id="ic10ListTab">
				<ta:panel id="panel3" key="人员清单" fit="true">
					<ta:datagrid id="ic10List" haveSn="true" fit="true" selectType="checkbox">
						<ta:datagridItem id="aac001" key="人员ID" dataAlign="center" align="center" hiddenColumn="true" />
						<ta:datagridItem id="aac002" key="公民身份号码" width="150px" dataAlign="center" align="center" />
						<ta:datagridItem id="aac003" key="姓名" dataAlign="center" align="center" />
						<ta:datagridItem id="aac004" key="性别" dataAlign="center" align="center" collection="aac004" width="60px" />
						<ta:datagridItem id="aab001" key="单位ID" dataAlign="center" align="center" />
						<ta:datagridItem id="aae044" key="单位名称" dataAlign="center" align="center" width="250px" />
						<ta:datagridItem id="yac030" key="是否在编人员" width="120px" collection="sfbz" dataAlign="center" align="center" />
						<ta:datagridItem id="aac012" key="个人身份" width="120px" collection="aac012" dataAlign="center" align="center" />
						<ta:datagridItem id="yac009" key="初次待遇" align="center" dataAlign="center" />
						<ta:datagridItem id="aae019" key="当前待遇" align="center" dataAlign="center" />
						<ta:datagridItem id="aac006" key="出生日期" dataAlign="center" align="center" />
						<ta:datagridItem id="aac007" key="参工日期" align="center" dataAlign="center" />
						<ta:datagridItem id="aae206" key="建账时间" align="center" dataAlign="center" />
						<ta:datagridItem id="aac084" key="离退休标志" collection="aac084" align="center" dataAlign="center" />
						<ta:datagridItem id="aic162" key="离退休日期" align="center" dataAlign="center" />
						<ta:datagridItem id="aic161" key="离退休类别" collection="aic161" align="center" dataAlign="center" />
						<ta:datagridItem id="aae211" key="待遇核定年月" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aae210" key="待遇享受开始年月" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aae116" key="待遇发放状态" width="120px" collection="aae116" align="center" dataAlign="center" />
						<ta:datagridItem id="yac001" key="个人最后发放年月" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aae200" key="视同缴费月数" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aae201" key="实际缴费月数" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aic164" key="平均缴费指数" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aac026" key="退休上年度当地职工月平均工资" width="200px" align="center" dataAlign="center" />
						<ta:datagridItem id="yic380" key="统筹应承担金额" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="yic381" key="单位应承担金额" width="120px" align="center" dataAlign="center" />
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="center" collection="AAE011" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="150px" />
						<ta:datagridItem id="yab003" key="经办所属机构" width="120px" align="center" dataAlign="center" collection="yab003" />
						<ta:datagridItem id="yic206" key="提前退休月数" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac082" key="离退休登记类型" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aae204" key="特殊工种折算月数" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac056" key="军龄" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aae203" key="军龄折算月数" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac057" key="离退休证号" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac081" key="建国前参加革命工作老工人标志" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac014" key="专业技术职务等级" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac015" key="国家职业资格等级（工人技术等级）" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac020" key="行政职务(级别)" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="yic006" key="退休后工资职级" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="yic007" key="退休后津贴职级" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac083" key="退休前是否为原工伤定期待遇享受人员" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac085" key="原工商业者标志" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac093" key="最高荣誉称号级别代码" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac055" key="参加革命工作日期" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac114" key="异地安置人员标识" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aaz261" key="退休行政审批ID" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="aac049" key="首次参保日期" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="yae230" key="是否补发待遇" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:datagridItem id="dhaaz002" key="打回的aaz002" align="center" dataAlign="center" hiddenColumn="true" />
						<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="错误信息" id="errorTab">
				<ta:panel id="panel4" key="错误信息" fit="true">
					<ta:datagrid id="errorDataGrid" haveSn="true" forceFitColumns="true" fit="true">
						<ta:datagridItem id="aaz002" key="业务日志编号" dataAlign="center" align="center" />
						<ta:datagridItem id="aaa121" key="业务类型" collection="AAA121" width="250px" dataAlign="center" align="center" />
						<ta:datagridItem id="aac003" key="当事人" dataAlign="center" align="center" />
						<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" />
						<ta:datagridItem id="aae011" key="经办人" collection="YAE092" align="center" dataAlign="center" />
						<ta:datagridItem id="errMsg" key="错误消息" align="center" dataAlign="center" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").css("overflow", "hidden");
		initializeSuggestFramework(3, "ac01", "jstj", 700, 200, 4, fn_queryInfo, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});

	//回调函数	
	function fn_queryInfo(){
	   if (g_Suggest != ""){ 
			Base.submit("aac001","<%=path%>/process/pensionbenefit/approve/treatmentrecalculation/treatmentRecalculationAction!queryBaseInfo.do", null, null, fn_check);
		}
	}

	function queryData() {
		Base.submit("querySet", "treatmentRecalculationBatchAction!queryList.do", null, null, null, function(data) {
		});
	}

	function fn_check() {
		Base.resetForm("form1");
		initializeSuggestFramework(3, "ac01", "jstj", 700, 200, 4, fn_queryInfo, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	}

	//保存经办信息
	function submitData() {
		var selectRows = Base.getGridSelectedRows("ic10List");
		if (selectRows.length == 0) {
			alert("请选择需要复核的数据！");
			return false;
		}
		var prm = {};
		prm.d2List = Ta.util.obj2string(selectRows);
		Base.submit("form1", "treatmentRecalculationBatchAction!toSave.do", prm, null, null, function() {
		});

	}

	function checkRequired() {
		var aac002 = Base.getValue("aac002");
		var aac003 = Base.getValue("aac003");
		var aae145 = Base.getValue("aae145");
		var aae006 = Base.getValue("aae006_1");
		var aae007 = Base.getValue("aae007_1");
		Base.setValue("aae136", aac002);
		Base.setValue("aae133", aac003);
		Base.setValue("aae006", aae006);
		Base.setValue("aae007", aae007);
		if (aae145 == "11") {
			Base.setDisRequired([ "aae006", "aae007" ]);
			Base.setRequired([ "aae010", "aaf002", ]);
			Base._setReadOnly([ "aae010", "aaf002" ], false);
			Base._setReadOnly([ "aae006", "aae007" ], true);
			Base.setValue("aae006", "");
			Base.setValue("aae007", "");
		} else if (aae145 == "12") {
			Base.setDisRequired([ "aae010", , "aaf002" ]);
			Base.setRequired([ "aae006", "aae007" ]);
			Base._setReadOnly([ "aae006", "aae007" ], false);
			Base._setReadOnly([ "aae010", "aaf002" ], true);
			Base.setValue("aae010", "");
			Base.setValue("aaf002", "");
		} else if (aae145 == "31" || aae145 == "21" || aae145 == "22") {
			Base.setDisRequired([ "aae006", "aae007", "aae010", "aaf002" ]);
			Base._setReadOnly([ "aae006", "aae007", "aae010", "aaf002" ], false);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>