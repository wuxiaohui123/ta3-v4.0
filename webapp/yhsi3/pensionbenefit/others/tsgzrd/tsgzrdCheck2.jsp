<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊工种认定审批</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:text id="sysdate" key="系统时间" display="false" />
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="aac012" readOnly="true" />
			<ta:date id="aac049" key="首次参保日期" labelWidth="130" readOnly="true" />
			<ta:date id="aac007" key="参加工作时间" labelWidth="130" readOnly="true" />
			<ta:text id="aae140" key="险种类型" display="false" />
		</ta:panel>
		<ta:panel id="rdxx" cols="1" key="特殊工种年限信息" height="200">
			<ta:datagrid id="dg_rdxx" haveSn="true" height="200">
				<ta:datagridItem id="aaz185" key="人员工作经历ID" align="center" dataAlign="center" hiddenColumn="false" />
				<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" width="160" />
				<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center" width="160" />
				<ta:datagridItem id="yae599" key="月数" align="center" dataAlign="center" width="100" />
				<ta:datagridItem id="aac019" key="特殊工种" collection="aac019" align="center" dataAlign="center" width="200" />
				<ta:datagridItem id="aab004" key="单位名称" align="center" dataAlign="left" width="600" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	
	//打开查询个人信息页面
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null,null, true);
	}
	
	function submitData() {
		Base.submit("form1", "tsgzrdCheck2Action!toSave.do", null, null, null, null);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>