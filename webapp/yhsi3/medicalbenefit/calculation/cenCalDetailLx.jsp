<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="printBtn" key="打印审核表" icon="xui-icon-spotPrint" onClick="toPrint()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aae011" key="经办人" display="false"/>
	    <ta:selectInput id="aka130_1" key="医疗类别" collection="AKA130"  display="false" /> 
		<ta:panel id="panel1" key="查询条件" cols="3" >
	        <ta:text id="ywlx" key="当前业务" display="false" /> 
			<ta:text id="aac001" key="个人ID"  />
			<ta:text id="aac003" key="姓名" />
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  filter="51,52,71,72" maxVisibleRows="8"/> 
			<ta:text  id="akb020"  key="医疗机构编号" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"   />
			<ta:date id="aae001"  key="年度"  showSelectPanel="true"  dateYear="true"/>
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="登记时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:box span="1" cols="2" >
				<ta:date id="aae030jz" key="就诊时间" showSelectPanel="true" columnWidth="0.6" />
				<ta:date id="aae031jz" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:selectInput id="yke056" key="结算状态"  data="[{'id':'0','name':'未结算'},{'id':'1','name':'已结算'}]" />
		</ta:panel>
		<ta:panel id="panel2" key="登记信息(双击数据,查看或修改明细)"  fit="true">
			<ta:datagrid id="kc21List" fit="true" haveSn="true" onRowDBClick="clickfn">
				<ta:datagridItem id="aaz217" key="就诊事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz002" key="业务日志ID"  hiddenColumn="true" />
				<ta:datagridItem id="yke056" key="结算状态" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4" collection="YKE056" />
				<ta:datagridItem id="aac001" key="个人编号" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" />
				<ta:datagridItem id="aac003" key="姓名" align="center"  showDetailed="true"  dataAlign="left"  maxChart="3" />
				<ta:datagridItem id="aac002" key="身份证号" align="center"  showDetailed="true"  dataAlign="left"  maxChart="10"  />
				<ta:datagridItem id="aab003" key="单位名称" align="center"  showDetailed="true"  dataAlign="left"  maxChart="12" />
				<ta:datagridItem id="aka130" key="医疗支付类别" align="center"  showDetailed="true"  dataAlign="left"  maxChart="8"  collection="AKA130"/>
				<ta:datagridItem id="aae030" key="开始日期" align="center"  showDetailed="true"  dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="aae031" key="结束日期" align="center"  showDetailed="true"  dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center"  showDetailed="true"  dataAlign="left"  maxChart="10" />
				<ta:datagridItem id="akb097" key="医疗机构等级" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"  collection="AKB096"/>
				<ta:datagridItem id="ake013" key="报销原因" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AKE013"/>
				<ta:datagridItem id="aae011" key="经办人" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AAE011"/>
				<ta:datagridItem id="aae036" key="经办时间" align="center"  showDetailed="true"  dataAlign="center"  maxChart="9"  dataType="datetime" />
			</ta:datagrid>
	</ta:panel>
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
	//登记信息双击录入明细数据 
	function clickfn(e,rowdata)
	{
		var yke056 = rowdata.yke056;
		if(yke056 != "01" && yke056 != "02"){
			Base.alert("已结算,不能修改明细!","warn");
		}else{
			var parameter = {};
			parameter["dto['aac001']"] = rowdata.aac001;
			parameter["dto['aaz217']"] = rowdata.aaz217;
			parameter["dto['aae030']"] = rowdata.aae030;
			parameter["dto['aae031']"] = rowdata.aae031;
			parameter["dto['aka130']"] = rowdata.aka130;
			Base.openWindow("win_mxlr", "明细录入信息", "<%=path%>/medicalbenefit/calculation/cenCalDetailLxAction!getDetail.do", parameter, "98%", "98%", null, null, true, null, null);
		}	
	}
	
	//查询已登记未结算登记信息
	function toQuery()
	{
		Base.clearGridData("kc21List");
		Base.submit("panel1","cenCalDetailLxAction!toQuery.do");
	}
	
	//打印审核表
	function toPrint()
	{
		var kc21List = Base.getGridSelectedRows("kc21List");
		if(kc21List.length == 0){
			Base.alert("请选择需要打印的数据!", "warn");
			return false;
		}
		var aaz217 = kc21List[0].aaz217;
		var aae011 = Base.getValue("aae011");
		var aka130 = kc21List[0].aka130;
		var aac001 = kc21List[0].aac001;
		var reportName="CenterJS_SHDLX.raq"; // 住院审核单
		if("11" == aka130 || "12" == aka130 || "14"==aka130 || "15" == aka130)
			reportName = "centerBxMxsh_LXMZ.raq"; // 门诊审核单
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011+";aac001="+aac001);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>