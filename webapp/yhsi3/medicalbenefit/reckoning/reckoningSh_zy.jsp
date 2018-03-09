<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构审核_病种</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="btnQuery"   key="开始统计" icon="xui-icon-query"       onClick="toQuery()"/>
			<ta:toolbarItem id="btnSave"    key="复核"    icon="xui-icon-spotSave"     onClick="toSave()"/>
			<ta:toolbarItem id="btnClose"   key="退出"    icon="xui-icon-spotClose"    onClick="parent.Base.closeWindow('detailWin')" />
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aaa027" key="分中心"  display="false"/>
		<ta:text id="aae011" key="经办人"  display="false"/>
		<ta:text id="aka122" key="病种类型"   display="false" />
		<ta:panel id="fltCxtj" key="查询条件" cols="3" >
		    <ta:text id="akb020" key="医疗机构编码"  display="false"/>
			<ta:text id="akb021" key="医疗机构名称"  required="true" labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:selectInput id="yka316"  key="人员类型" collection="YKA316" filter="15,16" reverseFilter="true" labelWidth="120" required="true"/>
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="结算日期"   required="true" showSelectPanel="true" labelWidth="70" columnWidth="0.55"/>
				<ta:date id="aae036_e" key="至"  showSelectPanel="true" labelWidth="15" columnWidth="0.45"/>
			</ta:box>
			<ta:box span="1" cols="3">
			    <input   id="aae031_check" type="checkbox" style="width:20px;padding:0px;margin-top:5px;margin-left:5%;" />
				<ta:date id="aae031_s" key="出院日期"  showSelectPanel="true" labelWidth="70" cssStyle="margin-left:-79%;margin-right:10%;"/>
				<ta:date id="aae031_e" key="至"  showSelectPanel="true" labelWidth="15" cssStyle="margin-left:-10%;"/>
			</ta:box>
			<ta:box span="1" cols="3">
			    <input   id="yae050_check" type="checkbox" style="width:20px;padding:0px;margin-top:5px;margin-left:20%;" />
				<ta:date id="yae050_s" key="初审日期"  showSelectPanel="true" labelWidth="73"  cssStyle="margin-left:-65%;margin-right:10%;"/>
				<ta:date id="yae050_e" key="至"  showSelectPanel="true"  labelWidth="15"  cssStyle="margin-left:-10%;"/>
			</ta:box>
		</ta:panel>
		<ta:panel id="pnlJssj"  key="汇总数据" fit="true">
			<ta:datagrid id="dgrdJSLX" fit="true" haveSn="true" forceFitColumns="true">
			    <ta:datagridItem id="aka120" key="病种编码"  hiddenColumn="false"/>
			    <ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="8"  />
			    <ta:datagridItem id="aae209" key="年月"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"  />
			    <ta:datagridItem id="yka316" key="清算类型"   align="center"  showDetailed="true"  dataAlign="left"  maxChart="7" collection="YKA316"/>
			    <ta:datagridItem id="aka122" key="病种类型"   align="center"  showDetailed="true"  dataAlign="left"  maxChart="9" collection="AKA122"/>
			    <ta:datagridItem id="aka121" key="病种名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="10"/>
			    <ta:datagridItem id="rc"     key="核准主记录数"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="akc264" key="核准总费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="akc228" key="全支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="akc268" key="超限价自付金额"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="yka318" key="个人比例先自付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="akb069" key="拒付费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6" dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="yka319" key="统筹范围费用"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="yka059" key="统筹内个人自付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="tczf"   key="统筹支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="ake034" key="个人账户支付"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="cfdxrc" key="超封顶线人次"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			    <ta:datagridItem id="yka063" key="超封顶线金额"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  dataType="number"  totals="sum" tatalsTextShow="false"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
		   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
		   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
		
	// 查询条件
	function checkCxData()
	{
		var akb020 = Base.getValue("akb020"); // 医疗机构编码
		var yka316 = Base.getValue("yka316"); // 清算类型
		if("" == akb020 || null == akb020)
		{
			Base.alert("请选择医疗机构!","warn",function(){
				Base.focus("akb020");
			});
			return false;
		}
		if("" == yka316 || null == yka316)
		{
			Base.alert("请选择人员类别!","warn",function(){
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
	
	//获取查询条件
	function getIds()
	{
		var ids =  "yka316,akb020,aka122"
	    	ids +=",aae036_s,aae036_e";
		var flag = $("#aae031_check")[0].checked;
	    if(flag)
	    	ids +=",aae031_s,aae031_e";
	    flag = $("#yae050_check")[0].checked;  
	    if(flag)
	    	ids +=",yae050_s,yae050_e";
	    return ids;
	}
	
	//查询
	function toQuery()
	{
		if(checkCxData()){
			var ids = getIds();
			Base.submit(ids,"detailReviewZYAction!toQueryJsjl.do");
		}
	}

	// 复核保存
	function toSave()
	{
		//未审核的医疗机构清算数据
		var dgrdJSLX=Base.getGridData("dgrdJSLX");
		if(1 > dgrdJSLX.length){
			Base.alert("没有需要复核的信息！","warn");
		}else{
			var ids = getIds();
			Base.submit(ids,"detailReviewZYAction!toSave.do");
		}
	}
	
	// 打印
	function toPrint(){
		if(checkCxData()){
			var aka122 = Base.getValue("aka122"); // 病种类型
			var printName = "HosptialMonthAduit_PTBZ.raq";
			if("3" == aka122)
				printName = "HosptialMonthAduit_TSBZ.raq";
			if("4" == aka122)
				printName = "HosptialMonthAduit_DBZ.raq";
			var akb020 = Base.getValue("akb020"); // 医疗机构编码
			var yka316 = Base.getValue("yka316"); // 清算类型
			var aaa027 = Base.getValue("aaa027"); // 分中心
			var aae011 = Base.getValue("aae011"); // 经办人
			var aae030 = Base.getValue("aae036_s"); // 结算开始日期
			var aae031 = Base.getValue("aae036_e"); // 结算结束日期
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+printName+"&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=akb020="+akb020+";yka316="+yka316+";aaa027="+aaa027+";aae011="+aae011+";aae030="+aae030+";aae031="+aae031);
		}
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>