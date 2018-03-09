<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" 

"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗新增</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fld_lrbyxx" cols="3" key="录入基本信息">
			<ta:number id="yke048" key="医疗机构变更ID" display="false" />
			<ta:text id="akb020" key="医疗机构编号" required="true" maxLength="12" labelWidth="150" onChange="fn_checkAkb020()" />
			<ta:text id="akb021" key="医疗机构名称" span="2" required="true" maxLength="200" labelWidth="150" onChange="fn_checkAkb021()" />
			<ta:selectInput collection="AKB022" id="akb022" key="医疗机构类型" required="true" labelWidth="150" />
			<ta:selectInput collection="AKB023" id="akb023" key="医疗机构类别" required="true" labelWidth="150" />
			<ta:selectInput collection="AKA101" id="aka101" key="机构统计等级" required="true" labelWidth="150" />
			<ta:selectInput collection="AKB095" id="akb095" key="医疗机构等级" required="true" labelWidth="150" />
			<ta:selectInput collection="AKB096" id="akb096" key="起付线等级" labelWidth="150" display="false" />
			<ta:selectInput collection="AKB097" id="akb097" key="基金支付比例等级" labelWidth="150" display="false" />
			<ta:selectInput collection="AAF003" id="aaf003" key="开通联网标志" labelWidth="150" display="false" />
			<ta:selectInput collection="AKA086" id="aka086" key="医疗机构类别" labelWidth="150" display="false" />
			<ta:selectInput collection="YAB003" id="aaa027" key="所属统筹区" required="true" labelWidth="150" />
			<ta:selectInput collection="AKD100" id="akd100" key="机构分类" required="true" labelWidth="150" />
			<ta:text id="akb301" key="主机构编码" labelWidth="150" />
			<ta:date id="aae030" key="开始日期" required="true" showSelectPanel="true" labelWidth="150" />
			<ta:date id="aae031" key="终止日期" showSelectPanel="true" labelWidth="150" onChange="judgeTime(this)" />
			<ta:text id="aae004" key="联系人" maxLength="50" labelWidth="150" />
			<ta:text id="aae005" key="联系电话" maxLength="50" labelWidth="150" />
			<ta:text id="aae006" key="经营地址" labelWidth="150" span="2" />
		</ta:panel>
		<ta:panel id="fld_lryhxx" cols="3" key="录入银行信息（预留）">
			<ta:text id="aaz003" key="银行账号ID" maxLength="18" />
		</ta:panel>
		<ta:panel id="fld_lrzjxx" cols="3" key="证件信息">
			<ta:text id="akf006" key="经营许可证号" maxLength="50" labelWidth="150" />
			<ta:text id="akf007" key="执业许可证号" maxLength="50" labelWidth="150" />
			<!-- <ta:text id="aaz017" key="组织登记事件"   maxLength="20"/>   -->
		</ta:panel>
		<ta:panel id="fld_lrqtxx" cols="3" key="其它信息">
			<ta:number id="akf009" key="医院科室数" min="0" max="10000" labelWidth="150" />
			<ta:number id="akf010" key="医院重点科室数" min="0" max="10000" labelWidth="150" />
			<ta:number id="akf015" key="床位数" min="0" max="10000" labelWidth="150" />
			<ta:number id="akf016" key="经营面积" min="0" max="100000" precision="2" labelWidth="150" />
			<ta:text id="akf003" key="开通IP" maxLength="50" labelWidth="150" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//保存页面信息
	function toSave() {
		if (Base.validateForm("form1")) {
			Base.submit('form1', 'newHospitalAction!toSave.do');
			return true;
		} else {
			return false;
		}
	}

	//判断当前时间是否晚于系统时间
	function judgeTime(obj) {
		var aae030 = Base.getValue('aae030');
		var aae031 = Base.getValue('aae031');
		if (aae030 != '' && aae031 != '' && aae031 < aae030) {
			obj.value = '';
			Base.alert("开始日期【<span style='color:#ff0000;'>" + aae030
					+ "</span>】"
					+ "<br>必须<span style='color:#ff0000;'>小于</span><br>"
					+ "结束日期【<span style='color:#ff0000;'>" + aae031
					+ "</span>】", "warn");
			return false;
		}
		Base.submit('aae030', 'modifyHospitalAction!judgeTime.do');
	}

	$(document).ready(function() {
		$("body").taLayout();
		Base.focus('akb020');
		/* fnSetRedBorder(); */
		Base.hideObj("fld_lryhxx");
	});
	function fn_checkAkb020() {
		Base.submit('akb020', 'newHospitalAction!toCheck.do');
	}

	function fn_checkAkb021() {
		Base.submit('akb021', 'newHospitalAction!toCheckAkb021.do');
	}

	function fn_checkNumber(obj) {
		var val = obj.value;
		if (obj.value != '' && val < 0) {
			obj.value = '';
			Base.alert("输入的数字不能为负数", "warn");
		}
	}

	function fn_changeAkb022(key, value) {
		if ('2' == value) {
			Base.setValue('akb023', '99');
			Base.setValue('aka101', '11');
			Base.setDisRequired('akb095');
			Base.setDisRequired('akb096');
			Base.setDisRequired('akb097');
			//Base.setValue('akb095', '99');
			//Base.setValue('akb096', '99');
			//Base.setValue('akb097', '99');
		} else if ('1' == value) {
			Base.setValue('akb023', '10');
			Base.setRequired('akb095');
			Base.setRequired('akb096');
			Base.setRequired('akb097');
		} else {
			Base.setRequired('akb095');
			Base.setRequired('akb096');
			Base.setRequired('akb097');
		}
	}

	function fn_changeAka101(key, value) {
		switch (parseInt(value)) {
		case 1:
			Base.setValue('akb095', '00');
			Base.setValue('akb096', '00');
			Base.setValue('akb097', '00');
			break;
		case 2:
		case 3:
		case 4:
			Base.setValue('akb095', '01');
			Base.setValue('akb096', '01');
			Base.setValue('akb097', '01');
			break;
		case 5:
		case 6:
		case 7:
			Base.setValue('akb095', '02');
			Base.setValue('akb096', '02');
			Base.setValue('akb097', '02');
			break;
		case 8:
		case 9:
		case 10:
			Base.setValue('akb095', '03');
			Base.setValue('akb096', '03');
			Base.setValue('akb097', '03');
			break;
		case 11:
			Base.setValue('akb095', '99');
			Base.setValue('akb096', '99');
			Base.setValue('akb097', '99');
			break;
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>