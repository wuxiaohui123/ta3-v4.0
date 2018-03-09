<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位注销复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:toolbarItem id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="alt+C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<ta:text id="fhjc" display="false" key="复核级次" />
		</ta:panel>

		<ta:panel fit="true" hasBorder="false">
			<ta:panel id="pnlUnitBase" key="单位基本信息" cols="3">
				<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" readOnly="true" />
				<ta:text id="aae044" key="名称" labelWidth="120" span="2" readOnly="true" />
				<ta:text id="aab999" key="单位管理码" labelWidth="120" maxLength="20" readOnly="true" />
				<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true" collection="AAB019" />
				<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019" readOnly="true" />
			</ta:panel>

			<ta:panel id="pnlCancell" key="单位变更信息" cols="3">
				<ta:selectInput id="aae160" key="变更原因" labelWidth="120" collection="AAE160" required="true" readOnly="true" />
				<ta:date id="aae035" key="变更日期" labelWidth="120" required="true" readOnly="true" />
				<ta:textarea id="aae013_jb" span="3" key="备注" height="60" labelWidth="120" maxLength="200" readOnly="true" />
			</ta:panel>

			<ta:tabs id="tbs_xzxx" fit="true" cssStyle="overflow:auto">
				<ta:tab id="tb_cbxx" key="单位参保信息" cssStyle="overflow:auto">
					<ta:datagrid id="unitSIGrid" forceFitColumns="true" enableColumnMove="false" snWidth="30" haveSn="true" fit="true">
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" width="160" />
						<ta:datagridItem id="aab033" key="征收方式" collection="AAB033" align="center" width="80" />
						<ta:datagridItem id="aab050" key="参保日期" collection="AAB050" align="center" width="130" dataAlign="center" />
						<ta:datagridItem id="aab051" key="参保状态" collection="AAB051" align="center" width="130" />
						<ta:datagridItem id="yae097" key="最大做帐期号" width="100" dataAlign="center" align="center" />
						<ta:datagridItem id="yab139" key="参保所属机构" width="270" align="center" collection="YAB003" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="sjlcTb" key="事件流程记录" cssStyle="overflow:auto">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
		$("body").css("overflow", "auto");
	});

	//流程跳转
	function submitData() {
		Base.submit('form1', 'unitCancellRegistCheckAction!toSave.do');
	}

	function closeWin() {
		parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>