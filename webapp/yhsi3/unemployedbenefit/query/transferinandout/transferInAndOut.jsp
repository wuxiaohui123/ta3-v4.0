<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>transferInAndOut</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:toolbarItem id="btnFind" key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="query();" />
		<ta:toolbarItemSeperator />
		<ta:button id="resetBtn" key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
		</ta:panel>
		<ta:tabs id="inout" fit="true">
			<ta:tab id="in" key="失业待遇转入">
				<ta:datagrid id="jc18List" fit="true">
					<ta:datagridItem id="aac001" key="人员ID" width="100" />
					<ta:datagridItem id="aac003" key="姓名" width="80" />
					<ta:datagridItem id="aac002" key="身份证号" width="160" />
					<ta:datagridItem id="aac004" key="性别" collection="AAC004" width="60" />
					<ta:datagridItem id="aae005" key="联系电话" width="100" />
					<ta:datagridItem id="aac071" key="转移前所在单位名称" width="180" />
					<ta:datagridItem id="aac072" key="转移前社会保险机构名称" width="180" />
					<ta:datagridItem id="aac073" key="转移前社会保险机构帐号" hiddenColumn="true" />
					<ta:datagridItem id="aac074" key="转移前社会保险机构邮政编码" hiddenColumn="true" />
					<ta:datagridItem id="aac075" key="转移前社会保险机构开户行行号" hiddenColumn="true" />
					<ta:datagridItem id="aae035" key="变更日期" dataType="date" width="100" />
					<ta:datagridItem id="aae160" key="变更原因" width="100" collection="AAE160" />
					<ta:datagridItem id="aae180" key="人员缴费基数" width="100" />
					<ta:datagridItem id="aae200" key="视同缴费月数" width="100" />
					<ta:datagridItem id="aja005" key="失业保险待遇金额标准" width="100" />
					<ta:datagridItem id="ajc063" key="剩余未享受待遇月数" width="100" />
					<ta:datagridItem id="ajc064" key="已支付就业培训费" width="100" />
					<ta:datagridItem id="ajc065" key="已支付职业介绍费" width="100" />
					<ta:datagridItem id="ajc092" key="未计发待遇的累计缴费月数" width="100" />
					<ta:datagridItem id="aae201" key="实际缴费月数" width="100" />
					<ta:datagridItem id="aae013" key="备注" width="100" showDetailed="true" />
					<ta:datagridItem id="aae011" key="经办人" width="100" collection="AAE011" />
					<ta:datagridItem id="aae036" key="经办时间" width="100" dataType="date" />
					<ta:datagridItem id="yab003" key="经办所属机构" width="100" collection="YAB003" />
					<ta:datagridItem id="yab139" key="参保所属机构" width="100" collection="YAB003" />
					<ta:datagridItem id="yie014" key="区直转出证明号(0表示由系统未统一的经办机构转入)" width="100" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="out" key="失业待遇转出">
				<ta:datagrid id="jc12List" fit="true">
					<ta:datagridItem id="aac001" key="人员ID" width="100" />
					<ta:datagridItem id="aac003" key="姓名" width="80" />
					<ta:datagridItem id="aac002" key="身份证号" width="160" />
					<ta:datagridItem id="aac004" key="性别" collection="AAC004" width="60" />
					<ta:datagridItem id="aae005" key="联系电话" width="100" />
					<ta:datagridItem id="aac076" key="转移后所在单位名称" width="180" />
					<ta:datagridItem id="aac077" key="转移后社会保险机构名称" width="180" />
					<ta:datagridItem id="aac078" key="转移后社会保险机构帐号" hiddenColumn="true" />
					<ta:datagridItem id="aac079" key="转移后社会保险机构邮政编码" hiddenColumn="true" />
					<ta:datagridItem id="aac080" key="转移后社会保险机构开户行行号" hiddenColumn="true" />
					<ta:datagridItem id="aae033" key="缴费截止时间" hiddenColumn="true" />
					<ta:datagridItem id="aae035" key="变更日期" width="100" dataType="date" />
					<ta:datagridItem id="aae160" key="变更原因" width="100" collection="AAE160" />
					<ta:datagridItem id="aae180" key="人员缴费基数" width="100" />
					<ta:datagridItem id="aae200" key="视同缴费月数" width="100" />
					<ta:datagridItem id="aae201" key="实际缴费月数" width="100" />
					<ta:datagridItem id="ajc079" key="转移失业保险待遇总金额" width="100" />
					<ta:datagridItem id="yjc004" key="转移失业保险金" width="100" />
					<ta:datagridItem id="yjc005" key="转移失业医疗保险金" width="100" />
					<ta:datagridItem id="yjc009" key="转移失业大病医疗保险金" width="100" />
					<ta:datagridItem id="yjc006" key="转移失业保险就业培训补贴" width="100" />
					<ta:datagridItem id="yjc007" key="转移失业保险职介补贴" width="100" />
					<ta:datagridItem id="aja005" key="失业保险待遇金额标准" width="100" />
					<ta:datagridItem id="ajc063" key="剩余未享受待遇月数" width="100" />
					<ta:datagridItem id="ajc064" key="已支付就业培训费" width="100" />
					<ta:datagridItem id="ajc065" key="已支付职业介绍费" width="100" />
					<ta:datagridItem id="ajc092" key="未计发待遇的累计缴费月数" width="100" />
					<ta:datagridItem id="aae013" key="备注" width="100" />
					<ta:datagridItem id="aae011" key="经办人" width="100" collection="AAE011" />
					<ta:datagridItem id="aae036" key="经办时间" width="100" dataType="date" />
					<ta:datagridItem id="yab003" key="经办所属机构" width="100" collection="YAB003" />
					<ta:datagridItem id="yab139" key="参保所属机构" width="100" collection="YAB003" />
					<ta:datagridItem id="sfzyjj" key="是否转移基金" width="100" collection="sfbz" />
					<ta:dataGridToolPaging url="" pageSize="9999" showExcel="true" selectExpButtons="1"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
	});

	function query() {
		Base.submit("form1", "transferInAndOutAction!queryBaseInfo.do", null, null, false);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>