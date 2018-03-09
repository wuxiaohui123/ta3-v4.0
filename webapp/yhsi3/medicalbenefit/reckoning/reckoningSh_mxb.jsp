<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>慢性病月度费用审核(弹出框)</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading/>
		<ta:form id="form" fit="true" >
		    <ta:box id="bxZ" cols="3">
			    <ta:text id="akb020" key="医疗机构编码" display="false" labelWidth="120"/>
				<ta:text id="akb021" key="医疗机构名称" labelWidth="120"  required="true" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
				<ta:selectInput id="yka316" key="人员类别"  collection="YKA316" required="true" filter="13,14"  reverseFilter="true" labelWidth="120"/>
				<ta:date id="aae209" key="结算年月"  showSelectPanel="true" labelWidth="120"  issue="true" required="true"/>
			</ta:box>
			<ta:panel id="pnlResult" key="统计结果" cols="3">
			    <ta:text id="akc264"  key="总费用"  readOnly="true" labelWidth="120"/>
			    <ta:text id="rc"  key="主记录数"   readOnly="true" labelWidth="120"/>
			    <ta:text id="yka319"  key="医保费用"  readOnly="true" labelWidth="120"/>
			    <ta:text id="zf"  key="自费费用"  readOnly="true" labelWidth="120"/>
			    <ta:text id="ake034"  key="个人账户支付"  readOnly="true" labelWidth="120"/>
			    <ta:text id="tczf"  key="统筹支付"  readOnly="true" labelWidth="120"/>
			    <ta:text id="akb069"  key="拒付费用"  readOnly="true" labelWidth="120"/>
			    <ta:text id="kkhje"  key="应支付费用"  readOnly="true" labelWidth="120"/>
			</ta:panel>
		    <ta:buttonLayout id="btns" align="center" cssClass="no-padding">
			   <ta:button id="btnTj"    key="开始统计" icon="xui-icon-show"   onClick="toMxSh()"/>
			   <ta:button id="btnSh"    key="复核" icon="xui-icon-spotSave"   onClick="save()"/>
			   <ta:button id="btnClose" key="退出"     icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('w_sh');"/>
			</ta:buttonLayout>
	    </ta:form>
	</body>
</html>
<script type="text/javascript">
function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
}
function toMxSh()
{
	Base.submit("bxZ","detailReviewMxbAction!toQueryFromKc24.do");
}

function save()
{
	Base.submit("bxZ","detailReviewMxbAction!toSave.do");
}

$(document).ready(function () {
	$("body").taLayout();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>