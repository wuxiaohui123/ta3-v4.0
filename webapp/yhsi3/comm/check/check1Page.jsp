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
		       <ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
		       <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		    </ta:buttonLayout>
		</ta:toolbar>
	<ta:form id="form1"  fit="true">
		<ta:panel id="fld_emp" cols="3" key="查询条件">
			<ta:selectInput id="aaa121" key="业务类型" labelWidth="120" maxVisibleRows="300" collection="AAA121"/>
			<ta:date id="aae036b" key="经办开始时间" labelWidth="120" showSelectPanel="true"/>
			<ta:date id="aae036e" key="经办结束时间" labelWidth="120" showSelectPanel="true"/>
			<ta:selectInput id="aae011" key="经办人" labelWidth="120" collection="AAE011" />
			<ta:text id="aac003" key="当事人名称" labelWidth="120" bpopTipMsg="可输入公民身份号码、姓名、人员ID、单位编号、单位名称"/>
			<ta:text id="fhjc" key="当前复核级次" labelWidth="120" value="1" display="false"/>
		</ta:panel> 
		<ta:panel id="fld_emp1" cols="3" key="审核信息">
			<ta:selectInput id="action" key="审核标志" required="true" labelWidth="120" collection="ACTION" value="1" filter="0,3"/>
		</ta:panel> 
		<ta:tabs fit="true">
	   		<ta:tab key="待审核信息" id="ae02a1ListTab">
				<ta:panel id="ae02a1ListPanel" key="待审核信息（双击某行数据弹出单个复核页面或者勾选同一业务类型进行批量复核）" bodyStyle="margin:0px" fit="true">
					<ta:datagrid id="ae02a1ListGrid" haveSn="true" fit="true" forceFitColumns="true" selectType="checkbox" onRowDBClick="showCheckInfo">
					   <ta:datagridItem id="yae013" key="功能目标地址" dataAlign="center" align="center"  hiddenColumn="true"/>
					   <ta:datagridItem id="aae419" key="级次" dataAlign="center" align="center" hiddenColumn="true"/>
					   <ta:datagridItem id="aaz002" key="业务日志编号" maxChart="10"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="action_" key="业务来源" maxChart="8"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="aaa121" key="业务类型" collection="AAA121" maxChart="18"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="aaz010" key="当事人ID" align="center" dataAlign="center"/>
					   <ta:datagridItem id="aac003" key="当事人名称" maxChart="16"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="aae036" key="经办时间" maxChart="12"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="aae011" key="经办人" collection="AAE011" maxChart="6"  align="center" dataAlign="center"/>
					   <ta:datagridItem id="aae013" key="备注" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="aae416" key="复核总级次" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="aae016" key="复核标志" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="aae417" key="申请业务日志ID" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="yae248" key="数据来源" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="yae098" key="业务流水号字段CODE" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="yae099" key="业务流水号" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="yae070" key="过程名" align="center" dataAlign="center" hiddenColumn="true"/>
					   <ta:datagridItem id="yae071" key="包名" align="center" dataAlign="center" hiddenColumn="true"/>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="错误信息" id="errorTab">
				<ta:panel id="errorPanel" key="错误信息列表" bodyStyle="margin:0px" fit="true">
					<ta:datagrid id="errorDataGrid" haveSn="true"  forceFitColumns="true" fit="true">
					   <ta:datagridItem id="aaz002" key="业务日志编号" maxChart="8" dataAlign="center" align="center"/>
					   <ta:datagridItem id="aaa121" key="业务类型" collection="AAA121" maxChart="12" dataAlign="center" align="center"/>
					   <ta:datagridItem id="aac003" key="当事人" maxChart="10"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="aae036" key="经办时间" maxChart="10"  dataAlign="center" align="center"/>
					   <ta:datagridItem id="aae011" key="经办人" collection="AAE011" maxChart="4"  align="center" dataAlign="center"/>
					   <ta:datagridItem id="errMsg" key="错误消息" maxChart="20"  align="center" dataAlign="center" showDetailed="true"/>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
//页面布局控制
$(document).ready(function() {
	$("body").taLayout();
	$("caption.tableView-title").css("margin-bottom","10px");
	$("div.slick-pager-nav-dis").hide();
	$("span.slick-pager-settings").css("float","left");

});
//双击查看经办明细
function showCheckInfo(e,rowdata){
	//获取码值描述
	var rdata = rowdata.grid.getOptions().collectionsDataArrayObject.aaa121;
	var descp = null;
    for (var i = 0 ; i < rdata.length; i++) {
		if (rowdata.aaa121 == rdata[i].id){
			descp = rdata[i].name
			break;
		}
	}
    var title  = rowdata.aac003 + "-" + descp;//标题描述
    var yae013 = rowdata.yae013;
    var aae419 = rowdata.aae419;
	if(yae013 == null || yae013 == ""){
		alert("请配置 业务审批级次对应地址表 AAA4！");
		return false;
	}
	if(aae419 == null || aae419 == ""){
		alert("请配置 业务审批级次对应地址表 AAA4！");
		return false;
	}
	//url = "/lysb/process/pensionbenefit/approve/administrativeapproval/administrativeApprovalCheck1Action!execute.do";
    Base.openWindow('userwin', title+"经办信息", '<%=basePath%>'+yae013+'?fhjc='+Base.getValue("fhjc"),
                     {"dto['aaz002']":rowdata.aaz002,"dto['aaz010']":rowdata.aaz010,"dto['aaa121']":rowdata.aaa121,"dto['fhjc']":Base.getValue("fhjc")}, "95%", "90%",null,queryData,true);
}
function queryData(){
	Base.submit("form1","check1PageAction!queryCheck1List.do",null,null,null,function(data){
		});
}
function submitData(){
	var selectRows = Base.getGridSelectedRows("ae02a1ListGrid") ;
	var action = Base.getValue("action");
    var tempAaa121 = "";
    var vAaa121 = "";
	if(selectRows.length == 0){
		alert("请选择需要复核的数据！");
		return false;
	}
	for (var i = 0 ; i < selectRows.length; i++) 
	{
		if(i == 0) tempAaa121 = selectRows[0].aaa121;
		if(i > 0)
		{
			vAaa121 = selectRows[i].aaa121;
			if(vAaa121 != tempAaa121)
			{
				alert("此功能只支持同一业务批量复核，请确认选择的是同一业务类型！");
				return false;
			}
		}
		if(action=='3'){
		    var aaa121 = selectRows[i].aaa121;
		    if(aaa121=='A20057'||aaa121=='A20059'){
		       Base.alert("单位预缴核定,单位应收核定不能打回！");
		       return;
		    }
		}
	}
	var prm ={};
	prm.d2List= Ta.util.obj2string(selectRows);

	Base.submit("form1","check1PageAction!toSave.do",prm,null,null,function(){
	});
}
</script>
<%@ include file="/ta/incfooter.jsp"%>