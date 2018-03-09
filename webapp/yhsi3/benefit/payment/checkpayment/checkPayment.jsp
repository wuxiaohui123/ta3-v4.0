<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>应付核定</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center">
			<ta:button id="queryBtn" icon="xui-icon-query" key="查询可参与核定单位" onClick="queryData()" asToolBarItem="true" />
			<ta:button id="saveBtn" icon="xui-icon-spotSave" hotKey="ctrl+S" key="应付核定" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="queryResultBtn" icon="xui-icon-query" hotKey="ctrl+Q" key="查询核定结果" onClick="queryResultData()" asToolBarItem="true" />
			<ta:button id="toBackBtn" icon="icon-undo" key="应付核定回退" onClick="toBack()" toolTip="勾选下面的做账结果后点击" asToolBarItem="true" />
			<ta:button id="zzBtn" icon="xui-icon-spotSave" hotKey="ctrl+Z" key="业务匝帐" onClick="zz()" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印" onClick="print()" asToolBarItem="true" display="false" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:hidden;" fit="true">
		<ta:panel id="flt_jbxx" cols="3" key="查询条件">
			<ta:selectInput id="aae140" key="险种类别" collection="AAE140" required="true" display="false" />
			<ta:text id="yab003" key="经办机构" display="false" />
			<ta:date id="aae002" key="应付核定期号" issue="true" showSelectPanel="true" required="true" />
			<ta:selectInput id="yaa020" key="特殊发放类别" required="true" display="false" readOnly="true" data="[{'id':'2','name':'定期待遇'}
				      ,{'id':'9','name':'医疗费'}
				      ,{'id':'10','name':'一次性待遇除医疗费'}
				      ]" />
			<ta:text id="aaz030" key="核定流水号" display="false" />
			<ta:text id="aaa005" key="应付核定支付计划是否合并标志" display="false" />
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
			<ta:tab id="tab1" key="可参与核定的单位">
				<ta:datagrid id="list1" haveSn="true" fit="true" border="true" selectType="checkbox">
					<ta:datagridItem id="aae002" key="做账期号" width="200" align="center" />
					<ta:datagridItem id="aab001" key="单位编码" width="200" align="center" />
					<ta:datagridItem id="aae044" key="单位名称" width="450" align="center" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="核定结果(双击查看单位人员明细)">
				<ta:datagrid id="list2" fit="true" border="true" selectType="checkbox" onRowSelect="fnSelectRowsByData" columnFilter="true" onRowDBClick="QueryAC82Info" haveSn="true">
					<ta:datagridItem id="aaz030" key="通知" hiddenColumn="true" width="120" align="center" sortable="true" />
					<ta:datagridItem id="aae002" key="做账期号" width="120" align="center" sortable="true" />
					<ta:datagridItem id="aab001" key="单位编码" width="120" align="center" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" width="250" align="center" sortable="true" />
					<ta:datagridItem id="aae019" key="总额" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" width="120" align="center" sortable="true" />
					<ta:datagridItem id="dq" key="定期待遇金额" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" width="120" align="center" sortable="true" />
					<ta:datagridItem id="ycx" key="一次性金额" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" width="120" align="center" sortable="true" />
					<ta:datagridItem id="bk" key="补扣金额" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" width="120" align="center" sortable="true" />
					<ta:datagridItem id="rs" key="人数" totals="sum" tatalsTextShow="false" dataType="Number" width="120" align="center" sortable="true" />
					<ta:datagridItem id="sqdqdy" key="上期定期待遇金额" formatter="convertState" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" width="120" align="center" sortable="true" />
					<ta:datagridItem id="sqrs" key="上期人数" formatter="convertState" totals="sum" tatalsTextShow="false" dataType="Number" width="120" align="center" sortable="true" />
					<ta:dataGridToolPaging url="checkPaymentAction!queryResult.do" showCount="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab3" key="错误信息">
				<ta:datagrid id="list3" fit="true" forceFitColumns="true" haveSn="true">
					<ta:datagridItem id="aab001" key="单位编码" align="center" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" />
					<ta:datagridItem id="aae013" key="说明" align="center" />
					<ta:datagridItem id="appcode" key="错误编号" align="center" />
					<ta:datagridItem id="errormsg" key="错误信息" showDetailed="true" align="center" />
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		var aae140 = Base.getValue("aae140");
		if (aae140 == "410") {
			Base.showObj("printBtn");
		}

	});

	//查询可参与做账单位
	function queryData() {
		Base.submit("form1", "checkPaymentAction!query.do");
	}

	//查询做账结果
	function queryResultData() {
		Base.submit("form1", "checkPaymentAction!queryResult.do");
	}

	//匝帐
	function zz() {
		Base.submit("form1", "checkPaymentAction!toZZ.do");
	}

	//支付
	function submitData() {
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		Base.submit("form1,list1", "checkPaymentAction!toSave.do", null, null, false, function(data) {
			if (aae140 == "110" && yab003 == "450401" && data.fieldData.rows != 0) {
				Base.alert("个人银行帐户信息发放方式有误,合计:" + data.fieldData.rows + "人");
			}
		});
	}

	//回退
	function toBack() {
		Base.submit("form1,list2", "checkPaymentAction!toBack.do");
	}

	function toBackD() {
		Base.submit("form1,list4", "checkPaymentAction!toBackD.do");
	}

	function fnSelectRowsByData(obj, event) {
		if (obj.column != undefined && obj.column.id == "_checkbox_selector") {
		} else {
			if (event.target.checked) {
				var aaz030 = obj.aaz030;
			} else {
				var aaz030 = 0;
			}
		}
	}

	function QueryAC82Info(e, rowdata) {
		Base.openWindow("queryinfoAC82", ">>发放明细", "checkPaymentAction!queryinfoAC82.do", {
			"dto['aaz030']" : rowdata.aaz030,
			"dto['aab001']" : rowdata.aab001
		}, "95%", "90%", null, null, true);

	}

	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}
	
	function print(){
        var rowdata = Base.getGridSelectedRows("list2");
        var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
			reportVals.push(rowdata[i].aab001);
		}					           
	    var aae002 = Base.getValue("aae002");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GScqdyjsb.raq&"
				+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aab001="+reportVals+";aae002="+aae002);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>