<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>matepaymentInfoAction</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;margin-right:5px;padding:0px;border:0px solid #99BBE8">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="printBtn1" icon="xui-icon-spotPrint" key="结算通知书（财务）[F]" onClick="print(1)" asToolBarItem="true" />
		<ta:button id="printBtn2" icon="xui-icon-spotPrint" key="结算通知书（稽核）[F]" onClick="print(2)" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<ta:text id="yab003" key="经办机构" display="false" />
		</ta:box>

		<ta:panel id="jstj" key="检索条件" cols="3" cssStyle="margin-left:0px;margin-right:0px" bodyStyle="margin:0px">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:date id="aae002" key="做账期号" issue="true" showSelectPanel="true" />
			<ta:text id="aab001" key="单位编号" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'))" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" />
			<ta:selectInput id="aae145" key="发放方式" collection="AAE145" onSelect="checkRequired" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" display="false" />
			<ta:selectInput id="yaf012" key="银行类别" collection="AAF002" display="false" />
			<ta:selectInput id="aaz009" key="代发机构" collection="AAZ009" display="false" />
			<ta:text id="aac003" key="姓名" bpopTipMsg="可输入身份证号、姓名、人员ID" onChange="sfwQueryUtilDY(1,'getAac001DY',Base.getValue('aac003'),null,Base.getValue('aae140'))" />
			<ta:text id="aac002" key="身份证编号" display="false" readOnly="true" />
			<ta:text id="aac001" key="个人编号" display="false" />
			<ta:selectInput id="yad169" key="发放对象" collection="YAD169" />
			<ta:selectInput id="aaa079" key="拨付方式" collection="AAA079" />
			<ta:selectInput id="aaa088" key="发放类型" collection="AAA088" />
			<ta:text id="zbr" key="制表人" display="false" />
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_e" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
			<ta:checkboxgroup id="aaa036" span="3" cols="5" data="[{'id':'500100','name':'生育津贴'},{'id':'500200','name':'生育医疗费'},
			{'id':'500300','name':'计划生育手术费'},{'id':'500700','name':'男职工看护津贴'},{'id':'500800','name':'计划生育手术津贴'},
			{'id':'500900','name':'生育难产医疗费'}]"></ta:checkboxgroup>
		</ta:panel>

		<ta:panel id="Ac82Panel" key="待遇核定信息" fit="true" bodyStyle="margin:0px">
			<ta:datagrid id="Ac82Grid" fit="true" columnFilter="true" haveSn="true" selectType="radio" onChecked="fnSetData">
				<ta:datagridItem id="aab001" key="单位编号" width="80px" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" width="160px" dataAlign="right" showDetailed="true">
				</ta:datagridItem>
				<ta:datagridItem id="aab019" key="单位类型" width="160px" dataAlign="right" showDetailed="true" collection="AAB019">
				</ta:datagridItem>
				<ta:datagridItem id="aaz220" key="应付计划事件ID" hiddenColumn="false">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="80px" hiddenColumn="false">
				</ta:datagridItem>

				<ta:datagridItem id="aac002" key="公民身份号码" width="180px" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="80px">
				</ta:datagridItem>
				<ta:datagridItem id="aae002" key="支付期号" width="80px" dataAlign="center">
				</ta:datagridItem>
				<ta:datagridItem id="aaa088" key="发放类型" collection="AAA088" width="120px"></ta:datagridItem>
				<ta:datagridItem id="aaa036" key="待遇类别" collection="AAA036" width="120px"></ta:datagridItem>
				<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" width="120px"></ta:datagridItem>
				<ta:datagridItem id="aae019" key="待遇金额" width="120" dataAlign="right" totals="sum">
				</ta:datagridItem>
				<ta:datagridItem id="aae117" key="支付标志" collection="AAE117" width="120px"></ta:datagridItem>
				<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" width="170px"></ta:datagridItem>
				<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" width="120px"></ta:datagridItem>
				<ta:datagridItem id="aaz031" key="拨付通知ID" width="180px" dataAlign="right">
				</ta:datagridItem>
				<ta:datagridItem id="yad019" key="失败原因" collection="AAE357">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, "ac01", "aac003", 850, 200, 7, '', 1, false);
		initializeSuggestFramework(2, null, "aab001", 700, 200, 3, '', 1, false);
	});
	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		var aaa036 = Base.getValue("aaa036");
		Base.setValue("aac001", null);
		Base.setValue("aac002", null);
		Base.submit("form1", "matepaymentInfoAction!query.do", null, null, false, function(data) {
			Base.setPanelTitle("Ac82Panel", "待遇核定信息,合计:" + data.fieldData.rows + "人次");
		});
	}

	function checkRequired() {
		var aae145 = Base.getValue("aae145");
		if (aae145 == "11") {
			Base.hideObj("aaf002");
			Base.showObj([ "yaf012", "aaz009" ]);
		} else if (aae145 == "12") {
			Base.hideObj([ "aaf002", "yaf012", "aaz009" ]);
		} else if (aae145 == "14") {
			Base.hideObj([ "aaf002", "aaz009" ]);
			Base.showObj("yaf012");
		} else if (aae145 == "21") {
			Base.hideObj([ "yaf012", "aaz009" ]);
			Base.showObj("aaf002");
		} else {
			alert("支付方式录入错误！");
			return false;
		}
	}

	function fnSetData(rowsdata, e) {
		Base.setValue("aac001", rowsdata.aac001);
	}
	
	//打印
	function print(num){
		var yab003=Base.getValue("yab003");
		var aac001=Base.getValue("aac001");//个人编号
		var aab001=Base.getValue("aab001");//单位编号
		var aae145=Base.getValue("aae145");//发放方式
		var aae002=Base.getValue("aae002");//做账期号
		var aaa036=Base.getValue("aaa036");//待遇类别
		var aaa088=Base.getValue("aaa088");//发放类型
		var aaa079=Base.getValue("aaa079");//拨付方式
		var yad169=Base.getValue("yad169");//发放对象	
		var aae140=Base.getValue("aae140");//险种类型
		var aae036_s=Base.getValue("aae036_s");
		var aae036_e=Base.getValue("aae036_e");
		var zbr = Base.getValue("zbr");//制表人
		if(aae036_s==''||aae036_e==''){
			Base.alert("请输入经办时间在打印！","error");
			return false;
		}
		if(num==1){
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYyljstzs.raq&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=yab003="+yab003+";aab001="+aab001
					+";aae145="+aae145+";aae002="+aae002
					+";aaa036="+aaa036+";aaa088="+aaa088
					+";aaa079="+aaa079+";yad169="+yad169
					+";aae140="+aae140+";aac001="+aac001
					+";aae036_s="+aae036_s+";aae036_e="+aae036_e+";zbr="+zbr);
		}else if(num == 2){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYyljstzs_2.raq&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=yab003="+yab003+";aab001="+aab001
					+";aae145="+aae145+";aae002="+aae002
					+";aaa036="+aaa036+";aaa088="+aaa088
					+";aaa079="+aaa079+";yad169="+yad169
					+";aae140="+aae140+";aac001="+aac001
					+";aae036_s="+aae036_s+";aae036_e="+aae036_e+";zbr="+zbr);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>