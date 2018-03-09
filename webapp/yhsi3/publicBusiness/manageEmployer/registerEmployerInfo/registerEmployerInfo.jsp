<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位参保登记</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeWinBtn" key="关闭[C]" icon="icon-remove" hotKey="C" onClick="closeWin();" asToolBarItem="true" display="false" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:box id="fld_dwlx" cols="3">
			<ta:selectInput id="yab019" key="单位管理类型" labelWidth="125" collection="YAB019" required="true" onSelect="checked_k" />
		</ta:box>
		<ta:panel fit="true">
			<ta:tabs id="tbsSI" fit="true">
				<ta:tab id="tbRegistSI" key="单位基本信息" cssStyle="overflow:auto">
					<ta:panel id="fld_dwxx" key="单位信息" cols="3" expanded="false" scalable="false">
						<ta:text id="isTab" key="是否被选中tab" display="false" />
						<ta:text id="aaz002" key="业务日志ID" display="false" />
						<ta:text id="aae044" key="单位名称" labelWidth="125" span="2" maxLength="100" required="true" onChange="fnChangeAAE044()" />
						<ta:text id="aab001" key="单位编号" labelWidth="125" readOnly="true" />
						<ta:text id="aab999" key="单位管理码" labelWidth="125" maxLength="20" onChange="fnCkAab999();" />
						<ta:text id="yab559" key="单位档案编号" labelWidth="125" maxLength="20" />
						<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="125" required="true" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
						<ta:selectInput id="aaa149" key="行业风险类别" labelWidth="125" required="true" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAA149" onSelect="fnSlectAAA149" />
						<ta:selectInput id="aab022" key="行业代码" labelWidth="125" required="true" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
						<ta:selectInput id="aab019" key="单位类型" labelWidth="125" required="true" islevel="true" isMustLeaf="true" onSelect="fncheckaab019" />
						<ta:selectInput id="aab021" key="隶属关系" labelWidth="125" required="true" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
						<ta:selectInput id="aab020" key="经济类型" labelWidth="125" required="true" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
						<ta:selectInput id="aab301" key="所属行政区代码" labelWidth="125" collection="AAB301" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
						<ta:selectInput id="yab243" key="单位所在地" labelWidth="125" display="true" collection="AAB301" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
						<ta:text id="aae045" key="法人代表姓名" required="true" maxLength="50" labelWidth="125" />
						<ta:text id="aae046" key="法人公民身份证号码" validType="idcard" maxLength="18" labelWidth="125" />
						<ta:text id="aae013" key="备注" labelWidth="125" span="3" maxLength="200" />
						<ta:text id="systime" key="服务器时间" labelWidth="125" display="false" />
					</ta:panel>
					<ta:panel id="fld_gsxx" key="成立信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aae053" key="组织机构代码" labelWidth="125" bpopTipPosition="bottom" maxLength="10" required="true" bpopTipMsg="10位字符,只能是'-'或数字并且倒数第二位为'-'" onChange="fnCheckaae053()" />
						<ta:text id="aab023" key="主管部门" labelWidth="125" maxLength="100" />
						<ta:date id="aae047" key="成立日期" showSelectPanel="true" labelWidth="125" />
						<ta:text id="aae048" key="批准成立部门" maxLength="100" labelWidth="125" />
						<ta:date id="aae049" key="批准成立日期" showSelectPanel="true" labelWidth="125" onBlur="fnCheckBuildTime()" />
						<ta:text id="aae051" key="批准成立文号" labelWidth="125" maxLength="100" />
					</ta:panel>
					<ta:panel id="fld_swxx" key="联系信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aae006" key="地址" labelWidth="125" maxLength="200" required="true" span="2" />
						<ta:text id="aae007" key="邮政编码" labelWidth="125" validType="zipcode" required="true" maxLength="6" />
						<ta:text id="aae004" key="联系人姓名" labelWidth="125" maxLength="60" required="true" onChange="fnChangeAAE004()" />
						<ta:text id="aae005" key="联系电话" labelWidth="125" required="true" validType="mobile" maxLength="50" onChange="fnChangeAAE005()" />
						<ta:text id="aae159" key="联系电子邮箱" labelWidth="125" validType="email" maxLength="50" />
					</ta:panel>
					<ta:panel id="fld_dwzg" key="专管员信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aab016" key="专管员姓名" labelWidth="125" maxLength="60" required="true" />
						<ta:text id="aab018" key="专管员联系电话" labelWidth="125" validType="mobile" maxLength="50" required="true" />
						<ta:text id="yab237" key="专管员所在部门" labelWidth="125" maxLength="100" />
					</ta:panel>
					<ta:panel id="fld_gsdzxx" key="工商登记信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aab007" key="登记执照号码" labelWidth="125" maxLength="50" />
						<ta:date id="aab008" key="登记发照日期" labelWidth="125" showSelectPanel="true" />
						<ta:selectInput id="aab006" key="登记执照种类" labelWidth="125" collection="AAB006" islevel="true" isMustLeaf="true" maxVisibleRows="10" />
						<ta:text id="aab009" key="有效期限（年）" labelWidth="125" validType="number" maxLength="6" />
					</ta:panel>
					<ta:panel id="fld_swdzxx" key="税务登记信息" fit="true" cols="3" expanded="false" scalable="false">
						<ta:selectInput id="yab240" key="地税征收城市" labelWidth="125" collection="AAB301" islevel="true" isMustLeaf="true" maxVisibleRows="10" onSelect="fnSelectYab240" />
						<ta:box cols="2">
							<ta:text id="aaz066" key="税务机构ID" labelWidth="125" required="true" maxLength="20" minLength="1" bpopTipMsg="可输入税务机构ID、税务机构名称、税号查询" onChange="callSwRPC()" columnWidth="0.9" />
							<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
								<ta:button id="showSbjgRPCBtn" key="?" onClick="showSbjgRPC()" />
							</ta:buttonLayout>
						</ta:box>
						<ta:text id="yae433" key="税务机构名称" labelWidth="125" maxLength="100" />
						<ta:text id="aab030" key="税号" labelWidth="125" maxLength="20" onChange="fn_jump()" />
					</ta:panel>
				</ta:tab>
				<ta:tab id="tb_dwtb" key="单位参保信息">
					<%@ include file="/yhsi3/commonJSP/xzlx_dw.jsp"%>
					<ta:buttonLayout align="left">
						<ta:button id="butTB" key="信息数据共享[C]" hotKey="alt+G" icon="icon-ok" onClick="fnTbxx()" />
					</ta:buttonLayout>
					<ta:tabs id="tbs_xzxx" fit="true" onSelect="fnSelectTab">
						<%@ include file="/yhsi3/commonJSP/xzlx_tab_dw.jsp"%>
					</ta:tabs>
				</ta:tab>
				<ta:tab id="tb_fzjg" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		//税务名称 initializeSuggestFramework 已使用1-22
		initializeSuggestFramework(23, "af06", 'aaz066', 400, 80, 3, fnSelect23, 0, false);
		
		//打回重办时隐藏机关养老
		fncheckaab019();
		// 为组织机构代码添加按钮释放事件：自动设置"-"格式
		var aae053 = document.getElementById("aae053");
		$(aae053).bind("keyup",
		function(e) {
			var aae053 = Base.getValue("aae053");
			var leng = aae053.length;
			if (leng == 8) {
				if (e.keyCode == 8) {
					aae053 = aae053.replaceAll("-", "");
					aae053 = aae053.substring(0, aae053.length - 1);
					Base.setValue("aae053", aae053);
				} else {
					Base.setValue("aae053", aae053 + "-");
				}
			}
		});
	});

	function fnSelect23() {
		Base.setValue("aaz066", g_Suggest[0]);
		Base.setValue("yae433", g_Suggest[1]);
		Base.setValue("aab030", g_Suggest[2]);
	}

	//税务机构：多参数检索下拉框数据
	function callSwRPC() {
		var yab240 = Base.getValue("yab240");
		if (yab240 != '') {
			suggestQuery(23, myPath() + "/process/synthesis/suggestFrameworkAction!getSWInfoString.do", 
			{
				"dto['aab301']": Base.getValue('yab240'),
				"dto['inputString']": Base.getValue("aaz066")
			});
		}
	}
	function showSbjgRPC() {
	    var yab240 = Base.getValue("yab240");
	    if (yab240 != ''){
			Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow03.do", {"dto['aab301']": yab240}, 1000, 450, null, null, true);
	    }
	}
	//根据单位管理类型来显示整个页面可录入
	function checked_k() {
		var yab019 = Base.getValue("yab019");
		var ary = ["110", "120", "210", "310", "311", "330", "320", "370", "340", "410", "510"];
		if (yab019 != "") {
			Base.setEnable("tbsSI,saveBtn");
			Base.setReadOnly("aab001");
			for (var i = 0; i < ary.length; i++) {
				Base.getObj("aae140_all").checked = false;
				Base.getObj("aae140_" + ary[i]).checked = false;
				Base.setReadOnly(ary[i] + 　"_aaf002");
				Base.setReadOnly("sb_" + ary[i] + 　"_aae010");
				Base.setReadOnly("sb_" + ary[i] + 　"_aae009");
				Base.setReadOnly(ary[i] + 　"_aae044");
			}
			// 隐藏了企业补充
			Base.submit(null, 'registerEmployerInfoAction!toCheckids.do', {
				"dto['yab019']": yab019
			},
			false, false,
			function() {
				var yab019 = Base.getValue("yab019");
				if (yab019 == '02') {
					Base.setValue('aab022', '1583');
					Base.setValue('aaa149', '1');
					Base.setReadOnly('aaa149');
					Base.setValue('aab019', '99');
					Base.setReadOnly('aab019');
					Base.setValue('aab020', '900');
					Base.setValue('aab021', '90');
				} else {
					Base.setValue('aab019', '10');
					Base.setEnable('aab019');
					//默认为企业 需要隐藏机关养老与公务员补充
					Base.hideObj("aae140_120,aae140_320");
				}
			});
		}
	}

	//单位名称
	function fnChangeAAE044() {
		Base.submit("aae044,yab019", 'registerEmployerInfoAction!toCheckAAE044.do', null, null, false,
		function() {
			var ary = ['110', '210', '310', '311', '320', '330', '340', '370', '410', '510'];
			for (var i = 0; i < ary.length; i++) {
				var aab033 = Base.getValue(ary[i] + "_aab033");
				if (aab033 == "1") {
					Base.setValue("dw_" + ary[i] + "_aae009", Base.getValue("aae044"));
				}
			}
		});
	}

	//检测单位管理码+重复校验
	function fnCkAab999() {
		var aab999 = Base.getValue("aab999");
		if (/.*[\u4e00-\u9fa5]+.*$/.test(aab999)) {
			Base.alert("单位管理码不能包含中文,请重新输入!", "warn");
			Base.setValue("aab999", "");
			Base.focus("aab999");
			return;
		}
		Base.submit('aab999', 'registerEmployerInfoAction!toCheckAab999Repeat.do');
	}

	//行业风险类别自动默认行业代码
	function fnSlectAAA149(key, value) {
		Base.submit('aaa149,yab019', 'registerEmployerInfoAction!toSelectAAA149.do');
	}

	// 选择单位类型 变更 特殊单位类别
	function fncheckaab019() {
		var yab019 = Base.getValue("yab019");
		var aab019 = Base.getValue("aab019");

		//如果是个体工商户（有雇工的）,则不参加生育保险
		if (yab019 == "01" && aab019 == "80") {
			Base.setDisabled("aae140_510");
		} else {
			Base.setEnable("aae140_510");
		}

		if (yab019 == '02') { //灵活就业单位
			$("#aae140_110").attr("checked", true);
			$("#aae140_120").attr("checked", false);
			checkedAae140('110');
			checkedAae140('120');
			Base.showObj("aae140_110,aae140_310,aae140_330");
		}

		if (yab019 == '01') { //普通单位
			if (aab019.substr(0, 1) == "3" || aab019.substr(0, 1) == "5") { //机关事业
				Base.setDisRequired("aab022,aaa149");
				Base.setValue("aaa149", "1");
				Base.setValue("aae140_120","aae140_120");
				Base.setValue("aae140_110","");
				checkedAae140('110');
				checkedAae140('120');
				Base.showObj("aae140_120,aae140_320");
			} else if (aab019 == "80") {
				Base.filterSelectInput("110_yaz289", "11001");
				Base.setValue("110_yaz289", "11003");
				Base.setValue("aae140_510","");
			} else { //其它
				Base.activeTab("tb_dwtb");
				Base.setRequired("aab022,aaa149");
				// 操作险种选择项
				Base.setValue("aae140_110","aae140_110");
				Base.setValue("aae140_120","");
				checkedAae140('110');
				checkedAae140('120');
				Base.hideObj("aae140_120,aae140_320");
			}
		}
	}

	//使用联系人姓名默认专管员姓名
	function fnChangeAAE004() {
		Base.setValue("aab016", Base.getValue("aae004"));
	}

	//使用联系人姓名默认专管员姓名
	function fnChangeAAE005() {
		Base.setValue("aab018", Base.getValue("aae005"));
	}

	//地税征收城市控制地税信息可录入
	function fnSelectYab240(key, value) {
		var yab240 = Base.getValue("yab240");
		if (yab240 != '') {
			Base.setEnable("aab030,aaz066,yae433");
		}
	}

	//检测协议号是否包含中文+重复校验
	function fnXyh(id) {
		var yae106 = Base.getValue(id);
		if (/.*[\u4e00-\u9fa5]+.*$/.test(yae106)) {
			alert("协议号不能包含中文,请重新输入!");
			Base.setValue(id, "");
			Base.focus(id);
		}
		Base.submit(null, 'registerEmployerInfoAction!checkYae106.do', {
			"dto['yae106ID']": id,
			"dto['yae106']": yae106
		});
	}

	//保存参保信息
	function submitData() {
		var param = {};
		var sel = ""; //记录选中的复选框
		//复选框选中，则对应值设为1，否则设为0,拼凑JSON格式字符串
		var ary = ["aae140_110", "aae140_120", "aae140_210", "aae140_310", "aae140_311", "aae140_330", "aae140_320", "aae140_370", "aae140_340", "aae140_350", "aae140_410", "aae140_510"];
		var cbList = "[";
		for (var i = 0; i < ary.length; i++) {
			if ($("#" + ary[i])[0] != undefined && $("#" + ary[i])[0].checked == true) {
				sel = sel + ary[i] + "|";
				cbList = cbList + "{" + ary[i] + ":" + "1" + "}";
			} else {
				cbList = cbList + "{" + ary[i] + ":" + "0" + "}";
			}
		}
		cbList = cbList + "]";
		param.cbList = cbList;

		//所有选中的复选框是否必输项都填了
		var isAll = true; //整个页面的必输项是否填写完整
		var selec = sel.split("|"); //获取选中的复选框的id
		var allCheckError;
		var errorAae140;
		var aae140_aab033 = "";
		var aae140_aab033_now;
		var aae140_aab033_flag = false; // 是否征收方式一致标志
		//参保信息tab校验
		for (var i = 0; i < selec.length - 1; i++) {
			var id = selec[i];
			var idbehind = id.substring(id.indexOf("_") + 1); //获取id的后缀，如"110"
			//显示具体哪一个tab验证问题
			if (Base.validateTab("tab_" + idbehind, false) == false) {
				alert("单位参保信息中的" + getAae140Name(idbehind) + "必录项未填写完整，请填写完整!", "warn");
				Base.activeTab("tab_" + idbehind);
				return false;
			}

			//判断提交参保信息的征收方式是否一致
			aae140_aab033_now = Base.getValue(idbehind + "_aab033");
			if (!aae140_aab033_flag && aae140_aab033 != "" && aae140_aab033 != aae140_aab033_now) {
				aae140_aab033_flag = true;
			} else if (aae140_aab033 == "") {
				aae140_aab033 = aae140_aab033_now;
			}
		}

		//基本信息tab校验
		isAll = isAll && Base.validateTab("tbRegistSI", false);
		if (isAll) {
			//没有选中任何险种，给予提示
			if (sel == "") {
				if (confirm("未新增任何险种，确认保存？")) {
					Base.submit('form1', 'registerEmployerInfoAction!toSave.do', param);
				}
			} else {
				if (aae140_aab033_flag) {
					if (confirm("当前参保险种存在不同的征收方式，确认保存？")) {
						Base.submit('form1', 'registerEmployerInfoAction!toSave.do', param);
					}
				} else {
					Base.submit('form1', 'registerEmployerInfoAction!toSave.do', param);
				}
			}
		} else {
			Base.alert("【单位基本信息】必录项未填完整或填写格式有误!", "warn");
			Base.activeTab("tbRegistSI");
		}
	}

	//通过参保日期，提取基本养老最大做账期号
	function fnIssue(id) {
		var ary = ["330", "320", "370"];
		var aab050 = Base.getValue(id + "_aab050");
		if (id == "310" && aab050 != "") {
			for (var i = 0; i < ary.length; i++) {
				var aab050_now = Base.getValue(ary[i] + "_aab050");
				if (aab050_now != "") {
					var aab050_now_int = aab050_now.substr(0, 4) + aab050_now.substr(5, 2) + aab050_now.substr(8, 2);
					var aab050_int = aab050.substr(0, 4) + aab050.substr(5, 2) + aab050.substr(8, 2);
					if (parseInt(aab050_now_int) < parseInt(aab050_int)) {
						Base.alert("主险城镇职工基本医疗险参保时间晚于附属险种！", "error");
						Base.setValue("310_aab050", "");
						return;
					}
				}
			}
		}

		for (var j = 0; j < ary.length; j++) {
			if (id == ary[j]) {
				var aab050_310 = Base.getValue("310_aab050");
				if (aab050 != "" && aab050_310 != "") {
					var aab050_310_int1 = aab050_310.substr(0, 4) + aab050_310.substr(5, 2) + aab050_310.substr(8, 2);
					var aab050_now_int1 = aab050.substr(0, 4) + aab050.substr(5, 2) + aab050.substr(8, 2);
					if (parseInt(aab050_now_int1) < parseInt(aab050_310_int1)) {
						Base.alert("主险城镇职工基本医疗险参保时间晚于附属险种！", "error");
						Base.setValue(id + "_aab050", "");
						return;
					}
				}
			}
		}

		aab050 = (aab050.replace("-", "")).substr(0, 6);
		checkUnitInsTime(id + "_aab050");
		var yae097 = fnIssue1(aab050);
		Base.setValue(id + "_yae097", yae097);
	}

	//通过传入参保日期，提取险种的最大做账期号
	function fnIssue1(issue) {
		var year = issue.substr(0, 4);
		var month = issue.substr(4);
		var yae097;
		if (parseInt(month) == 1) {
			year = parseInt(year) - 1;
			month = 12;
			yae097 = year + "" + month;
		} else {
			if (parseInt(month) < 11) {
				yae097 = year + "0" + (parseInt(month) - 1);
			} else {
				yae097 = year + "" + (parseInt(month) - 1);
			}
		}
		return yae097;
	}

	//单位成立时间与单位参保时间作比较 
	function checkUnitInsTime(timeID) {
		var aae047 = Base.getValue("aae047");
		var aab050 = Base.getValue(timeID);
		if (aae047 > aab050) {
			alert("单位参保时间【" + aab050 + "】不能早于单位的成立时间【" + aae047 + "】,请重新录入参保时间！");
			Base.setValue(timeID, "");
			Base.focus(timeID);
		}
	}

	//信息同步实现(根据高亮的tab,来共享其它未被勾选险种的相关银行信息)
	function fnTbxx() {
		var ary = ["aae140_110", "aae140_120", "aae140_210", "aae140_310", "aae140_311", "aae140_320", "aae140_330", "aae140_340", "aae140_370", "aae140_410", "aae140_510"];
		var yaf010, t_aaf002, t_aae010, t_aae009, aaz065, aae044, aae010, aae009, yae106, yaf011, aab050, yae097, aab033;
		var count = 0;
		var aryChecked = new Array();
		for (var i = 0; i < ary.length; i++) {
			if (Base.getObj(ary[i]).checked == true) {
				aryChecked[count] = ary[i];
				count = count + 1;
			}
		}
		if (count < 2) {
			Base.alert('注：仅勾选一种参保险种或未勾选险种，无需数据同步，请检查！', "warn");
			return false;
		}

		var isTab = Base.getValue("isTab");

		if (isTab != null && isTab != "") {
			Base.confirm("确认以" + getAae140Name(isTab) + "的参保信息为参照，同步到其他已勾选险种的参保信息",
			function fn(yes) {
				if (yes) {
					for (var i = 0; i < aryChecked.length; i++) {
						var tabid = aryChecked[i];
						var aae140_now = tabid.substring(tabid.indexOf("_") + 1);
						if (aae140_now != isTab) {
							Base.setValue(aae140_now + "_aab050", Base.getValue(isTab + "_aab050"));
							Base.setValue(aae140_now + "_yae097", Base.getValue(isTab + "_yae097"));
							Base.setValue(aae140_now + "_aab033", Base.getValue(isTab + "_aab033"));
							//如果银行托收 设为必录
							if (Base.getValue(isTab + "_aab033") == "1") {
								Base.setRequired(aae140_now + "_yaf010");
								Base.setRequired(aae140_now + "_aaz065");
								Base.setRequired("sb_" + aae140_now + "_aae009");
								Base.setRequired("sb_" + aae140_now + "_aae010");
								Base.setRequired("dw_" + aae140_now + "_aae009");
								Base.setRequired("dw_" + aae140_now + "_aae010");
								Base.setRequired(aae140_now + "_yaf011");
							} else {	//如果其他征收方式设为非必录
								Base.setDisRequired(aae140_now + "_yaf010");
								Base.setDisRequired(aae140_now + "_aaz065");
								Base.setDisRequired("sb_" + aae140_now + "_aae010");
								Base.setDisRequired("sb_" + aae140_now + "_aae009");
								Base.setDisRequired("dw_" + aae140_now + "_aae009");
								Base.setDisRequired("dw_" + aae140_now + "_aae010");
								Base.setDisRequired(aae140_now + "_yaf011");
							}
							Base.setValue(aae140_now + "_yaf010", Base.getValue(isTab + "_yaf010"));
							Base.setValue(aae140_now + "_aaf002", Base.getValue(isTab + "_aaf002"));
							Base.setValue("sb_" + aae140_now + "_aae010", Base.getValue("sb_" + isTab + "_aae010"));
							Base.setValue("sb_" + aae140_now + "_aae009", Base.getValue("sb_" + isTab + "_aae009"));
							Base.setValue(aae140_now + "_aaz065", Base.getValue(isTab + "_aaz065"));
							Base.setValue(aae140_now + "_yae106", Base.getValue(isTab + "_yae106"));
							Base.setValue(aae140_now + "_yaf011", Base.getValue(isTab + "_yaf011"));
							Base.setValue(aae140_now + "_aae044", Base.getValue(isTab + "_aae044"));
							Base.setValue("dw_" + aae140_now + "_aae010", Base.getValue("dw_" + isTab + "_aae010"));
							Base.setValue("dw_" + aae140_now + "_aae009", Base.getValue("dw_" + isTab + "_aae009"));
						}
					}
				}
			});
		}
	}

	//选择险种tab页赋值被选择tab的险种id
	function fnSelectTab(tabid) {
		var tabVal = tabid.substring(tabid.indexOf("_") + 1);
		if (tabVal != null && tabVal != "") {
			Base.setValue("isTab", tabVal);
		} else {
			return false;
		}
	}

	//校验组织机构代码格式
	function fnCheckaae053() {
		var aae053 = Base.getValue("aae053");
		if (aae053 == "") {
			return false;
		}
		var aae053_exp = /^[a-zA-Z0-9]{1}[0-9]{7}-[a-zA-Z0-9]{1}$/;
		if (aae053_exp.test(aae053) == false) {
			Base.alert("注意：组织机构代码不符合规范，请重新输入！", "warn");
			Base.setValue("aae053", "");
			return false;
		}
		//增加组织机构代码判重复
		Base.submit(null, 'registerEmployerInfoAction!checkForAae053.do', {
			"dto['aae053']": aae053
		});
	}

	//成立日期与批准成立日期的比较
	function fnCheckBuildTime() {
		var aae047 = Base.getValue("aae047"); //成立日期
		var aae049 = Base.getValue("aae049"); //批准成立日期
		var otime = Base.getValue("systime");
		if (aae047 != '' && aae049 != '') {
			if (aae047 < aae049) {
				alert("【成立时间：" + aae047 + "】 早于【批准成立时间：" + aae049 + "】，请重新录入！");
				Base.setValue("aae049", "");
				Base.focus("aae049");
			}
			if (aae049 > otime) {
				alert("【批准成立时间：" + aae049 + "】大于【系统当前时间：" + otime + "】，请重新录入！");
				Base.setValue("aae049", "");
				Base.focus("aae049");
			}
		}

		if (aae047 == '' && aae049 != '') {
			if (aae049 > otime) {
				alert("【批准成立时间：" + aae049 + "】大于【系统当前时间：" + otime + "】，请重新录入！");
				Base.setValue("aae049", "");
				Base.focus("aae049");
			}
		}
	}

	// 校验最大做账期号   例如20130518参保，最大做账期号能录入201304，不能录入201303
	function fnCheckZZQH(idaab050, idyae097) {
		var aab050 = Base.getValue(idaab050);
		var yae097 = Base.getValue(idyae097);
		var aab050_a = aab050.replace("-", "").substr(0, 6);
		if (parseInt(yae097) <= (parseInt(aab050_a) - 1)) {
			Base.alert("最大做账期号录入不符合业务规范，其录入最小值只能为参保日期的上一个月，请检查重新录入！", "warn");
			Base.setValue(idyae097, "");
			Base.focus(idyae097);
			return false;
		}
	}

	//征收方式若为银行托收， 银行信息全部为红星必录
	function fnChangeRedStar() {
		var ary = ['110', '120', '210', '310', '311', '320', '330', '340', '370', '410', '510'];
		var aab033;
		for (var i = 0; i < ary.length; i++) {
			aab033 = Base.getValue(ary[i] + "_aab033");
			if (aab033 == "1") { //征收方式=银行托收	
				Base.setRequired(ary[i] + "_yaf010");
				Base.setRequired(ary[i] + "_aaz065");
				Base.setRequired("sb_" + ary[i] + "_aae009");
				Base.setRequired("sb_" + ary[i] + "_aae010");
				Base.setRequired("dw_" + ary[i] + "_aae009");
				Base.setRequired("dw_" + ary[i] + "_aae010");
				Base.setRequired(ary[i] + "_yaf011");
				Base.setValue("dw_" + ary[i] + "_aae009", Base.getValue("aae044"));
			} else {
				Base.setDisRequired(ary[i] + "_yaf010");
				Base.setDisRequired(ary[i] + "_aaz065");
				Base.setDisRequired("sb_" + ary[i] + "_aae010");
				Base.setDisRequired("sb_" + ary[i] + "_aae009");
				Base.setDisRequired("dw_" + ary[i] + "_aae009");
				Base.setDisRequired("dw_" + ary[i] + "_aae010");
				Base.setDisRequired(ary[i] + "_yaf011");

				Base.setValue(ary[i] + "_aaz065", "");
				Base.setValue(ary[i] + "_aae044", "");
				Base.setValue("dw_" + ary[i] + "_aae010", "");
				Base.setValue("dw_" + ary[i] + "_aae009", "");
				Base.setValue(ary[i] + "_yae106", "");
				Base.setValue(ary[i] + "_yaf011", "");

				Base.setValue(ary[i] + "_yaf010", "");
				Base.setValue(ary[i] + "_aaf002", "");
				Base.setValue("sb_" + ary[i] + "_aae010", "");
				Base.setValue("sb_" + ary[i] + "_aae009", "");
			}
		}
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	// 自动跳转参保信息录入tab页
	function fn_jump() {
		Base.activeTab("tb_dwtb");
	}
	
	//险种名字
	function getAae140Name(id) {
		if (id == '110') {
			return '【企业养老】';
		} else if (id == '120') {
			return '【机关养老】';
		} else if (id == '210') {
			return '【失业】';
		} else if (id == '310') {
			return '【基本医疗】';
		} else if (id == '311') {
			return '【个帐补充】';
		} else if (id == '320') {
			return '【机关养老】';
		} else if (id == '330') {
			return '【大病补助】';
		} else if (id == '340') {
			return '【离休】';
		} else if (id == '350') {
			return '【二乙】';
		} else if (id == '370') {
			return '【企业补充】';
		} else if (id == '410') {
			return '【工伤】';
		} else if (id == '510') {
			return '【生育】';
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>