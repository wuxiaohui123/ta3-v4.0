<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>被征地农民认定(复核)</title>
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
				<ta:tab id="tab1" key="征地信息">
					<ta:panel key="个人信息" cols="3" id="fltPerson" scalable="false" expanded="false">
					    <ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="190" readOnly="true" required="true" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
						<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="190" readOnly="true"/>
						<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="190" readOnly="true" readOnly="true"/>
						<ta:selectInput id="aac058" key="证件类型" labelWidth="190" collection="aac058" readOnly="true" readOnly="true"/>
						<ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="190" readOnly="true"/>
						<ta:date id="aac006" key="出生日期" labelWidth="190" readOnly="true" readOnly="true"/>
					</ta:panel>
					<ta:panel key="征地信息" cols="3" id="fltLand" scalable="false" expanded="false">
					    <ta:text id="yac301" key="城市(县、镇)规划区内或外" required="true" labelWidth="190" maxLength="6" readOnly="true"/>
					    <ta:text id="yac300" key="征地项目或批次" required="true" labelWidth="190" maxLength="50" readOnly="true"/>
					    <ta:number id="yac302" key="征地后家庭人均耕地面积(亩)" required="true" labelWidth="190" min="0" precision="2" readOnly="true"/>
					    <ta:text id="aac010" key="户口所在地" required="true" labelWidth="190" maxLength="50" readOnly="true"/>
					    <ta:text id="aae005" key="联系电话" required="true" labelWidth="190" maxLength="25" readOnly="true"/>
					    <ta:text id="yac303" key="镇人民政府(街道办事处)" required="true" labelWidth="190" maxLength="50" readOnly="true"/>
					    <ta:text id="aae013_1" key="备注" labelWidth="190" maxLength="50" span="3" readOnly="true"/>
					</ta:panel>
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
		Base.submit("form1", "landAcquisitionPeasantCheckAction!toSave.do");  //保存信息
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>