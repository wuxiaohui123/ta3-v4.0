<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>清算回退</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="回退[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  labelWidth="100"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:box id="bxAae001" cols="2">
			  <ta:date id="aae209_s" key="结算年月"  showSelectPanel="true" labelWidth="100" issue="true" required="true" columnWidth="0.6"/>
			  <ta:date id="aae209_e" key="至"  showSelectPanel="true" labelWidth="15" issue="true" columnWidth="0.4"/>
			</ta:box>  
			<ta:selectInput id="yka316" key="结算类别"  collection="YKA316"  labelWidth="120" filter="20,21,22,23"/>
			<ta:selectInput id="aka122" key="病种类型"  collection="AKA122"  labelWidth="120" />
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="医疗服务机构月度费用清算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdReckoningInfo" fit="true" haveSn="true" selectType="checkbox" forceFitColumns="true">
				<ta:datagridItem id="akb020" key="医疗机构编号"  align="center"  showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  showDetailed="true" dataAlign="left" maxChart="15"/>			
				<ta:datagridItem id="aae030" key="开始日期" align="center"  showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
				<ta:datagridItem id="aae031" key="终止日期" align="center"  showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>				
				<ta:datagridItem id="yka316" key="清算类别" align="center"  showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316"/>
				<ta:datagridItem id="akb079" key="人次" align="center"  showDetailed="true" dataAlign="right" maxChart="3"/>
				<ta:datagridItem id="akb065" key="总费用" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akc228" key="非医保费用" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka318" key="比例先自付" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka063" key="超封顶线" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="yka059" key="分段个人支付" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>				
				<ta:datagridItem id="akb068" key="统筹基金应付" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>										
				<ta:datagridItem id="ake034" key="个人账户应付" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="akb090" key="预留金额" align="center"  showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter" />	
				<ta:datagridItem id="akb069" key="扣款费用" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>			
				<ta:datagridItem id="akb094" key="实际支付金额" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>
				<ta:datagridItem id="aka122" key="病种类型" align="center"  showDetailed="true" dataAlign="left" maxChart="6" collection="AKA122"/>					
				<ta:datagridItem id="yka500" key="定额标准" align="center"  showDetailed="true" dataAlign="right" maxChart="6"/>	
				<ta:datagridItem id="yka501" key="本月结存或超支费用" align="center"  showDetailed="true" dataAlign="right" maxChart="8"/>			
				<ta:datagridItem id="yae041" key="审核人" align="center"  showDetailed="true" dataAlign="left" maxChart="3" collection="AAE011"/>
				<ta:datagridItem id="yae051" key="审核日期" align="center"  showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
				<ta:datagridItem id="yae042" key="结算人" align="center"  showDetailed="true" dataAlign="left" maxChart="3" collection="AAE011"/>
				<ta:datagridItem id="yae052" key="结算日期" align="center"  showDetailed="true" dataAlign="center" maxChart="6" dataType="date"/>
			    <ta:datagridItem id="aaz272" key="流水号" align="center"  showDetailed="true" dataAlign="left" maxChart="6" />
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
	});
	 // 列渲染方法
	function fnFormatter(row, cell, value, columnDef, dataContext)
    {
		return "<span style='color:red;'>"+value+"</span>";
	}
	
	//医疗机构编码的change事件和回车事件控制
	$("#akb020").change(function(){
		sfwQueryUtil(2,'getKb01',Base.getValue('akb020'));
	});
	
	//suggestframework医疗机构回调方法
	function fn_getHospital(){
		Base.setValue("akb020",g_Suggest[0]);
		Base.setValue("akb021",g_Suggest[1]);
	}
		
	//查询
	function query(){
		Base.clearGridData("dgrdReckoningInfo");
		Base.submit('form1','reckoningRollbackAction!toQueryHospitalInfo.do');
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
		parameter['gridInfo']=gridStr
		Base.submit("form1","reckoningRollbackAction!save.do",parameter,null,false,null,null);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>