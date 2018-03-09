<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>结算信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
            <ta:toolbarItem id="queryBtn"   key="查询[Q]"     icon="xui-icon-query" hotKey="Q" onClick="toQuery()"  />
            <ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
			<ta:toolbarItem id="btnSet"     key="设置"        icon="icon-setting"  onClick="toOpen()" />
            <ta:button id="resetBtn" key="重置[R]" type="resetPage" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" />
       </ta:toolbar>
	<ta:form id="form1" fit="true">
	    <ta:selectInput id="aae011" key="经办人"   display="false" />
		<ta:panel id="pnlCxtj" key="查询条件"  cols="4">			
			<ta:text id="aac001"  key="个人ID" />
			<ta:text id="aac003"  key="姓名" />
			<ta:selectInput id="akc021" key="人员类型"  collection="akc021" />
			<ta:selectInput id="aac008" key="参保状态"  collection="aac008" />
	         <ta:selectInput id="aae140" key="险种类型"  collection="YL140" />
			<ta:text id="aab001"  key="单位ID"  />
			<ta:text id="aab003"  key="单位名称"  />
			<ta:text id="akb020"  key="医疗机构编码"  display="false"/>
			<ta:box cols="2">
				<ta:text id="akb021" key="医疗机构名称" labelWidth="100" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:date id="aae030" key="结算日期(从)"   showSelectPanel="true" required="true" />
			<ta:date id="aae031" key="结算日期(至)"   showSelectPanel="true" required="true"/>
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" filter="51,52,61,62,71,72" maxVisibleRows="10"/> 
			 <ta:selectInput id="aka130_2" key="医疗类别"  collection="aka078" display="false" readOnly="true"/>
	         <ta:selectInput id="aka078" key="支付类型"  collection="aka078"/>
			<ta:selectInput id="yka032" key="支付地点" collection="YKA032" /> 
	        <ta:selectInput id="aaa027" key="统筹区"   collection="AAB034"/>
	         <ta:selectInput id="aka077" key="退费结算标志"  collection="aka077" value="0"/>
		</ta:panel>
		<ta:panel fit="true" id="panel1" key="结算信息(双击列表数据，展示明细信息)">
			<ta:datagrid id="kc24List" fit="true" onRowDBClick="clickfn"  haveSn="true">
				<ta:datagridItem id="print" key="打印结算单" icon="xui-icon-spotPrint" align="center" click="toPrint" maxChart="5" />
				<ta:datagridItem id="aac001" key="个人编号" width="90"  sortable="true" align="center"/>	
				<ta:datagridItem id="aac003" key="姓名" width="100"  sortable="true" align="center"/>
				<ta:datagridItem id="aac002" key="身份证" width="100" maxChart="9"  sortable="true" align="center"/>
				<ta:datagridItem id="aac004" key="性别" width="50"  sortable="true" align="center" collection="AAC004" />
				<ta:datagridItem id="aab003" key="单位" width="250" showDetailed="true"  sortable="true" align="center"/>
				<ta:datagridItem id="akb020" key="机构编码" width="80" showDetailed="true" sortable="true" align="center"/>
				<ta:datagridItem id="akb021" key="机构名称" width="250" showDetailed="true" sortable="true" align="center"/>							
				<ta:datagridItem id="aka130" key="支付类别" width="130" collection="AKA130" sortable="true" align="center"/>
				<ta:datagridItem id="akc021" key="人员类别" width="100" collection="AKC021" sortable="true" align="center"/>
				<ta:datagridItem id="aka030" key="结算类别" width="130" collection="aka030" sortable="true" align="center"/>
				<ta:datagridItem id="aae030" key="入院时间" width="130" dataType="DateTime" sortable="true" align="center"/>
				<ta:datagridItem id="aae031" key="出院时间" width="130" dataType="DateTime" sortable="true" align="center"/>
				<ta:datagridItem id="akc264" key="医疗费总额" width="130" sortable="true" totals="sum" align="center"/>
				<ta:datagridItem id="yka115" key="起付线" width="130"  sortable="true" align="center"/>
				<ta:datagridItem id="akc228" key="全自费" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="akc268" key="超限价自付" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="yka318" key="先行自付" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="yka319" key="符合范围" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="akb081" key="实际支付" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake039" key="基本医疗支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake029" key="大额救助医疗支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake041" key="城镇居民统筹支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake035" key="公补统筹支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake043" key="离休医疗支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake026" key="企业补充医疗支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake034" key="个人帐户支出" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="aae240" key="帐户支出后余额" width="130"  sortable="true"  totals="sum" align="center"/>
				<ta:datagridItem id="ake053" key="年度统筹范围累计" width="130"  sortable="true" align="center"/>
				<ta:datagridItem id="ykc022" key="年度累计住院次数" width="130"  sortable="true" align="center"/>
				<ta:datagridItem id="yka436" key="年度统筹支付累计" width="130"  sortable="true" align="center"/>
				<ta:datagridItem id="aae140" key="险种类型" width="120" collection="AAE140" sortable="true" align="center"/>
				<ta:datagridItem id="akc191" key="医院流水号" width="120"  sortable="true" align="center"/>
				<ta:datagridItem id="aae011_dj" key="登记经办人" width="90" collection="AAE011" sortable="true" align="center"/>
				<ta:datagridItem id="aae036_dj" key="登记时间" width="150" dataType="DateTime" sortable="true" align="center"/>
				<ta:datagridItem id="aae011" key="结算经办人" width="90" collection="AAE011" sortable="true" align="center"/>
				<ta:datagridItem id="aae036" key="结算时间" width="150" dataType="DateTime" sortable="true" align="center"/>
				<ta:datagridItem id="yae040" key="稽核人" width="90" collection="AAE011" sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="yae050" key="稽核时间" width="130" dataType="DateTime" sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="yke090" key="审核标志" width="90" collection="YKE090" sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="yke091" key="拒付标志" width="90" collection="YKE091" sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="yae041" key="审核人" width="90" collection="AAE011" sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="yae051" key="审核时间" width="130" dataType="DateTime" sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="akb069" key="拒付金额" width="130"  sortable="true" align="center" hiddenColumn="true"/>
				<ta:datagridItem id="aka077" key="退费结算标志" width="100" collection="AKA077"  sortable="true" align="center"/>
				<ta:datagridItem id="aaz216" key="结算流水号"   />	
				<ta:datagridItem id="aaz217" key="就诊流水号"  />	
				<ta:dataGridToolPaging url="calculationQueryAction!toQuery.do" selectExpButtons="1,2,3" submitIds="fieldset1" pageSize="1000" ></ta:dataGridToolPaging>
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
	//rpc回调
	function callbackFunHos() {
		
	};
	// 费用明细
	function clickfn(e,rowdata){
		var parameter={"dto['aaz217']":rowdata.aaz217};
		Base.openWindow('userwin',"明细信息",myPath()+"/medicalbenefit/common/mxQueryAction!toQuery.do",parameter,'95%','90%',null,null,true);
    }
	
	// 查询数据
	function toQuery(){
		var aac001 = Base.getValue("aac001");
		var aac003 = Base.getValue("aac003");
		var akc021 = Base.getValue("akc021");
		var aac008 = Base.getValue("aac008");
		var aae140 = Base.getValue("aae140");
		var aab001 = Base.getValue("aab001");
		var aab003 = Base.getValue("aab003");
		var akb020 = Base.getValue("akb020");
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		var aka130 = Base.getValue("aka130");
		var aka078 = Base.getValue("aka078");
		var yka032 = Base.getValue("yka032");
		var aaa027 = Base.getValue("aaa027");
		if((null == aac001 || "" == aac001)&&
		   (null == akb020 || "" == akb020)&&
		   (null == yka032 || "" == yka032)&&
		   (null == aae030 || "" == aae030)&&
		   (null == aae031 || "" == aae031)&&
		   (null == aka130 || "" == aka130)&&
		   (null == aae140 || "" == aae140)&&
		   (null == akc021 || "" == akc021)&&
		   (null == aac008 || "" == aac008)&&
		   (null == aaa027 || "" == aaa027)){
			  Base.alert("请至少录入一个查询条件!","warn");
			  return false;
			}
		Base.submit("pnlCxtj","calculationQueryAction!toQuery.do",null,null,true,null,null);
    }
	
	//单条结算单打印
	function toPrint(data, e) 
	{
		var aaz217 = data.aaz217;
		var aaz216 = data.aaz216;
		var aac001 = data.aac001;
		var aae011 = Base.getValue("aae011");
		//var reportName = "centercal_zy.raq";
		var reportName = "jsdInHospital.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aaz216="+aaz216+";aae011="+aae011+";aac001="+aac001);
	}

	
	// 导出EXCEL
	function  toUpload(){
		Base.expGridExcel("kc24List");
	}
	
	// 设置
	function toOpen(){
		if(null != columnData || "" != columnData){
		  // 弹出设置框 ,方法来源:medicare.js
	      openGridSet("kc24List",columnData,"menuid01030802",null,null,null);
		}
	}
	var columnData = null;
	$(document).ready(function() {
		//columnData = getColumnWZ("kc24List"); 
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>