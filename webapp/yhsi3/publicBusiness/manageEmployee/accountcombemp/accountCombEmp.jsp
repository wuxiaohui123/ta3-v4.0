<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>accountCombEmp</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
		<ta:pageloading />
		<ta:box fit="true">
			<ta:toolbar id="tlb">
				<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
				<ta:button id="resetBtn" key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
			</ta:toolbar>
			<ta:box height="90%" id="form1">
				<ta:box id="procInc">
					<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				</ta:box>
				<ta:panel id="person1" key="合号人员信息" cols="3">
					<ta:box cols="2">
						<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()"/>
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="aac002_s" key="证件号码" maxLength="18" labelWidth="120" />
					<ta:text id="aac003_s" key="姓名" labelWidth="120" maxLength="60" readOnly="true" />
					<ta:box cols="2">
						<ta:text id="aac001_c" key="个人编号(副号)" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC_c()"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showRyRPCBtn_c" key="?" onClick="showRyRPC_c()"/>
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="aac002_c" key="证件号码" maxLength="18" labelWidth="120" />
					<ta:text id="aac003_c" key="姓名" labelWidth="120" maxLength="60" readOnly="true" />
				</ta:panel>
				<ta:box height="45%" cols="2">
					<ta:box height="100%" columnWidth="0.5" cssStyle="margin-left:1px;">
						<ta:panel id="pnl_a" key="合并对象险种信息" fit="true">
							<ta:datagrid id="aae140_a" enableColumnMove="true" fit="true" forceFitColumns="true" snWidth="20" haveSn="true">
								<ta:datagridItem id="aac001" key="个人编号" width="80" />
								<ta:datagridItem id="aac003" key="姓名" width="100" />
								<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" width="120" />
								<ta:datagridItem id="yac084" key="退休标志" collection="YAC084" maxChart="4" />
								<ta:datagridItem id="aac049" key="首次参保日期" maxChart="5" />
								<ta:datagridItem id="aae041" key="开始年月" width="70" />
								<ta:datagridItem id="aae042" key="终止年月" width="70" />
								<ta:datagridItem id="aaz159" key="人员参保关系ID" width="80" hiddenColumn="false" />
							</ta:datagrid>
						</ta:panel>
					</ta:box>
					<ta:box height="100%" columnWidth="0.5" cssStyle="margin-left:1px;">
						<ta:panel id="pnl_b" key="被合并对象险种信息" fit="true">
							<ta:datagrid id="aae140_b" enableColumnMove="true" fit="true" forceFitColumns="true" snWidth="20" selectType="checkbox" haveSn="true">
								<ta:datagridItem id="aac001" key="个人编号" width="80" />
								<ta:datagridItem id="aac003" key="姓名" width="80" />
								<ta:datagridItem id="aac049" key="首次参保日期" maxChart="5" />
								<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" width="120" />
								<ta:datagridItem id="yac084" key="退休标志" collection="YAC084" maxChart="4" />
								<ta:datagridItem id="aae041" key="开始年月" width="70" />
								<ta:datagridItem id="aae042" key="终止年月" width="70" />
								<ta:datagridItem id="aaz159" key="人员参保关系ID" width="80" hiddenColumn="false" />
							</ta:datagrid>
						</ta:panel>
					</ta:box>
				</ta:box>
				<ta:box height="45%" cssStyle="margin-left:1px;">
					<ta:panel id="pnlInfo" fit="true">
						<ta:tabs fit="true">
							<ta:tab key="合并信息" id="scanResult">
								<ta:datagrid id="aae140_c" fit="true" forceFitColumns="true" enableColumnMove="true" snWidth="20" haveSn="true">
									<ta:datagridItem id="aac001" key="个人编号" />
									<ta:datagridItem id="yae215" key="原个人编号" />
									<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" />
									<ta:datagridItem id="aae041" key="开始年月" />
									<ta:datagridItem id="aae042" key="终止年月" />
									<ta:datagridItem id="aaz159" key="人员参保关系ID" hiddenColumn="false" />
									<ta:datagridItem id="yac561" key="原人员参保关系ID" hiddenColumn="false" />
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="tab2" key="合并后人员参保信息">
								<ta:datagrid id="ac20Grid" haveSn="true" fit="true">
									<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="5" />
									<ta:datagridItem id="aac001" key="个人编号" align="center" maxChart="5" />
									<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
									<ta:datagridItem id="aae140" key="险种" align="center" collection="aae140" maxChart="8" />
									<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="5" dataType="date" />
									<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="3" />
									<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="3" />
									<ta:datagridItem id="cbzt" key="缴费状态" align="center" dataAlign="center" maxChart="3" />
									<ta:datagridItem id="yac084" key="离退休" align="center" collection="yac084" maxChart="3" />
									<ta:datagridItem id="aaz136" key="基数规则" align="center" collection="aaz136" maxChart="10" />
									<ta:datagridItem id="yaz289" key="缴费规则" align="center" collection="yaz289" maxChart="10" />
									<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="5" />
									<ta:datagridItem id="yab139" key="参保所属机构" align="center" collection="aab301" width="100" />
									<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="15" />
									<ta:datagridItem id="aaz159" key="参保关系ID" align="center" collection="aab301" width="160" />
								</ta:datagrid>
							</ta:tab>
							<ta:tab key="事件流程记录" id="cseTab">
								<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
							</ta:tab>
						</ta:tabs>
					</ta:panel>
				</ta:box>
			</ta:box>
		</ta:box>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Ta.autoPercentHeight();
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 2, false);
		initializeSuggestFramework(2, 'ac01', 'aac001_c', 1000, 200, 9, fn_queryInfoPerson1, 2, false);
	});
	//个人编号RPC
	function callRyRPC(){
		sfwQueryUtil_newRPC(1,'getAc01String',{"dto['inputString']":Base.getValue('aac001')});
	}
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
	function fn_setRyData(){
		fn_setRyInfo();  //调用功能界面业务方法
	//	Base.setValue("aac001", parent.getValue("aac001"));
	}
	//个人编号副号RPC
	function callRyRPC_c(){
		sfwQueryUtil_newRPC(2,'getAc01String',{"dto['inputString']":Base.getValue('aac001_c')});
	}
	function showRyRPC_c(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData_c,true);
	}
	function fn_setRyData_c(){
		Base.submit('aac001_c', 'accountCombEmpAction!getBaseInfoByAac002_2.do', null, false, null, fnCheckAac001, null);
	}
	//人员回调函数
	function fn_queryInfoPerson() {
		if (g_Suggest != '') {
			Base.setValue('aac002_s', g_Suggest[0]);
			Base.setValue('aac001', g_Suggest[2]);
			Base.setValue('aac003_s', g_Suggest[1]);
			Base.setValue('aac004_s', g_Suggest[3]);
			Base.clearGridData('empBaseInfo');
			Base.clearGridData('aae140_a');
			Base.clearGridData('aae140_c');
			Base.clearGridData('ae02Grid');
			Base.submit('aac001', 'accountCombEmpAction!getBaseInfoByAac002.do', null, false, null, fnCheckAac001, null);
		}
	}

	//人员回调函数
	function fn_queryInfoPerson1() {
		if (g_Suggest != '') {
			Base.setValue('aac002_c', g_Suggest[0]);
			Base.setValue('aac003_c', g_Suggest[1]);
			Base.setValue('aac004_c', g_Suggest[3]);
			Base.setValue('aac001_c', g_Suggest[2]);
			Base.clearGridData('empBaseInfo');
			Base.clearGridData('aae140_b');
			Base.clearGridData('aae140_c');
			Base.clearGridData('ae02Grid');
			Base.submit('aac001_c', 'accountCombEmpAction!getBaseInfoByAac002_2.do', null, false, null, fnCheckAac001, null);
		}
	}

	//人员编号校验
	function fnCheckAac001() {
		var aac001_c = Base.getValue('aac001_c');
		var aac001 = Base.getValue('aac001');
		if (aac001_c != '' && aac001_c != null && aac001 == aac001_c) {
			Base.alert("从号编号不能与主号编号相同");
			Base.focus("aac001_c");
			Base.setDisabled("saveBtn");
		} else {
			Base.setEnable("saveBtn");
		}
	}

	//选择合并与被合并记录信息
	function fnSetObj(obj) {
		var selectRow = Base.getGridSelectedRows('empBaseInfo');
		var newRows = Base.getGridData('aae140_a');
		var oldRows = Base.getGridData('aae140_b');
		var aac001, newAac001, oldAac001;
		if (selectRow != '') {
			aac001 = selectRow[0]['aac001'];
		} else {
			Base.alert('请先选择合并或被合并人员信息,谢谢!', 'warn');
			return;
		}
		if (newRows != '') {
			newAac001 = newRows[0]['aac001'];
		}
		if (oldRows != '') {
			oldAac001 = oldRows[0]['aac001'];
		}
		if (obj == 'new') {
			if (newAac001 == aac001) {
				Base.alert('该人员已经选作为合并对象!', 'warn');
				return;
			}
			if (oldAac001 == aac001) {
				Base.alert('该人员已经选作为被合并对象!', 'warn');
				return;
			}
			Base.submit("form1,empBaseInfo", 'accountCombEmpAction!getInsInfoByAac001.do', {
				"dto['aac001']": aac001,
				"dto['hblx']": 'new'
			});
		}
		if (obj == 'old') {
			if (oldAac001 == aac001) {
				Base.alert('该人员已经选作为被合并对象!', 'warn');
				return;
			}
			if (newAac001 == aac001) {
				Base.alert('该人员已经选作为合并对象!', 'warn');
				return;
			}
			Base.submit("form1,empBaseInfo", 'accountCombEmpAction!getInsInfoByAac001.do', {
				"dto['aac001']": aac001,
				"dto['hblx']": 'old'
			});
		}
	}

	function submitData() {
		Base.clearGridData('aae140_c');
		var newRows = Base.getGridData('aae140_a');
		var oldRows = Base.getGridData('aae140_b');
		var selectRows = Base.getGridSelectedRows("aae140_b");

		if (oldRows == '') {
			Base.alert('请先选择一条人员基本信息作为被合并对象,谢谢!', 'warn');
			return;
		}
		if (selectRows == '') {
			Base.alert('请勾选被合并对象进行合并,谢谢!', 'warn');
			return;
		}
		var newAac001 = Base.getValue('aac001');
		var oldAac001 = oldRows[0]['aac001'];
		if (newAac001 == oldAac001) {
			Base.alert('两个合并编号为同一编号，请确认！', 'warn');
			return;
		}
		var newLen = newRows.length;
		var oldLen = selectRows.length;
		for (i = 0; i < oldLen; i++) {
			var addRow = {};
			var aae140Old = selectRows[i].aae140;
			addRow.aac001 = newAac001; //人员编号
			addRow.yae215 = oldAac001; //原人员编号
			for (j = 0; j < newLen; j++) {
				var aae140New = newRows[j].aae140;
				if (aae140New == aae140Old) {
					addRow.aaz159 = newRows[j].aaz159; //个人参保关系ID
				}
			}
			addRow.yac561 = selectRows[i].aaz159; //原个人参保关系ID
			addRow.aae140 = selectRows[i].aae140; //险种类型
			addRow.aae041 = selectRows[i].aae041; //开始年月
			addRow.aae042 = selectRows[i].aae042; //终止年月
			Base.addGridRowDown("aae140_c", addRow);
		}
		var becomeRows = Base.getGridData('aae140_c');
		if (becomeRows == '') {
			Base.alert('没有合并信息,不能进行保存,谢谢!', 'warn');
			return;
		} else {
			var param = {};
			param.hbList = Ta.util.obj2string(becomeRows);
			Base.submit("form1", "accountCombEmpAction!toSave.do", param);
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>