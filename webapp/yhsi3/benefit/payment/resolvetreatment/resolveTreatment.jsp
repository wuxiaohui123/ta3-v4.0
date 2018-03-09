<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>退发分解</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>  
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="to_save" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>

		<ta:panel id="flt_jbxx" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<ta:text id="aaz157" display="false" labelWidth="130" key="人员社会保险明细ID" />
			<ta:date id="zzqh" key="做账期号" issue="true" showSelectPanel="true" labelWidth="130" display="false" />
			<ta:selectInput id="flag" data="[{'id':'1','name':'退发信息分解'},{'id':'2','name':'一次性待遇分解'}]" labelWidth="130" key="分解类别" required="true" onSelect="fn_query" />
			<ta:number id="kfzje" labelWidth="130" cssClass="color:red" key="待扣减总金额" precision="2" readOnly="true" />
			<ta:text id="yac001" key="个人最大做账期号" readOnly="true" labelWidth="130" />
		</ta:panel>

		<ta:tabs id="tabs1" fit="true" height="280">
			<ta:tab id="tab1" key="待分解退发信息">
				<ta:datagrid id="dfjlist" forceFitColumns="true" height="180" fit="true" heightDiff="100">
					<ta:datagridItem id="aab001" key="单位编号" width="80" />
					<ta:datagridItem id="aae044" key="单位名称" width="200" />
					<ta:datagridItem id="aae140" key="险种类型" width="120" collection="AAE140" />
					<ta:datagridItem id="aae002" key="做账期号" width="95px" dataAlign="center" />
					<ta:datagridItem id="aaa077" key="补扣发业务类型" width="125px" collection="AAA077" />
					<ta:datagridItem id="aae041" key="补退开始年月" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae042" key="补退结束年月" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae058" key="补退金额" width="95px" totals="sum" dataAlign="right" formatter="convertState" dataType="number" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="分解后退发信息">
				<ta:datagrid id="fjhlist" forceFitColumns="true" height="180" fit="true" heightDiff="100">
					<ta:datagridItem id="aab001" key="单位编号" width="80" />
					<ta:datagridItem id="aae044" key="单位名称" width="200" />
					<ta:datagridItem id="aae140" key="险种类型" width="120" collection="AAE140" />
					<ta:datagridItem id="aae002" key="做账期号" width="95px" dataAlign="center" />
					<ta:datagridItem id="aaa077" key="补扣发业务类型" width="125px" collection="AAA077" />
					<ta:datagridItem id="aae041" key="补退开始年月" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae042" key="补退结束年月" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae058" key="补退金额" width="95px" totals="sum" dataAlign="right" formatter="convertState" dataType="number" />
				</ta:datagrid>
			</ta:tab>

			<ta:tab id="tab3" key="待分解一次性待遇信息">
				<ta:datagrid id="ycxfjlist" forceFitColumns="true" height="180" fit="true" heightDiff="100">
					<ta:datagridItem id="aab001" key="单位编号" width="80" />
					<ta:datagridItem id="aae044" key="单位名称" width="200" />
					<ta:datagridItem id="aae140" key="险种类型" width="120" collection="AAE140" />
					<ta:datagridItem id="aae002" key="做账期号" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae210" key="开始年月" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae129" key="金额" width="95px" totals="sum" dataAlign="right" formatter="convertState" dataType="number" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab4" key="分解后一次性待遇信息">
				<ta:datagrid id="ycxfjhlist" forceFitColumns="true" height="180" fit="true" heightDiff="100">
					<ta:datagridItem id="aab001" key="单位编号" width="80" />
					<ta:datagridItem id="aae044" key="单位名称" width="200" />
					<ta:datagridItem id="aae140" key="险种类型" width="120" collection="AAE140" />
					<ta:datagridItem id="aae002" key="做账期号" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae210" key="开始年月" width="95px" dataAlign="center" />
					<ta:datagridItem id="aae129" key="金额" width="95px" totals="sum" dataAlign="right" formatter="convertState" dataType="number" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>

		<ta:panel id="flt_btxx" cols="3" key="退发分解信息">
			<ta:date id="kjksqh" required="true" labelWidth="130" cssStyle="color:red" key="分解开始年月" showSelectPanel="true" issue="true" onChange="fn_checkAae041();" />
			<ta:number id="mqkjje" required="true" labelWidth="130" cssStyle="color:red" key="分解金额" precision="2" onChange="fn_totalAmountCheck();" />
			<ta:number id="kjqs" labelWidth="130" key="分解总期数" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow13.do", null, 1000, 450, null, function() {
			if (g_Suggest != "") {
				fn_setPersonBaseInfoData();
			}
		}, true);
	}

	//检查补退开始日期
	function fn_checkAae041() {
		var aae210 = Base.getValue("yac001");
		var aae041 = Base.getValue("kjksqh");
		if (aae041 <= aae210) {
			Base.alert("分解开始年月不能小于个人最大做账期号,请确认！", 'warn', function() {
				Base.setValue("kjksqh", "");
				Base.focus("kjksqh");
			});
		}
	}

	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}

	function fn_totalAmountCheck() {
		var kjzje = Base.getValue("kfzje");
		if (kjzje == null || kjzje == '') {
			kjzje = 0;
		}

		var kjqs = Base.getValue("kjqs");
		if (kjqs == null || kjqs == '') {
			kjqs = 0;
		}

		var mqkjje = Base.getValue("mqkjje");
		if (mqkjje == null || mqkjje == '') {
			mqkjje = 0;
		}

		if ((kjzje * 1) < (mqkjje * 1)) {
			alert("分解金额大于待分解金额！");
			Base.setValue("mqkjje", "");
			Base.focus("mqkjje");
		}
	}

	////保存经办信息
	function toSave() {
		Base.submit("form1", "resolveTreatmentAction!toSave.do");
	}

	//查询信息
	function fn_query() {
		Base.submit("aac001,aae140,aaa121,flag", "resolveTreatmentAction!queryBaseInfo.do", null, null, null, null);
	}

	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>