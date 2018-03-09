<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta"  tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转入登记复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入登记复核[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" key="复核级次" display="true" />
			</ta:box>
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="人员基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" height="200" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" haveSn="true" border="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续申请表和联系函" id="tab2">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="人员基本信息和基金转移信息" id="tab3" cssStyle="overflow:auto">
				<ta:panel id="pnlDZXX" key="转移基金登帐信息" expanded="false" scalable="false" height="92">
					<ta:datagrid id="ad12List" enableColumnMove="true" haveSn="true" border="true" snWidth="30" fit="true">
						<%@ include file="/yhsi3/commonJSP/ad12.jsp"%>
					</ta:datagrid>
				</ta:panel>
				<ta:panel id="pnlJBXX" key="人员转移信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aab004" key="转出单位名称" readOnly="true" labelWidth="150" required="true" />
					<ta:date id="aae035" key="转移时间" readOnly="true" labelWidth="150" showSelectPanel="true" issue="true" required="true" />
					<ta:number id="aic083" key="个人账户基金转移额" labelWidth="150" value="0" precision="2" readOnly="true" />
					<ta:number id="aae240" key="个人账户存储存储额" labelWidth="150" value="0" precision="2" display="false" readOnly="true" />
					<ta:number id="aic102" key="转移基金总额" labelWidth="150" value="0" precision="2" display="false" readOnly="true" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="历年缴费及个人账户记账信息" id="tab4" cssStyle="overflow:auto">
				<ta:datagrid id="ic91List" enableColumnMove="true" snWidth="30" forceFitColumns="true" haveSn="true" fit="true">
					<ta:datagridItem id="aab299" key="行政区划" maxChart="3" align="center" dataAlign="center" />
					<ta:datagridItem id="aab300" key="地区名称" maxChart="4" align="center" dataAlign="left" />
					<ta:datagridItem id="aae001" key="年度" maxChart="1" align="center" dataAlign="center" />
					<ta:datagridItem id="aae041" key="开始年月" maxChart="3" align="center" dataAlign="center" />
					<ta:datagridItem id="aae042" key="终止年月" maxChart="3" align="center" dataAlign="center" />
					<ta:datagridItem id="aae382" key="年末累计存储额" maxChart="6" align="center" dataAlign="right" />
					<ta:datagridItem id="aae013" key="备注" maxChart="7" align="center" dataAlign="left" showDetailed="true" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
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
		Base.submit("form1", "insurTransInRegYbCheckAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>