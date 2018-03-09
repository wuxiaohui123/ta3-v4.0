<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>起付减免登记复核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
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
			<ta:text id="yae099" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
	
		<ta:panel id="fltPersonInfo" key="申请人基本信息" cols="3">
			<ta:text id="aac001" key="个人ID" required="true" labelWidth="120"/>
			<ta:text id="aac003" key="姓名" readOnly="true"  labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true"  labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
			<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
			<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>			
			<ta:text id="aab001" key="单位ID"  readOnly="true" span="2" labelWidth="120" display="false"/>
			<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
			<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
			<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
			<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
			<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
			<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/>
	    </ta:panel>
		<ta:panel id="pnl_3" key="起付线" cols="3">
			<ta:number id="ykc411" key="减免后起付线" required="true" labelWidth="120" precision="2"/>
			<ta:text id="aae013" key="备注" maxLength="100"  labelWidth="120"/></br>
			说明：减免本次住院次数选择"是",代表不累计本次住院次数
		</ta:panel>
		<ta:tabs id="tabs1" fit="true">
		  <ta:tab key="住院信息(勾选后点击保存)" id="tab2">
			<ta:datagrid id="dateGrid_kc21" fit="true" forceFitColumns="true" selectType="checkbox" >
				<ta:datagridItem id="aaz217" key="人员医疗就诊事件ID" hiddenColumn="true"/>
				<ta:datagridItem id="aac001" key="人员ID"   hiddenColumn="false"/>
				<ta:datagridItem id="aac003" key="姓名"     align="center" showDetailed="true"  dataAlign="left"  maxChart="3"/>
				<ta:datagridItem id="akb021" key="医院名称"  align="center" showDetailed="true"  dataAlign="left" maxChart="10"/>
				<ta:datagridItem id="aae030" key="开始日期"  align="center" dataAlign="center"  dataType="date" maxChart="7"/>
				<ta:datagridItem id="aae031" key="终止日期"  align="center" dataAlign="center"  dataType="date" maxChart="7"/>
				<ta:datagridItem id="akc190"   key="就诊编号"   showDetailed="true"   align="center"  maxChart="7" sortable="true"/>
				<ta:datagridItem id="yke019" key="登记日期"  align="center" dataAlign="center"  dataType="date" maxChart="7"/>
				<ta:datagridItem id="aka130" key="医疗类别"  collection="AKA130" align="center" dataAlign="center"  showDetailed="true"  maxChart="6"/>
				<ta:datagridItem id="yka115" key="减免前起付线"  align="center" showDetailed="true" dataAlign="right" maxChart="5"/>
				<ta:datagridItem id="ykc022" key="本次住院次数"  align="center" showDetailed="true" dataAlign="right" maxChart="5"/>
				<ta:datagridItem id="akc193" key="入院诊断"  align="center" showDetailed="true" dataAlign="left" maxChart="10"/>
				<ta:datagridItem id="aka121" key="病种名称"  align="center" showDetailed="true" dataAlign="left" maxChart="8"/>
				<ta:datagridItem id="yke014" key="住院号"    align="center" showDetailed="true" dataAlign="left" maxChart="4"/>
			</ta:datagrid>
		  </ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("action", '1,2', true);
	});

	//保存
	function toSave() {
		Base.submit("form1","qifuReductionAuditAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>