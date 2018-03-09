<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位应收核定复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave();" />
		<ta:toolbarItemSeperator />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="frm" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel key="审核信息" cols="4" id="fltjb" expanded="false" scalable="false">
			<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" reverseFilter="true" filter="1,2" />
			<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
			<ta:textarea id="aae013" span="2" key="审核意见" height="40px" />
			<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="40px" readOnly="true" />
			<ta:buttonLayout span="2">
				<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
			</ta:buttonLayout>
			<ta:buttonLayout span="2">
				<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
			</ta:buttonLayout>
		</ta:panel>
		<ta:text id="fhjc" key="复核级次" display="false" />
		<ta:text id="aaz002" key="日志ID" display="false" />
		<ta:tabs fit="true">
			<ta:tab id="tab_this" key="本次核定信息">
				<ta:datagrid id="dg_this" haveSn="true" fit="true">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="170"></ta:datagridItem>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="100"></ta:datagridItem>
					<ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" width="100"></ta:datagridItem>
					<ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" width="100"></ta:datagridItem>
					<ta:datagridItem id="yac084" key="离退休标志" align="center" dataAlign="left" width="100" collection="YAC084"></ta:datagridItem>
					<ta:datagridItem id="aab119" key="人数" align="center" dataAlign="left" width="100"></ta:datagridItem>
					<ta:datagridItem id="aab084" key="工资总额" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="dwhzh" key="单位划账户" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="dwhtc" key="单位划统筹" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="grhzh" key="个人划账户" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="grhtc" key="个人划统筹" align="center" dataAlign="right" width="100"></ta:datagridItem>
					<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="140" sortable="true"></ta:datagridItem>
					<ta:datagridItem id="yab003" key="经办机构" align="center" dataAlign="left" collection="YAB003" width="100"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab_sjlcjl" key="事件流程记录">
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
	function closeWin() {
		parent.Base.closeWindow("userwin");
	}
	//保存审核信息
	function fnSave() {
		var rows = Base.getGridData('dg_this');
		var param = {};
		param.d2List = Ta.util.obj2string(rows);
		if ("" == rows) {
			Base.alert('没有需要审核的单位预缴信息！', 'warn');
			return;
		} else {
			Base.submit('frm', 'receivableVouchCheckAction!toSave.do', param);
			Base.setDisabled('btnSave');
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>