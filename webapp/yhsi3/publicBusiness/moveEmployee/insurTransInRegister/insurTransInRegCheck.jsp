<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转入登记复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入登记复核[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:text id="fhjc" key="当前复核级次" display="false" />
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="人员基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" height="200" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续申请表和联系函" id="tab2">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="人员基本信息和基金转移信息" id="tab3" cssStyle="overflow:auto">
				<ta:panel id="pnlDZXX" key="转移基金登帐信息" expanded="false" scalable="false" height="92">
					<ta:datagrid id="ad12List" enableColumnMove="true" haveSn="true" border="true" snWidth="30" fit="true">
						<%@ include file="/yhsi3/commonJSP/ad12.jsp"%>
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="pnlJBXX" key="人员基本信息" cols="2" height="133" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic90_jbxx.jsp"%>
				</ta:panel>
				<ta:panel id="pnlJJXX" key="基金转移信息" height="82" cols="2" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic90_jjxx.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="历年缴费及个人账户记账信息" id="tab4" cssStyle="overflow:auto">
				<ta:datagrid id="ic91List" enableColumnMove="true" snWidth="30" haveSn="true" fit="true">
					<%@ include file="/yhsi3/commonJSP/ic91.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		Base.submit("form1", "insurTransInRegCheckAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>