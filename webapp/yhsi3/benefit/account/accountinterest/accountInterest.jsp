<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>accountInterest</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		</ta:box>
		<ta:tabs fit="true">
			<ta:tab id="tab_1" key="批量方式">
				<ta:toolbar id="tlb">
					<ta:buttonLayout align="center" span="3">
						<ta:button id="queryBtn" icon="xui-icon-query" key="待结转信息查询[Q]" onClick="query()" hotKey="Q" asToolBarItem="true" />
						<ta:button id="queryBtn1" icon="xui-icon-query" key="已结转信息查询[F]" onClick="query2()" hotKey="F" asToolBarItem="true" />
						<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="save()" asToolBarItem="true" />
						<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
					</ta:buttonLayout>
				</ta:toolbar>
				<ta:text id="aae417" key="申请业务日志id" readOnly="true" display="false" value="111111111111111" />
				<ta:text id="aaa121" key="业务类型编码" display="false" />
				<ta:text id="yae248" key="数据来源" readOnly="true" display="false" value="1" />
				<ta:panel cols="3" id="fieldest1" key="查询条件">
					<ta:date id="aae001" key="年度" required="true" labelWidth="130" dateYear="true" showSelectPanel="true" />
					<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
				</ta:panel>
				<ta:tabs id="tabs1" fit="true">
					<ta:tab id="tab1" key="待结转单位信息">
						<ta:datagrid id="list" fit="true" border="true" forceFitColumns="true" selectType="checkbox" haveSn="true">
							<ta:datagridItem id="aab001" key="单位编码" align="center" dataAlign="right" />
							<ta:datagridItem id="dwmc" key="单位名称" align="center" />
							<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="right" />
							<ta:datagridItem id="aac003" key="姓名" align="center" width="80" />
							<ta:datagridItem id="aac002" key="身份证号" align="center" width="120" dataAlign="right" hiddenColumn="true" />
							<ta:datagridItem id="aab999" key="单位管理码" align="center" hiddenColumn="true" />
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab2" key="已结转单位信息">
						<ta:datagrid id="list2" fit="true" border="true" forceFitColumns="true" haveSn="true">
							<ta:datagridItem id="aab001" key="单位编码" align="center" dataAlign="right" />
							<ta:datagridItem id="aab999" key="单位管理码" align="center" hiddenColumn="true" />
							<ta:datagridItem id="dwmc" key="单位名称" align="center" />
							<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="right" />
							<ta:datagridItem id="aac003" key="姓名" align="center" width="80" />
							<ta:datagridItem id="aac002" key="身份证号" align="center" width="120" dataAlign="right" hiddenColumn="true" />
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab3" key="错误信息">
						<ta:datagrid id="list3" fit="true" border="true" forceFitColumns="true" haveSn="true">
							<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="right" />
							<ta:datagridItem id="aab001" key="单位编码" align="center" dataAlign="right" />
							<ta:datagridItem id="aab999" key="单位管理码" align="center" hiddenColumn="true" />
							<ta:datagridItem id="dwmc" key="单位名称" align="center" />
							<ta:datagridItem id="appcode" key="错误代码" align="center" />
							<ta:datagridItem id="errmsg" key="错误信息" align="center" />
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
			<ta:tab id="tab_2" key="定时服务方式">
				<ta:toolbar id="ButtonLayout2">
					<ta:button id="btnBatchSave" key="保存[S]" asToolBarItem="true" icon="xui-icon-spotSave" hotKey="S" onClick="fnTimeSave()" />
					<ta:button id="btnBatchReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage" />
				</ta:toolbar>
				<ta:panel id="flst3" key="账户计息" cols="3" expanded="false" scalable="false">
					<ta:date id="aae001_1" key="年度" required="true" labelWidth="130" dateYear="true" showSelectPanel="true" />
					<ta:date id="zxsj" key="执行时间" datetime="true" validNowTime="right" showSelectPanel="true" span="2" />
				</ta:panel>
				<ta:tabs id="tab_batch" fit="true">
					<ta:tab id="tab_successBatch" key="定时服务创建成功信息">
						<ta:datagrid id="dg_successBatch" haveSn="true" fit="true">
							<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" width="120" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" width="800" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" width="400" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="successmsg" key="成功信息" align="center" dataAlign="left" width="100" showDetailed="true"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_errorBatch" key="定时服务创建失败信息">
						<ta:datagrid id="dg_errorBatch" haveSn="true" fit="true">
							<ta:datagridItem id="jobid" key="jobid" align="center" dataAlign="left" width="120" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="what" key="服务名" align="center" dataAlign="left" width="800" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="starttime" key="开始时间" align="center" dataAlign="center" width="400" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="errormsg" key="失败信息" align="center" dataAlign="left" width="100" showDetailed="true"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		//$("body").taLayout(); 
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
		fn_setDateGridKey();
		//initializeSuggestFramework(1, 'ab01', 'aab999_1', 500, 200, 3, null, 0, false);
		/* window.onload = function(){//页面加载时调用getYear()，赋值给调整年度
			 getYear();
		}; */

	});
    
	// 打开单位信息查询页面
	function showDwRPC(){
        Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,null,true);
	}
	
	function fn_ab01Info() {
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
		}
	}

	function fn_setDateGridKey() {
		var aae140 = Base.getValue("aae140");
		if (aae140 == "150") {
			fn_SetGridTitle("list", "aab001", "村镇编号");
			fn_SetGridTitle("list", "dwmc", "村镇名称");
			fn_SetGridTitle("list2", "aab001", "村镇编号");
			fn_SetGridTitle("list2", "dwmc", "村镇名称");
			fn_SetGridTitle("list3", "aab001", "村镇编号");
			fn_SetGridTitle("list3", "dwmc", "村镇名称");
		} else {
			fn_SetGridTitle("list", "aab001", "单位编号");
			fn_SetGridTitle("list", "dwmc", "单位名称");
			fn_SetGridTitle("list2", "aab001", "单位编号");
			fn_SetGridTitle("list2", "dwmc", "单位名称");
			fn_SetGridTitle("list3", "aab001", "单位编号");
			fn_SetGridTitle("list3", "dwmc", "单位名称");
		}
	}

	//查询待结转信息
	function query() {
		Base.clearGridData("list1");
		Base.clearGridData("list2");
		Base.submit("form1", "accountInterestAction!queryInfo.do");
	}
	
	//查询已结转信息
	function query2() {
		Base.clearGridData("list1");
		Base.clearGridData("list2");
		Base.submit("form1", "accountInterestAction!queryInfo2.do");
	}

	//获取当前年份
	/*    function getYear(){
	       function getEle(id){
	           return document.getElementById(id);
	       }    
	       var text = getEle("aae001");
	       var date = new Date(),
	       nowYear = +date.getFullYear();
	       text.value = nowYear;
	   } */

	//保存数据
	function save() {
		var selectRows = Base.getGridSelectedRows("list");
		if (selectRows.length == 0) {
			alert("请勾选列表数据！");
			return false;
		}
		var prm = {};
		prm.list = Ta.util.obj2string(selectRows);
		Base.submit("form1", "accountInterestAction!toSave.do", prm, null, null, function(data) {});
	}
	   
	//创建定是服务器
	function fnTimeSave() {
		Base.submit("flst3", "accountInterestAction!toSaveTime.do", null, null, null, function(data) {});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>