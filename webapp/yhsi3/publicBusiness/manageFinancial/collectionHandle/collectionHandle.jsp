<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>托收单实处理</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave();" asToolBarItem="true" />
			<ta:button id="cancelBtn" key="作废[F]" icon="xui-icon-spotDelete" hotKey="F" onClick="fnCancel();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="false" scalable="false">
			<ta:text id="aaz010" key="当事人ID" maxLength="20" onChange="sfwQueryUtil(1,'getDSRXX',Base.getValue('aaz010'))" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" />
			<ta:text id="yaa030" key="当事人名称" readOnly="true" span="2" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" />
			<ta:text id="aaz288" key="单据号" />
		</ta:panel>
		<ta:panel key="处理信息" cols="3" id="fltdate" expanded="false" scalable="false">
			<ta:number id="aad127" key="附件张数" max="999" min="0" alignLeft="true" />
			<ta:date id="aad017" key="缴费日期" showSelectPanel="true" onChange="dateCheck()" />
			<ta:button id="setBtn" key="批量设置" onClick="setAad127();" />
		</ta:panel>
		<ta:tabs id="pnlInfo" fit="true">
			<ta:tab id="tab1" key="待处理单据">
				<ta:datagrid id="danjuGrid" fit="true" snWidth="30" haveSn="true" selectType="checkbox" forceFitColumns="true" onRowDBClick="dbclick">
					<ta:datagridItem id="yad155" key="保险费票据登记ID" align="center" dataAlign="left" hiddenColumn="false" />
					<ta:datagridItem id="yad154" key="单据号" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aaz010" key="当事人ID" align="center" dataAlign="left" maxChart="6" />
					<ta:datagridItem id="aae044" key="当事人名称" align="center" dataAlign="left" maxChart="10" />
				    <ta:datagridItem id="aaf002" key="银行类别" align="center" dataAlign="left" collection="AAF002" maxChart="7" />
					<ta:datagridItem id="aad127" key="附件张数" align="center" dataAlign="left" maxChart="4">
						<ta:datagridEditor max="999" min="0" required="true" type="number" />
					</ta:datagridItem>
					<ta:datagridItem id="aad017" key="缴费日期" align="center" dataAlign="center" maxChart="8">
						<ta:datagridEditor required="true" type="date" showSelectPanel="true" onChange="gridDateChange"/>
					</ta:datagridItem>
					<ta:datagridItem id="yad003" key="实处理金额" align="center" dataAlign="right" maxChart="5" />
					<ta:datagridItem id="yad162" key="票据类型" align="center" dataAlign="left" collection="YAD162" maxChart="6" />
				    <ta:datagridItem id="aae010" key="社保机构银行账号" align="center" dataAlign="left" collection="AAF002" maxChart="10" />
					<ta:datagridItem id="aad016" key="收款方式" align="center" dataAlign="left" collection="AAD005" maxChart="8" />
				    <ta:datagridItem id="xq" key="单据信息概要" align="center" dataAlign="left" maxChart="16" showDetailed="true"></ta:datagridItem>
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="出错信息" id="tab3">
				<ta:datagrid id="errList" enableColumnMove="false" fit="true" snWidth="30" haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="yad154" key="单据号" align="center" dataAlign="left" maxChart="7" />
					<ta:datagridItem id="aaf002" key="银行类别" align="center" dataAlign="left" collection="AAF002" maxChart="8" />
					<ta:datagridItem id="aaz010" key="当事人编号" align="center" dataAlign="center" />
					<ta:datagridItem id="aae044" key="当事人名称" align="center" dataAlign="center" />
					<ta:datagridItem id="errmsg" key="错误信息" align="center" dataAlign="center" showDetailed="true" width="200" />
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
	$(document).ready(function() {
		$("body").taLayout();
		Base.setDisabled("saveBtn,cancelBtn");
		Base.hideObj("tab2");
		Base.focus("aaz010");
		initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
	});
	function fnSelect1() {
		Base.setValue("aaz010", g_Suggest[1]);
		Base.setValue("yaa030", g_Suggest[2]);
	}
	//查询
	function fnQuery() {
		Base.clearGridData("danjuGrid");
		Base.submit("pnlJS", "collectionHandleAction!toQuery.do");
	}
	//保存
	function fnSave() {
		var rows = Base.getGridSelectedRows("danjuGrid");
		if (rows.length == 0) {
			alert("请勾选需要保存的单据信息!");
			return;
		} else {
			var param = {};
			param.rows = Ta.util.obj2string(rows);
			Base.submit("form1", "collectionHandleAction!toSave.do", param);
		}
	}
	//作废
	function fnCancel() {
		var rows = Base.getGridSelectedRows("danjuGrid");
		if (rows.length == 0) {
			alert("请勾选需要作废的单据信息!");
			return;
		} else {
			var param = {};
			param.rows = Ta.util.obj2string(rows);
			Base.submit("form1", "collectionHandleAction!toCancel.do", param);
		}
	}
	//设置附件张数 缴费时间
	function setAad127() {
		var aad127 = Base.getValue("aad127");
		var aad017 = Base.getValue("aad017");
		if(aad127==''&&aad017==''){
		    alert("附件张数和缴费日期必须填写一个！");
		    return;
		}
		var selectData = Base.getGridSelectedRows("danjuGrid");
		if (selectData == "") {
			alert("请勾选数据!");
			return;
		}
		var j = selectData.length;
		for ( var i = 1; i <= j; i++) {
		    if(aad127==''||aad127==null){
		        Base.setGridRowData("danjuGrid", selectData[i - 1]._row_ + 1, {
				    "aad017" : aad017
			    });
		    }else if(aad017==''||aad017==null){
		        Base.setGridRowData("danjuGrid", selectData[i - 1]._row_ + 1, {
				    "aad127" : aad127
			    }); 
		    }else{
		        Base.setGridRowData("danjuGrid", selectData[i - 1]._row_ + 1, {
				    "aad127" : aad127,
				    "aad017" : aad017
			    });
		    }
			
		}
		Base.alert("批量赋值成功!", "success");
	}

	//双击弹出单据详细信息
	function dbclick(e, rowdata) {
		var aaz288 = rowdata.yad154;
		var sfxxgrmx = '0'; //显示个人征集明细
		top.Base.openWindow('userwin',"单据详细信息",myPath() + "/process/publicBusiness/manageFinancial/billQuery/billQueryAction!dbClick.do", {
				"dto['aaz288']" : aaz288,
				"dto['sfxxgrmx']" : sfxxgrmx
			}, "95%", "90%", null, null, true);
	}

	//日期验证
	function dateCheck() {
		var curdate = Base.getValue('aad017').substring(0, 4) + Base.getValue('aad017').substring(5, 7) + Base.getValue('aad017').substring(8, 10);
		var nowDate = getCurrentDate();
		if (curdate > nowDate) {
			Base.alert("所选日期不能大于当前日期", "warn");
			Base.setValue("aad017", "");
			return false;
		}
	}

	//表格日期验证
	function gridDateChange(data, value) {
		var curdate = value.substring(0, 4) + value.substring(5, 7)
				+ value.substring(8, 10);
		var nowDate = getCurrentDate();
		if (curdate > nowDate) {
		    Base.setGridRowData("danjuGrid", data.row + 1, {
				"aad017" : ""
			});
			Base.alert("所选日期不能大于当前日期", "warn");
			return false;
		}
	}

	//获取当前日期
	function getCurrentDate() {
		var myDate = new Date();
		var yearStr = myDate.getFullYear().toString();
		var monthStr = '';
		var dayStr = '';
		if (myDate.getMonth() + 1 >= 10) {
			monthStr = (myDate.getMonth() + 1).toString();
		} else {
			monthStr = '0' + (myDate.getMonth() + 1).toString();
		}
		if (myDate.getMonth() >= 10) {
			dayStr = myDate.getDate().toString();
		} else {
			dayStr = myDate.getDate().toString();
		}
		nowDate = yearStr + monthStr + dayStr;
		return nowDate;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>