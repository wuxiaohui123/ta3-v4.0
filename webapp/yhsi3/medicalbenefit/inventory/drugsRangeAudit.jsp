<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊疾病用药范围维护审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel key="审核信息" cols="4" id="fltjb">
			<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
			<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
			<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
			<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
			<ta:buttonLayout span="2">
				<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
			</ta:buttonLayout>
			<ta:buttonLayout span="2">
				<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
			</ta:buttonLayout>
		</ta:panel>
		<ta:text id="aaz084" key="病种用药范围登记事件ID" readOnly="true" display="false" />
		<ta:text id="aaz254" key="特殊病用药范围目录ID" readOnly="true" display="false" />
		<ta:panel id="baseField" key="特殊病种信息" cols="3" >
			<ta:text id="aka120" key="特殊病种ID" readOnly="true" />
			<ta:text id="aka121" key="特殊病种名称" readOnly="true" />
			<ta:selectInput id="aka122" key="病种类型" collection="AKA122" labelWidth="120" readOnly="true"/>
		</ta:panel>

		<ta:panel id="pnlyxzml" key="已选择绑定的目录信息" fit="true" cssStyle="margin-bottom:2px;" expanded="false" scalable="false">
			<ta:datagrid id="yxzml" haveSn="true" forceFitColumns="true" snWidth="15" fit="true">
				<ta:datagridItem id="aaz231" key="社保三大目录ID" hiddenColumn="true" width="120"/>
				<ta:datagridItem id="ake001" key="社保三大目录编码" showDetailed="true" width="140" align="center"/>
				<ta:datagridItem id="ake002" key="社保三大目录名称" showDetailed="true" width="140" align="center"/>
				<ta:datagridItem id="ake003" key="三大目录类别" showDetailed="true"  collection="AKE003" width="120" align="center"/>
				<ta:datagridItem id="aae030" key="开始生效日期" showDetailed="true" width="120" dataType="date" align="center" dataAlign="center"/>
				<ta:datagridItem id="aae031" key="终止生效日期" showDetailed="true" width="120" dataType="date" align="center" dataAlign="center"/>
				<ta:datagridItem id="aka022" key="医疗使用标志" showDetailed="true" collection="AKA022" width="120" hiddenColumn="true"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("action", '1,2', true);
	});

	//保存
	function toSave() {
		if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?",
				function(btn, callback) {
					if (btn) {
						Base.submit('form1','drugsRangAuditAction!toSave.do');
					}
				});
		}
	}

	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>