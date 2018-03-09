<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>WorkinjuryCognizance</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose"	hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认[P]" hotKey="P"	asToolBarItem="true" display="false" />
			<ta:button id="verityBtn" icon="icon-save" key="审核记录"  asToolBarItem="true" onClick="verityHistorySuggestView();" display="false" />
			<ta:button id="queryBtn" key="查询人员缴费明细[Q]" icon="xui-icon-query"	hotKey="Q" onClick="fn_personJfmxQuery()" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>
			<ta:panel id="jbxxfset" cssStyle="margin:0px;" key="基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<ta:text id="aab001" key="单位检索条件" readOnly="true" labelWidth="130" required="true"/>
				<ta:text id="aae044" key="工伤单位名称" readOnly="true" labelWidth="130" />
				<ta:selectInput id="aab019" key="单位性类型" collection="AAB019" readOnly="true" labelWidth="130" />
			</ta:panel>

			<!-- 录入工伤认定登记信息 -->
			<ta:panel id="gsrdxx" key="工伤认定信息" cols="3">
				<ta:text id="aaz128" key="工伤申报id" display="false" />
				<ta:text id="aaz127" key="工伤认定id" display="false" />
				<ta:selectInput id="ylc035" key="工伤人员类别" required="true" collection="YLC035" onSelect="validateYLC035" value="1" filter="2,3"  labelWidth="130" />
				<ta:selectInput id="alc021" key="伤害程度" required="true" collection="ALC021" onSelect="validateALC021" labelWidth="130" filter="3,4" />
				<ta:selectInput id="alc022" key="伤害部位" collection="ALC022"  labelWidth="130" />
				<ta:selectInput id="ala023" key="与受伤害人关系" collection="ALA023"	labelWidth="130" />
				<ta:date id="alc020" key="工伤发生时间" showSelectPanel="true" required="true" validNowTime="left" onChange="timealert();"  labelWidth="130" />
				<ta:date id="alc040" key="死亡/失踪日期" showSelectPanel="true"	required="true" validNowTime="left"	labelWidth="130" />
				<ta:selectInput id="aja004" key="农民工标识" required="true" collection="AJA004" labelWidth="130" readOnly="true" value="0"/>
				<ta:date id="alc026" key="申报日期" showSelectPanel="true"	required="true" validNowTime="left" labelWidth="130" onChange="slrq_gstimepd()" />
				<ta:date id="alc017" key="受理日期" validNowTime="left" showSelectPanel="true" labelWidth="130" 	onChange="yhjb_gstimepd()" />
				<ta:text id="alc011" key="认定书编号" required="true" labelWidth="130" />					
				<ta:selectInput id="alc029" key="工伤认定结论" collection="ALC029"	required="true" filter="1,2" reverseFilter="true" labelWidth="130" />
				<ta:text id="alc030" key="工伤认定机构" required="true" labelWidth="130" />
				<ta:date id="alc031" key="工伤认定日期" validNowTime="left" 	showSelectPanel="true" labelWidth="130" required="true" onChange="yhjb_gstimepd()" />
				<ta:selectInput id="alc027" key="工亡类别" collection="ALC027" labelWidth="130" display="false" />
				<ta:text id="aca111" key="职业/工种" labelWidth="130" />
				<ta:selectInput id="ala017" key="职业病" collection="ALA017" labelWidth="130" />
				<ta:text id="alc007" key="诊断机构" labelWidth="130" />
				<ta:date id="ylc045" key="停工留薪期开始" validNowTime="left" labelWidth="130" showSelectPanel="true" />
				<ta:date id="ylc046" key="停工留薪期结束" validNowTime="right" labelWidth="130" showSelectPanel="true" />
				<ta:text id="aac042" key="申报人姓名" labelWidth="130" />
				<ta:selectInput id="aac043" key="申报人证件类型" collection="AAC043" 	labelWidth="130" />
				<ta:text id="aac044" key="申报人证件号码" maxLength="18" labelWidth="130" />
				<ta:text id="aac045" key="申报人电话" validType="number" labelWidth="130" />
				<ta:text id="aac046" key="申报人地址" labelWidth="130" />
				<ta:selectInput id="ala016" span="2" key="认定依据" value="107" required="true" collection="ALA016"	onSelect="changeAla017"  labelWidth="130" />
				<ta:textarea id="alc006" span="3" key="伤害事件情况" maxLength="200"	height="40px" labelWidth="130" />
				<ta:textarea id="alc014" span="3" key="诊断意见" maxLength="200"	height="40px" labelWidth="130" required="true" />
			</ta:panel>

			<!-- 历史工伤认定列表，可修改或删除选中项 -->
			<ta:panel key="工伤认定历史信息" id="lsrdxx">
				<ta:datagrid id="lc31Grid">
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" 	width="50" align="center" click="fnDelRow" />
					<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate"	width="50" align="center" click="fnUpdate" />
					<ta:datagridItem id="aaz128" key="工伤申报ID" hiddenColumn="true"  dataAlign="center"/>
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" dataAlign="center" />
					<ta:datagridItem id="aab999" key="单位管理码" hiddenColumn="true" dataAlign="center" />
					<ta:datagridItem id="aae044" key="单位名称" width="200" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc020" key="工伤发生时间" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022"	align="center" dataAlign="center" />
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021"	align="center" dataAlign="center" />
					<ta:datagridItem id="ala023" key="与受伤害人关系" collection="ALA023"	width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="alc026" key="申报日期" align="center" dataAlign="center" />
					<ta:datagridItem id="alc007" key="诊断机构" align="center" dataAlign="center" />
					<ta:datagridItem id="aca111" key="职业/工种" collection="ACA111"	align="center" dataAlign="center" />
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017"  align="center" dataAlign="center" />
					<ta:datagridItem id="ylc035" key="工伤人员类别" collection="YLC035"	width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="alc040" key="因工死亡(失踪)日期" width="140"	align="center" dataAlign="center" />
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true" />
					<ta:datagridItem id="ylc043" key="解除劳动合同" width="120"		hiddenColumn="true" />
					<ta:datagridItem id="ala016" key="认定依据" collection="ALA016"	align="center" dataAlign="center" showDetailed="true"/>
					<ta:datagridItem id="alc011" key="认定书编号" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc017" key="受理日期" align="center"	dataAlign="center" />
					<ta:datagridItem id="alc029" key="工伤认定结论" collection="ALC029"	width="120" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc030" key="工伤认定机构" width="120" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc031" key="工伤认定日期" width="120"	align="center" dataAlign="center" />
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027"	align="center" dataAlign="center"/>
					<ta:datagridItem id="ylc045" key="停工留薪期开始" width="120" 	align="center" dataAlign="center" />
					<ta:datagridItem id="ylc046" key="停工留薪期结束" width="120"		align="center" dataAlign="center" />
					<ta:datagridItem id="aac042" key="申报人姓名" hiddenColumn="true" />
					<ta:datagridItem id="aac043" key="申报人证件类型" hiddenColumn="true" />
					<ta:datagridItem id="aac044" key="申报人证件号码" hiddenColumn="true" />
					<ta:datagridItem id="aac045" key="申报人电话" hiddenColumn="true" />
					<ta:datagridItem id="aac046" key="申报人地址" hiddenColumn="true" />
					<ta:datagridItem id="alc026" key="报告日期" hiddenColumn="true" />
					<ta:datagridItem id="alc006" key="伤害事件情况" hiddenColumn="true" />
					<ta:datagridItem id="alc014" key="诊断意见" hiddenColumn="true" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">

// 页面初始化
$(document).ready(function() {
	$("form").css("overflow", "auto");

});

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","workinjuryCognizanceAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001")});
	}, true);
}

//rpc 查询给页面个人基本信息赋值
function fn_setPersonBaseInfoData(){
	Base.setValue("aac001",g_Suggest[2]);
	Base.setValue("aac002",g_Suggest[0]);
	Base.setValue("aac003",g_Suggest[1]);	
	Base.setValue("aac004",g_Suggest[3]);
	Base.setValue("aab001",g_Suggest[5]);
	Base.setValue("aae044",g_Suggest[6]);
}

//回调函数查询初始化页面信息
function fn_queryInfo() { //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	if (g_Suggest != "") {
		fn_setPersonBaseInfoData();
		var aac001 = Base.getValue("aac001");
		Base.submit("", "workinjuryCognizanceAction!queryPersonInfo.do", {
			"dto['aac001']" : aac001
		});
	}
}

//单位信息查询回调函数
function fn_ab01Info() {
	if (g_Suggest != "") {
		fn_setUnitBaseInfoData();
		timealert();
	}
}

//患职业病改变必录项
function changeAla017() {
	if (ala016 != "104") {
		Base._setIsRequired("ala017", false);//职业病
		Base._setIsRequired("aca111", false);//职业工种
		return false;
	} else{
		Base._setIsRequired("ala017", true);//职业病
		Base._setIsRequired("aca111", true);//职业工种
		return true;
	}
}

function changeAla016() {
	var ylc035 = Base.getValue("ylc035");//认定依据类别
	var ala016 = Base.getValue("ylc035");//认定依据类别
	if (ylc035 != "1" & ylc035 != "2") {
	    Base.setValue("ala016","104");
	} 	
}

function validateYLC035() {
    changeAla016();
}

//时间点是否参加工伤保险
function timealert() {
	var alc020 = Base.getValue("alc020");
	var alc040 = Base.getValue("alc040");
	var aab001 = Base.getValue("aab001");
	var ylc035 = Base.getValue("ylc035");
	if (aab001 == null || aab001 == "") {
//		return false;
	}

	if ((alc020 != null && alc020 != "") && (alc040 != null && alc040 != "")) {
		if (alc020 > alc040) {
			alert("工伤发生时间晚于失踪或死亡时间，请核实！")
			Base.setValue("alc040", "");
			Base.focus(alc040);
		}
	}

	//工伤
	if (alc020 != null && alc020 != "" && ylc035 != "2") {
		Base.submit("ylc035,aac001",
				"workinjuryCognizanceAction!insureInfo.do", {
					"dto['timePoint']" : alc020,
					"dto['aab001']" : aab001,
					"dto['aae044']" : Base.getValue("aae044")
				});
	}
	//工亡 
	if (alc040 != null && alc040 != "" && ylc035 != "2") {
		Base.submit("ylc035,aac001",
				"workinjuryCognizanceAction!insureInfo.do", {
					"dto['timePoint']" : alc040,
					"dto['aab001']" : aab001,
					"dto['aae044']" : Base.getValue("aae044")
				});
	}
	
}

//伤害程度为受伤时工伤死亡、失踪时间，工亡类别不可录入(不能认定两次死亡)
function validateALC021() {
	var alc021 = Base.getValue("alc021");
	if ("2" == alc021 || "3" == alc021) {
		Base.setValue("alc040", "");
		Base._setIsRequired("alc040", false);
		Base.setReadOnly("alc040");
		//Base._setIsRequired("alc022",false);
		Base._setReadOnly("alc022", false);
	} else {
		//更改工伤亡时间可读
		Base._setIsRequired("alc040", true);
		Base._setReadOnly("alc040", false);
		//失踪没有伤害部位
		if ("4" == alc021) {
			Base.setValue("alc022", "");
			Base._setIsRequired("alc022", false);
			Base.setReadOnly("alc022");
		} else {
			Base._setReadOnly("alc022", false);
		}

		//判断操作不是更新
		var aaz127 = Base.getValue("aaz127");
		if (aaz127 != null && aaz127 != "") {
			return false;
		}
		//不能认定两次死亡或失踪，更新不判断
		var rowData = Base.getGridData("lc31Grid");
		for ( var i = 0; i < rowData.length; i++) {
			if (rowData[i].alc021 == "1" || rowData[i].alc021 == "4") {
				Base.alert("该人员已进行过失踪或死亡认定!");
				Base.setValue("alc021", "");
				return false;
			}
		}
	}

	//判断生存状态与工伤程度匹配
	var aac060 = Base.getValue("aac060");
	if (aac060 == null || aac060 == "") {
		return false;
	}
	if ("1" == aac060 || "3" == aac060) {
		if ("1" == alc021 || "4" == alc021) {
			Base.alert("该人员生存状态正常，不能认定死亡或失踪！");
			Base.setValue("alc021", "");
		}
	}

	if ("2" == aac060) {
		if ("1" != alc021) {
			Base.alert("该人员生存状态死亡，不能认定非死亡！");
			Base.setValue("alc021", "");
		}
	}

	if ("9" == aac060) {
		if ("4" != alc021) {
			Base.alert("该人员生存状态不明，不能认定非失踪！");
			Base.setValue("alc021", "");
		}
	}
}

function slrq_gstimepd() {
	var alc026 = Base.getValue("alc026");//受理日期
	var alc020 = Base.getValue("alc020"); //工伤发生日期
	if ((alc026 != null && alc026 != '') && (alc020 != null && alc020 != "")) {
		if (alc026 < alc020) {
			alert("工伤发生时间晚于申报时间，请核实！")
			Base.setValue("alc026", "");
			Base.focus(alc026);
		}
		var aDate, oDate1, oDate2,iDays;
		aDate = alc026.split("-");
		oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); //转换为10-18-2004格式
		aDate = alc020.split("-");
		oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
		iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
		if (iDays>30) { 	    	
			Base.alert("申报时间距离工伤发生时间超过了30天，请核实！")
			Base.focus(alc026);
		}
	}
}
function yhjb_gstimepd() {
	var alc031 = Base.getValue("alc031");
	var alc017 = Base.getValue("alc017");
	var alc020 = Base.getValue("alc020");

	if ((alc031 != null && alc031 != '') && (alc020 != null && alc020 != "")) {
		if (alc031 < alc020) {
			alert("工伤发生时间晚于工伤认定时间，请核实！")
			Base.setValue("alc031", "");
			Base.focus(alc031);
		}
	}

	if ((alc017 != null && alc017 != '') && (alc020 != null && alc020 != "")) {
		if (alc017 < alc020) {
			alert("工伤发生时间晚于受理时间，请核实！")
			Base.setValue("alc017", "");
			Base.focus(alc017);
		}
	}

	if ((alc031 != null && alc031 != '') && (alc017 != null && alc017 != "")) {
		if (alc031 < alc017) {
			alert("受理时间晚于工伤认定时间，请核实！")
			Base.setValue("alc031", "");
			Base.focus(alc031);
		}
	}
}

//修改认定信息
function fnUpdate(data, e) {
	Base.setValue("aaz128", data.aaz128); //工伤申报ID
	Base.setValue("aab001", data.aab001); //单位ID
	Base.setValue("aae044", data.aae044); //单位名称 
	Base.setValue("aac042", data.aac042); //申报人姓名  
	Base.setValue("alc020", data.alc020); //工伤发生时间
	Base.setValue("alc022", data.alc022); //伤害部位
	Base.setValue("alc021", data.alc021); //伤害程度
	Base.setValue("ala023", data.ala023); //与受伤害人关系
	Base.setValue("alc026", data.alc026); //报告日期       
	Base.setValue("alc007", data.alc007); //诊断机构       
	Base.setValue("aca111", data.aca111); //职业/工种
	Base.setValue("ala017", data.ala017); //职业病
	Base.setValue("ylc035", data.ylc035); //工伤人员类别
	Base.setValue("alc040", data.alc040); //因工死亡(失踪)日期
	Base.setValue("aaz127", data.aaz127); //工伤认定信息ID
	Base.setValue("ala016", data.ala016); //认定依据
	Base.setValue("alc011", data.alc011); //认定书编号    
	Base.setValue("alc017", data.alc017); //受理日期     
	Base.setValue("alc029", data.alc029); //工伤认定结论
	Base.setValue("alc030", data.alc030); //工伤认定机构
	Base.setValue("alc031", data.alc031); //工伤认定日期
	Base.setValue("alc027", data.alc027); //工亡类别
	Base.setValue("ylc043", data.ylc043); //解除劳动合同
	Base.setValue("ylc045", data.ylc045); //停工留薪期开始
	Base.setValue("ylc046", data.ylc046); //停工留薪期结束
	Base.setValue("aac043", data.aac043); //申报人证件类型
	Base.setValue("aac044", data.aac044); //申报人证件号码
	Base.setValue("aac045", data.aac045); //申报人电话
	Base.setValue("aac046", data.aac046); //申报人地址
	Base.setValue("alc006", data.alc006); //伤害事件情况
	Base.setValue("alc014", data.alc014); //诊断意见
	validateALC021();
}

//删除认定信息
function fnDelRow(data, e) {
	var aaz127 = data.aaz127;
	var aaz128 = data.aaz128;
	Base.confirm("确认要删除?", function(btn, callback, options) {
		if (btn) {
			Base.submit("procInc,jbxxfset", "workinjuryCognizanceAction!toSave.do", {
				"dto['aaz127']" : aaz127,
				"dto['aaz128']" : aaz128,
				"dto['yae587']" : "3"
			});
		}
	});
}

//保存经办信息
function submitData() {
	if (!Base.validateForm("gsrdxx")) {
		Base.hideMask();
		return false;
	}

	//操作选择
	var aaz127 = Base.getValue("aaz127");
	if (aaz127 != null && aaz127 != "") {
		if (!confirm("确认更新？")) {
			return false;
		}
	}

	Base.submit("form1", "workinjuryCognizanceAction!toSave.do");
}
</script>
<%@ include file="/ta/incfooter.jsp"%>