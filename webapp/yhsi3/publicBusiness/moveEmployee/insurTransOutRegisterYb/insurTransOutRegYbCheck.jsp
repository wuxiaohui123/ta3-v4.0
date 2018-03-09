<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转出登记复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:toolbarItem id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:box id="hideArea">
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人详细信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" haveSn="true" border="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="缴费信息(实缴)" id="tab2">
				<ta:datagrid id="ac43a1list" enableColumnMove="true" forceFitColumns="true" haveSn="true" snWidth="20" fit="true">
					<ta:datagridItem id="aab301" key="行政区划" maxChart="5" align="center" dataAlign="left" collection="AAB301" />
					<ta:datagridItem id="aae140" key="险种类型" maxChart="7" collection="aae140" align="center" dataAlign="left" />
					<ta:datagridItem id="aae003" key="费款所属期" maxChart="4" align="center" dataAlign="center" />
					<ta:datagridItem id="aac040" key="缴费工资" maxChart="4" align="center" dataAlign="right" />
					<ta:datagridItem id="aae180" key="缴费基数" maxChart="4" align="center" dataAlign="right" />
					<ta:datagridItem id="aae079" key="到账年月" maxChart="6" dataType="date" align="center" dataAlign="left" />
					<ta:datagridItem id="dwhzh" key="单位划账户" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="dwhtc" key="单位划统筹" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="grhzh" key="个人划账户" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="grhtc" key="个人划统筹" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="关系转移接续联系函" id="tab3">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" id="lxh_2" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续信息表 " id="tab4">
				<ta:panel id="pnlJBXX" key="人员转移信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aab004" key="转出单位名称" readOnly="true" labelWidth="150" span="2" required="true" />
					<ta:date id="aae035" key="转移时间" readOnly="true" labelWidth="150" showSelectPanel="true" issue="true" required="true" />
				</ta:panel>
				<ta:panel id="pnlJJXX" key="转移基金信息" cols="3" expanded="false" scalable="false">
					<ta:number id="aic083" key="个人账户基金转移额" labelWidth="150" value="0" precision="2" readOnly="true" />
					<ta:number id="aae240" key="个人账户存储存储额" labelWidth="150" value="0" precision="2" readOnly="true" />
					<ta:number id="aic102" key="转移基金总额" labelWidth="150" value="0" precision="2" readOnly="true" />
				</ta:panel>
				<ta:panel key="历年缴费及个人账户记账信息" id="id_2" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="ic91list" enableColumnMove="true" snWidth="30" forceFitColumns="true" haveSn="true" fit="true">
						<ta:datagridItem id="aab299" key="行政区划" maxChart="3" align="center" dataAlign="center" />
						<ta:datagridItem id="aab300" key="地区名称" maxChart="4" align="center" dataAlign="left" />
						<ta:datagridItem id="aae041" key="开始年月" maxChart="3" align="center" dataAlign="center" />
						<ta:datagridItem id="aae042" key="终止年月" maxChart="3" align="center" dataAlign="center" />
						<ta:datagridItem id="aae382" key="年末累计存储额" maxChart="6" align="center" dataAlign="right" />
						<ta:datagridItem id="aae013" key="备注" maxChart="7" align="center" dataAlign="left" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tab6" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, "ac01", "aac002", 600, 400, 3, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.submit("from1", "insurTransOutRegYbCheckAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		Base.submit("form1", "insurTransOutRegYbCheckAction!toSave.do");
	}

	//按钮打印
	function toPrint() {
		var yae099 = Base.getValue('yae099');
		alert(yae099);
		if (yae099 == '' || yae099 == null) {
			alert("请获取到yae099,请检查过程传出值！");
			return;
		}
		var prm = "yae099=" + yae099;
		fnPrintComm("contactLetter.raq", prm);
	}

	//行打印
	function fnClick(data, e) {
		var yac196 = data.yac196;
		if (yac196 == '' || yac196 == null) {
			alert("请选择需要打印的数据！");
			return;
		}
		var prm = "yac196=" + yac196;
		fnPrintComm("contactLetter.raq", prm);
	}

	//导出
	function toExport() {
		var aac001 = Base.getValue('aac001');
		location.href = myPath() + "/process/publicBusiness/moveEmployee/insurTransOutRegister/insurTransOutRegCheckAction!toExport.do?dto.aac001=" + aac001;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>