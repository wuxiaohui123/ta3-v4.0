<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>黑名单撤销复核</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" asToolBarItem="true" />
			<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="fnClose();" asToolBarItem="true"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">			
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
			
			<ta:panel id="panel1" key="黑名单新增" cols="3" >
				<ta:selectInput id="aaa028" key="当事人类别" collection="AAA028" onSelect="onSelect" labelWidth="120" required="true" filter="1,2" reverseFilter="true"/> 
				<ta:box cols="2" id="personBox">
					<ta:text id="aac001" key="个人ID" required="true" maxLength="20" labelWidth="120" onChange="getAc01Info(fn_query())" columnWidth="0.9"/>
					<ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
				</ta:box>
				<ta:box cols="2" id="ogniBox">
					<ta:text id="aab001" key="单位ID" labelWidth="120" onChange="getAb01Info(fn_query())" columnWidth="0.9"/>
 					<ta:button id="ogniSmallBtn" key="?" onClick="showOgniWindow()" />
				</ta:box>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120"/>
				<ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" />
				<ta:selectInput id="aae140" key="险种" collection="AAE140" readOnly="true" labelWidth="120" />
				<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="120" />
				<ta:selectInput id="yke035" key="黑名单类型"  labelWidth="120"  collection="YKE035" required="true"/>				
				<ta:text id="yke036" key="封锁原因"  labelWidth="120"  span="2" />
				<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
				<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
				<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
				<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
				<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>			
				<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
				<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
				<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
				<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
				<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
				<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("action", '1,2', true);
		//fnSetRedBorder();
		
	});

	//保存页面信息
	function toSave(){
		Base.confirm('确定保存吗？',function(yes){
			if(yes){
				Base.submit('form1','addBlackListAuditAction!toSave.do');
			}
		});
	}
	//点击关闭
	function fnClose(){
		parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
