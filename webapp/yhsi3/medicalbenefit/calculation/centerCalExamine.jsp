<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心支付审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:button id="btnQuery" icon="xui-icon-query"  key="查询[Q]"  hotKey="Q" onClick="toQuery()" asToolBarItem="true" />
		<ta:button id="btnClear" icon="xui-icon-spotSave"  key="清条件"  hotKey="C" onClick="Base.clearData('panel1');" asToolBarItem="true" />
		<ta:button id="btnSave" icon="xui-icon-spotSave" key="审批[S]" hotKey="S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel1" key="查询条件,注:请至少输入一个查询条件!" cols="3" >
			<ta:text id="aac001" key="个人ID" />
			<ta:text id="aac003" key="姓名" />
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  filter="51,52,61,62,71,72" maxVisibleRows="8"/>
			<ta:text  id="akb020"  key="医疗机构编号"  popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2" />
			<ta:box span="1" cols="2">
				<ta:date id="aae030" key="结算时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae031" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:selectInput id="aae140" key="险种类型" collection="YL140" maxVisibleRows="8" />
			<ta:selectInput id="aka078" key="支付类型" collection="AKA078" maxVisibleRows="8" filter="4"/>
		</ta:panel>
		<ta:panel id="panel2" cols="3" key="审核信息" >
			<ta:selectInput id="action" key="审核标志" required="true"  collection="ACTION" value="1" filter="0,3"/>
			<ta:selectInput id="yka547" key="拨付方式" required="true"  collection="YKA547" value="1" display="false"/>
		</ta:panel>
		<ta:tabs id="tabs" fit="true">
			<ta:tab id="kc24Tab" key="待审批列表">
				<ta:panel fit="true" id="panel2" key="结算信息" >
					<ta:datagrid id="kc24List" fit="true"  haveSn="true" selectType="checkbox" >
						<ta:datagridItem id="print" key="查看结算单" icon="xui-icon-spotPrint" align="center" click="toPrint" maxChart="5" />
						<ta:datagridItem id="aac001" key="人员ID"  align="center"   dataAlign="left" maxChart="6"/>
						<ta:datagridItem id="aac003" key="姓名"     align="center" showDetailed="true"  dataAlign="left" maxChart="4" />
						<ta:datagridItem id="aac002" key="身份证号" align="center" showDetailed="true"  dataAlign="left" maxChart="9"  />
						<ta:datagridItem id="akc264" key="医疗费总额"  align="center" showDetailed="true"  dataAlign="right"  maxChart="5"/>
						<ta:datagridItem id="yka115" key="本次起付线"  align="center" showDetailed="true"  dataAlign="right"  maxChart="5"/>
						<ta:datagridItem id="yka058" key="起付线内费用个人支付"  align="center" showDetailed="true"  dataAlign="right"  maxChart="10"/>
						<ta:datagridItem id="tczf"   key="统筹支出" align="center" showDetailed="true"  dataAlign="right"  maxChart="5" />
						<ta:datagridItem id="tcblzf"   key="统筹个人比例自付" align="center" showDetailed="true"  dataAlign="right"  maxChart="8" />
						<ta:datagridItem id="ake034" key="个人账户支出" align="center" showDetailed="true"  dataAlign="right"  maxChart="5"/>
						<ta:datagridItem id="aae009" key="银行户名" align="center" showDetailed="true"  dataAlign="left"  maxChart="5" />
						<ta:datagridItem id="aae010" key="银行账号" align="center" showDetailed="true"  dataAlign="left"  maxChart="10" />
						<ta:datagridItem id="aaf002" key="银行类型" align="center" showDetailed="true"  dataAlign="left"  maxChart="7" collection="AAF002"/>
						<ta:datagridItem id="akc021" key="人员性质" align="center" showDetailed="true"  dataAlign="left" maxChart="4"  collection="AKC021"/>
						<ta:datagridItem id="aae140" key="险种类型" align="center" showDetailed="true"  dataAlign="left" maxChart="6"  collection="AAE140"/>
						<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true"  dataAlign="left" maxChart="18"  dataType="date" />
						<ta:datagridItem id="aae030" key="入院时间" align="center" showDetailed="true"  dataAlign="center" maxChart="7"  dataType="date" />
						<ta:datagridItem id="aae031" key="出院时间" align="center" showDetailed="true"  dataAlign="center" maxChart="7"  dataType="date" />
						<ta:datagridItem id="aae036" key="结算时间" align="center" showDetailed="true"  dataAlign="center" maxChart="7"  dataType="date" />
						<ta:datagridItem id="aka130" key="医疗类别" align="center" showDetailed="true"  dataAlign="left" maxChart="7"   collection="AKA130" />
						<ta:datagridItem id="aka030" key="结算类别" align="center" showDetailed="true"  dataAlign="left" maxChart="7"   collection="AKA030" />
						<ta:datagridItem id="ake013" key="报销原因" align="center" showDetailed="true"  dataAlign="left" maxChart="7"   collection="AKE013" />
						<ta:datagridItem id="aae011" key="结算人"  align="center" showDetailed="true"  dataAlign="left"    maxChart="5" collection="AAE011"/>
						<ta:datagridItem id="aae036" key="结算时间" align="center" showDetailed="true"  dataAlign="center"  maxChart="7" dataType="date" />
						<ta:datagridItem id="aaz216" key="结算流水号"  maxChart="6"/>
						<ta:datagridItem id="aaz217" key="就诊流水号"  maxChart="6"/>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="错误信息" id="errorTab">
				<ta:panel id="errorPanel" key="错误信息列表" fit="true" >
					<ta:datagrid id="errorDataGrid" haveSn="true" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aac003" key="姓名" width="10" align="center" dataAlign="center" />
						<ta:datagridItem id="errMsg" key="错误消息" align="center" dataAlign="center" showDetailed="true"/>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	function clickfn(e,rowdata){
		var param={"dto['aaz217']":rowdata.aaz217,"dto['aac001']":rowdata.aac001};
		Base.openWindow('userwin',"明细","<%=path%>/medicalbenefit/calculation/centerCalExamineAction!toDetail.do",param,900,500,null,null,true);
	}
	
	//单条结算单打印
	function toPrint(data, e)
	{
		var aaz217 = data.aaz217; // 就诊事件ID
		var aaz216 = data.aaz216; // 结算ID
		var aka130 = data.aka130; // 医疗类别
		var aac001 = data.aac001; // 人员ID
		var aka030 = data.aka030;// 结算类别
		var aae140 = data.aae140; // 险种类型
		var ake013 = data.ake013; // 报销原因
		var aae011 = Base.getValue("aae011");
		//var reportName = "centercal.raq";
		var reportName = "centercal_zy.raq";
		// 门诊结算表,包括普通门诊和离休门诊
		if ("1" == aka130.substr(0, 1))
			reportName = "centerCal_mz.raq";
		// 门诊慢性病
		if (aka130 == "13" || "13a" == aka130 || "13b" == aka130){
			  reportName = "centercalMxb_1.raq";
			if("11" == ake013) //慢性病中心补保报销
			  reportName = "centercalMxb.raq";
		}
		// 离休住院
		if (aka130.substr(0, 1) == "2" && "340" == aae140)
			reportName = "centerCal_lxzy.raq";
		if("8" == aka030)
			reportName = "centerCal_mz.raq";
		if("16" == aka130)
			reportName = "centerCal_sy.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aaz216="+aaz216+";aae011="+aae011+";aac001="+aac001);
	}
	
	// 保存
	function toSave()
	{
		// 清空数据
		Base.clearGridData("errorDataGrid");
		// 选中的数据
		var selectRows = Base.getGridSelectedRows("kc24List");
		if(selectRows.length == 0){
			Base.alert('请勾选数据', 'warn');
			return false;
		}
	    var gridData = [];
	    var row = {};
		// 遍历获取重要字段
		$.each(selectRows,function(index,rowdata){
			row = {};
			row.aaz217 = rowdata.aaz217;
			row.aaz216 = rowdata.aaz216;
			row.aac001 = rowdata.aac001;
			gridData.push(row);
		});
		var prm ={};
		prm.kc24List= Ta.util.obj2string(gridData);
		Base.submit("panel2","centerCalExamineAction!toSave.do",prm,null,null,function(){
			Base.deleteGridSelectedRows("kc24List");
		});
	}
	
	// 查询
	function toQuery()
	{
		
		Base.clearGridData("kc24List");
		Base.submit("panel1","centerCalExamineAction!toQuery.do");
	}
	
	// 查询条件检查
	function checkCxtj()
	{
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		if("" == aae030 || "" == aae031)
		{
			Base.alert("请输入结算时间!","warn");
			return false;
		}
		return true;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>