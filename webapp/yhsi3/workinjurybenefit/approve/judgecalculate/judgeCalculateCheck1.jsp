<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>JudgeCalculateCheck1</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>		
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" display="false" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>

			<ta:panel id="grjbxx" key="人员基本信息" cols="3">
				<ta:text id="aac001" key="人员ID" readOnly="true" />
				<ta:text id="aac003" key="姓 名" readOnly="true" />
				<ta:text id="aac002" key="身份证号码" readOnly="true" />
				<ta:text id="aab001" key="单位ID" readOnly="true" />
				<ta:text id="aae044" key="单位名称" span="2" readOnly="true" />
				<ta:text id="aab999" key="单位管理码" display="false" />
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			</ta:panel>

			<ta:panel id="gsxx" key="人员工伤信息" height="83px" bodyStyle="margin:0px">
				<ta:datagrid id="gsxxList" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false">
					</ta:datagridItem>
					<ta:datagridItem id="alc020" key="工伤时间">
					</ta:datagridItem>
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035">
					</ta:datagridItem>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022">
					</ta:datagridItem>
					<ta:datagridItem id="alc027" key="工伤类别" collection="ALC027">
					</ta:datagridItem>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040">
					</ta:datagridItem>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060">
					</ta:datagridItem>				
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021">
					</ta:datagridItem>
					<ta:datagridItem id="alc029" key="认定结论" collection="ALC029">
					</ta:datagridItem>
					<ta:datagridItem id="ylc002" key="工亡类别" collection="YLC002">
					</ta:datagridItem>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017">
					</ta:datagridItem>
					<ta:datagridItem id="alc040" key="死亡(失踪)日期" width="110">
					</ta:datagridItem>
					<ta:datagridItem id="ylc040" key="死亡原因">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
			<%-- <%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%> --%>

			<ta:panel id="dqdyxx" key="当前报销信息">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true" haveSn="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

		</ta:form>
	</body>
</html>
<script type="text/javascript">
//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	
	Base.submit("form1", "judgeCalculateCheck1Action!toSave.do");
}

//页面布局控制
$(document).ready(function() {
//	$("body").taLayout();
	$("form").css("overflow","auto");
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
