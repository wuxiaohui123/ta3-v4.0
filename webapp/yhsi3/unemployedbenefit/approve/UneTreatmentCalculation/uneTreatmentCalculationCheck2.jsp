<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇新增办结[S]" icon="xui-icon-spotSave" hotKey="S" onClick="transProcess();"  asToolBarItem="true" />
		<ta:button id="printBtn3" icon="xui-icon-spotPrint" key="打印失业登记卡" onClick="printDJK()" asToolBarItem="true" display="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	
	<ta:form  id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>		
		</ta:box>	
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>	
		<ta:panel key="人员基本信息" cols="3" id="jbxxfset" >
		    <ta:text id="aac001" key="人员ID"  labelWidth="130"  readOnly="true" />
			<ta:text id="aac003" key="姓名" required="true"  labelWidth="130"  readOnly="true"/>
			<ta:text id="aac002" key="公民身份证号码"  labelWidth="130" required="true"   readOnly="true"/>
			<ta:text id="aab001" key="失业代管单位代码"  labelWidth="130"  readOnly="true" />
			<ta:text id="aae044" key="单位名称" labelWidth="130"   span="2" readOnly="true"/>
			<ta:selectInput key="性别" collection="AAC004" id="aac004" readOnly="true" labelWidth="130" />
			<ta:text id="aaz170" key="待遇核定事件id"  labelWidth="130" display="false" readOnly="true"  />
			<ta:date key="出生日期" id="aac006" labelWidth="130" readOnly="true"  />
		    <ta:selectInput key="用工形式" collection="AAC013" id="aac013" readOnly="true" labelWidth="130"/>
		    <ta:date key="参工日期" id="aac007" readOnly="true"  labelWidth="130"  />
		    <ta:text key="参保险种" id="aae140_H" readOnly="true" display="false"  labelWidth="130"/>
		    <ta:text key="业务类型编码" id="aaa121_H" readOnly="true" display="false" labelWidth="130"/>
		</ta:panel>
		
		<ta:panel key="上次失业信息" cols="3" id="scsyxx" >
			<ta:selectInput id="ajc093_old" key="失业原因"  collection="AJC093" readOnly="true" labelWidth="130" />
			<ta:date id="ajc090_old" key="失业时间"   readOnly="true" labelWidth="130" />
			<ta:text key="失业待遇证号" id="aaz257_old"  readOnly="true"  labelWidth="130"/>
		    <ta:date key="失业待遇终止年月" id="ajc056_old" readOnly="true" labelWidth="130" issue="true"/>
		    <ta:text key="可领月数" id="ajc097_old" readOnly="true" labelWidth="130"/>
		    <ta:text key="已领月数" id="ajc098" readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc099" key="剩余可享受月数" readOnly="true"   labelWidth="130"/>
		</ta:panel>
		
  		<ta:panel key="本次失业信息录入" id="bcsyxx" cols="3">
  			<ta:text id="yje004" key="失业证号"   readOnly="true" labelWidth="130"/>
  			<ta:selectInput key="是否农民工" readOnly="true" collection="AAC028" id="aac028" labelWidth="130"/>
  			<ta:selectInput key="有无求职要求" readOnly="true" collection="AJA012" id="aja012" labelWidth="130"/>
  			<ta:selectInput key="培训意向" readOnly="true" collection="YJC002" id="yjc002"  labelWidth="130"/>
			<ta:text id="ajc001" key="视同缴费月数" readOnly="true" labelWidth="130"/>
			<ta:text id="ajc071" key="实际缴费月数" readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc072" key="总缴费月数"  readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc058" key="本次缴费享受月数" readOnly="true"  labelWidth="130"/>
			<ta:text id="ajc059" key="剩余享受月数" readOnly="true"  labelWidth="130" display="false"/>
			<ta:text id="ajc097" key="享受总月数" readOnly="true"  labelWidth="130"/>
			<ta:text id="yjc059" key="农民工缴费月数"  labelWidth="130" readOnly="true" />
			<ta:text id="yjc060" key="农民工享受月数"  labelWidth="130" readOnly="true" />
  			<ta:selectInput key="失业原因" readOnly="true"  collection="AJC093" id="ajc093"   labelWidth="130" />
		    <ta:date  key="失业时间" id="ajc090" readOnly="true"  labelWidth="130"   />
		    <ta:date  key="失业申报时间" id="ajc094" readOnly="true"   labelWidth="130"  />
		    <ta:date issue="true" key="待遇开始年月" id="aae210" readOnly="true"   labelWidth="130"  />
  		</ta:panel>
  
  		<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
  		
  		<ta:tabs height="230">
	   		<ta:tab key="待遇明细" id="ac73Tab">
	   			<ta:panel id="ac73Panel"  fit="true"  bodyStyle="margin:0px" >
					<ta:datagrid id="ac73Grid" enableColumnMove="false" fit="true"  columnFilter="true" haveSn="true" >
					   <ta:datagridItem id="aaz171" key="人员待遇核定项目明细ID " hiddenColumn="true" width="100" > </ta:datagridItem>
				       <ta:datagridItem id="aaz170" key="人员待遇核定事件id" hiddenColumn="true" width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aaa085" key="定期待遇标志" collection="AAA085" width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aae041" key="开始年月"  width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aae042" key="终止年月"  width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aae128" key="计算金额"  width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aae129" key="核发金额"  width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aaz002" key="业务日志ID" > </ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
	   		</ta:tab>
	   		<ta:tab key="补扣明细" id="ac75Tab">
	   			<ta:panel id="ac75Panel"  fit="true" bodyStyle="margin:0px" >
					<ta:datagrid id="ac76Grid" enableColumnMove="false" fit="true"  columnFilter="true" haveSn="true" >
					   <ta:datagridItem id="aaz167" key="人员待遇补扣发项目明细ID" width="100" hiddenColumn="true"> </ta:datagridItem>
				       <ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" width="100" > </ta:datagridItem>
				       <ta:datagridItem id="aaa078" key="待遇项目代码" collection="AAA078" width="100" > </ta:datagridItem>
				       <ta:datagridItem id="aae003" key="对应款费所属期" dataAlign="right" width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aae128" key="计算金额" dataAlign="right" width="100"> </ta:datagridItem>
				       <ta:datagridItem id="aae129" key="核发金额" dataAlign="right" width="100"> </ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
	   		</ta:tab>	   		
	   </ta:tabs>
  	</ta:form>
  	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		Base.hideObj(["jstjset"],false);
		$("span.slick-pager-settings").css("float","left");
	});	
	
	//流程流转
	function transProcess(){		
		Base.submit("form1", "uneTreatmentCalculationCheck2Action!transProcess.do");
	}	
	
	//打印失业登记卡
	function printDJK(){
		var aaz002 = Base.getValue("aaz002");
		if(aaz002==''||aaz002==null){
			Base.alert("没有获取到业务日志ID，请联系管理员！");
			return;
		}
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_BXDJK.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz002=" + aaz002);
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>
