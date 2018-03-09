<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AdministrativeApprovalCheck2</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
			<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="aac012" readOnly="true" />
			<ta:selectInput id="aac013" key="用工形式" labelWidth="130" collection="aac013" readOnly="true" />
			<ta:date id="aac007" key="参加工作时间" labelWidth="130" readOnly="true" />
			<ta:date id="aac049" key="养老参保日期" labelWidth="130" readOnly="true" />
			<ta:selectInput id="aac008" key="人员状态" labelWidth="130" collection="aac008" readOnly="true" />
			<ta:date id="yac516" key="档案出生日期" labelWidth="130" showSelectPanel="true" readOnly="true" />
			<ta:text id="aaz157" key="参保明细ID" display="false" />
			<ta:text id="aaz159" key="参保关系ID" display="false" />
		</ta:panel>
		<ta:panel id="rytxxx" cols="3" key="人员退休信息">
			<ta:text id="aab071" key="退休申报单位ID" display="false" />
			<ta:text id="aab999_1" key="退休申报单位代码" labelWidth="130" bpopTipMsg="单位名称、单位代码、单位ID" readOnly="true" />
			<ta:text id="aae044_1" key="退休申报单位名称" labelWidth="130" readOnly="ture" span="2" />
			<ta:selectInput id="aic161" key="离退休类别" labelWidth="130" collection="aic161" readOnly="true" />
			<ta:date id="aic162" key="离退休日期" labelWidth="130" showSelectPanel="true" readOnly="true" />
			<ta:number id="aae200" key="视同缴费月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
			<ta:number id="aae201" key="实际缴费月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
			<ta:number id="aae204" key="特殊工种折算月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
			<ta:selectInput id="aac014" key="专业技术职务等级" labelWidth="130" collection="aac014" readOnly="true" />
			<ta:selectInput id="aac015" key="国家职业资格等级" labelWidth="130" collection="aac015" readOnly="true" />
			<ta:selectInput id="aac020" key="行政职务(级别)" labelWidth="130" collection="aac020" readOnly="true" />
			<ta:selectInput id="aac081" key="建国前老工人标志" labelWidth="130" collection="aac081" readOnly="true" />
			<ta:selectInput id="aac085" key="原工商业者标志" labelWidth="130" collection="aac085" readOnly="true" />
			<ta:selectInput id="aac093" key="最高荣誉称号级别" labelWidth="130" collection="aac093" readOnly="true" />
			<ta:date id="aac055" key="参加革命工作日期" labelWidth="130" showSelectPanel="true" readOnly="true" />
			<ta:selectInput id="aac064" key="退役军人类别" labelWidth="130" collection="aac064" readOnly="true" />
			<ta:selectInput id="aac065" key="退役军衔级别" labelWidth="130" collection="aac065" readOnly="true" />
			<ta:number id="aac056" key="军龄(月)" labelWidth="130" max="999" min="0" readOnly="true" alignLeft="true" />
			<ta:number id="aae203" key="军龄折算月数" labelWidth="130" max="999" min="0" readOnly="true" alignLeft="true" />
			<ta:selectInput id="yic009" key="特殊贡献表彰类型" labelWidth="130" collection="YIC009" readOnly="true" />
			<ta:selectInput id="yic010" key="计划生育类型" labelWidth="130" collection="YIC010" readOnly="true" />
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//保存经办信息
	function submitData() {
		Base.submit("form1", "administrativeApprovalCheck2Action!toSave.do", null, null, null, function(data) {
			Base.setDisabled("btnSave");
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>