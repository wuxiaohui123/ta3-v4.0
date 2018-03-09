<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>业务回退工具</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="padding:0px;">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnQuery" icon="xui-icon-query" key="检索日志" onClick="queryData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="回退" onClick="rollBack()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="alt+R" type="resetPage" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel cols="3" key="检索条件" id="jstj">
			<ta:number id="days" key="X天内" labelWidth="120" />
			<ta:text id="aaz010" key="当事人ID" labelWidth="120" bpopTipMsg="可输入公民身份号码、姓名、人员ID、单位编号、单位名称" />
			<ta:text id="aaz002" key="业务日志ID" labelWidth="120" />
			<ta:selectInput id="aae011" key="经办人" labelWidth="120" collection="AAE011" islevel="true" isMustLeaf="true" />
			<ta:selectInput id="aaa121" key="业务类型" labelWidth="120" collection="aaa121" islevel="true" isMustLeaf="true" />
			<ta:number id="flag" key="特权回退参数" labelWidth="120" display="false" />
			<ta:text id="bz" type="password" display="false" />
			<ta:text id="jlcs" type="password" display="false" value="0" />
		</ta:panel>
		<ta:panel id="p1" key="日志列表" cssStyle="margin:0px;" fit="true">
			<ta:datagrid id="logGrid" fit="true" columnFilter="true" rowColorfn="fnColor" selectType="checkbox">
				<ta:datagridItem id="aaz002" key="业务日志ID" width="110" />
				<ta:datagridItem id="aaa121" key="业务类型" collection="AAA121" width="130" />
				<ta:datagridItem id="yaa017" key="办理状态" collection="YAA017" width="90" />
				<ta:datagridItem id="aaz010" key="当事人ID" width="85" />
				<ta:datagridItem id="aae044" key="当事人名称" width="140" />
				<ta:datagridItem id="aae036" key="经办时间" width="150" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" />

				<ta:datagridItem id="aaa792" key="已回退" collection="AAA831" width="60" hiddenColumn="false" />
				<ta:datagridItem id="aaa793" key="回退时间" width="140" hiddenColumn="false" />
				<ta:datagridItem id="aaa794" key="回退人" collection="YAE092" hiddenColumn="false" />
				<ta:datagridItem id="aae013" key="备注" showDetailed="true" />
				<ta:datagridItem id="aab034" key="经办机构" collection="YAB003" width="150" />
				<ta:datagridItem id="aaa796" key="经办IP" width="105" />
				<ta:datagridItem id="aae790" key="业务流水号" width="100" />
				<ta:datagridItem id="aaa831" key="使用触发器" collection="AAA831" hiddenColumn="false" />
				<ta:datagridItem id="inputxml" key="InputXML" showDetailed="true" hiddenColumn="false" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function fnColor(rowdata) {
		//aaa792 是否已经回退
		if (rowdata.aaa792 == '是' || rowdata.aaa792 == 1) {
			//return "silver";
		}
	}

	function queryData() {
		var flag = Base.getValue("flag");
		if (flag == '0') {
			Base.submit('form1', 'userRollbackToolAction!queryLog.do');
		} else if (flag == '1') {
			Base.submit('form1', 'priviRollbackToolAction!queryLog.do');
		} else
			Base.alert("获取特权参数错误！");
	}
	top._cbinfo123 = "";
	top._cbinfojlcs = "";
	function rollBack() {
		if (top._cbinfojlcs == 0 || top._cbinfojlcs == '' || top._cbinfojlcs == null) {
			Base.openWindow("CBInfo", "密码验证", myPath() + "/process/comm/priviRollbackToolAction!toEdit.do", null, "40%", "45%", null, function() {
				if (top._cbinfojlcs == 1) {
					var selectRows = Base.getGridSelectedRows("logGrid");
					if (selectRows.length == 0) {
						alert("请勾选需要回退的数据！");
						return;
					}
					var prm = {};
					prm.d2List = Ta.util.obj2string(selectRows);
					var flag = Base.getValue("flag");
					if (flag == '0') {
						Base.submit("form1", "userRollbackToolAction!doRollback.do", prm, null, null, null);
						if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
							top._cbinfojlcs = "0";
						}
					} else if (flag == '1') {
						Base.submit("form1", "priviRollbackToolAction!doRollback.do", prm, null, null, null);
						if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
							top._cbinfojlcs = "0";
						}
					} else {
						Base.alert("获取特权参数错误！");
						if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
							top._cbinfojlcs == "0";
						}
					}
				}
			}, true);
		} else if (top._cbinfojlcs == 1) {
			if ((top._cbinfo123 == "cqyx" && top._cbinfojlcs == "1") || (top._cbinfo123 == "yx" && top._cbinfojlcs == "1")) {
				var selectRows = Base.getGridSelectedRows("logGrid");
				if (selectRows.length == 0) {
					alert("请勾选需要回退的数据！");
					return;
				}
				var prm = {};
				prm.d2List = Ta.util.obj2string(selectRows);
				var flag = Base.getValue("flag");
				if (flag == '0') {
					Base.submit("form1", "userRollbackToolAction!doRollback.do", prm, null, null, null);
					if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
						top._cbinfojlcs = "0";
					}
				} else if (flag == '1') {
					Base.submit("form1", "priviRollbackToolAction!doRollback.do", prm, null, null, null);
					if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
						top._cbinfojlcs = "0";
					}
				} else {
					Base.alert("获取特权参数错误！");
					if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
						top._cbinfojlcs == "0";
					}
				}
			} else {
				Base.openWindow("CBInfo", "密码验证", myPath() + "/process/comm/priviRollbackToolAction!toEdit.do", null, "40%", "45%", null, function() {
					if (top._cbinfojlcs == 1) {
						var selectRows = Base.getGridSelectedRows("logGrid");
						if (selectRows.length == 0) {
							alert("请勾选需要回退的数据！");
							return;
						}
						var prm = {};
						prm.d2List = Ta.util.obj2string(selectRows);
						var flag = Base.getValue("flag");
						if (flag == '0') {
							Base.submit("form1", "userRollbackToolAction!doRollback.do", prm, null, null, null);
							if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
								top._cbinfojlcs = "0";
							}
						} else if (flag == '1') {
							Base.submit("form1", "priviRollbackToolAction!doRollback.do", prm, null, null, null);
							if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
								top._cbinfojlcs = "0";
							}
						} else {
							Base.alert("获取特权参数错误！");
							if (top._cbinfo123 == "yx" || top._cbinfo123 == "cqyx") {
								top._cbinfojlcs == "0";
							}
						}
					}
				}, true);
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>