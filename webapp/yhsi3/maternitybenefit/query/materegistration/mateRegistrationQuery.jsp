<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>mateRegistrationQueryAction</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:fieldset id="jstj" key="检索条件" cols="3" cssStyle="margin-left:3px">
			<ta:text id="aac002" key="个人信息" bpopTipMsg="个人编号、姓名，单位编号、单位名称，工伤登记id" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac002'));" labelWidth="120" />
			<ta:text id="aab999" key="单位检索条件" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab999'),'');" labelWidth="120" />
			<ta:text id="aac003" key="人员姓名" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004" readOnly="true" labelWidth="120" display="false" />
			<ta:date id="aac006" key="出生日期" issue="yyyy-mm-dd" readOnly="true" labelWidth="120" display="false" />
			<ta:text id="aac001" key="个人ID" readOnly="true" display="false" labelWidth="120" />

			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="120" />
			<ta:text id="aab001" key="单位ID" readOnly="true" labelWidth="120" display="false" />

			<ta:date id="kssj" key="开始时间" showSelectPanel="true" validNowTime="left" labelWidth="120" />
			<ta:date id="jssj" key="结束时间" showSelectPanel="true" validNowTime="left" labelWidth="120" />
			<ta:date id="amc020" key="生育时间" showSelectPanel="true" validNowTime="left" labelWidth="120" />
			<ta:buttonLayout span="1" align="center">
				<ta:button id="saveBtn" key="查询[S]" icon="icon-save" hotKey="S" onClick="query()" />
			</ta:buttonLayout>
		</ta:fieldset>

		<ta:tabs height="450">
			<ta:tab key="生育待遇资格登记信息">
				<ta:panel id="mc01Panel" height="300px" bodyStyle="margin:0px">
					<ta:datagrid id="mc01Grid" fit="true" columnFilter="true" haveSn="true">
						<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="false">
						</ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称">
						</ta:datagridItem>
						<ta:datagridItem id="aab999" key="单位管理码">
						</ta:datagridItem>
						<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="false">
						</ta:datagridItem>
						<ta:datagridItem id="aac002" key="证件号码">
						</ta:datagridItem>
						<ta:datagridItem id="aac003" key="姓名">
						</ta:datagridItem>
						<ta:datagridItem id="aac004" key="性别" collection="AAC004">
						</ta:datagridItem>
						<ta:datagridItem id="aac006" key="出生日期">
						</ta:datagridItem>
						<ta:datagridItem key="联系电话" id="aae005" align="center" />
						<ta:datagridItem key="申请日期" id="aae127" align="center" />
						<ta:datagridItem key="定点医疗机构ID" id="aaz107" align="center" />
						<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" />
						<ta:datagridItem key="配偶姓名" id="amc010" align="center" />
						<ta:datagridItem key="就诊开始日期" id="aae235" align="center" />
						<ta:datagridItem key="就诊终止日期" id="aae236" align="center" />
						<ta:datagridItem key="生育日期" id="amc020" align="center" />
						<ta:datagridItem key="生育证号" id="amc021" align="center" />
						<ta:datagridItem key="出生证号" id="amc022" align="center" />
						<ta:datagridItem key="晚育标志" id="amc027" collection="AMC027" align="center" />
						<ta:datagridItem key="生育类别" id="amc026" collection="AMC026" align="center" />
						<ta:datagridItem key="独生子女标志" id="ymc018" collection="AMA011" align="center" />
						<ta:datagridItem key="胎儿数" id="amc028" align="center" />
						<ta:datagridItem key="胎次" id="amc031" align="center" />
						<ta:datagridItem key="生育待遇资格认定ID" id="amc238" align="center" hiddenColumn="true" />
						<ta:datagridItem key="业务日志ID" id="aaz002" align="center" hiddenColumn="true" />
						<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="产前中后期检查登记信息">
				<ta:panel id="mc02Panel" height="300px" bodyStyle="margin:0px">
					<ta:datagrid id="mc02Grid" fit="true" columnFilter="true" haveSn="true">
						<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="false">
						</ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称">
						</ta:datagridItem>
						<ta:datagridItem id="aab999" key="单位管理码">
						</ta:datagridItem>
						<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="false">
						</ta:datagridItem>
						<ta:datagridItem id="aac002" key="证件号码">
						</ta:datagridItem>
						<ta:datagridItem id="aac003" key="姓名">
						</ta:datagridItem>
						<ta:datagridItem id="aac004" key="性别" collection="AAC004">
						</ta:datagridItem>
						<ta:datagridItem id="aac006" key="出生日期">
						</ta:datagridItem>

						<ta:datagridItem key="联系电话" id="aae005" align="center" />
						<ta:datagridItem key="申请日期" id="aae127" align="center" />
						<ta:datagridItem key="定点医疗机构ID" id="aaz107" align="center" />
						<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" />
						<ta:datagridItem key="配偶姓名" id="amc010" align="center" />
						<ta:datagridItem key="检查类型" id="ymc027" collection="ymc027" />
						<ta:datagridItem key="就诊开始日期" id="aae235" align="center" />
						<ta:datagridItem key="就诊终止日期" id="aae236" align="center" />
						<ta:datagridItem key="计划生育手术或生育日期" id="amc020" align="center" />
						<ta:datagridItem key="产前中后期检查登记ID" id="ymc031" align="center" hiddenColumn="true" />
						<ta:datagridItem key="业务日志ID" id="aaz002" align="center" hiddenColumn="true" />
						<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="计划生育手术登记">
				<ta:panel id="mc03Panel" height="300px" bodyStyle="margin:0px">
					<ta:datagrid id="mc03Grid" fit="true" columnFilter="true" haveSn="true">
						<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="false">
						</ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称">
						</ta:datagridItem>
						<ta:datagridItem id="aab999" key="单位管理码">
						</ta:datagridItem>
						<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="false">
						</ta:datagridItem>
						<ta:datagridItem id="aac002" key="证件号码">
						</ta:datagridItem>
						<ta:datagridItem id="aac003" key="姓名">
						</ta:datagridItem>
						<ta:datagridItem id="aac004" key="性别" collection="AAC004">
						</ta:datagridItem>
						<ta:datagridItem id="aac006" key="出生日期">
						</ta:datagridItem>
						<ta:datagridItem key="联系电话" id="aae005" align="center" />
						<ta:datagridItem key="申请日期" id="aae127" align="center" />
						<ta:datagridItem key="医疗机构ID" id="aaz107" align="center" />
						<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" />
						<ta:datagridItem key="手术开始日期" id="aae235" align="center" />
						<ta:datagridItem key="手术结束日期" id="aae236" align="center" />
						<ta:datagridItem key="手术日期" id="amc020" align="center" />
						<ta:datagridItem key="计划生育手术类别" id="ymc032" collection="YMC032" align="center" />
						<ta:datagridItem key="计划生育手术登记ID" id="ymc035" align="center" hiddenColumn="true" />
						<ta:datagridItem key="业务日志ID" id="aaz002" align="center" hiddenColumn="true" />
						<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>

	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
	
		initializeSuggestFramework(1, "ac01", "aac002", 700, 200, 4, '', 1, false);
		initializeSuggestFramework(2, "ab01", "aab999", 400, 200, 3, '', 1, false); //查询单位用 
	});
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		if (!Base.validateForm("form1")) {
			Base.hideMask();
			return false;
		}
		var aac002 = Base.getValue("aac002");

		Base.clearGridData("mc01Grid");
		Base.clearGridData("mc02Grid");
		Base.clearGridData("mc03Grid");
		Base.submit("form1", "mateRegistrationQueryAction!query.do");
	}

	function fmEmp(row, cell, value, columnDef, data) {
		return "<font color='red'>" + value + "</font>";
	}

	function qyqsQueryUtil(instance,method,param) {		
		suggestQuery(instance,"/yhsi3/process/workinjurybenefit/basicinformation/familyRegisterQueryAction!"+method+".do",{"dto['jstj']":param});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>