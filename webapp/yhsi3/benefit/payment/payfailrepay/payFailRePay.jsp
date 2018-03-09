<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>失败帐重发</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="queryBtn" icon="xui-icon-query" hotKey="ctrl+Q" key="查询失败帐信息[Q]" asToolBarItem="true" onClick="queryData()" />
			<ta:button id="queryResultBtn" icon="xui-icon-query" key="查询支付结果" onClick="queryResultData()" asToolBarItem="true" />
			<ta:button id="saveBtn" icon="xui-icon-spotSave" hotKey="ctrl+S" key="重新支付[S]" asToolBarItem="true" onClick="submitData()" />
			<ta:button id="toBackBtn" icon="icon-undo" key="回退" onClick="toBack()" toolTip="勾选下面的做账结果后点击" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="flt_jbxx" cols="3" key="查询条件">
			<ta:date id="aae002" key="支付失败期号" issue="true" showSelectPanel="true" required="true" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="130" />
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:text id="yab003" key="经办机构" display="false" />
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
			<ta:tab id="tab1" key="发放失败信息">
				<ta:datagrid id="list1" haveSn="true" fit="true" selectType="checkbox" forceFitColumns="true" columnFilter="true">
					<ta:datagridItem id="aab001" key="单位编号" width="120" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aac001" key="人员编号" width="120" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aac003" key="姓名" width="100" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aac002" key="身份证号" width="160" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae002" key="做账期号" dataAlign="center" align="center" width="100" sortable="true" />
					<ta:datagridItem id="aae140" key="险种类型" collection="aae140" hiddenColumn="false" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae019" key="金额" totals="sum" align="center" dataType="Number" tatalsTextShow="false" dataAlign="right" width="100" sortable="true" />
					<ta:datagridItem id="aae117" key="支付标志" collection="aae117" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aaa079" key="拨付方式" collection="aaa079" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aae136" key="领取人证件号码" width="150" align="center" dataAlign="center" sortable="true" hiddenColumn="true" />
					<ta:datagridItem id="yad169" key="拨付对象" collection="YAD169" width="70" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" width="70" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="yhbh" key="银行名称" width="180" collection="AAF002" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aaf002" key="银行编码" collection="aaf002" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aae009" key="户名" width="100" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae010" key="银行账号" dataAlign="center" align="center" width="220" showDetailed="true" sortable="true" />
					<ta:datagridItem id="aae037" key="支付人员类别" collection="aae037" width="110" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aad002" key="财务登帐时间" width="110" hiddenColumn="false" dataAlign="center" align="center" sortable="true" />
					<ta:datagridItem id="aad007" key="财务到账日期" width="110" hiddenColumn="false" dataAlign="center" align="center" sortable="true" />
					<ta:datagridItem id="yad019" key="失败原因" align="center" collection="YAD019" dataAlign="center" showDetailed="true" sortable="true" />
					<ta:datagridItem id="yab003" key="经办机构" collection="yab003" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aae011" key="经办人" hiddenColumn="false" align="center" sortable="true" />
					<ta:datagridItem id="aaz220" key="人员应付计划事件ID" hiddenColumn="false" align="center" sortable="true" />
					<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" width="110" sortable="true" />
					<ta:dataGridToolPaging url="" pageSize="9999" showExcel="true" showCount="true" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="支付结果(双击查看发放明细)">
				<ta:datagrid id="list2" fit="true" selectType="checkbox" haveSn="true" forceFitColumns="true" heightDiff="50" onRowDBClick="QueryAC82A1Info">
					<ta:datagridItem id="aaz031" key="拨付通知单ID" align="center" width="60" dataAlign="center" />
					<ta:datagridItem id="aae002" key="做账期号" align="center" width="40" dataAlign="center" />
					<ta:datagridItem id="aaa079" key="拨付方式" collection="aaa079" dataAlign="center" align="center" width="60" />
					<ta:datagridItem id="aaz085" key="拨付对象当事人ID" align="center" dataAlign="center" width="60" />
					<ta:datagridItem id="aab069" key="拨付对象当事人名称" align="center" />
					<ta:datagridItem id="yae002" key="支付人数" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" align="center" width="45" />
					<ta:datagridItem id="aae169" key="拨付总额" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" align="center" width="60" />
					<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" align="center" dataAlign="center" width="70" />
					<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" align="center" dataAlign="center" width="50" />
					<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="90" />
				</ta:datagrid>
				<ta:panel height="50">
					<ta:button id="ylbxzfhzspb" key="打印汇总审批表" icon="xui-icon-spotPrint" onClick="printRaq2('1')" asToolBarItem="false" />
					<ta:button id="yhdfyljqd" key="打印银行代发清单(个人)" icon="xui-icon-spotPrint" onClick="printRaq('1')" asToolBarItem="false" />
					<ta:button id="gxbtffqkb" key="打印单位拨付清单(单位)" icon="xui-icon-spotPrint" onClick="printRaq('0')" asToolBarItem="false" />
					<ta:button id="fyjstzs" key="费用结算通知书" icon="xui-icon-spotPrint" onClick="printTzs()" asToolBarItem="false" display="false" />
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab3" key="失败信息">
				<ta:datagrid id="list3" fit="true" haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="aaz031" key="拨付通知单ID" align="center" />
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
	});

	function fn_setKayname(key, val) {
		var aae140 = Base.getValue("aae140");
		if (aae140 == "150") {
			fn_SetKey("aab001", "村编号：");
			fn_SetKey("aae044", "村名称：");
			fn_SetKey("aae002", "村最大做账期号：");

		} else {
			fn_SetKey("aab001", "单位编号：");
			fn_SetKey("aae044", "单位名称：");
		}
	}

	//查询可参与做账单位
	function queryData() {
		Base.submit("form1", "payFailRePayAction!query.do");
	}

	//查询做账结果
	function queryResultData() {
		Base.submit("form1", "payFailRePayAction!queryResult.do");
	}

	//支付
	function zz() {
		Base.submit("form1", "payFailRePayAction!toZZ.do");
	}

	//支付
	function submitData() {
		Base.submit("form1,list1", "payFailRePayAction!toSave.do");
	}

	//回退
	function toBack() {
		var rowdata = Base.getGridSelectedRows("list2");
		Base.submit("form1,list2", "payFailRePayAction!toBack.do");
	}

	function toBackD() {
		Base.submit("form1,list4", "payFailRePayAction!toBackD.do");
	}

	function toQueryD() {
		Base.submit("form1,list4", "payFailRePayAction!queryD.do");
	}

	function toCreateD() {
		Base.submit("form1,list4", "payFailRePayAction!toCreateD.do");
	}
	
	//打印银行代发清单
	function printRaq(value) {
		var rowdata = Base.getGridSelectedRows("list2");
		var reportVals = new Array();
		for (var i = 0; i < rowdata.length; i++) {
			reportVals.push(rowdata[i].aaz031);
		}
		if (value == "0") {
			var selectNum = eval(rowdata).length;
			if (selectNum > 1) {
				Base.alert("只能选择一条支付结果数据！", "warn");
				return;
			}
			if (rowdata == '' || rowdata == null) {
				Base.alert("请选择一条支付结果数据！", "warn");
				return;
			}
			var aaz031 = rowdata[0].aaz031;
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=qylxgbjt_paymentinfo_yhcf.raq&"
				    +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}else if(value == "1"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=yhdfylj_qdcf.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+reportVals);
		}
	}

	//打印汇总审批表
	function printRaq2(value){	   
		var aae002 = Base.getValue("aae002");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var rowdata=Base.getGridSelectedRows("list2");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
		  	  reportVals.push(rowdata[i].aaz031);
	    }
		
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ylbxj_penymetspb_cf.raq&"+
				"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aae002="+aae002+";aae140="+aae140+";yab003="+yab003+";aaz031="+reportVals);	
	}
	
	function QueryAC82A1Info(e, rowdata){
		Base.openWindow("queryinfoAC82A1", ">>发放明细","payFailRePayAction!queryinfoAC82A1.do", {
			"dto['aaz031']" : rowdata.aaz031
			}, "95%", "90%", null, null, true);
		
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>