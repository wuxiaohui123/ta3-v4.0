<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>月度清算领导审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn"  key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave"   key="审批[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:toolbarItem id="btnCancel" key="撤销审批[D]" icon="xui-icon-spotClear" hotKey="D" onClick="toCancel()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj" key="查询条件" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:box id="bxAae001" cols="2">
			  <ta:date id="aae209_s" key="结算年月"  showSelectPanel="true" labelWidth="100" issue="true" required="true" columnWidth="0.6"/>
			  <ta:date id="aae209_e" key="至"  showSelectPanel="true" labelWidth="15" issue="true" columnWidth="0.4"/>
			</ta:box>  
			<ta:selectInput id="yka316" key="人员类别"  collection="YKA316"  labelWidth="120" filter="20,21,22,23"/>
			<ta:selectInput id="aka122" key="病种类型"  collection="AKA122"  labelWidth="120" />
			<ta:box id="bxYae053" cols="2">
			  <ta:date id="yae053_s" key="审批时间"  showSelectPanel="true" labelWidth="98" columnWidth="0.6"/>
			  <ta:date id="yae053_e" key="至"  showSelectPanel="true" labelWidth="15" columnWidth="0.4"/>
			</ta:box>  
			<ta:selectInput id="aka018" key="结算状态"  collection="AKA018"  labelWidth="120" filter="11,12"  reverseFilter="true"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="医疗服务机构月度费用清算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdReckoningInfo" fit="true" haveSn="true" selectType="checkbox" forceFitColumns="true">
			    <ta:datagridItem id="aka018" key="结算状态" align="center"  showDetailed="true" dataAlign="left" maxChart="4"  collection="AKA018" formatter="fnFormatter"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" align="center"  showDetailed="true" dataAlign="left" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center"  showDetailed="true" dataAlign="left" maxChart="12" formatter="fnFormatter"/>			
				<ta:datagridItem id="aae209" key="结算年月" align="center"  showDetailed="true" dataAlign="center" maxChart="5"  formatter="fnFormatter"/>				
				<ta:datagridItem id="yka316" key="结算类别" align="center"  showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316" formatter="fnFormatter"/>
				<ta:datagridItem id="aka122" key="病种类型" align="center"  showDetailed="true" dataAlign="right" maxChart="4" collection="AKA122" formatter="fnFormatter"/>					
				<ta:datagridItem id="aka121" key="病种名称" align="center"  showDetailed="true" dataAlign="right" maxChart="8"  formatter="fnFormatter"/>					
				<ta:datagridItem id="akb079" key="人次" align="center"  showDetailed="true" dataAlign="right" maxChart="3" formatter="fnFormatter"/>
				<ta:datagridItem id="akb065" key="总费用" align="center"  showDetailed="true" dataAlign="right" maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="akc228" key="全自费费用" align="center"  showDetailed="true" dataAlign="right" maxChart="5" formatter="fnFormatter"/>
				<ta:datagridItem id="akc268" key="超限价费用" align="center"  showDetailed="true" dataAlign="right" maxChart="5" formatter="fnFormatter"/>
				<ta:datagridItem id="yka318" key="比例先自付" align="center"  showDetailed="true" dataAlign="right" maxChart="5" formatter="fnFormatter"/>
				<ta:datagridItem id="yka319" key="符合范围费用" align="center"  showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="yka063" key="超封顶线" align="center"  showDetailed="true" dataAlign="right" maxChart="4" formatter="fnFormatter"/>
				<ta:datagridItem id="yka059" key="分段个人支付" align="center"  showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>				
				<ta:datagridItem id="akb068" key="统筹基金应付" align="center"  showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>										
				<ta:datagridItem id="ake034" key="个人账户应付" align="center"  showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="akb090" key="预留金额"  align="center"  showDetailed="true" dataAlign="right" maxChart="4" formatter="fnFormatter" />	
				<ta:datagridItem id="akb069" key="扣款金额" align="center"  showDetailed="true" dataAlign="right" maxChart="4" formatter="fnFormatter"/>			
				<ta:datagridItem id="akb094" key="实际支付金额" align="center"  showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter"/>
				<ta:datagridItem id="yka500" key="定额标准" align="center"  showDetailed="true" dataAlign="right" maxChart="4" formatter="fnFormatter"/>	
				<ta:datagridItem id="yka501" key="本月结存或超支费用" align="center"  showDetailed="true" dataAlign="right" maxChart="9" formatter="fnFormatter"/>			
				<ta:datagridItem id="yae041" key="审核人"  align="center"  showDetailed="true" dataAlign="left" maxChart="3" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae051" key="审核时间" align="center"  showDetailed="true" dataAlign="center" maxChart="12"  formatter="fnFormatter"/>
				<ta:datagridItem id="yae042" key="结算人"  align="center"  showDetailed="true" dataAlign="left" maxChart="3" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae052" key="结算时间" align="center"  showDetailed="true" dataAlign="center" maxChart="12"  formatter="fnFormatter"/>
				<ta:datagridItem id="yae043" key="审批人"  align="center"  showDetailed="true" dataAlign="left" maxChart="3" collection="AAE011" formatter="fnFormatter"/>
				<ta:datagridItem id="yae053" key="审批时间" align="center"  showDetailed="true" dataAlign="center" maxChart="12"  formatter="fnFormatter"/>
			    <ta:datagridItem id="aaz272" key="流水号" align="center"  showDetailed="true" dataAlign="left" maxChart="6"/>
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//表格列渲染方法
	function fnFormatter(row, cell, value, columnDef, dataContext)
    {
		if(dataContext.aka018 == "12"){
			if("" != value && null != value)
				value = "<span style='color:blue;'>"+value+"</span>";
		}
		return value;
	}
	
	//医疗机构回调函数
	function fnKb01MagifierBack(rowdata){
		   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
		   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}	
	//查询
	function query()
	{
		Base.clearGridData("dgrdReckoningInfo");
		Base.submit('form1','reckoningApprovalAction!toQuery.do');
	}
	
	// 审批
	function toSave(){
		var gridSelected=Base.getGridSelectedRows("dgrdReckoningInfo");//选中的表格数据
		if(gridSelected.length == 0){
			Base.alert("请先选择数据!","warn");
			return;
		}
		var gridData = [];
		var rowdata1 = {};
		$.each(gridSelected,function(index,rowdata){
			if(rowdata.aka018 != "11")
				return;
			rowdata1 = {};
			rowdata1.aaz272 = rowdata.aaz272; // 流水号
			rowdata1.akb020 = rowdata.akb020; // 医疗机构编码
			rowdata1.yka316 = rowdata.yka316; // 结算类型
			rowdata1.aka018 = rowdata.aka018; // 结算状态
			gridData.push(rowdata1);
		});
		if("" == gridData || null == gridData){
			Base.alert("没有可审批的数据!","warn");
			return;
		}
		var gridStr=Ta.util.obj2string(gridData);
		var parameter={};
		parameter['gridInfo']=gridStr
		Base.submit("form1","reckoningApprovalAction!save.do",parameter,null,false,null,null);
	}
	
	// 撤销
	function toCancel(){
		var gridSelected=Base.getGridSelectedRows("dgrdReckoningInfo");//选中的表格数据
		if(gridSelected.length == 0){
			Base.alert("请先选择数据!","warn");
			return;
		}
		var gridData = [];
		var rowdata1 = {};
		$.each(gridSelected,function(index,rowdata){
			if(rowdata.aka018 != "12")
				return;
			rowdata1 = {};
			rowdata1.aaz272 = rowdata.aaz272; // 流水号
			rowdata1.akb020 = rowdata.akb020; // 医疗机构编码
			rowdata1.yka316 = rowdata.yka316; // 结算类型
			rowdata1.aka018 = rowdata.aka018; // 结算状态
			gridData.push(rowdata1);
		});
		if("" == gridData || null == gridData){
			Base.alert("没有可撤销的数据!","warn");
			return;
		}
		var gridStr=Ta.util.obj2string(gridData);
		var parameter={};
		parameter['gridInfo']=gridStr
		Base.submit("form1","reckoningApprovalAction!cancel.do",parameter,null,false,null,null);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>