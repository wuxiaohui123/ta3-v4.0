<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
	<ta:pageloading />
		<ta:toolbar id="tlb">
			 <ta:buttonLayout align="center">
			    <ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印" onClick="print()" asToolBarItem="true"/>
			    <ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('queryinfoAC82');" asToolBarItem="true" />
			  </ta:buttonLayout>
 	    </ta:toolbar>
		<ta:form id="form" fit="true">
			<ta:panel id="PanelAC82" key="发放明细(双击查看待遇项目明细)" fit="true" >
				<ta:datagrid id="detailGrid" fit="true" haveSn="true" forceFitColumns="true" onRowDBClick="QueryAC83Info" columnFilter="true" selectType="checkbox">
					<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="center" hiddenColumn="false" sortable="true" />
					<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aac001" key="人员编号" align="center" dataAlign="center"  sortable="true" />
					<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae019" key="金额" align="center" dataAlign="center" sortable="true" totals="sum"/>
					<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" align="center" dataAlign="center" sortable="true" />
					<ta:datagridItem id="aae010" key="银行账号" collection="AAE010" align="center" dataAlign="center"  sortable="true" />
					<ta:datagridItem id="aaz220" key="人员应付计划事件ID" align="center" dataAlign="center"  sortable="true" /> 
				    <ta:dataGridToolPaging url="" pageSize="9999" selectExpButtons="1" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function fnClose(){
		parent.Base.closeWindow("queryinfoAC82");
	}
	
	function clearData(){
		Base.clearGridDirty("detailGrid");
	}
	
	function QueryAC83Info(e, rowdata){
		Base.openWindow("queryinfoAC83ByAae003", ">>发放信息","checkPaymentAction!queryinfoAC83GroupByAae003.do", {
			"dto['aaz220']" : rowdata.aaz220,
			"dto['aac001']" : rowdata.aac001
			}, "95%", "90%", null, null, true);
		
	}

function print(){
	    var datas = Base.getGridData("detailGrid");
	    var aab001 = datas[0].aab001;
	    var aae002 = datas[0].aae002;
	    var data = Base.getGridSelectedRows("detailGrid");
	    var reportVals = new Array();
		for(var i=0;i < data.length;i++){
			reportVals.push(data[i].aac001);
		}	
	   
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GScqdyjsb_gr.raq&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=aab001="+aab001+";aae002="+aae002+";aac001="+reportVals);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>