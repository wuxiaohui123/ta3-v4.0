<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>BasicInfoMaintenance</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:2px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="tab1" key="个人基本信息" cssStyle="overflow:auto;" selected="true">
				<ta:panel id="flt_jbxx" cols="3" key="基本信息" cssStyle="height:1000">
					<ta:text id="aaz257" display="false" labelWidth="130" key="享受定期待遇人员ID" />
					<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
					<%@ include file="/yhsi3/benefit/common/personBaseInfoDyAll.jsp"%>
					<ta:text id="aac042" labelWidth="130" key="代办人姓名" />
					<ta:text id="aac044" labelWidth="130" key="代办人证件号码" />
					<ta:number id="aac045" labelWidth="130" key="代办人电话" />
					<ta:text id="aac042_old" labelWidth="130" key="代办人姓名" display="false" />
					<ta:text id="aac044_old" labelWidth="130" key="代办人证件号码" display="false" />
					<ta:number id="aac045_old" labelWidth="130" key="代办人电话" display="false" />
					<ta:text id="aac002_old" display="false" labelWidth="130" key="证件号码" />
					<ta:text id="aac003_old" display="false" labelWidth="130" key="姓名" />
					<ta:text id="yaz099_old" key="组织发放信息ID" labelWidth="130" display="false" />
					<ta:text id="yad169_old" key="支付对象" labelWidth="130" display="false" />
					<ta:text id="aae145_old" key="支付方式" labelWidth="130" display="false" />
					<ta:text id="aac059_old" key="领取人证件类型" labelWidth="130" display="false" />
					<ta:text id="aae136_old" key="领取人证件号" labelWidth="130" display="false" />
					<ta:text id="aae133_old" key="领取人姓名" labelWidth="130" display="false" />
					<ta:text id="aae010_old" key="银行账号" labelWidth="130" display="false" />
					<ta:text id="aaf002_old" key="代发银行类别" labelWidth="130" display="false" />
					<ta:text id="aaz009_old" key="代发机构名称" labelWidth="130" display="false" />
					<ta:text id="yaf012_old" key="开户银行类别" labelWidth="130" display="false" />
					<ta:text id="yaf013_old" key="开户银行编号" labelWidth="130" display="false" />
					<ta:text id="yaf001_old" key="开户银行名称" labelWidth="130" display="false" />
					<ta:text id="yaf011_old" key="银行同城异地标志" labelWidth="130" display="false" />
					<ta:text id="aae007_old" key="邮政编码" labelWidth="130" display="false" />
					<ta:text id="aae006_old" key="详细地址" labelWidth="130" display="false" />
					<ta:text id="aaz099" key="发放信息ID" display="false" />
				</ta:panel>
				<ta:panel id="ac63Panel" key="人员发放信息(双击查看待遇信息)" height="150px">
					<ta:datagrid id="ac63GridList" selectType="radio" onChecked="fn_setpagedata" onRowDBClick="fn_detailsdymxview">
						<ta:datagridItem id="dqbz" key="是否定期待遇支付方式" width="140" formatter="convertState" collection="SFBZ" dataAlign="center" align="center" />
						<%@ include file="/yhsi3/benefit/common/dataGridPaymentInfo.jsp"%>
						<ta:datagridItem id="aaz099" key="待遇展示ID" hiddenColumn="true" width="115" />
						<ta:datagridItem id="yaz099" key="组织发放信息ID" hiddenColumn="true" width="115" />
						<ta:datagridItem id="aac042" key="代办人姓名" hiddenColumn="true" width="115" />
						<ta:datagridItem id="aac044" key="代办人证件号码" hiddenColumn="true" width="115" />
						<ta:datagridItem id="aac045" key="代办人电话" hiddenColumn="true" width="115" />
					</ta:datagrid>
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
				<ta:panel id="ac31a1Panel" key="上次变更信息" height="200px" bodyStyle="margin:0px">
					<ta:datagrid id="ac31a1Grid" fit="true" haveSn="true" forceFitColumns="true">
						<ta:datagridItem id="aaz205" key="人员信息变更明细ID" hiddenColumn="false" width="115" align="center" dataAlign="right" />
						<ta:datagridItem id="aaz206" key="人员信息变更事件ID" hiddenColumn="false" width="115" align="center" dataAlign="right" />
						<ta:datagridItem id="aae155" key="变更项目" width="160" align="center" dataAlign="left" />
						<ta:datagridItem id="aae301" key="变更前值描述" width="160" align="center" dataAlign="left" />
						<ta:datagridItem id="aae123" key="变更前信息" width="160" align="center" dataAlign="left" />
						<ta:datagridItem id="aae302" key="变更后值描述" width="160" align="center" dataAlign="left" />
						<ta:datagridItem id="aae124" key="变更后信息" width="160" align="center" dataAlign="left" />
						<ta:datagridItem id="aae036" key="经办时间" width="160" dataAlign="center" align="center" />
						<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="160" align="center" dataAlign="left" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab2" key="发放期支付记录">
				<ta:panel id="zfxx" key="待遇支付信息" fit="true">
					<ta:datagrid id="ac82Aae002List" fit="true" haveSn="true" enableColumnMove="false" columnFilter="true">
						<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" dataAlign="center" formatter="fnFormatter" />
						<ta:datagridItem id="aae145" key="发放方式" sortable="true" collection="AAE145" width="170" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aae133" key="领取人姓名" sortable="true" showDetailed="true" width="150" dataAlign="center" formatter="fnFormatter" />
						<ta:datagridItem id="aaf002" key="银行类别" sortable="true" collection="AAF002" width="150" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aae010" key="银行账号" width="150" showDetailed="true" dataAlign="right" formatter="fnFormatter" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" dataAlign="right" width="130" formatter="fnFormatter" />
						<ta:datagridItem id="yae112" key="统筹外待遇类别" sortable="true" collection="AAA036" width="130" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aae117" key="支付标志" sortable="true" collection="AAE117" width="130" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" dataAlign="center" width="150" formatter="fnFormatter" />
						<ta:datagridItem id="yad019" key="失败原因" sortable="true" collection="AAE357" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aae006" key="邮寄地址" width="200" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aaz220" key="人员应付计划事件ID" hiddenColumn="true" showDetailed="true" formatter="fnFormatter" />
						<ta:datagridItem id="aac001" key="个人编号" hiddenColumn="true" showDetailed="true" formatter="fnFormatter" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aae140,aaa121", "paymentInfoMaintenanceAction!queryBaseInfo.do", null, null, null, function() {
			});
		}, true);
	}

	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			Base.setValue("aaz001", "");
			Base.setValue("yad169", "");
			Base.setValue("aae145", "");
			Base.setValue("aac059", "");
			Base.setValue("aae136", "");
			Base.setValue("aae133", "");
			Base.setValue("aae010", "");
			Base.setValue("aaf002", "");
			Base.setValue("aaz009", "");
			Base.setValue("yaf001", "");
			Base.setValue("yaf013", "");
			Base.setValue("yaf012", "");
			Base.setValue("aae007", "");
			Base.setValue("aae006", "");
			Base.setValue("yaz099", "");
			Base.setValue("yaf011", "");
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aae140,aaa121", "paymentInfoMaintenanceAction!queryBaseInfo.do", null, null, null, function() {});
		}
	}

	function fn_check() {
		var aac002 = Base.getValue("aac002"); //修改后的--证件号码
		var aac003 = Base.getValue("aac003"); //修改后的--姓名
		var yad169 = Base.getValue("yad169");
		var aae145 = Base.getValue("aae145"); //修改后的--发放方式
		var aac059 = Base.getValue("aac059"); //修改后的--领取人证件类型
		var aae136 = Base.getValue("aae136"); //修改后的--领取人证件号
		var aae133 = Base.getValue("aae133"); //修改后的--领取人姓名
		var aaf002 = Base.getValue("aaf002"); //修改后的--银行类别
		var aae010 = Base.getValue("aae010"); //修改后的--银行账户
		var aae007 = Base.getValue("aae007"); //修改后的--邮政编码
		var aae006 = Base.getValue("aae006"); //修改后的--详细地址
		var aaz009 = Base.getValue("aaz009"); //修改后的--代发机构名称
		var yaf012 = Base.getValue("yaf012"); //修改后的--开户银行类别
		var yaf013 = Base.getValue("yaf013"); //修改后的--开户银行编号
		var yaf001 = Base.getValue("yaf001"); //修改后的--开户银行名称
		var yaf011 = Base.getValue("yaf011"); //修改后的--银行同城异地标志

		var aac002_old = Base.getValue("aac002_old"); //修改前的--证件号码
		var aac003_old = Base.getValue("aac003_old"); //修改前的--姓名
		var aac059_old = Base.getValue("aac059_old"); //修改前的--领取人证件类型
		var yad169_old = Base.getValue("yad169_old");
		var aae145_old = Base.getValue("aae145_old"); //修改前的--发放方式
		var aac059_old = Base.getValue("aac059_old"); //修改前的--领取人证件类型
		var aae136_old = Base.getValue("aae136_old"); //修改前的--领取人证件号
		var aae133_old = Base.getValue("aae133_old"); //修改前的--领取人姓名
		var aaf002_old = Base.getValue("aaf002_old"); //修改前的--银行类别
		var aae010_old = Base.getValue("aae010_old"); //修改前的--银行账户
		var aae007_old = Base.getValue("aae007_old"); //修改前的--邮政编码
		var aae006_old = Base.getValue("aae006_old"); //修改前的--详细地址
		var aaz009_old = Base.getValue("aaz009_old"); //修改前的--代发机构名称
		var yaf012_old = Base.getValue("yaf012_old"); //修改前的--开户银行类别
		var yaf013_old = Base.getValue("yaf013_old"); //修改前的--开户银行编号
		var yaf001_old = Base.getValue("yaf001_old"); //修改前的--开户银行名称
		var yaf011_old = Base.getValue("yaf011_old"); //修改后的--银行同城异地标志

		//	if (yad169 == yad169_old){
		if (yad169 == yad169_old && aae145 == aae145_old && aac059 == aac059_old 
				&& aae136 == aae136_old && aae133 == aae133_old && aaf002 == aaf002_old 
				&& aae010 == aae010_old && aae007 == aae007_old && aae006 == aae006_old 
				&& aaz009 == aaz009_old && yaf012 == yaf012_old && yaf013 == yaf013_old
				&& yaf001 == yaf001_old && yaf011 == yaf011_old) {
			Base.alert("信息没被修改，不能提交，请确认！", "warn");
			return false;
		} else {
			var aaz099 = Base.getValue("aaz099");
			if (aaz099 == null || aaz099 == '') {
				Base.alert("请选择一条发放信息！", "warn");
				return false;
			} else {
				return true;
			}
		}
	}

	// 保存经办信息
	function toSave() {
		if (fn_check() == true) {
			Base.submit("form1", "paymentInfoMaintenanceAction!toSave.do", null, null, null, function() {});
		}
	}

	function fn_setpagedata() {
		var rowdata = Base.getGridSelectedRows("ac63GridList");
		var yad169 = rowdata[0].yad169;
		var aae145 = rowdata[0].aae145; //发放方式
		var aac059 = rowdata[0].aac059; //领取人证件类型
		var aae136 = rowdata[0].aae136; //领取人证件号
		var aae133 = rowdata[0].aae133; //领取人姓名
		var aaf002 = rowdata[0].aaf002; //银行类别
		var aae010 = rowdata[0].aae010; //银行账户
		var aaz009 = rowdata[0].aaz009; //代发机构名称
		var yaf012 = rowdata[0].yaf012; //开户银行类别
		var yaf013 = rowdata[0].yaf013; //开户银行编号
		var yaf001 = rowdata[0].yaf001; //开户银行名称
		var aae007 = rowdata[0].aae007; //邮政编码
		var aae006 = rowdata[0].aae006; //详细地址
		var aaz099 = rowdata[0].aaz099; //发放信息ID
		var yaf011 = rowdata[0].yaf011; //银行同城异地标志
		var yaz099 = rowdata[0].yaz099; //组织发放信息ID
		var aac042 = rowdata[0].aac042; //代办人姓名
		var aac044 = rowdata[0].aac044; //代办人证件号码
		var aac045 = rowdata[0].aac045; //代办人电话

		Base.setValue("yad169", yad169); //发放方式
		Base.setValue("aae145", aae145); //发放方式
		Base.setValue("aac059", aac059); //领取人证件类型
		Base.setValue("aae136", aae136); //领取人证件号
		Base.setValue("aae133", aae133); //领取人姓名
		Base.setValue("aaf002", aaf002); //银行类别
		Base.setValue("aae010", aae010); //银行账户
		Base.setValue("aaz009", aaz009); //代发机构名称
		Base.setValue("yaf012", yaf012); //开户银行类别
		Base.setValue("yaf013", yaf013); //开户银行编号
		Base.setValue("yaf001", yaf001); //开户银行名称
		Base.setValue("yaf011", yaf011); //银行同城异地标志
		Base.setValue("aae007", aae007); //邮政编码
		Base.setValue("aae006", aae006); //详细地址
		Base.setValue("yaz099", yaz099); //组织发放信息ID
		Base.setValue("aac042", aac042); //代办人姓名
		Base.setValue("aac044", aac044); //代办人证件号码
		Base.setValue("aac045", aac045); //代办人电话

		Base.setValue("yad169_old", yad169); //发放方式
		Base.setValue("aae145_old", aae145); //发放方式
		Base.setValue("aac059_old", aac059); //领取人证件类型
		Base.setValue("aae136_old", aae136); //领取人证件号
		Base.setValue("aae133_old", aae133); //领取人姓名
		Base.setValue("aaf002_old", aaf002); //银行类别
		Base.setValue("aae010_old", aae010); //银行账户
		Base.setValue("aaz009_old", aaz009); //代发机构名称
		Base.setValue("yaf012_old", yaf012); //开户银行类别
		Base.setValue("yaf013_old", yaf013); //开户银行编号
		Base.setValue("yaf001_old", yaf001); //开户银行名称
		Base.setValue("yaf011_old", yaf011); //银行同城异地标志
		Base.setValue("aae007_old", aae007); //邮政编码
		Base.setValue("aae006_old", aae006); //详细地址
		Base.setValue("yaz099_old", yaz099); //组织发放信息ID
		Base.setValue("aac042_old", aac042); //代办人姓名
		Base.setValue("aac044_old", aac044); //代办人证件号码
		Base.setValue("aac045_old", aac045); //代办人电话

		Base.setValue("aaz099", aaz099);
		if (yad169 == "11") {
			Base.showObj("aac059");
			Base._setReadOnly("ffxxlr", false);
		} else {
			Base.hideObj("aac059");
			Base._setReadOnly("ffxxlr", true);
			Base._setReadOnly("yad169", false);
		}
		fn_setPaymentInfoReadOnlyPage();
		Base.submit("form1", "paymentInfoMaintenanceAction!setyaf013andaaz009List.do", null, null, false, function() {
			Base.setValue("yaf013", yaf013); //开户银行编号
			Base.setValue("aaz009", aaz009); //代发机构名称
		});
	}

	function fn_detailsdymxview(e, row) {
		var aae140 = Base.getValue("aae140");
		Base.openWindow("userwin", "明细信息", "paymentInfoMaintenanceAction!details.do", {
			"dto['aaz099']" : row.aaz099,
			"dto['aae140']" : aae140
		}, '55%', '70%', null, "", true);
	}

	//当选择支付对象为单位或机构时弹出窗口，在窗口中选择机构或单位   
	function fn_privateContorlYaz099() {
		var aae140 = Base.getValue("aae140");
		var yad169 = Base.getValue("yad169");
		var yaz099 = window.showModalDialog("paymentInfoMaintenanceAction!selectUnitInfoWindow.do?aae140=" + aae140 + "&yad169=" + yad169, null, 'dialogWidth:1000px;dialogHeight:500px;help:no;unadorned:no;resizable:no;toolbar=no;menubar=no;resizable=yes;location=no;status=no;scrollbars=no');
		return yaz099;
	}

	// 列渲染方法,结算但未拨付表示蓝色，已拨付红色
	function fnFormatter(row, cell, value, columnDef, dataContext) {
		var aae117 = dataContext.aae117;
		if (aae117 == "4") {
			if ("" == value || null == value)
				value = "";
			else
				value = "<span style = 'color:red;'>" + value + "</span>";
		}
		return value;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>