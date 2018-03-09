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
	    <ta:buttonLayout  id="tbr1" cssStyle="padding:0px;" >
			<ta:toolbarItem id="queryBtn"   key="查询" icon="xui-icon-query"         onClick="query()"/>
			<ta:toolbarItem id="clearBtn"   key="清条件" icon="xui-icon-spotClear"   onClick="toClear()"/>
			<ta:toolbarItem id="btnSave1"   key="普通病种" icon="xui-icon-spotSave"    onClick="toSaveBZ(1)" />
			<ta:toolbarItem id="btnSave2"   key="特殊病种" icon="xui-icon-spotSave"  onClick="toSaveBZ(3)" />
			<ta:toolbarItem id="btnSave3"   key="单病种" icon="xui-icon-spotSave"    onClick="toSaveBZ(4)" />
			<ta:toolbarItem id="btnCheck"   key="查看明细" icon="xui-icon-spotEdit"  onClick="toDetail()" />
			<ta:toolbarItem id="btnCancel"  key="撤销复核" icon="xui-icon-spotClear"  onClick="toCancel()" />
			<ta:toolbarItem id="btnPrint"   key="打印审核表" icon="xui-icon-spotPrint"  onClick="toPrint()" />
			<ta:toolbarItem id="btnSet"         key="设置" icon="icon-setting"  onClick="toSet()" />
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
		</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		 <ta:text id="aaa027" key="分中心"  display="false"/>
		 <ta:text id="aae011" key="经办人"  display="false"/>
		<ta:panel id="fltCxtj" key="查询条件" cols="3" >
		    <ta:text id="akb020" key="医疗机构编码"  display="false" labelWidth="100"/>
			<ta:text id="akb021" key="医疗机构名称"  required="true"  labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
		    <ta:selectInput id="yka316"  key="人员类型" collection="YKA316" filter="15,16" reverseFilter="true" labelWidth="120" required="true"/>	
			<ta:selectInput id="aka122" key="病种类型" collection="AKA122" labelWidth="120"  filter="2"/>
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="结算日期"  required="true" showSelectPanel="true" labelWidth="100" columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至"  showSelectPanel="true" labelWidth="15" columnWidth="0.4"/>
			</ta:box>
			<ta:box span="1" cols="8">
			    <input   id="yae051_check"  type="checkbox" style="width:20px;padding:0px;margin-top:5px;margin-left:70%;" />
			    <ta:box span="7" cols="2">
					<ta:date id="yae051_s" key="审核日期"  showSelectPanel="true" labelWidth="70" columnWidth="0.5"/>
					<ta:date id="yae051_e" key="至"  showSelectPanel="true"  labelWidth="15" columnWidth="0.5"/>
			 	</ta:box>	
			</ta:box>
		</ta:panel>
		<ta:panel id="pnlJssj"  key="已审核记录" fit="true">
			<ta:datagrid id="dgrdJSLX" fit="true" haveSn="true" forceFitColumns="true">
			    <ta:datagridItem id="aaz272" key="医疗待遇结算事件ID"  hiddenColumn="false"/>
			    <ta:datagridItem id="akb020" key="医疗机构编码"  hiddenColumn="false"/>
			    <ta:datagridItem id="aka120" key="病种编码"  hiddenColumn="false"/>
			    <ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="17"  />
			    <ta:datagridItem id="yka316" key="人员类别"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="5" collection="YKA316" />
			    <ta:datagridItem id="aae209" key="年月"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="3"  />
			    <ta:datagridItem id="aka122" key="病种类型"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="4" collection="AKA122" />
			    <ta:datagridItem id="aka121" key="病种名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="8"/>
			    <ta:datagridItem id="akb079" key="核准主记录数"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="akb065" key="核准总费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="akc228" key="全支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="akc268" key="超限自付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="yka318" key="个人比例自付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="yka319" key="医保费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="ake034" key="个人账户支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="yka059" key="统筹比例自付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="tczf"   key="统筹支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="akb081" key="应支付金额总计"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="8"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="akb069" key="拒付费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="yka063" key="超封顶线金额"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="cfdxrc" key="超封顶线人次"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  sortable="true"  totals="sum"  tatalsTextShow="false"/>
			    <ta:datagridItem id="aka018" key="状态"    align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" collection="AKA018"/>
			    <ta:datagridItem id="yae041" key="审核人"   align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" collection="AAE011"/>
			    <ta:datagridItem id="yae051" key="审核时间"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"  dataType="date"/>
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
	
	// 查询条件检查:1.必须输入医疗机构信息;2.必须输入结算日期;3.必须输入清算类型
	function checkCxData()
	{
		var akb020 = Base.getValue("akb020"); // 医疗机构编码
		var yka316 = Base.getValue("yka316"); // 清算类型
		if("" == akb020 || null == akb020)
		{
			Base.alert("请输入医疗机构编码!","warn",function(){
				Base.focus("akb020");
			});
			return false;
		}
		if("" == yka316 || null == yka316)
		{
			Base.alert("请输入人员类别!","warn",function(){
				Base.focus("yka316");
			});
			return false;
		}
    	var aae036_s = Base.getValue("aae036_s");
    	var aae036_e = Base.getValue("aae036_e");
    	if("" == aae036_s || "" == aae036_e){
    		Base.alert("结算时间段不能为空!","warn");
    		return false;
    	}
      return true;		
	}
	
	//查询
	function query()
	{
		if(checkCxData()){
			// 查询条件
		    var ids =  "yka316,akb020,aka122";
		    	ids += ",aae036_s,aae036_e";
		    var flag = $("#yae051_check")[0].checked;  
		    if(flag)
		    	ids +=",yae051_s,yae051_e";
		    var param = {};
			Base.submit(ids,'detailReviewZYAction!queryKf20k1.do',param);
		}
	}
	
	//清空条件
	function  toClear()
	{
	   Base.setValue("aka122","");
	   Base.setValue("yka316","");
	}
	
	// 病种类型的审核 
	function toSaveBZ(lx)
	{
		var title = "普通病种审核";
		if("3" == lx)
			title = "特殊病种审核";
		if("4" == lx)
			title = "单病种审核";
		var parameter={};
		parameter["dto['aka122']"] = lx;
		parameter["dto['yka316']"] = Base.getValue("yka316");
		parent.Base.openWindow('detailWin',title,"<%=path%>/process/medicalbenefit/reckoning/detailReviewZYAction!toBzSh.do", parameter, "95%", "90%",null,function(){
		},true);
	}
	
	// 查看明细
	function toDetail()
	{	
		//未审核的医疗机构清算数据
		var dgrdJSLX=Base.getGridSelectedRows("dgrdJSLX");
		if(1 > dgrdJSLX.length){
			Base.alert("请先选择数据！","warn");
		}else{
			var parameter={};
			var grdStr=Ta.util.obj2string(dgrdJSLX);
			parameter["dgrdJSLX"]=grdStr;
			parent.Base.openWindow('detailWin',"明细","<%=path%>/process/medicalbenefit/reckoning/detailReviewZYAction!toDetail.do", parameter, "98%", "98%",null,null,true);		
		}
		
	}
	
	//撤消
	function toCancel()
	{
		//未审核的医疗机构清算数据
		var dgrdJSLX=Base.getGridSelectedRows("dgrdJSLX");
		if(1 > dgrdJSLX.length){
			Base.alert("请先选择数据！","warn");
		}else{
			var parameter={};
			var grdStr=Ta.util.obj2string(dgrdJSLX);
			parameter["dgrdJSLX"]=grdStr;
			Base.submit("form1","detailReviewZYAction!toCancel.do",parameter);
		}
	}
	
	//审核表打印
	function toPrint()
	{
		if(checkCxData()){
			var akb020 = Base.getValue("akb020"); // 医疗机构编码
			var yka316 = Base.getValue("yka316"); // 清算类型
			var aaa027 = Base.getValue("aaa027"); // 分中心
			var aae011 = Base.getValue("aae011"); // 经办人
			var aae030 = Base.getValue("aae036_s"); // 结算开始日期
			var aae031 = Base.getValue("aae036_e"); // 结算结束日期
			var printName = "HosptialMonthAduit_ZY.raq";
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+printName+"&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=akb020="+akb020+";yka316="+yka316+";aaa027="+aaa027+";aae011="+aae011+";aae030="+aae030+";aae031="+aae031);
		}
	}
	
	// 设置
	function toSet(){
	   if(null == columnData || "" == columnData){
		 //获取datagrid列名称数据 存入columnData1
		   columnData = getColumnWZ("dgrdJSLX");
	   }
		// 弹出设置框 ,方法来源:medicare.js
	    openGridSet("dgrdJSLX",columnData,"menuid01031605",null,null,null);
	}
	var columnData = null;
</script>
<%@ include file="/ta/incfooter.jsp"%>