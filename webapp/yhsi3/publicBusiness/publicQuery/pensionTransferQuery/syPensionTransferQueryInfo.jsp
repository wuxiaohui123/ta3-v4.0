<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<ta:toolbar id="tlb">
	<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true" />
	<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datsyzyxq')" asToolBarItem="true" />
</ta:toolbar>
<ta:panel id="panel1" key="失业转移详情" fit="true">
	<ta:datagrid id="datsyzyxq" snWidth="30" haveSn="true" fit="true">
		<ta:datagridItem id="aac001" key="个人编号" maxChart="4" align="center" sortable="true" />
		<ta:datagridItem id="aac003" key="姓名" maxChart="4" align="center" sortable="true" />
		<ta:datagridItem id="aac004" key="性别" maxChart="2" align="center" sortable="true" collection="AAC004" />
		<ta:datagridItem id="aac002" key="身份证号码" maxChart="9" align="center" sortable="true" />
		<ta:datagridItem id="aac007" key="参加工作时间" maxChart="6" align="center" sortable="true" />
		<ta:datagridItem id="aac071" key="转移前所在单位名称" maxChart="12" align="center" />
		<ta:datagridItem id="aac076" key="转移后所在单位名称" maxChart="12" align="center" />
		<ta:datagridItem id="aae030" key="开始日期" maxChart="3" align="center" />
		<ta:datagridItem id="aae031" key="终止日期" maxChart="3" align="center" />
		<ta:datagridItem id="aac070" key="转移方向" maxChart="4" align="center" collection="AAC070" />
		<ta:datagridItem id="aac077" key="转移后社会保险机构名称" maxChart="12" align="center" />
		<ta:datagridItem id="aac072" key="转移前社会保险机构名称" maxChart="12" align="center" />
		<ta:datagridItem id="aae011" key="经办人" maxChart="4" align="center" collection="AAE011" />
		<ta:datagridItem id="aae036" key="经办时间" maxChart="4" align="center" />
		<ta:datagridItem id="yab003" key="经办所属机构" maxChart="10" align="center" collection="YAB003" />
	</ta:datagrid>
</ta:panel>

<script type="text/javascript">
	$(document).ready(function() {
	});
	function closeWin() {
		Base.closeWindow('detailWindow');
	}

	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("无数据可导出,请确认！", "warn");
		}
	}
</script>

<%@ include file="/ta/incfooter.jsp"%>