<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>retireBasicAction</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="queryBtn2" key="核定补发账号检查" icon="xui-icon-query" onClick="query2()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:date id="aae002" key="做账期号" issue="true" isFocusShowPanel="true" showSelectPanel="true" />
			<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" />
			<ta:selectInput id="aae145" key="待遇发放方式" collection="AAE145" />
			<ta:selectInput id="aae140" key="保险类型" display="false" />
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab id="tab1" key="核对个人银行帐户信息">
				<ta:datagrid id="ac82Grid" fit="true" columnFilter="true" haveSn="true">
					<ta:datagridItem id="aab001" key="单位编号" width="100" dataAlign="right">
					</ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" width="210" dataAlign="right">
					</ta:datagridItem>
					<ta:datagridItem id="aac001" key="个人编号" dataAlign="center" width="100">
					</ta:datagridItem>
					<ta:datagridItem id="aae133" key="姓名" width="100">
					</ta:datagridItem>
					<ta:datagridItem id="yaf012" key="开户银行类别" collection="AAF002" width="180">
					</ta:datagridItem>
					<ta:datagridItem id="aae145" key="待遇发放方式 " collection="AAE145" width="120">
					</ta:datagridItem>
					<ta:datagridItem id="aae010" key="银行帐号" width="210" dataAlign="right">
					</ta:datagridItem>
					<ta:dataGridToolPaging url="" pageSize="9999" selectExpButtons="1"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="个人银行帐户信息发放有误">
				<ta:datagrid id="ac82ErrorGrid" fit="true" columnFilter="true" haveSn="true">
					<ta:datagridItem id="aab001" key="单位编号" width="100" dataAlign="right">
					</ta:datagridItem>
					<ta:datagridItem id="aae044" key="单位名称" width="210" dataAlign="right">
					</ta:datagridItem>
					<ta:datagridItem id="aac001" key="个人编号" dataAlign="center" width="100">
					</ta:datagridItem>
					<ta:datagridItem id="aae133" key="姓名" width="100">
					</ta:datagridItem>
					<ta:datagridItem id="yaf012" key="开户银行类别" collection="AAF002" width="180">
					</ta:datagridItem>
					<ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" width="120">
					</ta:datagridItem>
					<ta:datagridItem id="aae010" key="银行帐号" width="210" dataAlign="right">
					</ta:datagridItem>
					<ta:dataGridToolPaging url="" pageSize="9999" selectExpButtons="1"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", "checkBankAccountInfoAction!query.do", null, null, false, function(data) {
			Base.setTabTitle("tab1", "核对个人银行帐户信息,合计:" + data.fieldData.rows1 + "人");
			Base.setTabTitle("tab2", "个人银行帐户信息发放有误,合计:" + data.fieldData.rows2 + "人");
		});
	}

	function query2() {
		Base.submit("form1", "checkBankAccountInfoAction!query2.do", null, null, false, function(data) {
			Base.setTabTitle("tab1", "核对个人银行帐户信息,合计:" + data.fieldData.rows1 + "人");
			Base.setTabTitle("tab2", "个人银行帐户信息发放有误,合计:" + data.fieldData.rows2 + "人");
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>