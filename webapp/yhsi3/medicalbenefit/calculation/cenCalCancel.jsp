<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>零星报销结算回退</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="Q" onClick="toQuery()" asToolBarItem="true" />
		<ta:button id="btnSave" icon="xui-icon-spotDelete" key="撤消[S]" hotKey="S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel1" key="查询条件,注:请至少输入一个查询条件!" cols="3" >
			<ta:text id="aac001" key="个人ID" onChange="sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'))" />
			<ta:text id="aac003" key="姓名" readOnly="true"/>
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  filter="51,52,61,62,71,72" maxVisibleRows="8"/>
			<ta:text  id="akb020"  key="医疗机构编号" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2" />
			<ta:box span="1" cols="2">
				<ta:date id="aae030" key="结算时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae031" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:selectInput id="aae140" key="险种类型" collection="YL140"  maxVisibleRows="8"  reverseFilter="true"/>
			<ta:selectInput id="aka078" key="支付类型" collection="AKA078" maxVisibleRows="8" filter="4"/>
			<ta:box span="1" cols="2">
				<ta:date id="yae051_b" key="审核时间" showSelectPanel="true" columnWidth="0.6" />
				<ta:date id="yae051_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>
			<ta:selectInput id="yae041" key="审核人" collection="AAE011" maxVisibleRows="10"/>
			<ta:text id="yke056" key="结算状态"  display="false"/>
		</ta:panel>
		<ta:panel fit="true" id="panel2" key="结算信息(双击查看明细)" >
			<ta:datagrid id="kc24List" fit="true" forceFitColumns="true"  onRowDBClick="clickfn" haveSn="true" selectType="radio" >
				<ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="aac003" key="姓名" align="center"  dataAlign="left" maxChart="3"/>
				<ta:datagridItem id="aac002" key="身份证号" align="center" showDetailed="true"  dataAlign="left" maxChart="7"/>
				<ta:datagridItem id="aka130" key="医疗类别"  collection="AKA130" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="ake013" key="报销原因"  collection="AKE013" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="akb021" key="医院名称" align="center" showDetailed="true" dataAlign="left" maxChart="7"   />
				<ta:datagridItem id="aae030" key="开始日期" align="center" showDetailed="true" dataAlign="center" maxChart="7" dataType="date"/>
				<ta:datagridItem id="aae031" key="结束日期" align="center" showDetailed="true" dataAlign="center" maxChart="7" dataType="date"/>
				<ta:datagridItem id="aae036" key="结算时间" align="center" showDetailed="true" dataAlign="center" maxChart="7" dataType="date"/>
				<ta:datagridItem id="akc264" key="医疗费总额"  align="center" showDetailed="true" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="akb081" key="实际支付金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"  />
				<ta:datagridItem id="ake034" key="个人账户支出" align="center" showDetailed="true" dataAlign="right" maxChart="6"  />
				<ta:datagridItem id="ake039" key="基本医疗支出" align="center" showDetailed="true" dataAlign="right" maxChart="6"  />
				<ta:datagridItem id="ake041" key="居民医疗支出" align="center" showDetailed="true" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="ake043" key="离休医疗支出" align="center" showDetailed="true" dataAlign="right" maxChart="6" />
				<ta:datagridItem id="djr" key="登记人" collection="AAE011" align="center" ></ta:datagridItem>
				<ta:datagridItem id="djsj" key="登记时间" align="center" dataAlign="center" width="150"></ta:datagridItem>
				<ta:datagridItem id="aae011" key="结算人" collection="AAE011" align="center" ></ta:datagridItem>
				<ta:datagridItem id="aae036" key="结算时间 " align="center" dataAlign="center" width="150"></ta:datagridItem>
				<ta:datagridItem id="yae041" key="复核人" collection="AAE011" align="center" ></ta:datagridItem>
				<ta:datagridItem id="yae051" key="复核时间" align="center" dataAlign="center" width="150"></ta:datagridItem>
				<ta:datagridItem id="aaz217" key="就诊流水号" align="center" maxChart="6"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
	});
	//人员回调
	function fn_getPerson()
	{
		Base.setValue("aac001",g_Suggest[2]);
		Base.setValue("aac003",g_Suggest[1]);
	}
	
    // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}	
    
    // 查看明细
	function clickfn(e,rowdata){
		var param={"dto['aaz217']":rowdata.aaz217,"dto['aac001']":rowdata.aac001};
		Base.openWindow('userwin',"明细","<%=path%>/medicalbenefit/calculation/cenCalCancelAction!toDetail.do",param,900,500,null,null,true);
	}
	
	// 撤销
	function toSave(){
		var selectRows = Base.getGridSelectedRows("kc24List");
		if(selectRows.length == 0){
			Base.alert('请选择需要撤销的数据!', 'warn');
			return false;
		}
		Base.confirm("请确认撤销数据,以免出现错误!",function(yes){
			if(yes){
				var prm ={};
				prm.kc24List= Ta.util.obj2string(selectRows);
				Base.submit("panel1","cenCalCancelAction!toSave.do",prm,null,false,function(){
					Base.deleteGridSelectedRows("kc24List");
				});
			}
		});
	}
	
	// 查询
	function toQuery()
	{
		
		Base.clearGridData("kc24List");
		Base.submit("panel1","cenCalCancelAction!toQuery.do");
	}
	
	function checkCxtj()
	{
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		if("" == aae030 || "" == aae031 || null == aae030 || null == aae031)
		{
			Base.alert("请输入结算时间段!","warn");
			return false;
		}	
		return true;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>