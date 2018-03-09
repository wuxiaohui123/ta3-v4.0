<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位信息维护</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:box id="fld_dwbh" cols="3">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="125" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwAab001RPC()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
		</ta:box>
		<ta:panel fit="true">
			<ta:tabs id="tabsSI" fit="true">
				<ta:tab id="tbRegistSI" key="单位基本信息" cssStyle="overflow:auto">
					<ta:text id="unitChangeIds" key="单位基本信息变更项ID" value="0" display="false" />
					<ta:panel id="fld_dwxx" key="单位信息" cols="3" expanded="false" scalable="false">
						<ta:text id="isTab" key="是否被选中tab" display="false" />
						<ta:text id="aae044" key="单位名称" labelWidth="125" span="2" maxLength="100" required="true" onChange="fnCheckaae044()" />
						<ta:text id="aae044c" key="单位名称" display="false" labelWidth="125" maxLength="100" required="true" />
						<ta:text id="aab999" key="单位管理码" labelWidth="125" maxLength="20" minLength="1" onChange="fnCkAab999();" />
						<ta:text id="yab559" key="单位档案编号" labelWidth="125" maxLength="20" />
						<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="125" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAB065" />
						<ta:selectInput id="aaa149" key="行业风险类别" labelWidth="125" required="true" islevel="true" isMustLeaf="true" maxVisibleRows="10" collection="AAA149" onSelect="fnSlectAAA149" />
						<ta:selectInput id="aab022" key="行业代码" labelWidth="125" collection="AAB022" islevel="true" isMustLeaf="true" required="true" maxVisibleRows="10" />
						<ta:selectInput id="aab019" key="单位类型" labelWidth="125" required="true" islevel="true" isMustLeaf="true" readOnly="true" onSelect="fncheckaab019" />
						<ta:selectInput id="yab019" key="单位管理类型" labelWidth="125" collection="YAB019" maxVisibleRows="10" readOnly="true" />
						<ta:selectInput id="aab021" key="隶属关系" labelWidth="125" required="true" collection="AAB021" maxVisibleRows="10" />
						<ta:selectInput id="aab020" key="经济类型" labelWidth="125" required="true" collection="AAB020" maxVisibleRows="10" />
						<ta:selectInput id="aab301" key="所属行政区代码" labelWidth="125" collection="AAB301" maxVisibleRows="10" islevel="true" isMustLeaf="true" />
						<ta:selectInput id="yab243" key="单位所在地" display="true" labelWidth="125" collection="AAB301" maxVisibleRows="10" islevel="true" isMustLeaf="true" />
						<ta:text id="aae045" key="法人代表姓名" required="true" maxLength="50" labelWidth="125" />
						<ta:text id="aae046" key="法人公民身份证号码" validType="idcard" labelWidth="125" maxLength="18" />
						<ta:text id="aae013" key="备注" labelWidth="125" span="2" maxLength="200" />
						<ta:text id="systime" key="服务器时间" labelWidth="125" display="false" />
					</ta:panel>
					<ta:panel id="fld_gsxx" key="成立信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aae053" key="组织机构代码" labelWidth="125" maxLength="20" onChange="fnCheckaae053()" bpopTipMsg="10位字符,只能是'-'或数字并且倒数第二位为'-'" />
						<ta:text id="aae053c" key="组织机构代码" display="false" labelWidth="125" maxLength="100" required="false" />
						<ta:text id="aab023" key="主管部门" labelWidth="125" maxLength="100" />
						<ta:date id="aae047" key="成立日期" showSelectPanel="true" labelWidth="125" onChange="fnCheckBuildTime()" />
						<ta:text id="aae048" key="批准成立部门" maxLength="100" labelWidth="125" />
						<ta:date id="aae049" key="批准成立日期" showSelectPanel="true" labelWidth="125" onChange="fnCheckBuildTime()" />
						<ta:text id="aae051" key="批准成立文号" labelWidth="125" maxLength="100" />
					</ta:panel>
					<ta:panel id="fld_swxx" key="联系信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aae006" key="地址" labelWidth="125" maxLength="200" required="true" span="2" />
						<ta:text id="aae007" key="邮政编码" labelWidth="125" validType="zipcode" maxLength="6" />
						<ta:text id="aae004" key="联系人姓名" labelWidth="125" maxLength="60" required="true" />
						<ta:text id="aae005" key="联系电话" labelWidth="125" validType="mobile" maxLength="50" required="true" />
						<ta:text id="aae159" key="联系电子邮箱" labelWidth="125" validType="email" maxLength="50" />
					</ta:panel>
					<ta:panel id="fld_dwzg" key="专管员信息" cols="3" expanded="false" scalable="false">
						<ta:text id="aab016" key="专管员姓名" labelWidth="125" maxLength="60" />
						<ta:text id="aab018" key="专管员联系电话" labelWidth="125" validType="mobile" maxLength="50" />
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
						<ta:text id="aab030" key="税号" labelWidth="125" maxLength="20" />
					</ta:panel>
				</ta:tab>
				<ta:tab id="tb_dwtb" key="单位参保信息">
					<ta:text id="hideIds" key="存储变更项ID" display="false" />
					<ta:text id="insNum" key="已参保险种数量" display="false" />
					<ta:text id="a110" display="false" />
					<ta:text id="a120" display="false" />
					<ta:text id="a210" display="false" />
					<ta:text id="a310" display="false" />
					<ta:text id="a320" display="false" />
					<ta:text id="a330" display="false" />
					<ta:text id="a311" display="false" />
					<ta:text id="a340" display="false" />
					<ta:text id="a350" display="false" />
					<ta:text id="a370" display="false" />
					<ta:text id="a410" display="false" />
					<ta:text id="a510" display="false" />
					<%@ include file="/yhsi3/commonJSP/xzlx_dw.jsp"%>
					<ta:buttonLayout align="left">
						<ta:button id="butTB" key="数据共享[C]" hotKey="alt+G" icon="icon-ok" onClick="fnTbxx()" />
					</ta:buttonLayout>
					<ta:tabs id="tbs_xzxx" fit="true" onSelect="fnSelect">
						<%@ include file="/yhsi3/commonJSP/xzlx_tab_dw_why.jsp"%>
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
		Base.focus("aab001");
		initializeSuggestFramework(33, null, 'aab001', 900, 200, 7, fn_getAb01, 1, false);
		//税务名称
		initializeSuggestFramework(24, "af06", 'aaz066', 400, 80, 3, fnSelect24, 0, false);

		// 为组织机构代码添加按钮释放事件：自动设置"-"格式
		var aae053 = document.getElementById("aae053");
		$(aae053).bind("keyup", function(e) {
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

	//单位信息回调函数
	function fn_getAb01() {
		if (g_Suggest != "") {
			Base.setValue('aab001', g_Suggest[1]);
			Base.submit("aab001", "maintainEmployerInfoAction!queryUnitInfo.do", null, null, null, function() {
				var yab019 = Base.getValue("yab019");
				var aab019 = Base.getValue("aab019");
				if (yab019 == '01') { //普通单位
					if (aab019.substr(0, 1) == "3" || aab019.substr(0, 1) == "5") { //机关事业
						Base.showObj("aae140_120,aae140_320");
						Base.setEnable("aae140_510");
					} else if (aab019 == "80") { //个体工商户
						Base.filterSelectInput("110_yaz289", "11001");
						Base.setValue("110_yaz289", "11003");
						$("#aae140_510").attr("checked", false);
						Base.setDisabled("aae140_510");
					} else { //其它
						Base.setRequired("aab022,aaa149");
						Base.hideObj("aae140_120,aae140_320");
						Base.setEnable("aae140_510");
					}
				}
				var param = uptAOlData("form1");
				fnSuccess();
			});
		}
	}

	function fnSelect24() {
		Base.setValue("aaz066", g_Suggest[0]);
		Base.setValue("yae433", g_Suggest[1]);
		Base.setValue("aab030", g_Suggest[2]);
	}

	//组织机构代码
	function fnCheckaae053() {
		var aae053 = Base.getValue("aae053");
		var aae053c = Base.getValue("aae053c");
		var aae053_exp = /^[a-zA-Z0-9]{1}[0-9]{7}-[a-zA-Z0-9]{1}$/;
		if (aae053_exp.test(aae053) == false) {
			Base.alert("注意：组织机构代码不符合规范，请重新输入！", "warn");
			Base.setValue("aae053", aae053c);
		}
	}

	//行业风险类别控制行业代码
	function fnSlectAAA149(key, value) {
		Base.submit('aaa149,yab019', 'maintainEmployerInfoAction!toSelectAAA149.do');
	}

	// 判断单位名称重复
	function fnCheckaae044() {
		var aae044 = Base.getValue("aae044");
		var aae044c = Base.getValue("aae044c");

		if (aae044 != aae044c) {
			Base.submit(null, 'maintainEmployerInfoAction!checkForAae044.do', {
				"dto['aae044']" : aae044,
				"dto['aae044c']" : aae044c
			});
		}
	}

	// 选择单位类型 变更 特殊单位类别
	function fncheckaab019() {
		var yab019 = Base.getValue("yab019");
		var aab019 = Base.getValue("aab019");

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
				Base.showObj("aae140_120,aae140_320");
				Base.setEnable("aae140_510");
			} else if (aab019 == "80") { //如果是个体工商户（有雇工的）,则不参加生育保险
				Base.filterSelectInput("110_yaz289", "11001");
				Base.setValue("110_yaz289", "11003");
				$("#aae140_510").attr("checked", false);
				Base.setDisabled("aae140_510");
			} else { //其它
				Base.setRequired("aab022,aaa149");
				// 操作险种选择项
				$("#aae140_110").attr("checked", true);
				$("#aae140_120").attr("checked", false);
				checkedAae140('110');
				checkedAae140('120');
				Base.hideObj("aae140_120,aae140_320");
				Base.setEnable("aae140_510");
			}
		}
	}

	//回调函数   主要用于控制修改过的值的颜色 
	function fnSuccess() {
		var par = Base.getValue('hideIds');
		if (par != '0') {
			cssControl(par, 'red');
		}
		var par1 = Base.getValue('unitChangeIds');
		if (par1 !== '0') {
			cssControl(par1, 'red');
		}

		var strs = new Array();
		strs = par.split(",");
		for (i = 0; i < strs.length; i++) {
			var newAae140 = strs[i].substring(3, strs[i].length);
			if (newAae140 == 'aae140') {
				var cb_xx = '#cb_' + strs[i].substring(0, 2) + '+label';
				alert(cb_xx);
				var oldValue = $(cb_xx).html();
				$(cb_xx).html('');
				$(cb_xx).html("<label style='color:red;'>新增</label>" + oldValue);
			}
		}
	}

	//颜色控制
	function cssControl(par, color) {
		par = par.substring(0, par.length - 1);
		var strs = new Array();
		strs = par.split(",");
		for (i = 0; i < strs.length; i++) {
			var obj = $('#' + strs[i]).attr('type'); //jquery '#' 表示id ，'.'表示類，
			if (obj == 'text') {
				$("#" + strs[i]).parent().prev().css("color", color);
			} else {
				$("#" + strs[i] + "_desc").parent().parent().prev().css("color", color);
			}
		}
	}

	//检测单位管理码
	function fnCkAab999() {
		var aab999 = Base.getValue("aab999");
		if (/.*[\u4e00-\u9fa5]+.*$/.test(aab999)) {
			alert("单位管理码不能包含中文,请重新输入!");
			Base.setValue("aab999", "");
			Base.focus("aab999");
			return;
		}
		Base.submit('aab999', '/yhsi3/process/publicBusiness/manageEmployer/registerEmployerInfo/registerEmployerInfoAction!toCheck.do');
	}

	//地税征收城市控制地税信息
	function fnSelectYab240(key, value) {
		var yab240 = Base.getValue("yab240");
		if (yab240 != '') {
			Base.setEnable("aab030,aaz066,yae433");
		}
	}

	//税务机构：多参数检索下拉框数据
	function callSwRPC() {
		var yab240 = Base.getValue("yab240");
		if (yab240 != '') {
			suggestQuery(24, myPath() + "/process/synthesis/suggestFrameworkAction!getSWInfoString.do", {
				"dto['aab301']" : Base.getValue('yab240'),
				"dto['inputString']" : Base.getValue("aaz066")
			});
		}
	}
	function showSbjgRPC() {
		var yab240 = Base.getValue("yab240");
		if (yab240 != '') {
			Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow03.do", {
				"dto['aab301']" : yab240
			}, 1000, 450, null, null, true);
		}
	}

	//检测协议号是否包含中文+校验重复
	function fnXyh(id) {
		var xyh = Base.getValue(id);
		if (/.*[\u4e00-\u9fa5]+.*$/.test(xyh)) {
			alert("协议号不能包含中文,请重新输入!");
			Base.setValue(id, "");
			Base.focus(id);
		}
		Base.submit(null, 'maintainEmployerInfoAction!checkYae106.do', {
			"dto['yae106ID']" : id,
			"dto['yae106']" : xyh
		});
	}

	//保存经办信息
	function submitData() {
		var param = getAllchgData("form1"); //获取改变前后的值
		var isAll = true; //整个页面的必输项是否填写完整
		var arry = [ '110', '120', '210', '310', '311', '320', '330', '340', '350', '370', '410', '510' ];
		for (var i = 0; i < arry.length; i++) {
			var aae140 = Base.getValue("aae140_" + arry[i]);
			if (aae140 == null || aae140 == "") {
				Base.setDisRequired(arry[i] + "_aab033");
				Base.setDisRequired(arry[i] + "_aaz136");
				Base.setDisRequired(arry[i] + "_yaz289");
			} else {
				isAll = isAll && Base.validateTab("tab_" + arry[i], false);
				//校验现在险种参保信息tab
				if (Base.validateTab("tab_" + arry[i], false) == false) {
					alert("单位参保信息中的" + getAae140Name(arry[i]) + "必录项未填写完整，请填写完整!", "warn");
					Base.activeTab("tab_" + arry[i]);
					return false;
				}
			}
		}
		//单位基本信息校验
		isAll = isAll && Base.validateTab("tbRegistSI", false);
		var num = parseInt(Base.getValue("insNum")) * 41 + 1;
		if ((param.length == num) || (param.length == 0) || (param.length == 42)) {
			Base.alert("单位信息没有任何改变！", "warn");
		} else if (!isAll) {
			Base.alert("【单位基本信息】必输项未填完整或填写格式有误!", "warn");
		} else {
			Base.submit('form1', 'maintainEmployerInfoAction!toSave.do', {
				'param' : param
			});
		}
	}

	//tabs fnSelect
	function fnSelect(tabid) {
		var tabVal = tabid.substring(tabid.indexOf("_") + 1);
		if (tabVal != null && tabVal != "") {
			Base.setValue("isTab", tabVal);
		} else {
			return false;
		}
	}

	//信息同步实现(根据高亮的tab,来共享其它已被勾选险种的相关银行信息)
	function fnTbxx() {
		var ary = [ "aae140_110", "aae140_120", "aae140_210", "aae140_310", "aae140_311", "aae140_320", "aae140_330", "aae140_340", "aae140_370", "aae140_410", "aae140_510" ];
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
			Base.confirm("确认以" + getAae140Name(isTab) + "的参保信息为参照，同步到其他已勾选险种的参保信息", function fn(yes) {
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
							} else { //如果其他征收方式设为非必录
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
				alert("【批准成立时间：" + aae049 + "】晚于【系统当前时间：" + otime + "】，请重新录入！");
				Base.setValue("aae049", "");
				Base.focus("aae049");
			}
		}
		if (aae047 == '' && aae049 != '') {
			if (aae049 > otime) {
				alert("【批准成立时间：" + aae049 + "】晚于【系统当前时间：" + otime + "】，请重新录入！");
				Base.setValue("aae049", "");
				Base.focus("aae049");
			}
		}
	}

	//征收方式若为银行托收， 银行信息全部为红星必录
	function fnChangeRedStar() {
		var ary = [ '110', '120', '210', '310', '311', '320', '330', '340', '370', '410', '510' ];
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

	//征缴规则变化时校验
	function fnChangeYaz289(key, value) {
		var aae140 = value.substr(0, 3);
		var param = {};
		param["dto['aae140']"] = aae140;
		param["dto['yaz289']"] = Base.getValue(aae140 + "_yaz289");
		param["dto['yaz289old']"] = Base.getValue(aae140 + "_yaz289old");
		Base.submit("aab001", "maintainEmployerInfoAction!tocheckYaz289XX.do", param);
	}

	//征缴规则变化时校验
	function fnChangeAkc022(key, value) {
		var param = {};
		param["dto['aae140']"] = "310";
		param["dto['akc022']"] = Base.getValue("310_akc022");
		param["dto['akc022old']"] = Base.getValue("310_akc022old");
		Base.submit("aab001", "maintainEmployerInfoAction!tocheckAkc022XX.do", param);
	}

	//通过参保日期，提取医疗保险最大做账期号
	function fnIssue(id) {
		var aab050;
		var cz_aab050 = Base.getValue(id + "_aab050");
		if (cz_aab050 == "" || null) {
			var aab050_s = Base.getValue("systime");
			Base.setValue(id + "_aab050", aab050_s);
			aab050 = (aab050_s.replace("-", "")).substr(0, 6);
		} else {
			aab050 = (cz_aab050.replace("-", "")).substr(0, 6);
		}
		checkUnitInsTime(id, aab050);
	}

	//通过传入参保日期，提取险种的最大做账期号
	function fnIssue1(issue) {
		var year = issue.substr(0, 4);
		var month = issue.substr(5, 6);
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
	function checkUnitInsTime(ID, yae097) {
		var aae047 = Base.getValue("aae047");
		var aab050 = Base.getValue(ID + "_aab050");
		var aae140 = ID;
		if (aae047 > aab050) {
			alert("单位参保时间【" + aab050 + "】不能早于单位的成立时间【" + aae047 + "】,请重新录入参保时间！");
			Base.setValue(ID + "_aab050", "");
			Base.focus(ID + "_aab050");
			return;
		}
		Base.submit("aab001", "maintainEmployerInfoAction!tocheckTime.do", {
			"dto['aab050']" : aab050,
			"dto['aae140']" : aae140
		}, null, false, function() {
			//成功回调
			Base.setValue(ID + "_yae097", fnIssue1(yae097));
		}, function() {
			//失败回调
			var now_aab050 = Base.getValue(ID + "_aab050now");
			if (aab050 > now_aab050) {
				alert("单位已存在实缴或者欠缴数据，更改后的参保时间不能大于现在的参保时间！");
				Base.setValue(ID + "_aab050", now_aab050);
				return;
			}
		});
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
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function() {
			Base.submit("aab001", "maintainEmployerInfoAction!queryUnitInfo.do", null, null, null, function() {
				var yab019 = Base.getValue("yab019");
				var aab019 = Base.getValue("aab019");
				if (yab019 == '01') { //普通单位
					if (aab019.substr(0, 1) == "3" || aab019.substr(0, 1) == "5") { //机关事业
						Base.showObj("aae140_120,aae140_320");
						Base.setEnable("aae140_510");
					} else if (aab019 == "80") { //个体工商户
						Base.filterSelectInput("110_yaz289", "11001");
						Base.setValue("110_yaz289", "11003");
						$("#aae140_510").attr("checked", false);
						Base.setDisabled("aae140_510");
					} else { //其它
						Base.setRequired("aab022,aaa149");
						Base.hideObj("aae140_120,aae140_320");
						Base.setEnable("aae140_510");
					}
				}
				var param = uptAOlData("form1");
				fnSuccess();
			});

		}, true);
	}
	function callDwAab001RPC() {
		sfwQueryUtil_newRPC(33, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>