<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>JudgeLaboringabilityCheck1</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="审核[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
						asToolBarItem="true" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" display="false" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>

			<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
			<ta:panel id="fset1" cols="3" key="人员基本信息">
				<ta:text id="aac001" key="个人ID" readOnly="true" />
				<ta:text id="aac003" key="姓 名" readOnly="true" />
				<ta:text id="aac002" key="身份证号码" readOnly="true" />
				<ta:text id="aab001" key="单位ID" readOnly="true" />
				<ta:text id="aae044" key="单位名称" readOnly="true" span="2" />
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" />
				<ta:text id="aaz127" key="认定id" readOnly="true" display="false" />
				<ta:text id="aaz151" key="鉴定id" readOnly="true" display="false" />
				<ta:text id="alc020" key="工伤发生时间" readOnly="true" display="false" />
			</ta:panel>

			<!-- 初始化工伤认定信息 -->
			<ta:panel key="工伤认定信息" id="lsrdxx"  cssStyle="overflow:auto">
				<ta:datagrid id="gsxxGrid" height="100" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
					<ta:datagridItem id="alc020" key="工伤发生时间" width="95" />
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" />
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" />
					<ta:datagridItem id="ala016" key="认定依据类别" width="95" collection="ALA016" />
					<ta:datagridItem id="alc011" key="认定书编号" />
					<ta:datagridItem id="alc017" key="受理日期" />
					<ta:datagridItem id="alc029" key="工伤认定结论" width="95" collection="ALC029" />
					<ta:datagridItem id="alc030" key="工伤认定机构" width="95" />
					<ta:datagridItem id="alc031" key="工伤认定日期" width="95" />
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" />
				</ta:datagrid>
			</ta:panel>

			<!-- 录入劳动能力鉴定登记信息 -->
			<ta:panel key="劳动能力鉴定登记" id="ldnljdxx" cols="3" >
				<ta:selectInput id="ala019" key="鉴定类别" labelWidth="130" collection="ALA019" readOnly="true"/>
				<ta:date id="alc017" key="受理日期" labelWidth="130" validNowTime="left" showSelectPanel="true" readOnly="true"/>
				<ta:date id="alc034" key="鉴定结论日期" labelWidth="130" validNowTime="left" showSelectPanel="true" readOnly="true"/>
				<ta:text id="alc035" key="鉴定书编号" labelWidth="130" required="false" readOnly="true"/>
				<ta:selectInput id="ala040" key="伤残等级" labelWidth="130" collection="ALA040" readOnly="true"/>
				<ta:selectInput id="alc060" key="护理依赖等级" labelWidth="130" collection="ALC060" readOnly="true"/>
				<ta:date id="ylc044" key="医疗终结期" labelWidth="130" showSelectPanel="true" readOnly="true" display="false"/>
				<ta:selectInput id="ylc025" key="鉴定发起方" labelWidth="130" collection="YLC025" readOnly="true"/>
				<ta:date id="aae127" key="申请日期" labelWidth="130" validNowTime="left" showSelectPanel="true" readOnly="true"/>
				<ta:text id="alc152" key="申请人姓名" labelWidth="130" readOnly="true"/>
				<ta:text id="alc049" key="申请人电话" labelWidth="130" validType="mobile" readOnly="true"/>				
			</ta:panel>
			<!-- 劳动能力历史鉴定信息列表，可修改或删除选中项  -->
			<ta:panel key="劳动能力鉴定历史信息" fit="true">
				<ta:datagrid id="lc03Grid" forceFitColumns="true" fit="true"  >
					<ta:datagridItem id="aaz151" key="劳动能力鉴定ID" />
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" />
					<ta:datagridItem id="ala019" key="鉴定类别" collection="ALA019" />
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" />
					<ta:datagridItem id="alc060" key="护理依赖等级" collection="ALC060" />
					<ta:datagridItem id="alc017" key="受理日期" />
					<ta:datagridItem id="alc034" key="鉴定结论日期" />
					<ta:datagridItem id="alc035" key="鉴定结论书编号" />
					<ta:datagridItem id="alc049" key="申请人联系电话" />
					<ta:datagridItem id="aae127" key="申请日期" />
					<ta:datagridItem id="alc152" key="申请人姓名" />
					<ta:datagridItem id="ylc025" key="鉴定发起方" collection="YLC025"/>
					<ta:datagridItem id="ylc044" key="医疗终结期" />
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" />
					<ta:datagridItem id="aae013" key="备注" />
				</ta:datagrid>
			</ta:panel>

		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//初始化页面布局
	$(document).ready(function() {
		$("body").taLayout();
		
	});

	//保存经办信息
	function submitData(){
		Base.submit("form1", "judgeLaboringabilityCheck1Action!toSave.do");
	}

</script>
<%@ include file="/ta/incfooter.jsp"%>
