<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>文件转换</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" id="resetBtn" asToolBarItem="true" type="resetPage" />
		<%@ include file="/yhsi3/synthesis/swfFile/comm/help.jsp"%>
	</ta:toolbar>
	<ta:form id="form1">
		<ta:panel key="文件格式转换" height="55">
			<ta:box cssStyle="margin-top:15px;" cols="5">
				<ta:text id="file" name="fileSys" type="file" cssStyle="width: 98%; height: 25px;" key="源文件路径" span="4" />
				<ta:buttonLayout id="ButtonLayout" align="left">
					<ta:submit id="save" key="转换" isSyncSubmit="true" submitIds="form1" icon="icon-edit" url="wordPdf2SwfAction!importFile.do" onSubmit="fnOnSubmit" />
				</ta:buttonLayout>
			</ta:box>
		</ta:panel>
	</ta:form>
</body>
</html>
<script>
	$(document).ready(function() {
		$("body").taLayout();
	});

	//新增提交时检查数据有效性
	function fnOnSubmit() {
		if (!$("#file").val()) {
			Base.alert("请选择需要格式转换的文件");
			return false;
		}
		;
		$("#form1").attr("ENCTYPE", "multipart/form-data");
		return true;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>