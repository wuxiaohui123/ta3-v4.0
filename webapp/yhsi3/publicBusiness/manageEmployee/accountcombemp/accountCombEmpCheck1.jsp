<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员多号合并复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="保存[S]" hotKey="S" icon="xui-icon-spotSave" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true" />
		</ta:toolbar>
		<ta:text id="yaz068" display="false" />
		<ta:form id="form1" fit="true">
			<ta:panel key="审核信息" height="85">
				<ta:box id="procInc">
					<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				</ta:box>
				<%@ include file="/yhsi3/comm/veritySuggestViewGg2.jsp"%>
			</ta:panel>
			<ta:text id="fhjc" display="false" key="复核级次" />
			<ta:panel id="pnlEmpBase" key="个人基本信息" cols="3" expanded="false" scalable="false">
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
			</ta:panel>
			<ta:tabs fit="true">
				<ta:tab key="合并信息" id="scanResult">
					<ta:datagrid id="aae140_c" fit="true" forceFitColumns="true" enableColumnMove="true" snWidth="30" haveSn="true">
						<ta:datagridItem id="aac001" key="个人编号" />
						<ta:datagridItem id="yae215" key="原个人编号" />
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" />
						<ta:datagridItem id="aae041" key="开始年月" />
						<ta:datagridItem id="aae042" key="终止年月" />
						<ta:datagridItem id="aaz159" key="人员参保关系ID" />
						<ta:datagridItem id="yac561" key="原人员参保关系ID" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="事件流程记录" id="caseTab">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
	});
	
	function submitData(){
		Base.submit("form1","accountCombEmpCheck1Action!toSave.do");  
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>