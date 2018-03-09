<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>银行代发登账</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="q" onClick="Query();" asToolBarItem="true" />
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="flst1" key="查询条件" cols="4" expanded="false" scalable="false">
			<ta:selectInput id="yae399" key="业务报盘类型" value="10" filter="8,10" reverseFilter="true" collection="yae399" />
			<ta:date id="aae036_b" key="经办开始时间" showSelectPanel="true" onChange="fnCheckDate()" />
			<ta:date id="aae036_e" key="经办结束时间" showSelectPanel="true" onChange="fnCheckDate()" />
			<ta:selectInput id="aae011" key="经办人" collection="aae011" />
			<ta:text id="aae013" key="备注" maxLength="50" span="2" display="false" />
		</ta:panel>
		<ta:panel id="flst2" key="数据文件" cols="4" expanded="false" scalable="false">
			<ta:number id="cg001" key="成功笔数" alignLeft="true" max="9999999" min="0" required="true" />
			<ta:number id="hj001" key="金额合计" alignLeft="true" max="999999999" min="0" precision="2" required="true" />
			<ta:number id="sb002" key="失败笔数" alignLeft="true" max="9999999" min="0" required="true" />
			<ta:number id="hj002" key="金额合计" alignLeft="true" max="999999999" min="0" precision="2" required="true" />
			<ta:text id="aaz002" key="业务日志ID" display="false" />
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
			<ta:tab id="tab1" key="未回盘数据">
				<ta:panel id="pnl">
					<ta:fileupload key="上传文件" id="flie" submitIds="form1" url="bankGagencyAction!upload.do" />
				</ta:panel>
				<ta:datagrid id="ae60Grid1" fit="true" forceFitColumns="true" haveSn="true">
					<%@ include file="/yhsi3/commonJSP/wjxx.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="本次回盘数据">
				<ta:panel id="pnl" cols="4" expanded="false" scalable="false">
					<ta:text id="cg001_j" key="成功笔数" readOnly="true" />
					<ta:text id="hj001_j" key="金额合计" readOnly="true" />
					<ta:text id="sb002_j" key="失败笔数" readOnly="true" />
					<ta:text id="hj002_j" key="金额合计" readOnly="true" />
				</ta:panel>
				<ta:datagrid id="ae60a1Grid" fit="true" groupingBy="yae595">
					<ta:datagridItem id="yae602" key="报盘事件ID" align="center" width="150"></ta:datagridItem>
					<ta:datagridItem id="yae594" key="报盘文件名" align="center" width="200"></ta:datagridItem>
					<ta:datagridItem id="yae202" key="明细流水号" align="center" width="100"></ta:datagridItem>
					<ta:datagridItem id="yae595" key="导盘处理标志" collection="yae595" align="center" width="100"></ta:datagridItem>
					<ta:datagridItem id="aad052" key="指标名称1" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad053" key="代码值1" align="center" width="130" collection="aae011"></ta:datagridItem>
					<ta:datagridItem id="aad054" key="指标名称2" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad055" key="代码值2" align="center" width="130"></ta:datagridItem>
					<ta:datagridItem id="aad056" key="指标名称3" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad057" key="代码值3" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad058" key="指标名称4" align="center" width="80" collection="aae011"></ta:datagridItem>
					<ta:datagridItem id="aad059" key="代码值4" align="center" width="80" collection="aad059"></ta:datagridItem>
					<ta:datagridItem id="aad060" key="指标名称5" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad061" key="代码值5" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad062" key="指标名称6" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="aad063" key="代码值6" align="center" width="100" totals="sum"></ta:datagridItem>
					<ta:datagridItem id="yae401" key="txt" align="center" width="200" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="已回盘未审核数据">
				<ta:datagrid id="ae60Grid2" fit="true" forceFitColumns="true" haveSn="true">
					<%@ include file="/yhsi3/commonJSP/wjxx.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab4" key="历史已审核数据">
				<ta:datagrid id="ae60Grid3" fit="true" forceFitColumns="true" haveSn="true">
					<%@ include file="/yhsi3/commonJSP/wjxx.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab5" key="临时表数据">
				<ta:panel id="pnl_bm" cols="1" expanded="false" scalable="false">
					<ta:text id="yae594" key="报盘文件名" readOnly="true" />
				</ta:panel>
				<ta:datagrid id="tmp_ae60a1" fit="true" forceFitColumns="true" haveSn="true">
					<ta:datagridItem id="yae202" key="明细流水号" align="center" width="80"></ta:datagridItem>
					<ta:datagridItem id="yae595" key="导盘处理标志" align="center" width="80" collection="yae595"></ta:datagridItem>
					<ta:datagridItem id="yae238" key="处理失败原因" align="center" width="80" showDetailed="true"></ta:datagridItem>
					<ta:datagridItem id="yae401" key="txt" align="center" width="600" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.hideObj("tab3,tab5");
		Base.setDisabled("saveBtn");
		Base.setReadOnly("cg001,hj001,sb002,hj002");
	});

	//时间校验
	function fnCheckDate() {
		var aae041 = Base.getValue("aae036_b");
		var aae042 = Base.getValue("aae036_e");
		var sysdate = Base.getValue("sysdate");
		if (aae041 == '' || aae042 == '') {
			return;
		} else if (aae041 > aae042) {//判断开始时间和结束时间
			alert('开始时间不能大于结束时间！');
			Base.setValue('aae036_e', '');
			return;
		}
	}
	//查询
	function Query() {
		Base.clearData("flst2");
		Base.setValue("cg001_j", "");
		Base.setValue("hj001_j", "");
		Base.setValue("sb002_j", "");
		Base.setValue("hj002_j", "");
		Base.clearGridData("ae60a1Grid");
		Base.clearGridData("ae60Grid1");
		Base.clearGridData("ae60Grid2");
		Base.clearGridData("tmp_ae60a1");
		Base.submit("flst1", "bankGagencyAction!query.do");
	}

	//保存
	function toSave() {
		var rows = Base.getGridData("tmp_ae60a1"); //获取表格选中行
		if (rows.length == 0) {
			alert("没有获取到临时表数据！");
			return;
		}
		//获取成功失败笔数和金额
		var cg001 = Base.getValue('cg001');
		var hj001 = Base.getValue('hj001');
		var sb002 = Base.getValue('sb002');
		var hj002 = Base.getValue('hj002');

		var cg001_j = Base.getValue('cg001_j');
		var hj001_j = Base.getValue('hj001_j');
		var sb002_j = Base.getValue('sb002_j');
		var hj002_j = Base.getValue('hj002_j');

		if (cg001 != cg001_j) {
			Base.activeTab('tab2');
			alert('输入的成功笔数和结果数据中的成功笔数不一致');
			Base.setValue('cg001', '');
			Base.setfocus('cg001');

		} else if (hj001 != hj001_j) {
			Base.activeTab('tab2');
			alert('输入的合计成功金额和结果数据中的成功合计金额不一致');
			Base.setValue('hj001', '');
			Base.setfocus('hj001');

		} else if (sb002 != sb002_j) {
			Base.activeTab('tab2');
			alert('输入的失败笔数和结果数据中的失败笔数不一致');
			Base.setValue('sb002', '');
			Base.setfocus('sb002');

		} else if (hj002 != hj002_j) {
			Base.activeTab('tab2');
			alert('输入的合计失败金额和结果数据中的失败合计金额不一致');
			Base.setValue('hj002', '');
			Base.setfocus('hj002');

		} else {
			var param = {};
			param.gridList = Ta.util.obj2string(rows);
			Base.submit('yae594', 'bankGagencyAction!toSave.do', param);
		}

	}
</script>
<%@ include file="/ta/incfooter.jsp"%>