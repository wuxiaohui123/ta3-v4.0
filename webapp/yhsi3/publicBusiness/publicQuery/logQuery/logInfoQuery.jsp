<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>logQueryInfo</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:toolbarItem id="btnFind" key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnFindLog()" />
		<ta:toolbarItemSeperator />
		<ta:button id="resetBtn" key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="jstj" key="查询条件" cols="3" scalable="false">
			<ta:selectInput id="aaa121" key="业务类型" labelWidth="120" islevel="true" isMustLeaf="true" />
			<ta:text id="aac003" key="当事人ID" labelWidth="120" bpopTipMsg="可输入公民身份号码、姓名、人员ID、单位编号、单位名称" />
			<ta:selectInput id="aae016" key="复核标志" labelWidth="120" collection="AAE016" />
			<ta:selectInput id="aae011" key="经办人" labelWidth="120" />
			<ta:date id="aae041" key="经办时间从" labelWidth="120" showSelectPanel="true" />
			<ta:date id="aae042" key="至" labelWidth="120" showSelectPanel="true" />
			<ta:selectInput id="action" key="最后一次动作" labelWidth="120" collection="ACTION" />
			<ta:text id="aac0031" key="模糊查询条件" labelWidth="120" span="2" bpopTipMsg="可输入公民身份号码、姓名、人员ID、单位编号、单位名称" />
			<ta:text id="yaz002" key="业务流水号" labelWidth="120" />
		</ta:panel>
		<ta:panel id="pnlLog" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="logGrid" fit="true" columnFilter="true" onRowDBClick="showLogDetailInfo" haveSn="true" snWidth="30">
				<ta:datagridItem id="aaz002" key="业务日志ID" width="115" align="center" />
				<ta:datagridItem id="aaa121" key="业务类型" width="150" collection="AAA121" align="center" showDetailed="true" />
				<ta:datagridItem id="aaz010" key="当事人ID" width="80" align="center" />
				<ta:datagridItem id="name" key="当事人名称" width="150" align="center" showDetailed="true" />
				<ta:datagridItem id="aae016" key="复核标志" width="90" collection="AAE016" align="center" />
				<ta:datagridItem id="action" key="最后一次动作" width="90" collection="ACTION" align="center" />
				<ta:datagridItem id="aae419" key="当前级次" width="65" align="center" />
				<ta:datagridItem id="aae416" key="复核总级次" width="75" align="center" />
				<ta:datagridItem id="aae013" key="备注" width="140" align="center" showDetailed="true" />
				<ta:datagridItem id="aae011" key="经办人" width="90" align="center" showDetailed="true" />
				<ta:datagridItem id="aae036" key="经办时间" width="145" align="center" dataAlign="center" />
				<ta:datagridItem id="yab003" key="经办所属机构" width="235" collection="YAB003" align="center" showDetailed="true" />
				<ta:datagridItem id="aae417" key="申请业务日志ID" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae248" key="数据来源" width="90" collection="YAE248" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae041" key="一级审批人" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae051" key="一级审批时间" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yaf004" key="一级审批机构" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae042" key="二级审批人" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae052" key="二级审批时间" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yaf005" key="二级审批机构" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae043" key="三级审批人" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae053" key="三级审批时间" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yaf006" key="三级审批机构" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae044" key="四级审批人" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae054" key="四级审批时间" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yaf007" key="四级审批机构" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="aae421" key="打回到经办" width="90" collection="AAE421" hiddenColumn="true" align="center" />
				<ta:datagridItem id="aae422" key="最后一次传入的办理级次" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae098" key="业务流水号字段" width="90" hiddenColumn="true" align="center" />
				<ta:datagridItem id="yae099" key="业务流水号" width="90" hiddenColumn="true" align="center" />
				<ta:dataGridToolPaging url="logInfoQueryAction!getLogInfo.do" showCount="true" pageSize="500" submitIds="jstj" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
		
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});
	
	//查询业务日志记录信息
	function fnFindLog(){
		Base.clearGridData('logGrid');
		Base.submit('jstj','logInfoQueryAction!getLogInfo.do');
	}
	
	//查看日志记录明细
	function showLogDetailInfo(e,rowdata){
		Base.openWindow('logDetail','>>业务日志详细信息','<%=path%>
	/process/publicBusiness/publicQuery/log/logInfoQueryAction!getDetail.do', {
			"dto['aaz002']" : rowdata.aaz002
		}, 1200, 600, null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>