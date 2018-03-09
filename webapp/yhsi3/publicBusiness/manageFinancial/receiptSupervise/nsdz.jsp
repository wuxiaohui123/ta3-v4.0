<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>check1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
		<ta:toolbar id="tlb">
		    <ta:buttonLayout align="center" span="3">
		       <ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
		       <ta:button id="btnprint1" key="打印确认汇总表" onClick="print1()" asToolBarItem="true" icon="xui-icon-spotPrint"/>
		       <ta:button id="btnprint2" key="打印确认明细表" onClick="print2()" asToolBarItem="true" icon="xui-icon-spotPrint" />
		       <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		    </ta:buttonLayout>
		</ta:toolbar>
	<ta:form id="form1"  fit="true">
		<ta:panel id="fld_emp" cols="3" key="查询条件">
			<ta:selectInput id="aaa121" key="业务类型" labelWidth="120" collection="aaa121" maxVisibleRows="300" value="D09001" display="false"/>
			<ta:date id="aae036b" key="经办开始时间" labelWidth="120" showSelectPanel="true"/>
			<ta:date id="aae036e" key="经办结束时间" labelWidth="120" showSelectPanel="true"/>
			<ta:selectInput id="aae011" key="经办人" labelWidth="120" collection="AAE011" />
			<ta:text id="aac003" key="参保人" labelWidth="120" bpopTipMsg="可输入公民身份号码、姓名、人员ID、单位编号、单位名称" display="false"/>
			<ta:text id="fhjc" key="当前复核级次" labelWidth="120" value="1" display="false"/>
			<ta:text id="yab003" key="经办机构" display="false" labelWidth="120"/>
			<ta:text id="dqjbr" key="当前经办人" display="false" labelWidth="120"/>
		</ta:panel> 
		<ta:tabs fit="true">
	   		<ta:tab key="已确认列表总数" id="ae02a1ListTab">
				<ta:panel id="ae02a1ListPanel"  bodyStyle="margin:0px" fit="true">
					<ta:datagrid id="listall" haveSn="true" fit="true" forceFitColumns="true" onRowDBClick="showCheckInfo" selectType="radio">
					   <ta:datagridItem id="dzbs" key="登帐笔数" align="center" collection="AAE011" maxChart="7"/>
					   <ta:datagridItem id="ywdjbs" key="业务单据笔数" align="center" maxChart="7"/>
					   <ta:datagridItem id="cwdjbs" key="财务单据笔数" align="center" maxChart="7"/>
					   <ta:datagridItem id="zje" key="总金额" align="center" maxChart="7"/>
					   <ta:datagridItem id="yaz767" key="确认ID" align="center"  maxChart="7"/>
					   <ta:datagridItem id="aae036" key="银行登帐确认时间" align="center" maxChart="7"/> 
					   <ta:datagridItem id="aae011" key="银行经办人" align="center" maxChart="7" collection="AAE011"/>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
//双击查看经办明细
function showCheckInfo(e,rowdata){
    var title  = "登帐确认事件："+rowdata.yaz767 + " 的详细信息";//标题描述
	//url = "/lysb/process/pensionbenefit/approve/administrativeapproval/administrativeApprovalCheck1Action!execute.do";
    Base.openWindow('userwin', title, myPath()+"/process/publicBusiness/manageFinancial/receiptSupervise/nsDzAction!showCheckInfo.do",
                     {"dto['yaz767']":rowdata.yaz767}, "95%", "90%",null,queryData,true);
}

function queryData(){
	Base.submit("form1","nsDzAction!queryCheck1List.do",null,null,null,function(data){
		});
}
function submitData(){
	var selectRows = Base.getGridSelectedRows("list") ;
	var prm ={};
	prm.d2List= Ta.util.obj2string(selectRows);

	Base.submit("form1","nsDzAction!toSave.do",prm,null,null,function(){
	});
}

function print1(){
	var rowdata = Base.getGridSelectedRows("listall"); 
	if(rowdata == null || rowdata == ''){
		alert("请选择要打印的数据!");
		return;
	}
	var yaz767 = rowdata[0].yaz767;
	var yab003 = Base.getValue("yab003");
	var dqjbr  = Base.getValue("dqjbr");
	var fileName="bsqrhzb.raq";
	var prm = "prm_yab003="+yab003+";prm_yaz767="+yaz767+";prm_dqjbr="+dqjbr; 
	fnPrintComm(fileName,prm);
}

function print2(){
	var rowdata = Base.getGridSelectedRows("listall"); 
	if(rowdata == null || rowdata == ''){
		alert("请选择要打印的数据!");
		return;
	}
	var yaz767 = rowdata[0].yaz767;
	var yab003 = Base.getValue("yab003");
	var dqjbr  = Base.getValue("dqjbr");
	var fileName="bsqrmxb.raq";
	var prm = "prm_yab003="+yab003+";prm_yaz767="+yaz767+";prm_dqjbr="+dqjbr; 
	fnPrintComm(fileName,prm);
}
//页面布局控制
$(document).ready(function() {
	$("body").taLayout();
	$("caption.tableView-title").css("margin-bottom","10px");
	$("div.slick-pager-nav-dis").hide();
	$("span.slick-pager-settings").css("float","left");

});
</script>
<%@ include file="/ta/incfooter.jsp"%>