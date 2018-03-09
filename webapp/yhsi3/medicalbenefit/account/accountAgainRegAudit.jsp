<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>补录个人账户复审</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
	  <ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true"/>
	  </ta:toolbar>	
		<ta:form id="form1" fit="true">
		  <ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz267" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
			
            <ta:panel id="fld_lrxxxx" cols="3" key="录入详细信息">
				<ta:text id="aac001"  key="个人ID"  readOnly="true" required="true" labelWidth="150" bpopTipMsg="输入个人ID、身份证号、姓名，可自动完成查询"/>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
				<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="150"/>
				<ta:selectInput collection="AAE140" id="aae140" key="险种类型" labelWidth="150" required="true" reverseFilter="310" filter="310" value="310" readOnly="true" display="false"/>
				<ta:text id="aae058" key="本次补录金额"  labelWidth="150" required="true" cssStyle="color:blue" readOnly="true"/>
				<ta:text id="aae240" key="余额" readOnly="true" labelWidth="150" cssStyle="color:blue"/>
				<ta:text id="aae001" key="年度" readOnly="true" labelWidth="150" />
				<ta:text id="yke132" key="本年医疗基本收入" readOnly="true" labelWidth="150" />
				<ta:text id="yke137" key="基本医疗利息收入" readOnly="true" labelWidth="150" />
				<ta:text id="yke134" key="本年基本医疗支出" readOnly="true" labelWidth="150" />
				<ta:text id="yke133" key="本年公务员医疗收入" readOnly="true" labelWidth="150" />
				<ta:text id="yke146" key="公务员利息利息" readOnly="true" labelWidth="150" />
				<ta:text id="yke135" key="本年公务员支出" readOnly="true" labelWidth="150" />
				<ta:selectInput collection="AAE100" id="aae100" key="当前有效标志" readOnly="true" labelWidth="150" />
				<ta:textarea id="aae013" key="备注"   span="2"  labelWidth="150" bpopTipMsg="输入字符长度小于200" readOnly="true"/>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
		$("body").taLayout();
        Base.filterSelectInput("action", '1,2', true);
	});
	//保存页面信息
	function toSave(){
		Base.submit('form1','accountAgainRegAuditAction!toSave.do');
	}
	
</script>

<%@ include file="/ta/incfooter.jsp"%>
