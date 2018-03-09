<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AssistanTapparatus</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />

	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">

		<ta:panel cssStyle="margin:5px;" key="辅助器具信息" cols="3" id="assistantapparatus">
			<ta:text id="aaz105" key="辅助器具ID" readOnly="true" display="false" />
			<ta:text id="ala020" key="辅助器具名称" onChange="fn_queryInfo();" required="true" maxLength="100" />
			<ta:text id="ala026" key="产地" maxLength="25" span="2" />
			<ta:text id="aaa121" display="false" />
		</ta:panel>
		<ta:panel key="辅助器具信息" height="300">
			<ta:datagrid id="fzqjxx" forceFitColumns="true" fit="true" haveSn="true">
				<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
				<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
				<ta:datagridItem id="ala020" key="辅助器具名称" sortable="true" width="120" />
				<ta:datagridItem id="ala026" key="产地" sortable="true" />
				<ta:datagridItem id="aaz105" key="辅助器具ID" hiddenColumn="true" sortable="true" />
				<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow", "auto");
	});

	//回调函数	
	function fn_queryInfo() {
		Base.submit("ala020", "assistantapparatusAction!queryAssistantapparatusInfo.do");
	}

	//修改认定信息
	function fnUpdate(data, e) {
		Base.setValue("ala020", data.ala020);
		Base.setValue("aae030", data.aae030);
		Base.setValue("aae031", data.aae031);
		Base.setValue("ala026", data.ala026);
		Base.setValue("aka068", data.aka068);
		Base.setValue("aka021", data.aka021);
		Base.setValue("aka020", data.aka020);
		Base.setValue("aaz105", data.aaz105);
		Base.setValue("businessLogID", data.aaz002);
	}

	//删除认定信息
	function fnDelRow(data, e) {
		var aaz105 = data.aaz105;
		Base.setValue("ala020", data.ala020);
		Base.confirm("确认要删除?", function(btn, callback, options) {
			if (btn) {
				Base.submit("procInc,ala020", "assistantapparatusAction!toSave.do", {"dto['aaz105']" : aaz105,"dto['yae587']" : "3"}, null, null, function() {
					Base.resetForm("form1");
				});
			}
		});
	}

	//保存经办信息
	function submitData() {
		//操作选择
		var aaz105 = Base.getValue("aaz105");
		if (aaz105 != null && aaz105 != "") {
			if (!confirm("确认更新？")) {
				return false;
			}
		}

		Base.submit("assistantapparatus", "assistantapparatusAction!toSave.do", null, null, null, function() {
			Base.resetForm("form1");
		});
	}
	function fnCheck() {
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		if (aae030 != null && aae031 != null && aae030 != "" && aae031 != "") {
			if (aae030 > aae031) {
				Base.alert("终止日期不能早于开始日期", "warn");
				Base.setValue("aae030", "");
				Base.setValue("aae031", "");
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>