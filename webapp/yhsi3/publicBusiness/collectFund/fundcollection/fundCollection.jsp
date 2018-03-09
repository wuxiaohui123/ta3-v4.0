<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>fundCollection</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:tabs fit="true">
		<ta:tab id="tab_unit" key="单个征集方式">
			<ta:toolbar id="tlb1">
				<ta:button id="btnQuery" key="查询[Q]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" />
				<ta:button id="btnSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave()" />
				<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
			</ta:toolbar>
			<ta:form id="form1" fit="true">
				<ta:box id="procInc">
					<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				</ta:box>
				<ta:panel id="flst1" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="cnt" key="欠费月数" display="false" />
					<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="flst2" key="征集信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="zsfs" key="征收类型" data="[{'id':'1','name':'单位部分'},{'id':'2','name':'个人部分'},{'id':'3','name':'全额'}]" labelWidth="120" required="true" value="3" />
					<ta:selectInput id="yad154" key="是否使用待转金" collection="YAD154" labelWidth="120" required="true" value="0" />
					<ta:selectInput id="aab033" key="征收方式" collection="AAB033" labelWidth="120" required="true" value="3" />
					<ta:selectInput id="yae581" key="利息征收标志" collection="yae581" labelWidth="120" required="true" value="0" />
					<ta:selectInput id="yae579" key="滞纳金征收标志" collection="yae579" labelWidth="120" required="true" onSelect="fnSelectYae597" value="0" />
					<ta:date id="aae042" key="滞纳金结束日期" showSelectPanel="true" labelWidth="120" onChange="fnCheckDate()" />
					<ta:text id="prm_userid" key="经办人" display="false"></ta:text>
					<ta:text id="prm_yab003" key="行政区" display="false"></ta:text>
				</ta:panel>
				<ta:tabs fit="true">
					<ta:tab key="欠费信息" id="tab_hd">
						<ta:datagrid id="dg_hd" enableColumnMove="false" fit="true" snWidth="60" haveSn="true" selectType="checkbox" onRowDBClick="fnCilckHD" columnFilter="true" forceFitColumns="true">
							<%@ include file="/yhsi3/commonJSP/hdxx2.jsp"%>
						</ta:datagrid>
					</ta:tab>
					<ta:tab key="待转金信息" id="tab_dzj">
						<ta:datagrid id="dg_dzj" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" onRowDBClick="fnCilck" forceFitColumns="true">
							<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" width="120"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" width="220"></ta:datagridItem>
							<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="140"></ta:datagridItem>
							<ta:datagridItem id="aaa028" key="当事人类别" align="center" dataAlign="center" width="120" collection="AAA028"></ta:datagridItem>
							<ta:datagridItem id="aaa093" key="承担缴费主体类型" align="center" dataAlign="left" width="160" collection="AAA093"></ta:datagridItem>
							<ta:datagridItem id="yae080" key="余额" align="center" dataAlign="right" width="160" dataType="Number"></ta:datagridItem>
							<ta:datagridItem id="aae341" key="筹资项目" align="center" dataAlign="right" width="120" collection="AAE341"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab key="历史征集信息" id="tab_history">
						<ta:datagrid id="dg_history" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" onRowDBClick="fnClickmx" selectType="checkbox" forceFitColumns="true">
							<ta:datagridItem id="btnPrint" icon="icon-print" key="点击打印" align="center" click="fnXNPrint"></ta:datagridItem>
							<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
						</ta:datagrid>
					</ta:tab>

					<ta:tab id="tab_dwzjd" key="征集单打印信息">
						<ta:datagrid id="dg_dwzjdInfo" haveSn="true" fit="true" forceFitColumns="true">
							<%@ include file="/yhsi3/commonJSP/ad15Info.jsp"%>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:form>
		</ta:tab>
		<ta:tab id="tab_batch" key="批量征集方式">
			<ta:toolbar id="tlb">
				<ta:button id="btnQueryBatch" key="查询[Q]" asToolBarItem="true" icon="xui-icon-query" hotKey="Q" onClick="fnQueryBatch()" />
				<ta:button id="btnSaveBatch" key="勾选保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSaveBatch()" />
				<ta:button id="btnSaveBatchAll" key="全部保存[A]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSaveBatchAll()" />
				<ta:button id="btnResetBatch" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
			</ta:toolbar>
			<%@ include file="/yhsi3/commonJSP/xzlx_dw.jsp"%>
			<ta:panel id="flstQuery" key="征集信息" cols="4" expanded="true" scalable="false">
				<ta:date id="aae003_b" key="费款期开始年月" showSelectPanel="true" labelWidth="130" issue="true" />
				<ta:date id="aae003_e" key="费款期截止年月" showSelectPanel="true" labelWidth="130" issue="true" />
				<ta:date id="aae002_b" key="做账期开始年月" showSelectPanel="true" labelWidth="130" issue="true" />
				<ta:date id="aae002_e" key="做账期截止年月" showSelectPanel="true" labelWidth="130" issue="true" />
				<ta:selectInput id="yad154_1" key="是否使用待转金" collection="YAD154" labelWidth="130" required="true" value="0" display="true" />
				<ta:selectInput id="aab033_1" key="征收方式" collection="AAB033" labelWidth="130" required="true" value="8" />
				<ta:selectInput id="aaa115_1" key="缴费类型" collection="AAA115" labelWidth="130" span="1" />
				<ta:selectInput id="lxbs" key="龙圩区标识" data="[{'id':'0','name':'包含龙圩区'},{'id':'1','name':'不包含龙圩区'},{'id':'2','name':'只包含龙圩区'}]" labelWidth="150" value="0" />
			</ta:panel>
			<ta:tabs id="batch" fit="true">
				<ta:tab key="欠费信息" id="tab_hdBatch" selected="true">
					<ta:datagrid id="dg_hdBatch" enableColumnMove="false" fit="true" snWidth="50" haveSn="true" selectType="checkbox" columnFilter="true" onRowDBClick="fnCilckHD" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/hdxx2.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="征集信息" id="tab_zjBatch">
					<ta:datagrid id="dg_zjBatch" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" columnFilter="true" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/zjxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="错误信息" id="tab_zjError">
					<ta:button key="导出错误信息" id="btnOut" icon="icon-output" onClick="fnExpFile('dg_zjError');" />
					<ta:datagrid id="dg_zjError" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" columnFilter="true" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/ae40.jsp"%>
					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
		</ta:tab>
		<ta:tab id="tab_batchds" key="批量征集(定时服务)">
			<ta:toolbar id="tlbds">
				<ta:button id="btnSaveBatchDS" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnSaveBatchDS()" />
				<ta:button id="btnResetBatchDS" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" onClick="fnResetBatchDS()" />
			</ta:toolbar>
			<ta:panel id="flstds" key="征集信息" cols="3" expanded="false" scalable="false">
				<ta:selectInput id="yad154_ds" key="是否使用待转金" collection="YAD154" labelWidth="120" required="true" value="0" />
				<ta:selectInput id="aab033_ds" key="征收方式" collection="AAB033" labelWidth="120" required="true" filter="1,10" reverseFilter="true" />
			</ta:panel>
			<ta:panel id="flstfw" key="定时服务" cols="3" expanded="false" scalable="false">
				<ta:date id="zxsj" key="执行时间" datetime="true" validNowTime="right" showSelectPanel="true" span="2" labelWidth="120" />
			</ta:panel>
			<ta:tabs id="batchds" fit="true">
				<ta:tab key="单位核定信息" id="tab_hdBatchds" selected="true">
					<ta:datagrid id="dg_hdBatchds" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" selectType="checkbox" forceFitColumns="true">
						<%@ include file="/yhsi3/commonJSP/hdxx2.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_successBatch" key="定时服务创建成功信息">
					<ta:datagrid id="dg_successBatch" haveSn="true" fit="true" forceFitColumns="true">
						<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" maxChart="8" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" maxChart="40" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" maxChart="16" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="successmsg" key="成功信息" align="center" dataAlign="left" maxChart="8" showDetailed="true"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_errorBatch" key="定时服务创建失败信息">
				</ta:tab>
			</ta:tabs>
		</ta:tab>
		<ta:tab id="tab24" key="事件流程信息">
			<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
		</ta:tab>
	</ta:tabs>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, hdQuery, 0, false);
		Base.setDisabled("btnSave,btnSaveBatch,btnPrintBatch");
		Base.focus("aab001");
		Base.hideObj("tab_successBatch,tab_errorBatch");
	});
	//回调查询
	function hdQuery() {
		if (g_Suggest != "") {
			Base.setValue("aab001", g_Suggest[1]);
			Base.clearGridData("dg_hd");
			Base.clearGridData("dg_dzj");
			Base.clearGridData("dg_history");
			Base.activeTab("tab_hd");
			Base.submit("flst1", "fundCollectionAction!toQuery.do");
		}
	}
	//查询
	function fnQuery() {
		var aab001 = Base.getValue("aab001");
		if (aab001 == '' | aab001 == null) {
			Base.alert("单位编号不能为空!", "warn");
			return;
		}
		Base.submit("flst1", "fundCollectionAction!toQuery.do");
	}
	//核定详情
	function fnCilckHD(e, rowdata) {
		var yae518 = rowdata.yae518;
		//必传项 yae518 
		Base.openWindow("ourwin", "核定明细", myPath() + "/process/publicBusiness/collectFund/fundCollection/showCheckMXInfoAction!zzhdxx.do", {
			"dto['yae518']" : yae518
		}, "95%", "90%", null, null, true);
	}
	//待转金详情
	function fnCilck(e, rowdata) {
		var aab001 = rowdata.aab001;
		var aae140 = rowdata.aae140;
		var aae341 = rowdata.aae341;
		Base.openWindow("DZJInfo", "待转金收支明细", "fundCollectionAction!toEdit.do", {
			"dto['aab001']" : aab001,
			"dto['aae140']" : aae140,
			"dto['aae341']" : aae341
		}, 1000, 480, null, null, true);
	}
	//滞纳金选择控制
	function fnSelectYae597(key, value) {
		if (value == "0") {
			Base.setReadOnly("aae041,aae042");
		} else if (value == "1") {
			Base.setEnable("aae041,aae042");
		}
	}
	//滞纳金开始期号 结束期号校验
	function fnCheckDate() {
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		if (aae041 != '' && aae042 != '') {
			if (aae041 > aae042) {
				Base.alert("滞纳金开始期号不能晚于滞纳金结束期号!", "warn");
				Base.setValue("aae042", "");
				return;
			}
		}
	}
	//保存
	function fnSave() {
		var rowdata = Base.getGridSelectedRows("dg_hd");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息!", "warn");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flst1,flst2", "fundCollectionAction!toSave.do", param);
	}
	//历史信息打印
	function fnXNPrint(rowdata, e) {
		qfts();
		var yad006 = rowdata.yad006;
		if (yad006 != '1') {
			Base.alert("财务已进行处理不能补打!", "warn");
			return;
		}
		var row = rowdata.row, aaz288 = rowdata.aaz288;
		var prm_userid = Base.getValue("prm_userid");
		var prm_yab003 = Base.getValue("prm_yab003");
		var fileName = "dwzjPrint1.raq";
		var prm = "prm_aaz288=" + aaz288 + ";prm_userid=" + prm_userid + ";prm_yab003=" + prm_yab003;
		var aab001 = Base.getValue("aab001");
		//原本是传入fst1和fst2的数据，后来改为不传值
		Base.clearGridData("dg_dwzjdInfo");
		Base.submit(null, "fundCollectionAction!toBDPrint.do", {
			"dto['yad005']" : rowdata.yad005,
			"dto['yad006']" : yad006,
			"dto['yae518']" : rowdata.yae518,
			"dto['aaz288']" : rowdata.aaz288,
			"dto['aaz010']" : rowdata.aaz010
		}, null, null, function fnSuccess() {
			fnPrintComm(fileName, prm);
		}, function fnFail() {
			Base.alert("打印有误，请联系管理员!", "warn");
		});

	}
	function fnClickmx(e, rowdata) {
		var aaz288 = rowdata.aaz288;
		Base.openWindow("dwhdxx", "单位征缴明细", "fundCollectionAction!toHdmxInfo.do", {
			"dto['aaz288']" : aaz288
		}, "95%", "90%", null, null, true);
	}

	//批量征集查询
	function fnQueryBatch() {
		Base.submit("flstQuery,xzlx", "fundCollectionAction!toQueryBatch.do", {
			"dto['aae140str']" : createAae140str()
		});
	}
	//批量征集保存
	function fnSaveBatch() {
		var rowdata = Base.getGridSelectedRows("dg_hdBatch");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flstQuery,xzlx", "fundCollectionAction!toSaveBatch.do", param);
	}
	//批量征集保存
	function fnSaveBatchAll() {
		Base.submit("flstQuery,xzlx", "fundCollectionAction!toSaveBatchAll.do", {
			"dto['aae140str']" : createAae140str()
		});
	}
	//打印
	function fnPrintBatch() {
		var rowdata = Base.getGridSelectedRows("dg_zjBatch");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("flstQuery", "fundCollectionAction!toPrintBatch.do", param);
	}
	//重置
	function fnResetBatch() {
		Base.setEnable("btnQueryBatch");
		Base.setDisabled("btnSaveBatch,btnPrintBatch");
		Base.clearGridData("dg_hdBatch");
		Base.clearGridData("dg_zjBatch");
		Base.activeTab("tab_hdBatch");
	}

	//批量征集保存 定时服务
	function fnSaveBatchDS() {
		Base.submit("flstds,flstfw", "fundCollectionAction!toSaveBatchDS.do", null);
	}
	//重置 定时服务
	function fnResetBatchDS() {
		Base.setValue("zxsj", "");
		Base.setEnable("btnQueryBatchDS");
		//    Base.setDisabled("btnSaveBatchDS");
		Base.clearGridData("dg_hdBatchds");
		Base.clearGridData("dg_successBatch");
		Base.clearGridData("dg_errorBatch");
		Base.activeTab("dg_hdBatchds");
		Base.hideObj("tab_successBatch");
		Base.hideObj("tab_errorBatch");
	}

	function createAae140str() {
		var ary = [ "aae140_110", "aae140_210", "aae140_310", "aae140_330", "aae140_320", "aae140_370", "aae140_340", "aae140_410", "aae140_510" ];
		var aae140str = "";
		for (var i = 0; i < ary.length; i++) {
			if (Base.getObj(ary[i]).checked) {

				if (Base.getObj(ary[i]).hide) {
					continue;
				}
				if (Base.getObj(ary[i]).disabled) {
					continue;
				}
				aae140str = aae140str + ary[i].substring(ary[i].indexOf("_") + 1) + ",";
			}

		}
		return aae140str.substring(0, aae140str.length - 1);
	}

	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有错误数据需要导出,请确认!", "warn");
		}
	}

	function qfts() {
		var cnt = Base.getValue("cnt");
		if (cnt > 2) {
			Base.alert("该单位存在【 " + cnt + " 】个月欠费");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>