<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>离休(二乙)费用月度清算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave"  key="结算[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:toolbarItem id="btnCancel" key="撤销结算[C]"  icon="xui-icon-spotDelete"  hotKey="C" onClick="toCencal()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">&nbsp; 
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:box id="bxAae001" cols="2">
			  <ta:date id="aae209_s" key="结算年月"  showSelectPanel="true" labelWidth="100" issue="true" required="true" columnWidth="0.6"/>
			  <ta:date id="aae209_e" key="至"  showSelectPanel="true" labelWidth="15" issue="true" columnWidth="0.4"/>
			</ta:box>  
			<ta:selectInput id="yka316"  key="人员类别" collection="YKA316" labelWidth="120" filter="17,18,24" reverseFilter="true"/>
			<ta:selectInput id="aka018" key="结算状态" labelWidth="100"  data="[{'id':'0','name':'未结算'},{'id':'1','name':'已结算'}]"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="医疗服务机构月度费用结算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdReckoningInfo" fit="true" forceFitColumns="true" haveSn="true"  >
			    <ta:datagridItem id="aka018" key="状态" collection="AKA018" align="center" dataAlign="left" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="akb020" key="医疗机构编号" align="center" showDetailed="true" dataAlign="left" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true" dataAlign="left" maxChart="10" formatter="fnFormatter"/>			
				<ta:datagridItem id="aae209" key="结算年月" align="center" showDetailed="true" dataAlign="center" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="yka316" key="清算类别" align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316" formatter="fnFormatter"/>
				<ta:datagridItem id="mzrc" key="门诊总人次" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="mzfy" key="门诊总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="mzakc228" key="门诊非医保费用" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="mzakb068" key="门诊统筹支付" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="zyrc" key="住院总人次"  align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="zyfy" key="住院总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="zyyka318" key="住院先自付" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
                <ta:datagridItem id="zyakc228" key="住院非医保费用" align="center" showDetailed="true" dataAlign="right" maxChart="7" formatter="fnFormatter"/>
                <ta:datagridItem id="zyakb068" key="住院统筹支付" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="jtrc" key="家庭病床总人次" align="center" showDetailed="true" dataAlign="right" maxChart="7" formatter="fnFormatter"/>
				<ta:datagridItem id="jtfy" key="家庭病床总费用"  align="center" showDetailed="true" dataAlign="right" maxChart="7" formatter="fnFormatter"/>
	            <ta:datagridItem id="jtakc228" key="家庭病床非医保费用" align="center" showDetailed="true" dataAlign="right" maxChart="8" formatter="fnFormatter"/>
	            <ta:datagridItem id="jtakb068" key="家庭病床统筹支付" align="center" showDetailed="true" dataAlign="right" maxChart="8" formatter="fnFormatter"/>
				<ta:datagridItem id="akb069" key="拒付费用" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="yae041" key="审核人" align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae051" key="审核日期" align="center" showDetailed="true" dataAlign="center" maxChart="10"  formatter="fnFormatter"/>
				<ta:datagridItem id="yae042" key="结算人" align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae052" key="结算日期" align="center" showDetailed="true" dataAlign="center" maxChart="10"  formatter="fnFormatter"/>
				<ta:datagridItem id="aaz272" key="流水号"  align="center" showDetailed="true" dataAlign="left" maxChart="6"  />
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//医疗机构回调函数
	function fnKb01MagifierBack(rowdata){
		   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
		   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
		
	//查询
	function query(){
		Base.clearGridData("dgrdReckoningInfo");
		Base.submit('form1','reckoningMonthLXAction!toQuery.do');
	}
	
	//保存
	function toSave(){
		var gridSelected=Base.getGridSelectedRows("dgrdReckoningInfo");//选中的表格数据
		if(gridSelected.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		var gridStr=Ta.util.obj2string(gridSelected);
		var parameter={};
		parameter['gridInfo']=gridStr;
		Base.submit("form1","reckoningMonthLXAction!save.do",parameter,null,false,null,null);
	}
	
	//撤销结算
	function toCencal(){
		var gridSelected=Base.getGridSelectedRows("dgrdReckoningInfo");//选中的表格数据
		if("" == gridSelected || null == gridSelected){
			Base.alert("请先选择撤销的数据!","warn");
		}else{
			var aka018 = gridSelected[0].aka018;
			if(aka018 < 11){
				Base.alert("还未结算,不能撤销!","warn");
			}else if(aka018 > 11){
				Base.alert("已经审批,不能撤销!","warn");
			}else{
				var gridStr=Ta.util.obj2string(gridSelected);
				var parameter={};
				parameter['gridInfo']=gridStr;
				Base.submit("form1","reckoningMonthLXAction!cancel.do",parameter,null,false,null,null);
			}
		}
	}
	// 渲染行颜色
	function fnFormatter(row, cell, value, columnDef,dataContext){
		var aka018 = parseInt(dataContext.aka018);
		if(aka018 > 3)
			value = "<span style='color:blue;'>"+value+"</span>";
		return value;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>