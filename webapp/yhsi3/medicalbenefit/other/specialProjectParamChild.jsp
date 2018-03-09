<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊项目参数管理弹出界面</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="saveKa35()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form2" fit="true">
		<ta:box cols="3" id="ka35">
			<ta:text id="bclx" key="保存类型(1:新增,2:修改)" display="false" />
			<ta:text id="filter" key="已经有参数的发票类别" maxLength="100" labelWidth="120" display="false" />
			<ta:text id="aaz235_c" key="社保三大目录先自付比例参数ID" labelWidth="150" required="true" display="false" />
			<ta:text id="ake001_c" key="社保三大目录统一编码" labelWidth="150" required="true" />
			<ta:number id="aka049_c" key="下限金额" labelWidth="120" min="0" max="9999999.99" precision="2" numberRound="false" amountPre="￥" required="true" onChange="checkAka049LessaAka048(this)" />
			<ta:number id="aka048_c" key="上限金额" labelWidth="120" min="0" max="9999999.99" precision="2" numberRound="false" amountPre="￥" required="true" onChange="checkAka049LessaAka048(this)" />
			<ta:number id="aka057_c" key="先自付比例" numberRound="false" precision="4" labelWidth="150" max="1" min="0" required="true" />
			<ta:date id="aae030_c" key="开始日期" showSelectPanel="true" labelWidth="120" validNowTime="right" required="true" onChange="toCheck(this)" />
			<ta:date id="aae031_c" key="终止日期" showSelectPanel="true" labelWidth="120" validNowTime="right" required="true" onChange="toCheck(this)" />
			<ta:text id="yka542_c" key="先行自付部分处理方式" labelWidth="150" required="true" />
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		//var filter = Base.getValue("filter");
		//	Base.filterSelectInput("aka063_c",filter, false);
	});

	//保存新增或修改数据
	function saveKa35() {
		if (Base.validateForm("form2")) {
			//验证数据的合法性;1.上下限数据大小比较.2.开始日期结束日期比较
			if (!(checkAka049LessaAka048(Base.getObj("aka048_c")) && toCheck(Base
					.getObj("aae030_c"))))
				return;
			Base.submit("form2", "specialProjectParamAction!saveKa35.do", null,
					null, false, function() {
						parent.Base.submit("",
								"specialProjectParamAction!queryKa35.do");
					}, null);
		}
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//验证下限金额应该小于上限金额
	function checkAka049LessaAka048(obj) {
		var ka048 = Base.getValue("aka048_c");//上限
		var ka049 = Base.getValue("aka049_c");//下限
		if (ka048 == null || ka049 == null || ka048 == '' || ka049 == '')
			return false;
		if (parseInt(ka049) > parseInt(ka048)) {
			Base.setValue(obj.id, "");
			Base.alert("下限金额不能大于上限金额！", "error");
			return false;
		}
		return true;
	}
	//验证日期的合法性
	function toCheck(obj) {
		var aae030_c = Base.getValue("aae030_c");//开始时间
		var aae031_c = Base.getValue("aae031_c");//结束时间
		if (aae030_c == null || aae031_c == null || aae030_c == ''
				|| aae031_c == '')
			return false;
		if (new Date(aae030_c) > new Date(aae031_c)) {
			Base.setValue(obj.id, "");
			Base.alert("开始时间不能大于结束时间", "error");
			return false;
		}
		return true;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>