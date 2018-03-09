<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="queryBtn"  key="查询[Q]" icon="xui-icon-query"     hotKey="Q" onClick="query()"/>
			<ta:toolbarItem id="btnSave"   key="月审核[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
			<ta:toolbarItem id="btnCancel" key="撤销审核[C]" icon="xui-icon-spotClear"  hotKey="C" onClick="toCancel()" />
			<ta:toolbarItem id="btnPrint"  key="打印审核表[P]" icon="xui-icon-spotPrint"  hotKey="P" onClick="toPrint()" />
			<ta:toolbarItem id="btnSet"         key="设置" icon="icon-setting"  onClick="toSet()" />
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:text id="aae011" key="经办人" display="false"/>
		<ta:panel id="pnlCxtj" key="查询条件" cols="7" >
		    <ta:text id="akb020" key="医疗机构编码" labelWidth="120" display="false"/>
		    <ta:box id="bxAae209" cols="2" span="2">
			  <ta:date id="aae209_s" key="结算年月"  showSelectPanel="true" labelWidth="80"  issue="true" columnWidth="0.6" required="true"/>
			  <ta:date id="aae209_e" key="至"        showSelectPanel="true" labelWidth="15"  issue="true" columnWidth="0.4"/>
			</ta:box>
			<ta:text id="akb021" key="医疗机构名称"  span="3" labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:selectInput id="yka316" key="人员类别" span="2" collection="YKA316" filter="19" reverseFilter="true" />
		</ta:panel>
		<ta:panel id="pnl"  key="月度审核记录" fit="true">
				<ta:datagrid id="dgrdJSLX" fit="true" haveSn="true"  forceFitColumns="true">
					<ta:datagridItem id="aaz272" key="医疗机构结算事件ID"  hiddenColumn="false"/>
					<ta:datagridItem id="aaz002" key="业务日志ID"  hiddenColumn="false"/>
					<ta:datagridItem id="akb020" key="医疗机构编码"  hiddenColumn="false"/>
				    <ta:datagridItem id="yka316" key="结算类型"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="8" collection="YKA316" />
				    <ta:datagridItem id="aae209" key="年月"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="3"  />
				    <ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="17"  />
				    <ta:datagridItem id="akb079" key="主记录数"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="akb065" key="总费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="yka319" key="医保费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="akc228" key="自费费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="ake034" key="个人账户支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="akb068" key="统筹支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="akb069" key="拒付费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="akb081" key="审核支付费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				    <ta:datagridItem id="yae051" key="审核时间"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"  dataType="date"/>
				    <ta:datagridItem id="yae041" key="审核人"   align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" collection="AAE011"/>
				    <ta:datagridItem id="aka018" key="状态"   align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" collection="AKA018"/>
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
	
	//查询
	function query()
	{
		if("" == Base.getValue("aae209_s")){
			Base.alert("请输入结算年月!","warn");
			return false;
		}
		if("" == Base.getValue("aae209_e")){
			Base.alert("请输入结算年月!","warn");
			return false;
		}
		Base.submit('pnlCxtj','detailReviewMztcAction!toQueryHospitalInfo.do');
	}
	
	// 月审核 
	function toSave()
	{
		var parameter={};
		parameter["dto['yka316_yw']"]=Base.getValue("yka316_yw");
		parent.Base.openWindow('w_sh',"医疗机构费用月度审核","<%=path%>/process/medicalbenefit/reckoning/detailReviewMztcAction!toOpenSh.do", parameter, "80%", "80%",null,null,true);
	}
	
	//撤消
	function toCancel()
	{
		var dgrdJSLX=Base.getGridSelectedRows("dgrdJSLX");
		if("" == dgrdJSLX || null == dgrdJSLX){
			Base.alert("请选择数据！","warn");
		}else{
			var parameter={};
			parameter["dto['aaz272']"]=dgrdJSLX[0].aaz272;
			parameter["dto['akb020']"]=dgrdJSLX[0].akb020;
			parameter["dto['aaz002']"]=dgrdJSLX[0].aaz002;
			Base.submit("","detailReviewMztcAction!toCancel.do",parameter,null,false,function(){
				Base.deleteGridSelectedRows("dgrdJSLX");
			},null);
		}
	}
	
	//打印
	function toPrint(data,e)
	{
		var aae011 = Base.getValue("aae011");
		var dgrdJSLX=Base.getGridSelectedRows("dgrdJSLX");
		if("" == dgrdJSLX || null == dgrdJSLX){
			Base.alert("请选择数据！","warn");
		}else{
		    //医疗机构清算事件ID	
			var aaz272 = dgrdJSLX[0].aaz272;
			if("undefined" == typeof(aaz272) || "" == aaz272)
				return;
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=HosptialMonthAduit_mztc.raq&"+
						"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
						"serverPagedPrint=no&mirror=no&"+
						"paramString=aaz272=" + aaz272+";aae011="+aae011);
		}
	}
	
	// 设置
	function toSet(){
	   if(null == columnData || "" == columnData){
		 //获取datagrid列名称数据 存入columnData1
		   columnData = getColumnWZ("dgrdJSLX");
	   }
		// 弹出设置框 ,方法来源:medicare.js
	    openGridSet("dgrdJSLX",columnData,"menuid01031617",null,null,null);
	}
	var columnData = null;
</script>
<%@ include file="/ta/incfooter.jsp"%>