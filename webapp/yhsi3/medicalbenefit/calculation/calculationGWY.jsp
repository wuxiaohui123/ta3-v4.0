<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>公务员医疗补助报销</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn"   key="查询[Q]"    icon="xui-icon-query"       hotKey="Q"  onClick="toQuery()" />
		<ta:toolbarItem id="jsBtn"      key="结算"       icon="xui-icon-spotAdd"     onClick="toJs()" />
		<ta:toolbarItem id="qxjsBtn"    key="取消结算"   icon="xui-icon-spotEdit"    onClick="toCancelJs()" />
		<ta:toolbarItem id="shBtn"      key="审核"       icon="xui-icon-spotClear"   onClick="toSh()" />
		<ta:toolbarItem id="cancelBtn"  key="取消审核"   icon="xui-icon-spotClear"   onClick="toCancelSh()" />
		<ta:toolbarItem id="printJsBtn"   key="打印结算单"       icon="xui-icon-spotPrint"   hotKey="P" onClick="toPrintJs()" />
		<ta:toolbarItem id="printCwBtn"   key="打印账务单"       icon="xui-icon-spotPrint"   hotKey="P" onClick="toPrintCw()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	    <ta:text id="aae011_r" key="经办人" display="false"/>
	 	<ta:text id="aaa027_r" key="分中心" display="false"/>
		<ta:panel id="panel1" key="查询条件" cols="3" >
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="结算时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:text id="aac001" key="个人ID"/>
			<ta:text id="aac003" key="姓名" />
			<ta:text id="aaz217" key="流水号" />
			<ta:text id="akb020"  key="医疗机构编号"  display="false"/>
			<ta:text id="akb021" key="医疗机构名称" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900"/>
		    <ta:selectInput id="yke056" key="结算标记"  data="[{'id':'03','name':'未审'},{'id':'04','name':'已审'}]" />
		    <ta:selectInput id="bxlx"  key="报销类型 "  collection="BXLX"/>
		    <ta:selectInput id="aaa027"  key="地区"  collection="AAB034"/>
		    <ta:date id="aae001" key="年度" showSelectPanel="true"  dateYear="true"  required="true"/>
		</ta:panel>
		<ta:panel id="panel2" key="报销信息"  fit="true">
			<ta:datagrid id="dgKc24k7" fit="true" haveSn="true"  headerColumnsRows="2">
				<ta:datagridItem id="yke056" key="结算状态" align="center" dataAlign="left" showDetailed="true" maxChart="4"  collectionData="[{'id':'03','name':'未审'},{'id':'04','name':'已审'}]" />
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" showDetailed="true" maxChart="6"/>
				<ta:datagridItem id="aac003" key="姓名"     align="center" dataAlign="left" showDetailed="true" maxChart="3" />
				<ta:datagridItem id="aac004" key="性别"     align="center" dataAlign="left" showDetailed="true" maxChart="2"  collection="AAC004"/>
				<ta:datagridItem id="akc021" key="人员性质"     align="center" dataAlign="left" showDetailed="true" maxChart="4"  collection="AKC021"/>
				<ta:datagridItem id="aab003" key="单位名称" align="center" dataAlign="left" showDetailed="true" maxChart="18" />
				<ta:datagridItem id="aab019" key="单位类型"  align="center" dataAlign="left" showDetailed="true" maxChart="7"  collection="AAB019"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center" dataAlign="left" showDetailed="true" maxChart="15" />
				<ta:datagridItem id="yke014" key="住院号"  align="center" dataAlign="left" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="aae030" key="入院日期" align="center" dataAlign="center" showDetailed="true" maxChart="5" />
				<ta:datagridItem id="aae031" key="出院日期" align="center" dataAlign="center" showDetailed="true" maxChart="5" />
				<ta:datagridItem id="yke021" key="住院天数"  align="center" dataAlign="center" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="akc196" key="出院诊断"  align="center" dataAlign="center" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="yka058" key="起付线金额 "    align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="qfxbl"   key="起付线报销比例 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="qfxzf"   key="起付线实际报销金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="qfxwbxje"   key="起付线未报销金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="yka059"   key="分段金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="tczfbl"   key="分段报销比例"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="tczf"     key="分段实际报销金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="fdwbxje"  key="分段未报销金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="sjbxje"  key="总报销金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="qfxlj"    key="起付线累计 金额"    align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="tczflj"   key="分段累计金额"   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="aae013"   key="备注"   align="center" dataAlign="left" showDetailed="true" maxChart="14" />
				<ta:datagridItem id="aae011" key="经办人"   align="center" dataAlign="left"  showDetailed="true " maxChart="3"    collection="AAE011" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" showDetailed="true" maxChart="10" />
				<ta:datagridItem id="yae041" key="审核人"   align="center" dataAlign="left"  showDetailed="true " maxChart="3"    collection="AAE011" />
				<ta:datagridItem id="yae051" key="审核时间" align="center" dataAlign="center" showDetailed="true" maxChart="10" />
				<ta:datagridItem id="aaz217" key="就诊流水号"   align="center"  maxChart="5"/>
				<ta:datagridItem id="aaz216" key="结算流水号"   align="center"  maxChart="5"/>
			</ta:datagrid>
	</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
	});
	
	// 个人ID change事件
	$("#aac001").change(function(){
		Base.setValue("aac003","");
		sfwQueryUtilForYl(1,'getAc01_all',{"dto.jstj":Base.getValue('aac001')});
	});

	// 人员回调函数
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.setValue("aac003",g_Suggest[1]);
	}
	
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	 
	// 查询
	function toQuery()
	{
		Base.clearGridData("dgKc24k7");
		Base.submit("panel1","calculationGWYAction!toQuery.do");
	}
	
	// 结算
	function toJs()
	{
		var param = {};
		Base.openWindow('win_js',"结算","<%=path%>/medicalbenefit/calculation/calculationGWYAction!toJs.do",param,"90%","85%",null,function(){
			
		},true);
	}
	
	// 审核 
	function toSh()
	{
		var gridData = Base.getGridSelectedRows("dgKc24k7");
		if("" == gridData || null == gridData){
			Base.alert("请先选择需要审核的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if("04" == yke056){
				Base.alert("已经审核!","warn");
				return;
			}else{
					var param = {};
					param["dto.aac001"] = gridData[0].aac001;
					param["dto.aaz217"] = gridData[0].aaz217;
					param["dto.action"] = "1";
					Base.submit("","calculationGWYAction!toSh.do",param,null,false,function(){
						toQuery();
					});	
			}
		}	
	}
	
	// 撤销 结算
	function  toCancelJs()
	{
		var gridData = Base.getGridSelectedRows("dgKc24k7");
		if("" == gridData || null == gridData){
			Base.alert("请先选择需要撤销的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if("03" != yke056 ){
				Base.alert("已经审核不能撤销!","warn");
				return;
			}else{
				Base.confirm("确定撤销?",function(yes){
					if(yes){
						var param = {};
						param["dto.aac001"] = gridData[0].aac001;
						param["dto.aaz217"] = gridData[0].aaz217;
						param["dto.action"] = "2";
						Base.submit("","calculationGWYAction!toCancel.do",param,null,false,function(){
							Base.deleteGridSelectedRows("dgKc24k7");
						});	
					}
				});
			}
		}	
	}
	
	// 撤销 审核
	function  toCancelSh()
	{
		var gridData = Base.getGridSelectedRows("dgKc24k7");
		if("" == gridData || null == gridData){
			Base.alert("请先选择需要撤销的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if("04" != yke056 ){
				Base.alert("未审核,不能操作!","warn");
				return;
			}else{
				Base.confirm("确定撤销?",function(yes){
					if(yes){
						var param = {};
						param["dto.aac001"] = gridData[0].aac001;
						param["dto.aaz217"] = gridData[0].aaz217;
						param["dto.action"] = "3";
						Base.submit("","calculationGWYAction!toCancel.do",param,null,false,function(){
							Base.deleteGridSelectedRows("dgKc24k7");
						});	
					}
				});
			}
		}	
	}
	
	// 打印
	function toPrintJs()
	{
		var  gridData = Base.getGridSelectedRows("dgKc24k7");
		if(gridData.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		var aac001 = gridData[0].aac001; // 个人ID
		var aae011 = Base.getValue("aae011"); // 经办人
		var aaz217 = gridData[0].aaz217; // 新的医疗待遇结算ID
		var reportName ="gwyBbx.raq"; 
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aac001="+aac001+";aae011="+aae011);

	}
	// 打印
	function toPrintCw()
	{
		var  gridData = Base.getGridSelectedRows("dgKc24k7");
		if(gridData.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		var aac001 = gridData[0].aac001; // 个人ID
		var aae011 = Base.getValue("aae011"); // 经办人
		var aaz217 = gridData[0].aaz217; // 新的医疗待遇结算ID
		var reportName ="gwyBx_cw.raq"; 
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aac001="+aac001+";aae011="+aae011);

	}
</script>
<%@ include file="/ta/incfooter.jsp"%>