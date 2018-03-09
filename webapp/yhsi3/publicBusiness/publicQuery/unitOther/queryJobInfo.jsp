<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定时服务执行明细查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button key="查询[Q]" icon="xui-icon-query" hotKey="Q" id="queryBtn" asToolBarItem="true" onClick="toQuery();" />
		<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="R" id="resetBtn" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="cxtj" key="查询条件" cols="3" scalable="false">
			<ta:text id="jobid" key="服务编号" />
			<ta:selectInput id="issuccess" key="建立标志" data="[{'id':'1','name':'成功','py':'cg'},{'id':'0','name':'失败','py':'sb'}]" />
			<ta:selectInput id="aae011" key="经办人" collection="AAE011" />
			<ta:date id="starttime" key="服务创建时间" showSelectPanel="true" onChange="fnChange1()" />
			<ta:date id="execstarttime" key="服务执行时间" showSelectPanel="true" onChange="fnChange2()" />
			<ta:date id="execendtime" key="服务结束时间" showSelectPanel="true" onChange="fnChange3()" />
		</ta:panel>
		<ta:panel id="pnlDwcb" key="查询结果" fit="true" expanded="false">
			<ta:datagrid id="jobinfo" haveSn="true" fit="true" onRowClick="fnClick">
				<ta:datagridItem id="jobid" key="定时服务编号" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="job_name" key="定时服务名称" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="starttime" key="服务创建时间" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="issuccess" key="服务建立标志" align="center" dataAlign="left" width="90" collectionData="[{'id':'1','name':'成功','py':'cg'},
					                                                                                                              {'id':'0','name':'失败','py':'sb'}]" />
				<ta:datagridItem id="message" key="服务建立信息" align="center" dataAlign="left" width="150" showDetailed="true" />
				<ta:datagridItem id="execstarttime" key="开始执行时间" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="execendtime" key="结束执行时间" align="center" dataAlign="left" width="150" />
				<ta:datagridItem id="lasttime" key="持续时间" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="progress" key="总进度" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="successrate" key="成功率" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="errorrate" key="失败率" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="remain" key="剩余时间" align="center" dataAlign="left" width="120" />
				<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" collection="AAE011" width="70" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	// 行双击事件
	function fnClick(e, rowdata) {
		Base.openWindow("MxInfo", "执行详情", myPath() + "/process/publicBusiness/publicQuery/unitOther/queryJobInfoAction!toMxQuery.do", {
			"dto['jobid']" : rowdata.jobid
		}, "95%", "90%", null, null, true);
	}
	function fnChange1() {
		var aae041 = Base.getValue("starttime");//创建
		var aae042 = Base.getValue("execstarttime");//开始
		var aae043 = Base.getValue("execendtime");//结束	    	    
		if (aae041 > aae042 && aae042 != '') {
			Base.alert("创建时间不能大于执行时间!", "warn");
			Base.setValue("starttime", "");
			return;
		}
		if (aae041 > aae043 && aae043 != '') {
			Base.alert("创建时间不能大于结束时间!", "warn");
			Base.setValue("starttime", "");
			return;
		}
	}
	function fnChange2() {
		var aae041 = Base.getValue("starttime");//创建
		var aae042 = Base.getValue("execstarttime");//开始
		var aae043 = Base.getValue("execendtime");//结束	    
		if (aae041 == '' || aae041 == null) {
			return true;
		}
		if (aae042 == '' || aae042 == null) {
			return true;
		}
		if (aae041 > aae042) {
			Base.alert("执行时间不能早于创建时间!", "warn");
			Base.setValue("execstarttime", "");
			return;
		}
		if (aae043 == '' || aae043 == null) {
			return true;
		}
		if (aae042 > aae043) {
			Base.alert("执行时间不能大于结束时间!", "warn");
			Base.setValue("execstarttime", "");
			return;
		}
	}
	function fnChange3() {
		var aae041 = Base.getValue("starttime");//创建
		var aae042 = Base.getValue("execstarttime");//开始
		var aae043 = Base.getValue("execendtime");//结束	    
		if (aae041 == '' || aae041 == null) {
			return true;
		}
		if (aae043 == '' || aae043 == null) {
			return true;
		}
		if (aae043 < aae041) {
			Base.alert("结束时间不能早于创建时间!", "warn");
			Base.setValue("execendtime", "");
			return;
		}
		if (aae042 == '' || aae042 == null) {
			return true;
		}
		if (aae043 < aae042) {
			Base.setValue("execendtime", "");
			Base.alert("结束时间不能早于执行时间!", "warn");
			return;
		}
	}
	//查询文件列表
	function toQuery() {
		Base.clearGridData("jobinfo");
		Base.submit("form1", "queryJobInfoAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
