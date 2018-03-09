<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊项目参数信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" />
		<ta:toolbarItem id="saveBtn" key="新增" icon="xui-icon-spotSave" onClick="toAdd()" />
		<ta:button id="btnReset" key="重置" icon="xui-icon-spotReset" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="queryField" key="查询条件" cols="3">
			<ta:text id="ake001" key="社保三大目录统一编码" labelWidth="150" />
			<ta:date id="aae030" key="开始时间" showSelectPanel="true" labelWidth="120" />
			<ta:date id="aae031" key="结束时间" showSelectPanel="true" labelWidth="120" />
		</ta:panel>
		<ta:panel id="pnlBzxx" key="特殊项目参数信息" fit="true" expanded="true" scalable="true">
			<ta:datagrid id="dg_bzxx" haveSn="true" fit="true" forceFitColumns="true">
				<ta:datagridItem id="edit" key="修改" width="50" align="true" icon="icon-edit" click="editKa35" />
				<ta:datagridItem id="pause" key="删除" width="50" align="true" icon="icon-remove" click="delKa35" />
				<ta:datagridItem id="aaz235" key="社保三大目录先自付比例参数ID" width="180" align="center" />
				<ta:datagridItem id="ake001" key="社保三大目录统一编码" width="150" align="center" />
				<ta:datagridItem id="aka048" key="上限金额" width="150" align="center" />
				<ta:datagridItem id="aka049" key="下限金额 " width="150" align="center" />
				<ta:datagridItem id="aka057" key="先自付比例" width="150" align="center" />
				<ta:datagridItem id="aae011" key="经办人" collection="AAE011" width="150" align="center" />
				<ta:datagridItem id="aae036" key="经办时间" showDetailed="true" width="150" align="center" />
				<ta:datagridItem id="aae030" key="开始日期" dataType="date" width="150" align="center" />
				<ta:datagridItem id="aae031" key="终止日期" dataType="date" width="150" align="center" />
				<ta:datagridItem id="yka542" key="先行自付部分处理方式" collection="yka542" width="150" align="center" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	function query() {
		Base.submit("queryField", "specialProjectParamAction!queryKa35.do");
	}

	//新增起付线信息
	function toAdd() {
		Base.openWindow('userwin', "特殊项目参数新增",
				"specialProjectParamAction!addKa35.do", null, '90%', '70%',
				null, null, true);
	}

	//修改列表中某条起付线信息
	function editKa35(data, e) {
		Base.openWindow('userwin', "起付线修改",
				"specialProjectParamAction!editKa35.do", {
					"dto['aaz235_c']" : data.aaz235,
					"dto['ake001_c']" : data.ake001,
					"dto['aka048_c']" : data.aka048,
					"dto['aka049_c']" : data.aka049,
					"dto['aka057_c']" : data.aka057,
					"dto['aae011_c']" : data.aae011,
					"dto['aae036_c']" : data.aae036,
					"dto['aae030_c']" : data.aae030,
					"dto['aae031_c']" : data.aae031,
					"dto['yka542_c']" : data.yka542
				}, '90%', '70%', null, null, true);
	}

	//停用列表中某条起付线信息
	function delKa35(data, e) {
		Base.confirm("确定要删除吗?", function(flag, callback) {
			if (flag) {
				Base.submit("", "specialProjectParamAction!delKa35.do", {
					"dto['aaz235']" : data.aaz235,
					"dto['ake001']" : data.ake001,
					"dto['aka048']" : data.aka048,
					"dto['aka049']" : data.aka049,
					"dto['aka057']" : data.aka057,
					"dto['aae011']" : data.aae011,
					"dto['aae036']" : data.aae036,
					"dto['aae030']" : data.aae030,
					"dto['aae031']" : data.aae031,
					"dto['yka542']" : data.yka542,
				}, null, false, null, null);
			}
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>