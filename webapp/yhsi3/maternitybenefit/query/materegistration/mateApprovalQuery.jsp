<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>mateApprovalQueryAction</title>
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
			<ta:selectInput id="aae145" key="发放方式" collection="AAE145" labelWidth="120" filter="13,21,22" />
			<ta:buttonLayout span="1" align="center">
				<ta:button id="saveBtn" key="查询[S]" icon="icon-save" hotKey="S" onClick="query()" />
			</ta:buttonLayout>
		</ta:fieldset>

		<ta:tabs height="450">
			<ta:tab key="生育津贴核定信息">
				<ta:panel id="mc04Panel" height="300px" bodyStyle="margin:0px">
					<ta:datagrid id="mc04Grid" fit="true" columnFilter="true" haveSn="true">
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
						<ta:datagridItem id="aaa076" key="核定类型" collection="AAA076">
						</ta:datagridItem>
						<ta:datagridItem id="amc030" key="生育津贴金" formatter="fmEmp" totals="sum"></ta:datagridItem>

						<ta:datagridItem id="aae145" key="支付方式" collection="AAE145" />
						<ta:datagridItem id="aac059" key="领取人证件类型 " collection="AAC059" />
						<ta:datagridItem id="aae136" key="领取人证件号码" />
						<ta:datagridItem id="aae133" key="领取人姓名" />
						<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" />
						<ta:datagridItem id="aae010" key="银行账号" />
						<ta:datagridItem id="aae007" key="邮政编码" />
						<ta:datagridItem id="aae006" key="联系地址" />
						<ta:datagridItem id="aae005" key="联系电话" />
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" />
						<ta:datagridItem id="yab003" key="经办机构" />
						<ta:datagridItem id="aae011" key="经办人" />
						<ta:datagridItem id="aae036" key="经办时间" />

						<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="生育医疗费核定信息">
				<ta:panel id="mc05Panel" height="300px" bodyStyle="margin:0px">
					<ta:datagrid id="mc05Grid" fit="true" columnFilter="true" haveSn="true">
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
						<ta:datagridItem id="ymc036" key="生育医疗费用来源" collection="YMC036" />
						<ta:datagridItem id="aaa076" key="核定类型" collection="AAA076">
						</ta:datagridItem>
						<ta:datagridItem id="aae198" key="实际医疗总费用" />
						<ta:datagridItem id="aae187" key="基金支付金额" formatter="fmEmp" totals="sum" />
						<ta:datagridItem id="ake051" key="自费金额" />

						<ta:datagridItem id="aae145" key="支付方式" collection="AAE145" />
						<ta:datagridItem id="aac059" key="领取人证件类型 " collection="AAC059" />
						<ta:datagridItem id="aae136" key="领取人证件号码" />
						<ta:datagridItem id="aae133" key="领取人姓名" />
						<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" />
						<ta:datagridItem id="aae010" key="银行账号" />
						<ta:datagridItem id="aae007" key="邮政编码" />
						<ta:datagridItem id="aae006" key="联系地址" />
						<ta:datagridItem id="aae005" key="联系电话" />

						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" />


						<ta:datagridItem key="定点医疗机构ID" id="aaz107" align="center" />
						<ta:datagridItem key="医疗机构名称" id="aae0441" align="center" />
						<ta:datagridItem id="yab003" key="经办机构" />
						<ta:datagridItem id="aae011" key="经办人" />
						<ta:datagridItem id="aae036" key="经办时间" />
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

		Base.clearGridData("mc04Grid");
		Base.clearGridData("mc05Grid");
		Base.submit("form1", "mateApprovalQueryAction!query.do");
	}

	function fmEmp(row, cell, value, columnDef, data) {
		return "<font color='red'>" + value + "</font>";
	}
	
	function qyqsQueryUtil(instance,method,param) {
		suggestQuery(instance,"/yhsi3/process/workinjurybenefit/basicinformation/familyRegisterQueryAction!"+method+".do",{"dto['jstj']":param});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>