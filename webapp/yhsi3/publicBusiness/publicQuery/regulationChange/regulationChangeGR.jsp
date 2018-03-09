<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员增减变动详细信息</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tb">
			<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExp()" asToolBarItem="true" />
			<ta:button id="bt" key="关闭" asToolBarItem="true" icon="xui-icon-spotClose" onClick="fnClose()" />
		</ta:toolbar>
		<ta:date id="start" key="开始年月" showSelectPanel="true" issue="true" display="false" />
		<ta:date id="end" key="结束年月" showSelectPanel="true" issue="true" display="false" />
		<ta:selectInput id="aae140" key="险种类型" collection="AAE140" filter="110,210,310,330,390,410,510" reverseFilter="true" display="false" />
		<ta:selectInput id="yab019" key="单位类型" collection="YAB019" display="false" />
		<ta:selectInput id="yab003" key="经办机构" collection="YAB003" display="false" />
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="新增人员详细情况">
				<ta:datagrid id="xzinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="8" showDetailed="true" />
					<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" />
					<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8" />
					<ta:datagridItem id="aac004" key="性别" align="center" maxChart="2" collection="AAC004" />
					<ta:datagridItem id="aae140" key="险种" align="center" collection="aae140" maxChart="8" />
					<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="yac084" key="离退休标识" align="center" dataAlign="center" maxChart="5" collection="YAC084" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" align="center" collection="YKC005" maxChart="10" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" align="center" collection="YKC006" maxChart="10" />
					<ta:datagridItem id="aac050" key="变更类型" align="center" collection="AAC050" maxChart="6" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" collection="aab301" width="100" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab12" key="恢复缴费人员详细情况">
				<ta:datagrid id="hfinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="8" showDetailed="true" />
					<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" />
					<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8" />
					<ta:datagridItem id="aac004" key="性别" align="center" maxChart="2" collection="AAC004" />
					<ta:datagridItem id="aae140" key="险种" align="center" collection="aae140" maxChart="8" />
					<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="yac084" key="离退休标识" align="center" dataAlign="center" maxChart="5" collection="YAC084" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" align="center" collection="YKC005" maxChart="10" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" align="center" collection="YKC006" maxChart="10" />
					<ta:datagridItem id="aac050" key="变更类型" align="center" collection="AAC050" maxChart="6" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" collection="aab301" width="100" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="中断人员详细情况">
				<ta:datagrid id="zdinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="8" showDetailed="true" />
					<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" />
					<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8" />
					<ta:datagridItem id="aac004" key="性别" align="center" maxChart="2" collection="AAC004" />
					<ta:datagridItem id="aae140" key="险种" align="center" collection="aae140" maxChart="8" />
					<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="yac084" key="离退休标识" align="center" dataAlign="center" maxChart="5" collection="YAC084" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" align="center" collection="YKC005" maxChart="10" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" align="center" collection="YKC006" maxChart="10" />
					<ta:datagridItem id="aac050" key="变更类型" align="center" collection="AAC050" maxChart="6" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" collection="aab301" width="100" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="终止人员详细情况">
				<ta:datagrid id="zzinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="8" showDetailed="true" />
					<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" />
					<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8" />
					<ta:datagridItem id="aac004" key="性别" align="center" maxChart="2" collection="AAC004" />
					<ta:datagridItem id="aae140" key="险种" align="center" collection="aae140" maxChart="8" />
					<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="yac084" key="离退休标识" align="center" dataAlign="center" maxChart="5" collection="YAC084" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" align="center" collection="YKC005" maxChart="10" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" align="center" collection="YKC006" maxChart="10" />
					<ta:datagridItem id="aac050" key="变更类型" align="center" collection="AAC050" maxChart="6" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" collection="aab301" width="100" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab4" key="办理退休人员详细情况">
				<ta:datagrid id="bltxinfoGrid" enableColumnMove="false" snWidth="30" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="8" showDetailed="true" />
					<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" />
					<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
					<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8" />
					<ta:datagridItem id="aac004" key="性别" align="center" maxChart="2" collection="AAC004" />
					<ta:datagridItem id="aae140" key="险种" align="center" collection="aae140" maxChart="8" />
					<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" maxChart="5" dataType="date" />
					<ta:datagridItem id="yac084" key="离退休标识" align="center" dataAlign="center" maxChart="5" collection="YAC084" />
					<ta:datagridItem id="ykc005" key="特殊人员类型" align="center" collection="YKC005" maxChart="10" />
					<ta:datagridItem id="ykc006" key="特殊人员类别" align="center" collection="YKC006" maxChart="10" />
					<ta:datagridItem id="aac050" key="变更类型" align="center" collection="AAC050" maxChart="6" />
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" collection="aab301" width="100" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnClose() {
		parent.Base.closeWindow("grInfo");
	}
	function fnExp() {
		Base.submitForm("form1", null, false, "regulationChangeAction!downZip.do");
		Base.hideMask();
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>