<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>人员生存状态变更登记复核</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tld">
			<ta:button id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="c" onClick="closeWin();" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<ta:text id="fhjc" display="false" key="复核级次" />
			<ta:text id="aaz083" display="false" key="当事人征缴计划事件ID" />
			<ta:panel key="个人信息" cols="3" id="fltPerson" >
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
			</ta:panel>
			<ta:panel key="变更类型" cols="3" >
				<ta:selectInput key="生存状态变更类型" id="aae171" collection="AAE171" labelWidth="120" />
			</ta:panel>
			<ta:panel id="m_tab" key="变更信息" cols="3" >
				<ta:text id="aac053" key="死亡证明" labelWidth="120" />
				<ta:selectInput id="yac551" key="丧葬方式" collection="YAC551" labelWidth="120" />
				<ta:text id="aac051" key="火化证号" labelWidth="120" />
				<ta:text id="aac052" key="状态变更原因" labelWidth="120" />
				<ta:date id="aae138" key="变更日期" showSelectPanel="true" labelWidth="120" />
				<ta:text id="aae013_bak" key="备注" labelWidth="120" />
			</ta:panel>
			<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
		//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		selectType();
	});
	
	function selectType() {
		var aae171 = Base.getValue("aae171");
		//ac26不存在记录可以进行 死亡 失踪 被收监服刑
		if (aae171 != '0') {
			if (aae171 == '1') {
				Base.hideObj("aac053");
				Base.hideObj("yac551");
				Base.hideObj("aac051");
				Base.hideObj("aae013_bak");
				Base.showObj("aac052");
				Base.showObj("aae138");
			} else if (aae171 == '2' || aae171 == '3') {
				Base.showObj("aac053");
				Base.showObj("yac551");
				Base.showObj("aac051");
				Base.hideObj("aae013_bak");
				Base.showObj("aac052");
				Base.showObj("aae138");
			} else {
				Base.hideObj("aac053");
				Base.hideObj("yac551");
				Base.hideObj("aac051");
				Base.showObj("aae013_bak");
				Base.showObj("aac052");
				Base.showObj("aae138");
			}
		} else {
			Base.hideObj("m_tab");
		}
	}
	
	function submitData(){
		Base.submit("form1", "surviveUpdateCheckAction!toCheck.do");  //查询信息
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>