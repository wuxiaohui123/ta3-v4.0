<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>征地时间认定(复核)</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" style="padding:0px;margin:0px" >
		<ta:pageloading />
		<ta:toolbar id="tld">
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S"  onClick="fnSave();"/>
			 <ta:toolbarItemSeperator/>
			 <ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="审核信息" cols="4" id="fltjb" expanded="false" scalable="false">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" reverseFilter="true" filter="1,2"/>
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013" span="2" key="审核意见" height="40px"/>
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="40px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
	        </ta:panel>
			<ta:text id="fhjc" display="false" key="复核级次"/>
			<ta:tabs id="tab" fit="true">
				<ta:tab id="tab1" key="征地时间">
					<ta:datagrid id="dgRDTime" fit="true" haveSn="true" forceFitColumns="true">
			        	<ta:datagridItem id="aac001" key="个人编号" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae041" key="开始时间" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae042" key="结束时间" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae201" key="月数" maxChart="12" align="center"></ta:datagridItem>
			        	<ta:datagridItem id="yae825" key="变更类型" maxChart="12" collection="YAE825" align="center"></ta:datagridItem>
			        </ta:datagrid>
				</ta:tab>
				<ta:tab id="tab2" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>

<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function closeWin(){
	    parent.Base.closeWindow("userwin");
	}
	
	//保存
	function fnSave(){
		Base.submit("form1", "landAcquisitionTimeCheckAction!toSave.do");  //保存信息
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>