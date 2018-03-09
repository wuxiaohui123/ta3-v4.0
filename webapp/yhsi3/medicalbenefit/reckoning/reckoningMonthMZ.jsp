<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构门诊(药店)费用月度清算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn"  key="查询[Q]"      icon="xui-icon-query"       hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave"   key="结算[S]"      icon="xui-icon-spotSave"    hotKey="S" onClick="toSave()" />
		<ta:toolbarItem id="btnCancel" key="撤销结算[C]"  icon="xui-icon-spotDelete"  hotKey="C" onClick="toCencal()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj"  key="查询条件" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:box id="bxAae001" cols="2">
			  <ta:date id="aae209_s" key="结算年月"  showSelectPanel="true" labelWidth="100" issue="true" required="true" columnWidth="0.6"/>
			  <ta:date id="aae209_e" key="至"  showSelectPanel="true" labelWidth="15" issue="true" columnWidth="0.4"/>
			</ta:box>  
			<ta:selectInput id="yka316" key="人员类别" collection="YKA316" labelWidth="120" filter="10,11,12,13,14,19" reverseFilter="true"/>
			<ta:selectInput id="aka018" key="结算状态" labelWidth="120"  data="[{'id':'0','name':'未结算'},{'id':'1','name':'已结算'}]"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="医疗服务机构月度费用结算信息" fit="true" expanded="false" scalable="false" >
			<ta:datagrid id="dgKf20k1" fit="true" haveSn="true" headerColumnsRows="2" >
				<ta:datagridItem id="aka018" key="结算状态" collection="AKA018"  align="center" dataAlign="center" maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb020" key="医疗机构编号" showDetailed="true" align="center" dataAlign="center" maxChart="5" formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" dataAlign="center" maxChart="18" formatter="fnFormatter"/>			
				<ta:datagridItem id="aae209" key="结算年月" showDetailed="true" align="center" dataAlign="center"  maxChart="6" formatter="fnFormatter"/>				
				<ta:datagridItem id="yka316" key="结算类别" showDetailed="true" align="center" dataAlign="center" maxChart="6" collection="YKA316" formatter="fnFormatter"/>
				<ta:datagridItem id="akb079" key="核准主记录数" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akb065" key="核准总费用" dataType="number" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka319" key="核准医保费用" dataType="number" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="ake034" key="核准个人账户支付" dataType="number" align="center" dataAlign="right" maxChart="4" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akb068" key="核准统筹基金支付" dataType="number" align="center" dataAlign="right" maxChart="4" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akc228" key="自费费用" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akb069" key="拒付费用" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="qyzzzh" key="企业在职个人账户支付" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="jgzzzh" key="机关事业在职个人账户支付" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="qtzzzh" key="其它单位在职个人账户支付" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="qytxzh" key="企业退休个人账户支付" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="jgtxzh" key="机关事业退休个人账户支付"  dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="qttxzh" key="其它单位退休个人账户支付" dataType="number" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yae041" key="审核人" maxChart="3"  showDetailed="true" align="center" dataAlign="left" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae051" key="审核时间" maxChart="10"  showDetailed="true" align="center" dataAlign="center" formatter="fnFormatter"/>
				<ta:datagridItem id="yae042" key="结算人" maxChart="3"  showDetailed="true" align="center" dataAlign="left" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae052" key="结算时间" maxChart="10"  showDetailed="true" align="center" dataAlign="center" formatter="fnFormatter"/>
				<ta:datagridItem id="aaz272" key="流水号" maxChart="6"  showDetailed="true" align="center" dataAlign="left"/>
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
	function query()
	{
		Base.clearGridData("dgKf20k1");
		Base.submit("form1","reckoningMonthMZAction!toQuery.do");
	}
	
	//结算保存
	function toSave(){
		var gridSelected=Base.getGridSelectedRows("dgKf20k1");//选中的表格数据
		if("" == gridSelected || null == gridSelected){
			Base.alert("请选择结算的数据!","warn");
		}else{
			var gridStr=Ta.util.obj2string(gridSelected);
			var parameter={};
			parameter['gridInfo']=gridStr;
			Base.submit("form1","reckoningMonthMZAction!save.do",parameter,null,false,null,null);
		}
	}
	//撤销结算
	function toCencal(){
		var gridSelected=Base.getGridSelectedRows("dgKf20k1");//选中的表格数据
		if("" == gridSelected || null == gridSelected){
			Base.alert("请选择需要撤销的数据!","warn");
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
				Base.submit("form1","reckoningMonthMZAction!cancel.do",parameter,null,false,null,null);
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