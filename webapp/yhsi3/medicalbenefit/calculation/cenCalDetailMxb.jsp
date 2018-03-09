<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn"  key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="editRegBtn" key="修改登记信息" icon="xui-icon-spotEdit"   onClick="toEditReg()" />
		<ta:toolbarItem id="editMxBtn" key="修改明细信息" icon="xui-icon-spotEdit"   onClick="toEditMx()" />
		<ta:toolbarItem id="printBtn"  key="打印审核表" icon="xui-icon-spotPrint" onClick="toPrint()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	    <ta:text id="aae011" display="false"/>
		<ta:panel id="pnlCxtj" key="查询条件" cols="3" >
			<ta:text id="aac001" key="个人ID"  />
			<ta:text id="aac003" key="姓名"  />
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  filter="13,13a,13b" reverseFilter="true" maxVisibleRows="8"/> 
			<ta:text  id="akb020"  key="医疗机构编号" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2" />
		    <ta:date id="aae001" key="年度" showSelectPanel="true"  dateYear="true"/>
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="登记时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:selectInput id="yke056" key="结算状态"  data="[{'id':'0','name':'未结算'},{'id':'1','name':'已结算'}]"  value="0"/>
		</ta:panel>
		<ta:panel id="panel2" key="登记信息(双击数据,查看或修改明细)"  fit="true">
			<ta:datagrid id="kc21List" fit="true" haveSn="true" onRowDBClick="clickfn">
				<ta:datagridItem id="yke056" key="结算状态" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4" collection="YKE056" />
				<ta:datagridItem id="aac001" key="个人编号" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" />
				<ta:datagridItem id="aac003" key="姓名" align="center"  showDetailed="true"  dataAlign="left"  maxChart="3" />
				<ta:datagridItem id="aac002" key="身份证号" align="center"  showDetailed="true"  dataAlign="left"  maxChart="10"  />
				<ta:datagridItem id="akc021" key="人员性质" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AKC021"/>
				<ta:datagridItem id="aab003" key="单位名称" align="center"  showDetailed="true"  dataAlign="left"  maxChart="12" />
				<ta:datagridItem id="aka130" key="医疗支付类别" align="center"  showDetailed="true"  dataAlign="left"  maxChart="8"  collection="AKA130"/>
				<ta:datagridItem id="aae030" key="开始日期" align="center"  showDetailed="true"  dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="aae031" key="结束日期" align="center"  showDetailed="true"  dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="aae001" key="年度"   align="center"  showDetailed="true"  dataAlign="center"  maxChart="3" />
				<ta:datagridItem id="yke069" key="单据数量" align="center"  showDetailed="true"  dataAlign="center"  maxChart="4"  />
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center"  showDetailed="true"  dataAlign="left"  maxChart="10" />
				<ta:datagridItem id="akb097" key="医疗机构等级" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"  collection="AKB096"/>
				<ta:datagridItem id="aae019" key="总费用" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="akc228" key="全自费" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="akc268" key="超限价" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="yka318" key="先自付" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="yka319" key="符合范围" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="fyyfw" key="非范围用药金额" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="ake013" key="报销原因" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AKE013"/>
				<ta:datagridItem id="aae011" key="经办人" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AAE011"/>
				<ta:datagridItem id="aae036" key="经办时间" align="center"  showDetailed="true"  dataAlign="center"  maxChart="9"  dataType="datetime" />
				<ta:datagridItem id="aaa027" key="经办机构" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"  collection="YAB003"/>
				<ta:datagridItem id="aaz002" key="业务日志ID"  hiddenColumn="true" />
				<ta:datagridItem id="aaz217" key="就诊流水号"  align="center" maxChart="4"/>
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
		Base.setValue("aac003")
		sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'));
	});
	
	// 人员回调方法
	function fn_getPerson(){
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac003", g_Suggest[1]);
	}
	
	  // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	  
	//登记信息双击录入明细数据 
	function clickfn(e,rowdata)
	{
		var parameter = {};
		parameter["dto['aac001']"] = rowdata.aac001; // 个人ID
		parameter["dto['aaz217']"] = rowdata.aaz217; // 医疗待遇申请事件ID
		parameter["dto['aae030']"] = rowdata.aae030; // 开始日期
		parameter["dto['aae031']"] = rowdata.aae031; // 结束日期
		parameter["dto['aka130']"] = rowdata.aka130; // 医疗类别
		Base.openWindow("win_mxlr", "明细录入信息", "<%=path%>/medicalbenefit/calculation/cenCalDetailMxbAction!getDetail.do", parameter, "99%", "99%", null, null, true, null, null);
	}
	//查询已登记未结算登记信息
	function toQuery()
	{
		// 年度
		var aae001 = Base.getValue("aae001");
		var aac001 = Base.getValue("aac001");
		var akb020 = Base.getValue("akb020");
		var aae036_s = Base.getValue("aae036_s");
		var aae036_e = Base.getValue("aae036_e");
		if(("" == aae001 || null == aae001)
				&&("" == aac001 || null == aac001)
				&&("" == akb020 || null == akb020)
				&&("" == aae036_e || null == aae036_e)
				&&("" == aae036_s || null == aae036_s)){
			return Base.alert("个人ID、医疗机构编码、年度或登记时间至少输入一个!","warn",function(){
				Base.focus("aac001");
			});
		}else{
			Base.clearGridData("kc21List");
			Base.submit("pnlCxtj","cenCalDetailMxbAction!toQuery.do");
		}
	}
	
	// 修改明细
	function toEditMx()
	{
		var gridData = Base.getGridSelectedRows("kc21List");
		if("" == gridData || null == gridData){
			Base.alert("请选择需要修改的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if(yke056 != "01" && yke056 != "02"){
				Base.alert("已结算,不能修改明细!","warn");
			}else{
    			clickfn(event,gridData[0]);
			}
		}
	}
	
	// 修改登记信息
	function toEditReg()
	{
		var gridData = Base.getGridSelectedRows("kc21List");
		if("" == gridData || null == gridData){
			Base.alert("请选择需要修改的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if(yke056 != "01" && yke056 != "02"){
				Base.alert("已结算,不能修改明细!","warn");
			}else{
				var parameter = {};
				parameter["dto['aac001']"] = gridData[0].aac001; // 个人ID
				parameter["dto['aac003']"] = gridData[0].aac003; // 姓名
				parameter["dto['aaz217']"] = gridData[0].aaz217; // 医疗待遇申请事件ID
				parameter["dto['aka130']"] = gridData[0].aka130; // 医疗类别
				parameter["dto['ake013']"] = gridData[0].ake013; // 报销原因
				Base.openWindow("win_reg", "登记信息", "<%=path%>/medicalbenefit/calculation/cenCalDetailMxbAction!openReg.do", parameter, "80%", "60%", null, null, true, null, null);
			}
		}
	}
	
	//打印审核表
	function toPrint()
	{
		var gridData = Base.getGridSelectedRows("kc21List");
		if("" == gridData || null == gridData){
			Base.alert("请选择需要打印的数据!","warn");
		}else{
			var aaz217 = gridData[0].aaz217;
			var aac001 = gridData[0].aac001;
			var aae011 = Base.getValue("aae011");
			var reportName="CenterJSMXB.raq";
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
					"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011+";aac001="+aac001);
			// 导出Excel
			//$("#report1_printIFrame").attr("src","/wzsb/reportServlet?action=3&file="+reportName+"&"+
			//		"srcType=file&columns=0&saveAsName="+"1573"+"&excelFormat=2003&"+
			//		"paramString=aaz217="+aaz217
			//		+";aae011="+aae011
			//		+";aac001="+aac001
			//);

		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>