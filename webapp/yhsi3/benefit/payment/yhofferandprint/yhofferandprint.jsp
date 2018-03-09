<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报盘打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout id="button" align="center">
			<ta:button id="queryBtn" icon="xui-icon-query" hotKey="Q" key="查询[Q]" onClick="query()" asToolBarItem="true" />
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="生成报盘文件" onClick="fn_toSave()" asToolBarItem="true" />
			<ta:button id="bptyBtn" icon="icon-arrow_down" key="导出报盘文件" onClick="fn_bptygs()" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true" enctype="multipart/form-data" methord="post" cssStyle="overflow:auto">
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		<!-- *********************************报盘界面****************************-->
		<ta:panel id="fieldset2" cols="3" key="报盘查询条件">
			<ta:date id="aae002" key="做账期号" issue="true" showSelectPanel="true" required="true" labelWidth="130" />
			<ta:selectInput id="yad169" key="支付对象" collection="yad169" filter="31" labelWidth="130" />
			<ta:selectInput id="aae145" key="发放方式" collection="aae145" filter="14,11" reverseFilter="true" labelWidth="130" />
			<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="130" onChange="fn_setAaz085" onSelect="fn_setAaz085" />
			<ta:text id="aaz085" key="拨付对象ID" bpopTipMsg="可输入单位编号,个人编号,代发机构编号" labelWidth="130" display="false" />
			<ta:selectInput id="yab003" key="经办机构" collection="YAB003" display="false" />
			<ta:selectInput id="aae011" key="经办人" collection="AAE011" display="false" />
		</ta:panel>
		<ta:tabs height="400">
			<ta:tab id="tab1" key="未生成报盘信息" cssStyle="overflow:auto;">
				<ta:datagrid id="list1" height="400" border="true" forceFitColumns="true" selectType="checkbox" haveSn="true">
					<!--   onRowClick="showlist2">-->
					<ta:datagridItem id="aae140" key="险种类别" collection="aae140" hiddenColumn="false" align="center" />
					<ta:datagridItem id="aaz031" key="拨付通知ID" align="center" width="90" />
					<ta:datagridItem id="aaa079" key="拨付方式" collection="aaa079" sortable="true" width="100" align="center" />
					<ta:datagridItem id="yad169" key="支付对象" collection="yad169" sortable="true" width="80" align="center" />
					<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" sortable="true" width="80" align="center" />
					<ta:datagridItem id="aaz085" key="拨付对象当事人ID" align="center" width="100" />
					<ta:datagridItem id="aab069" key="拨付对象当事人名称" width="300" align="center" />
					<ta:datagridItem id="yad006" key="财务处理标志" collection="YAD006" sortable="true" width="80" align="center" />
					<ta:datagridItem id="yae002" key="人数" width="70" dataAlign="right" align="center" />
					<ta:datagridItem id="aae169" key="金额" totals="sum" dataType="Number" tatalsTextShow="false" dataAlign="right" align="center" width="120" />
					<ta:datagridItem id="aae011" key="经办人" collection="aae011" align="center" width="80" />
					<ta:datagridItem id="aae036" key="经办时间" dataAlign="center" align="center" width="150" />
					<ta:dataGridToolPaging url="yhofferandprintAction!query.do" showCount="false" showExcel="false"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="报盘文件信息" cssStyle="overflow:auto;">
				<ta:datagrid id="list2" height="400" forceFitColumns="true" selectType="radio" haveSn="true">
					<ta:datagridItem id="aaz031" key="拨付通知ID" align="center" width="90" />
					<ta:datagridItem id="yae602" key="报盘事件ID" hiddenColumn="fasle"></ta:datagridItem>
					<ta:datagridItem id="yae025" key="报盘批次号" hiddenColumn="fasle"></ta:datagridItem>
					<ta:datagridItem id="yae594" key="报盘文件名" align="center" />
					<ta:datagridItem id="yae202" key="文件总序号" align="center" dataAlign="right"></ta:datagridItem>
					<ta:datagridItem id="yad169" key="支付对象" collection="yad169" sortable="true" width="100" align="center" />
					<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" sortable="true" width="100" align="center" />
					<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" sortable="true" width="100" align="center" />
					<ta:datagridItem id="dpcs" key="导盘次数" align="center" />
					<ta:dataGridToolPaging url="yhofferandprintAction!query.do" showCount="false" showExcel="false"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
		<ta:box>
			<ta:panel id="dbkhh" key="社保开户行信息" cols="3" cssStyle="display:none">
				<ta:text id="yaf010" key="社保机构银行帐号ID" required="true" labelWidth="140" maxLength="40" onChange="fnBankXX()" />
				<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
				<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" maxLength="60" readOnly="true" />
				<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" maxLength="60" readOnly="true" />
				<ta:text id="yad158" key="征集套账类型——dataGrid" display="false" value="0" />
			</ta:panel>
			<ta:button id="ltxbfqk" key="离退休费用拨付情况表" icon="xui-icon-spotPrint" onClick="printRaq('1')" asToolBarItem="false" display="false" />
			<ta:button id="yhdfqd" key="各县（市）银行代发养老金清单" icon="xui-icon-spotPrint" onClick="printRaq('2')" asToolBarItem="false" display="false" />
			<ta:button id="ffqkb" key="发放情况表" icon="xui-icon-spotPrint" onClick="printRaq('3')" asToolBarItem="false" />
			<ta:button id="yhthcfqd" key="打印银行退回重发清单" icon="xui-icon-spotPrint" onClick="printRaq('4')" asToolBarItem="false" display="false" />
			<ta:button id="jbylbxdyhdzftjb" key="基本养老保险待遇核定支付统计表" icon="xui-icon-spotPrint" onClick="printRaq('11')" asToolBarItem="false" display="false" />
			<ta:button id="fyjstzs" key="费用结算通知书" icon="xui-icon-spotPrint" onClick="printRaq('fyjstzs')" asToolBarItem="false" display="false" />
		</ta:box>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fn_peymentdy();
		initializeSuggestFramework(3, null, 'yaf010', 600, 100, 4, fnSelect3, 0, false);
	});

	//查询抛盘信息
	function query() {
		Base.submit("form1", "yhofferandprintAction!query.do");
	}

	function fn_toSave() {
		Base.submit("form1,list1", "yhofferandprintAction!toSave.do");
	}

	function exportRAR(url) {
		location.href = url;
	}

	function fn_bptygs() {
		var aae140 = Base.getValue("aae140");
		var rowdata = Base.getGridSelectedRows("list2");
		if (rowdata == '' || rowdata == null) {
			alert("请选择需要报盘的数据！");
			return false;
		}
		var yae602 = rowdata[0].yae602;
		var prm = {"dto['yae602']" : yae602};
		Base.submit("", "yhofferandprintAction!toSaveCs.do", prm, null, null, function(data) {
			fn_bptygs_exp();
		});
	}

	function fn_bptygs_exp() {
		var aae140 = Base.getValue("aae140");
		var rowdata = Base.getGridSelectedRows("list2");
		if (rowdata == '' || rowdata == null) {
			alert("请选择需要报盘的数据！");
		} else {
			var yae602 = rowdata[0].yae602;
			var yae594 = rowdata[0].yae594;
			var aaf002 = rowdata[0].aaf002;
			var yae025 = rowdata[0].yae025;
			var yad169 = rowdata[0].yad169;
			var mc = rowdata[0].yae594;
			var len = mc.length;
			var bbmc = mc.substr(0, len - 4);
			var yae594 = encodeURI(encodeURI(bbmc));
			if (aaf002 == "95559") {
				$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=3&file=jtyhbpwj.raq&"
						+"srcType=file&columns=0&saveAsName="+yae594+"&excelFormat=2003&"
	    				+"paramString=yae602="+yae602);
	        }else if(aaf002=="95580"){
	        	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=3&file=yzyhbpwj.raq&"
	        			+"srcType=file&columns=0&saveAsName="+yae594+"&excelFormat=2003&"
	    				+"paramString=yae602="+yae602);
	        }else{
	    	    location.href="<%=path%>/process/benefit/payment/yhofferandprint/yhofferandprintAction!bpWZ.do?dto.yae602="+yae602+"&dto.aaf002="+aaf002+"&dto.yae025="+yae025+"&dto.yad169="+yad169;   
	        }
	    }
	}
	
	function showlist2(e, rowdata){
		Base.submit("fieldset2","<%=path%>/process/benefit/payment/yhofferandprint/action/YhofferandprintAction!queryList.do",{"dto['aae140']":rowdata.aae140,"dto['aaz031']":rowdata.aaz031},null,function(data){
			null;
		});
	}
	
	function fnBankXX(){
		  suggestQuery(3,myPath()+"/process/comm/suggestFrameworkAction!getBankInjb_JJSZ.do",{"dto['jstj']":Base.getValue('yaf010'),"dto['yad158']":Base.getValue('yad158')});
	}
	
	//银行信息
	function fnSelect3(){
	    Base.setValue("yaf010",g_Suggest[5]);
		Base.setValue("yae597",g_Suggest[0]);
		Base.setValue("aae009",g_Suggest[1]);
		Base.setValue("aae010",g_Suggest[2]);
		Base.focus("aaa158");
	}
	
	function printRaq(value){	   
		var aae002 = Base.getValue("aae002");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var yaf012 = Base.getValue("yaf012");
		var aae011 = Base.getValue("aae011");
		var yae597 = Base.getValue("yae597");
		var aae010 = Base.getValue("aae010");
		var aae009 = Base.getValue("aae009");
		var data = Base.getGridSelectedRows("list2");
	    var aaz031 = data[0].aaz031;
		if (value == "1"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ltxfy_paymentinfo.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aae002="+aae002+";aae140="+aae140
					+";yab003="+yab003+";yaf012="+yaf012+";aae011="+aae011);	
		}else if (value == "2"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=qxyhdfyljqd_fiscalinfo.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aae002="+aae002+";aae140="+aae140+";yaf012="+yaf012);
		}else if (value == "3"){
		    if (data == '' || data == null){
		        alert("请选择需要打印的拨付通知单！");
		     }
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=qylxgbjt_paymentinfo.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031+";aae140="+aae140);
		}else if (value == "4"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=repayment_bankinfo.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aae002="+aae002+";aae140="+aae140+";yab003="+yab003+";yaf012="+yaf012);
		}else if (value == "11"){
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_tjbb_jbyljhdzf.raq&"
	        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=yab003="+yab003+";aae002="+aae002+";aae011="+aae011);
		}else if (value == "fyjstzs"){
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSyljstzs_BF.raq&"
	        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}
	}
	
	function fn_peymentdy(){
		var aae140 = Base.getValue("aae140");
		if (aae140 == "110"){
		}else if (aae140 == "210"){
			Base.hideObj("ltxbfqk,yhdfqd,gxbtffqkb,yhthcfqd,yhdfyljqd,ylbxzfhzspb,jbylbxdyhdzftjb");
		}else{
		}
	}
		
	function fn_setAaz085(value, key){
	   return false;
	   var yaf012 = Base.getValue("yaf012");
	   var yaf012_desc = Base.getValue("yaf012_desc");
	   if(yaf012_desc == ''){
		   yaf012 = '';
	   }
	   Base.setValue("aaz085", yaf012);
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>