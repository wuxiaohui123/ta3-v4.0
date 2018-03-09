<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转移申请(系统内)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入申请复核[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="转入申请信息" id="tab1">
				<ta:panel key="联系函申请信息" cols="3" id="lxh" expanded="false" scalable="false" fit="true">
					<ta:selectInput id="aac070" key="转移方向" labelWidth="130" collection="aac070" required="true" value="1" readOnly="true" display="fasle" />
					<ta:selectInput id="aae173" key="转移类型" labelWidth="130" collection="aae173" required="true" value="1" />
					<ta:text id="aae270" key="联系函编号" labelWidth="130" maxLength="20" required="true" />
					<ta:text id="yac519" key="原个人编号" labelWidth="130" maxLength="20" required="true" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('yac519'))" bpopTipMsg="可输入身份证号、姓名及个人编号进行模糊查询）" />
					<ta:text id="aac003" key="姓名" labelWidth="130" maxLength="20" required="true" />
					<ta:text id="aac002" key="证件号码" labelWidth="130" maxLength="20" required="true" />
					<ta:selectInput id="yac250" key="原行政区划代码" collection="aab301" labelWidth="130" required="true" readOnly="true" />
					<ta:text id="yac251" key="原参保机构名称" labelWidth="130" required="true" maxLength="50" span="2" />
					<ta:text id="yac252" key="原参保机构联系电话" labelWidth="130" maxLength="50" required="true" />
					<ta:text id="yac253" key="原参保机构地址" labelWidth="130" maxLength="100" span="2" required="true" />
					<ta:text id="yac254" key="原参保机构邮编" labelWidth="130" validType="zipcode" maxLength="6" required="true" />
					<ta:text id="yac256" key="原参保地区名称" labelWidth="130" maxLength="50" required="true" />
					<ta:text id="yac261" key="转入地参保机构名称" labelWidth="130" readOnly="true" display="true" span="2" />
					<ta:selectInput id="aab299" key="转入地行政区划代码" labelWidth="130" readOnly="true" collection="aab301" />
					<ta:text id="yae440" key="代办人姓名" labelWidth="130" maxLength="30" />
					<ta:text id="yae441" key="代办人与转移人员关系" labelWidth="130" maxLength="10" />
					<ta:text id="yae442" key="代办人电话" labelWidth="130" validType="number" maxLength="50" />
					<ta:text id="yae444" key="代办人邮编" labelWidth="130" validType="zipcode" maxLength="6" />
					<ta:text id="yae443" key="代办人联系地址" labelWidth="130" maxLength="50" span="2" />
					<ta:text id="aaz161" key="人员参保关系转入事件ID" labelWidth="130" display="false" />
					<ta:text id="yae099" key="业务流水号" labelWidth="130" readOnly="true" display="false" />
					<ta:text id="yaz159" key="人员参保关系ID" readOnly="true" labelWidth="150" display="false" />
					<ta:text id="fhjc" key="当前复核级次" display="false" />
				</ta:panel>
				<ta:panel key="转入单位信息" cols="3" id="fltUnit" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
				</ta:panel>
				<ta:panel key="转移制度方向" id="zyzdfx" expanded="false" scalable="false">
					<ta:checkboxgroup id="aic113" cssStyle="margin-left:20px;" cols="2">
						<ta:radio key="企业养老保险转企业养老保险（制度内）" id="aic113_1" value="1" />
						<ta:radio key="机关事业养老保险转机关事业养老保险（制度内）" id="aic113_6" value="6" />
						<ta:radio key="企业养老保险转机关事业养老保险（制度间）" id="aic113_2" value="2" />
						<ta:radio key="机关事业养老保险转企业养老保险（制度间）" id="aic113_3" value="3" />
					</ta:checkboxgroup>
				</ta:panel>
			</ta:tab>
			<ta:tab key="已复核通过的系统内联系函信息" id="tab3">
				<ta:datagrid id="ic89list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true">
					<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="50" dataAlign="center" click="fnClick" />
					<ta:datagridItem id="aaz002" key="业务日志ID" width="180" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="yae099" key="业务流水号" width="180" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="aae270" key="联系函编号" width="120" align="center" dataAlign="center" hiddenColumn="true" />
					<ta:datagridItem id="yac519" key="原个人编号" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="yac250" key="原参保机构行政区划代码" width="180" align="center" dataAlign="center" collection="yab003" />
					<ta:datagridItem id="yac251" key="原参保机构名称" width="170" align="center" dataAlign="center" showDetailed="true" />
					<ta:datagridItem id="yac252" key="原参保机构联系电话" width="180" collection="aac004" align="center" dataAlign="center" />
					<ta:datagridItem id="yac253" key="原参保机构地址" width="250" align="center" dataAlign="center" showDetailed="true" />
					<ta:datagridItem id="yac254" key="原参保机构邮编" width="180" align="center" dataAlign="center" />
					<ta:datagridItem id="yac256" key="原参保地区名称" width="180" align="center" dataAlign="center" showDetailed="true" />
					<ta:datagridItem id="aab299" key="转入地行政区划代码" width="120" align="center" dataAlign="center" collection="yab003" />
					<ta:datagridItem id="yae440" key="代办人姓名" width="300" align="center" dataAlign="center" />
					<ta:datagridItem id="yae441" key="代办人与转移人员关系" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="yae442" key="代办人电话" width="120" align="center" dataAlign="center" />
					<ta:datagridItem id="yae444" key="代办人邮编" width="250" collection="yab003" align="center" dataAlign="right" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
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
	});

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存
	function toSave() {
		Base.submit("form1", "insurTransferApplySICheckAction!toSave.do");
	}

	//行打印
	function fnClick(data, e) {
		var yae099 = data.yae099;
		var aaz002 = data.yae099;
		if (yae099 == '' || yae099 == null) {
			alert("请选择需要打印的数据查询条件yae099！");
			return;
		}
		if (aaz002 == '' || aaz002 == null) {
			alert("请选择需要打印的数据查询条件aaz002！");
			return;
		}
		var prm = "prm_yae099=" + yae099 + ";aaz002=" + aaz002;
		fnPrintComm("contactLetter.raq", prm);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>