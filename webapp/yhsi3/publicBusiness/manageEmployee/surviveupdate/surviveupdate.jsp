<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>人员生存状态变更登记</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tld">
			<ta:button key="查询[Q]" id="queryBtn" icon="xui-icon-query" hotKey="q" asToolBarItem="true" onClick="fn_queryInfoPerson();" />
			<ta:button key="保存[S]" icon="xui-icon-spotSave" hotKey="s" asToolBarItem="true" disabled="false" id="saveBtn" onClick="submitData();" />
			<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="r" asToolBarItem="true" id="resetBtn" type="resetPage" />
			<ta:button key="关闭[C]" icon="xui-icon-spotClose" hotKey="c" id="colseBtn" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:text id="yae248" key="数据来源" readOnly="true" display="false" value="1" />
			<ta:text id="aaz002" key="业务日志ID" display="false" />
			<ta:text id="type" key="人员状态类型" display="false" />
			<ta:text id="exist" key="是否存在记录" display="false" />
			<ta:panel key="个人信息" cols="3" id="fltPerson" >
				<ta:box cols="2">
					<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC();"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();"/>
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
				<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="120" readOnly="true" />
				<ta:selectInput id="aac058" key="证件类型" labelWidth="120" collection="aac058" readOnly="true" />
				<ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="120" />
				<ta:date id="aac006" key="出生日期" labelWidth="120" readOnly="true" />
				<ta:date id="yab139" key="参保所属机构" display="false" />
			</ta:panel>
			<ta:panel id="fltUnit" key="单位基本信息" cols="3" expanded="false" scalable="false">
				<ta:box cols="2">
					<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC()" columnWidth="0.9" />
					<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
						<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
					</ta:buttonLayout>  
				</ta:box>
				<ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120" />
			</ta:panel>
			<ta:panel key="变更类型" cols="3" >
				<ta:selectInput key="生存状态变更类型" id="aae171" collection="AAE171" onSelect="selectType" labelWidth="120" disabled="true" />
			</ta:panel>
			<ta:panel id="m_tab" key="变更信息" cols="3" cssStyle="display:none">
				<ta:text id="aac053" key="死亡证明" labelWidth="120" />
				<ta:selectInput id="yac551" key="丧葬方式" collection="YAC551" labelWidth="120" />
				<ta:text id="aac051" key="火化证号" labelWidth="120" />
				<ta:text id="aac052" key="状态变更原因" labelWidth="120" maxLength="200" required="true" />
				<ta:date id="aae138" key="变更日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAae138();" />
				<ta:text id="aae013" key="备注" labelWidth="120" value="" maxLength="200" />
			</ta:panel>
			<ta:tabs id="tab" fit="true">
				<ta:tab id="tab_history" key="历史事件">
					<ta:datagrid id="ac26Grid" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aac001" key="人员编号" width="165" />
						<ta:datagridItem id="aac052" key="状态变更原因" width="165" />
						<ta:datagridItem id="aae138" key="状态变更日期" width="165" dataType="date" />
						<ta:datagridItem id="aac053" key="死亡证明" width="165" />
						<ta:datagridItem id="yac551" key="丧葬方式" width="155" collection="YAC551" />
						<ta:datagridItem id="aac051" key="火化证号" width="165" />
						<ta:datagridItem id="aae171" key="生存状态变更类型" width="165" collection="AAE171" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab5" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>

<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");
		initializeSuggestFramework(1, 'ac01', 'aac001', 450, 200, 4, fn_queryInfoPerson, 2, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 450, 200, 4,fn_queryDwInfo , 2, false);
	});
	
	function callRyRPC(){
		sfwQueryUtil_newRPC(1,'getAc01String',{"dto['inputString']":Base.getValue('aac001')});
	}
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
	function fn_setRyData(){
		Base.submit("form1", "surviveUpdateAction!getAc01.do"); //查询信息
		Base.setValue("aac001", parent.getValue('aac001'));
	}
	
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']":Base.getValue('aab001')});
	}
 	function showDwRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
    }
    
    function fn_setDwData(){
    	Base.setValue("aab001", parent.getValue("aab001"));
    }
    
	//判断变更日期与参保最早日期做比较
	function fnCheckAae138() {
		var ac26Rows = Base.getGridData('ac26Grid'); //获取所有已经登记事件数据
		var aae138 = Base.getValue('aae138');
		var aae138Max;
		if (ac26Rows != '') {
			var len = ac26Rows.length;
			for (i = 0; i < len; i++) {
				var aae138Str = ac26Rows[i].aae138.substring(0, 10);
				if (typeof(aae138Max) == 'undefined') {
					aae138Max = aae138Str;
				}
				if (aae138Str > aae138Max) {
					aae138Max = aae138Str;
				}
			}
		}
		if (aae138 < aae138Max) {
			Base.alert('变更日期不能早于历史变更日期【' + aae138Max + '】', 'warn');
			return;
		}
		Base.submit("aac001,aae138", "surviveUpdateAction!checkChangeTime.do");
	}

	//根据个人编号的查询个人信息的回调方法
	function fn_queryInfoPerson() {
		if (g_Suggest != "") {
		//	Base.clearData("fltUnit");
			Base.setValue('aac001', g_Suggest[2]);
			Base.clearGridData("ac26Grid");
			Base.submit("form1", "surviveUpdateAction!getAc01.do"); //查询信息
		}
		Base.setValue("aae013", "");
	}
	//查询单位基本信息
	function fn_queryDwInfo() {
		if (g_Suggest != "") {
			Base.clearData("fltUnit");
			Base.setValue('aab001', g_Suggest[1]);
			Base.setValue('aae044', g_Suggest[2]);
		}
	}
	function selectType() {
		Base.setValue("aac053", "");
		Base.setValue("yac551", "");
		Base.setValue("aac051", "");
		Base.setValue("aae013", "");
		Base.setValue("aac052", "");
		Base.setValue("aae138", "");
		var aae171 = Base.getValue("aae171");
		Base.showObj("m_tab");
		//ac26不存在记录可以进行 死亡 失踪 被收监服刑
		if (aae171 != '0') {
			if (aae171 == '1') {
				Base.hideObj("aac053");
				Base.hideObj("yac551");
				Base.hideObj("aac051");
				Base.hideObj("aae013");
				Base.showObj("aac052");
				Base.showObj("aae138");
				Base.focus("aac052");
				Base.setValue("aac052", "失踪");
			} else if (aae171 == '2' || aae171 == '3') {
				Base.showObj("aac053");
				Base.showObj("yac551");
				Base.showObj("aac051");
				Base.hideObj("aae013");
				Base.showObj("aac052");
				Base.showObj("aae138");
				Base.focus("aac053");
				Base.setValue("aac052", "死亡");
			} else {
				Base.hideObj("aac053");
				Base.hideObj("yac551");
				Base.hideObj("aac051");
				Base.showObj("aae013");
				Base.showObj("aac052");
				Base.showObj("aae138");
				Base.focus("aac052");
				Base.setValue("aac052", "被判收监");
			}
		} else {
			Base.hideObj("m_tab");
		}
		Base.setEnable("saveBtn");
	}
	
	function submitData() {
		Base.submit("form1", "surviveUpdateAction!toSave.do"); //查询信息
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>