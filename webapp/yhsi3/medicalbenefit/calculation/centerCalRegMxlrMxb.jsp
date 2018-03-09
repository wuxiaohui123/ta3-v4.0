<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>明细录入</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btns2">
		<ta:toolbarItem id="queryBtn" key="查询已录费用" icon="xui-icon-query"   onClick="toQuery()" />
		<ta:toolbarItem id="printBtn" key="打印审核表" icon="xui-icon-spotPrint" onClick="toPrint()" />
		<ta:toolbarItem id="yjsBtn"     key="预结算" icon="xui-icon-spotEdit"  onClick="toYjs()" />
		<ta:toolbarItem id="btnUpload"  key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
		<ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose"  onClick="parent.Base.closeWindow('win_mxlr');" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	   <ta:box id="pnlReg" cols="5">
		   <ta:text id="sysdate" key="系统时间" display="false"/>
		   <ta:text id="aae011" key="经办人" display="false"/>
		   <ta:text id="aaz217" key="人员就诊事件ID" display="false"/>
		   <ta:text id="aaz210" key="单据ID" display="false"/>
	       <ta:text id="aae140" key="险种类型" display="false"/>
		   <ta:text id="aac001" key="人员ID"  readOnly="true" display="false"/>
		   <ta:selectInput id="ake013" key="报销原因" collection="AKE013"  display="false"/>
		   <ta:text id="aac003" key="姓名"  readOnly="true" labelWidth="100"/>
		   <ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  readOnly="true" labelWidth="100"/>
		   <ta:text id="aka121" key="病种名称"  readOnly="true" span="3" labelWidth="100" />
		   	<ta:text id="akb020"  key="医疗机构编号" required="true" labelWidth="100" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do?dto.sort=desc" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" required="true" span="3" labelWidth="100" />
			<ta:selectInput id="akb097" collection="AKB096" key="医疗机构等级" readOnly="true" labelWidth="100"/>
		    <ta:date id="aae030" key="就诊日期" labelWidth="100" required="true" showSelectPanel="true" onChange="aae030Chg()"/>
		    <ta:text id="aae072" key="单据号" labelWidth="100" required="true"/>
			<ta:text id="yke069" key="提交单据份数" labelWidth="100"  readOnly="true"/>
			<ta:button id="btnModifyDj"  key="修改单据信息" icon="xui-icon-spotEdit" onClick="toModifyDj()"  toolTip="提示:单击单据信息后,此功能才能操作!"/>
	   </ta:box>	   
	   <%@ include file="../common/kc22LrMxb.jsp"%>
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
    
	// 单据号回车事件
	$("#aae072").keydown(function(e){
		var isie = (document.all) ? true : false;
		var key;
		if (isie) 
			key = e.keyCode;
		else
			key = e.which;
		if(13 == key){
			$("#ake001").focus();
			return false;
		}
	});
    
    // 就诊日期
    function aae030Chg(){
    	var sysdate = Base.getValue("sysdate");
    	var aae030 = Base.getValue("aae030");
    	if("" != aae030 && "" != sysdate && null != aae030 && null != sysdate){
    		if(aae030 > sysdate){
    			Base.alert("不能大于系统日期："+sysdate,"warn");
                Base.setValue("aae030");
                return;
    		}
    	}
    }
    
	//打印审核表
	function toPrint()
	{
		var aaz217 = Base.getValue("aaz217");
		var aae011 = Base.getValue("aae011");
		var aac001 = Base.getValue("aac001");
		var reportName="CenterJSMXB.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011+";aac001="+aac001);
	}
	
	//预结算
	function toYjs()
	{
		var parameter = {};
		parameter["dto['aac001']"] = Base.getValue("aac001");
		parameter["dto['aaz217']"] = Base.getValue("aaz217");
		Base.openWindow("win_yjs", "预结算信息", "<%=path%>/medicalbenefit/calculation/cenCalDetailMxbAction!toYjs.do", parameter, "99%", "99%", null, null, true, null, null);
	}

	//查询所有已录入的费用信息
	function toQuery()
	{
		Base.submit("aaz217","<%=path%>/medicalbenefit/calculation/cenCalDetailMxbAction!toQueryAllFee.do");
	}
	
	// 导出EXCEL
	function  toUpload()
	{
		Base.expGridExcel("kc22List");
	}
	
	// 修改单据信息
	function toModifyDj()
	{
       var akb020 = Base.getValue("akb020"); // 医疗机构编码
   	   var akb021 = Base.getValue("akb021"); // 医疗机构名称
       var aae030 = Base.getValue("aae030"); // 就诊日期
       var aae072 = Base.getValue("aae072"); // 单据号
       var aaz217 = Base.getValue("aaz217"); // 就诊ID
       var aaz210 = Base.getValue("aaz210"); // 单据ID
       if("" == aaz217 || "" == aaz210 || null == aaz217 || null == aaz210)
    	    return Base.alert("单击单据后,才能操作此功能!","warn");
       if(""==akb020||null==akb020)
   		    return Base.alert("请输入医疗机构编码!","warn",function(){Base.focus("akb020");});
   	   if(""==akb021||null==akb021)
    		return Base.alert("请输入医疗机构名称!","warn",function(){Base.focus("akb021");});
       if(""==aae030||null==aae030)
   		    return Base.alert("请输入就诊日期!","warn",function(){Base.focus("aae030");});
   	   if(""==aae072||null==aae072)
   		   return Base.alert("请输入单据号!","warn",function(){Base.focus("aae072");});
   	   var parameter = {};
       parameter["dto['aaz217']"] = aaz217;
       parameter["dto['aaz210']"] = aaz210;
       parameter["dto['akb020']"] = akb020;
       parameter["dto['akb021']"] = akb021;
       parameter["dto['aae030']"] = aae030;
       parameter["dto['aae072']"] = aae072;
       Base.submit("","<%=path%>/medicalbenefit/calculation/cenCalDetailMxbAction!toModifyDj.do",parameter);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>	
