<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TransferInto</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" disabled="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="ctrl+P" asToolBarItem="true" disabled="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:text id="sysdate" key="系统时间" display="false" />
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<ta:date id="aae235_begin" key="死亡年月起" labelWidth="130" issue="true" showSelectPanel="true" readOnly="false" />
			<ta:date id="aae235_end" key="死亡年月止" labelWidth="130" issue="true" showSelectPanel="true" readOnly="false" />
			<ta:text id="aaz157" key="参保明细ID" display="false" />
			<ta:text id="aaz159" key="参保关系ID" display="false" />
			<ta:text id="yab003" key="经办所属机构" display="false" />
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="待核定人员信息">
				<ta:datagrid id="dhdLst" selectType="checkbox" height="180px" fit="true" border="true" forceFitColumns="true">
					<ta:datagridItem id="dwmc" key="单位名称" dataAlign="center" align="center" width="260px" />
					<ta:datagridItem id="aab001" key="单位编号" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="aac001" key="人员编号" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="aac002" key="身份证号" dataAlign="center" align="center" width="120px" hiddenColumn="true" />
					<ta:datagridItem id="aac003" key="姓名" dataAlign="center" align="center" width="80px" />
					<ta:datagridItem id="aae210" key="待遇享受开始年月" dataAlign="center" align="center" width="130px" />
					<ta:datagridItem id="aae235" key="死亡年月" dataAlign="center" align="center" width="130px" />
					<ta:datagridItem id="old_szf" key="死亡时计算丧葬费" dataAlign="center" align="center" width="130px" />
					<ta:datagridItem id="old_fxj" key="死亡时计算抚恤金" dataAlign="center" align="center" width="130px" />
					<ta:datagridItem id="old_gwbzj" key="死亡时计算工亡补助金" dataAlign="center" align="center" width="130px" hiddenColumn="true" />
					<ta:datagridItem id="aaz257" key="享受定期待遇人员ID" dataAlign="center" align="center" width="100px" hiddenColumn="true" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="已核定一次性待遇补差信息">
				<ta:datagrid id="yhdLst" height="180px" border="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="dwmc" key="单位名称" dataAlign="center" align="center" width="220px" />
					<ta:datagridItem id="aab001" key="单位编号" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="aac001" key="人员编号" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="aac002" key="身份证号" dataAlign="center" align="center" width="120px" hiddenColumn="true" />
					<ta:datagridItem id="aac003" key="姓名" dataAlign="center" align="center" width="80px" />
					<ta:datagridItem id="szf_bc" key="丧葬费补差金额" dataAlign="center" align="center" width="130px" totals="sum" />
					<ta:datagridItem id="fxj_bc" key="抚恤金补差金额" dataAlign="center" align="center" width="130px" totals="sum" />
					<ta:datagridItem id="fxj_gwbzjbc" key="工亡补助金补差金额" dataAlign="center" align="center" width="130px" totals="sum" hiddenColumn="true" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="核定出错信息">
				<ta:datagrid id="errLst" height="180px" border="true" forceFitColumns="true">
					<ta:datagridItem id="aab001" key="单位编号" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="aac001" key="人员编号" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="aac002" key="身份证号" dataAlign="center" align="center" width="120px" hiddenColumn="true" />
					<ta:datagridItem id="aac003" key="姓名" dataAlign="center" align="center" width="80px" />
					<ta:datagridItem id="appcode" key="错误代码" dataAlign="center" align="center" width="100px" />
					<ta:datagridItem id="errmsg" key="错误信息" dataAlign="center" align="center" width="200px" showDetailed="true" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<br />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
		var aae140 = Base.getValue("aae140");
		if(aae140 == '410'){
			Base.setGridColumnShow('dhdLst', 'old_gwbzj');	
			Base.setGridColumnShow('yhdLst', 'fxj_gwbzjbc');
		}
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
				if (g_Suggest != "") {
					fn_setPersonBaseInfoData();
				}
		}, true);
	}
	
	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function(){
			if (g_Suggest != "") {
				fn_setPersonBaseInfoData();
			}
		}, true);	
	}
	
	function query(){
		Base.submit("form1","oneTreDiffBatchAppAction!queryBaseInfo.do");
	}
	//RPC
	function convertState(row, cell, value, columnDef, dataContext){
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>"+value+"</div>";
	}	
	
	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
		}
	}

	function fn_ab01Info() {
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
		}
	}

	//保存经办信息
	function submitData() {
		var selectRows = Base.getGridSelectedRows("dhdLst");
		if (selectRows.length == 0) {
			alert("请勾选列表数据！");
			return false;
		}
		var prm = {};
		prm.dhdLst = Ta.util.obj2string(selectRows);
		Base.submit("form1", "oneTreDiffBatchAppAction!toSave.do", prm, null, null, function(data) {
			Base.setEnable("printBtn");
		});
	}

	//覆盖公用js方法，以便填充退休申报单位名称对应数据,如果不需要录入退休申报单位则将此方法直接删除既可。
	function fn_ab01Infotx() {
		Base.setValue("aab071", g_Suggest[1]);
		if (g_Suggest[0] == '' || g_Suggest[0] == null)
			Base.setValue("aab999_1", g_Suggest[1]);
		else
			Base.setValue("aab999_1", g_Suggest[0]);
		Base.setValue("aae044_1", g_Suggest[2]);
	}

	function print() {
		var yab003 = Base.getValue("yab003");
		var aae235_begin = Base.getValue("aae235_begin");
		var aae235_end = Base.getValue("aae235_end");
		var aae140 = Base.getValue("aae140");
		if (aae140 == "110") {
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyhd_ycxplbchd.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=yab003="+yab003+";aae140=110;aae235_begin="
					+aae235_begin+";aae235_end="+aae235_end);
							 
		 }
		 if(aae140 == "210"){
			 $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=j_dyhd_ycxplbchd.raq&" 
					 + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
					 + "serverPagedPrint=no&mirror=no&" + "paramString=yab003=" + yab003
					 + ";aae140=210;aae235_begin=" + aae235_begin + ";aae235_end=" + aae235_end);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>