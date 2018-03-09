<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>支付计划</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class = "no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
		   <ta:buttonLayout align="center">   
		       <ta:button  id="queryBtn"   icon="xui-icon-query"       key="查询报销数据"     onClick="query()"     asToolBarItem="true"/>  
		       <ta:button  id="queryBtn1"  icon="xui-icon-query"        key="查询支付计划"     onClick="queryResult()" asToolBarItem="true"/> 
		       <ta:button  id="saveBtn"    icon="xui-icon-spotSave"    key="生成支付计划"     onClick="toSave()"    asToolBarItem="true"/>  
		       <ta:button  id="cancelBtn"  icon="xui-icon-spotDelete"    key="取消支付计划"     onClick="toCancel()"    asToolBarItem="true"/>  
		       <ta:button  id="resetBtn"   icon="xui-icon-spotReset"   key="重置[R]"          type="resetPage"      asToolBarItem="true" />
		    </ta:buttonLayout> 
 	   </ta:toolbar>
		<ta:form id="form1" fit="true" >
		      <ta:text id = "aae011" display="false"/>
		     <ta:panel id="pnlCxtj" key="支付查询" cols="3" >  
     		    <ta:box id="bxDate1" span="1" cols="2">
					<ta:date id="aae036_s"  key="复核日期" labelWidth="100" showSelectPanel="true" columnWidth="0.6"/>
					<ta:date id="aae036_e"  key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			    </ta:box>
     		    <ta:box id="bxDate2" span="1" cols="2">
					<ta:date id="aae036s"  key="支付日期" labelWidth="100" showSelectPanel="true" columnWidth="0.6"/>
					<ta:date id="aae036e"  key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			    </ta:box>
			    <ta:text id="aaz031" key="拨付通知ID" />  
			    <ta:selectInput id="aae140" key="险种类型" collection="YL140"   maxVisibleRows="8" />
			    <ta:selectInput id="aka078" key="支付类型" collection="AKA078"  maxVisibleRows="8" filter="4"/>
			    <ta:selectInput id="yad005" key="处理状态" collection="YAD005"  maxVisibleRows="8" filter="3,4" />
			    <ta:selectInput id="aae100"  key="财务人员"  data="[{'id':'0','name':'否'},{'id':'1','name':'是'}]"  />
			    <p style="margin-top:6px;">注：财务人员请选择"是"，否则查不到数据!</P>
		    </ta:panel>   
				<ta:tabs id="tabs1" fit="true" >  
					<ta:tab id="tab1" key="中心报销数据"  >  
						  <ta:datagrid id="dgKa10k1" fit="true" forceFitColumns="true"  selectType="checkbox"   haveSn="true" >  
						      <ta:datagridItem id="yka544" key="拨付流水号" align="center" dataAlign="left"  maxChart="6"/>  
						      <ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left"  maxChart="6"/>  
						      <ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left"  maxChart="6"/>  
						      <ta:datagridItem id="aab003" key="单位名称"  align="center" dataAlign="left"  maxChart="6" showDetailed="true"/>  
						      <ta:datagridItem id="aae140" key="险种类型"  align="center" dataAlign="left"  maxChart="6"  collection="AAE140"/>  
						      <ta:datagridItem id="aka130" key="医疗类别"  align="center" dataAlign="left"  maxChart="6"  collection="AKA130"/>  
						      <ta:datagridItem id="akb021" key="医疗机构名称" align="center" dataAlign="left"  maxChart="6"  showDetailed="true"/>  
						      <ta:datagridItem id="akc264" key="医疗费用总额" align="center" dataAlign="right"  maxChart="6"/>  
						      <ta:datagridItem id="ake034" key="个账支出" align="center" dataAlign="right"  maxChart="6"/>  
						      <ta:datagridItem id="tczf"   key="统筹支出" align="center" dataAlign="right"  maxChart="6"/>  
						      <ta:datagridItem id="yke072" key="支付总额" align="center" dataAlign="right"  maxChart="6"/>  
						      <ta:datagridItem id="aae011" key="结算人"    align="center" dataAlign="left"     maxChart="6" collection="AAE011"/>  
						      <ta:datagridItem id="aae036" key="结算时间"   align="center" dataAlign="center"  maxChart="10"  showDetailed="true"/>  
						      <ta:datagridItem id="yae041" key="复核人"    align="center" dataAlign="left"     maxChart="6" collection="AAE011"/>  
						      <ta:datagridItem id="yae051" key="复核时间"   align="center" dataAlign="center"  maxChart="10"  showDetailed="true"/>  
						      <ta:datagridItem id="aae009" key="银行户名"   align="center" dataAlign="center"  maxChart="6"  showDetailed="true"/>  
						      <ta:datagridItem id="aae010" key="银行账号"   align="center" dataAlign="center"  maxChart="10"  showDetailed="true"/>  
						      <ta:datagridItem id="yaf011" key="银行异地标志"    align="center" dataAlign="left"     maxChart="6" collection="YAF011"  sortable="true"/>  
						      <ta:datagridItem id="aaf002" key="银行类型"       align="center" dataAlign="left"     maxChart="6" collection="AAF002"   sortable="true"/>  
				          </ta:datagrid>  
					</ta:tab>  
					<ta:tab id="tab2" key="支付计划"> 
						  <ta:datagrid id="dgResult" fit="true" forceFitColumns="true"  >  
						      <ta:datagridItem id="printBtn"    key="打印代发清单"  align="center" maxChart="5"   icon="xui-icon-spotPrint"  click="toPrint"/>  
						      <ta:datagridItem id="printMxBtn"  key="打印清单明细"  align="center" maxChart="5"   icon="xui-icon-spotPrint"  click="toPrintMx"/>  
						      <ta:datagridItem id="bptyZhBtn" key="导出报盘文件"  align="center" maxChart="5"   icon="icon-download"  click="fn_bptygs"/>  
						      <ta:datagridItem id="aaz086" key="报盘"  hiddenColumn="false"/>
						      <ta:datagridItem id="khbz"   key="跨行标志 "   align="center" dataAlign="center"  maxChart="4"  showDetailed="true"  sortable="true"/>   
						      <ta:datagridItem id="yad005" key="处理状态" align="center"  dataAlign="center"   maxChart="6"  collection="YAD005"/>
						      <ta:datagridItem id="aaz031" key="拨付通知单ID" align="center"  dataAlign="center"   maxChart="6" />
					          <ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center"   maxChart="4" />  
					          <ta:datagridItem id="aae140" key="险种类型" collection="AAE140" dataAlign="center" align="center"  maxChart="6" /> 
					          <ta:datagridItem id="aaa079" key="拨付方式" collection="aaa079" dataAlign="center" align="center"  maxChart="6" /> 
					          <ta:datagridItem id="aab069" key="拨付对象当事人" align="center"  showDetailed="true" maxChart="15" />  
					          <ta:datagridItem id="aaf002" key="银行" collection="AAF002" dataAlign="center" align="center"  maxChart="6" /> 
					          <ta:datagridItem id="yae002" key="支付人数" totals="sum" dataType="Number" tatalsTextShow="false"  dataAlign="right" align="center"  maxChart="4" />
					          <ta:datagridItem id="aae169" key="拨付总额" totals="sum" dataType="Number" tatalsTextShow="false"  dataAlign="right" align="center"  maxChart="6" />  
					          <ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" align="center" dataAlign="center"  maxChart="6" /> 
					          <ta:datagridItem id="aaa036" key="是否统筹待遇" align="center" dataAlign="center"  maxChart="6" />
					          <ta:datagridItem id="aae011" key="经办人"    align="center" dataAlign="left"     maxChart="6" collection="AAE011"/>  
						      <ta:datagridItem id="aae036" key="经办时间 "   align="center" dataAlign="center"  maxChart="10"  showDetailed="true"/>   
				          </ta:datagrid> 
					</ta:tab> 
				</ta:tabs>  
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">

//查询支付信息
function query()
{
	var aae036_s = Base.getValue("aae036_s");
	var aae036_e = Base.getValue("aae036_e");
	if("" == aae036_s || null == aae036_s){
		return Base.alert("请输入复核日期!", "warn",function(){
			Base.focus("aae036_s");
		});
	}
	if("" == aae036_e || null == aae036_e){
		return Base.alert("请输入复核日期!", "warn",function(){
			Base.focus("aae036_e");
		});
	}
	 Base.activeTab("tab1");
	 Base.clearGridData("dgKa10k1");
	Base.submit("pnlCxtj","centerCalPaymentAction!toQuery.do");
}

//查询支付结果
function queryResult()
{
	var aae036_s = Base.getValue("aae036s");
	var aae036_e = Base.getValue("aae036e");
	if("" == aae036_s || null == aae036_s){
		Base.alert("请输入支付日期!", "warn",function(){
			Base.focus("aae036s");
		});
		return  false;
	}
	if("" == aae036_e || null == aae036_e){
		Base.alert("请输入支付日期!", "warn",function(){
			Base.focus("aae036e");
		});
		return false;
	}
	Base.activeTab("tab2");
	Base.clearGridData("dgResult");
	Base.submit("pnlCxtj","centerCalPaymentAction!queryResult.do");
	return true;
}

//生成支付计划
function toSave()
{
  var dgKa10k1 = Base.getGridSelectedRows("dgKa10k1");
  if("" == dgKa10k1 || null == dgKa10k1){
	  Base.alert("请选择中心报销数据!","warn");
  }else{
	 var param = {};
	 param.dgKa10k1 = Ta.util.obj2string(dgKa10k1);
	 Base.setDisabled("saveBtn");
     Base.submit("form1","centerCalPaymentAction!toSave.do",param);
  }
}

// 取消支付计划
function toCancel()
{
	var dgResult = Base.getGridSelectedRows("dgResult");
    if("" == dgResult || null == dgResult){
	  Base.alert("请选择支付计划数据!","warn");
	}else{
		 var param = {};
		 param["dto.aaz031"] = dgResult[0].aaz031;
		 Base.setDisabled("cancelBtn");
	     Base.submit("","centerCalPaymentAction!toCancel.do",param);
	}
}

// 打印银行清单
function toPrint(data,e)
{
	    var aaz031 = data.aaz031;
	    var aae011 = Base.getValue("aae011");
		var reportName = "centerCalBfd.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz031="+aaz031+
				 ";aae011="+aae011); 
		// 异步更新支付标志
	    Base.getJson("centerCalPaymentAction!updateYad005InAd34.do",{"dto.aaz031":aaz031},function(){
	    	queryResult();
	    });
}
// 打印银行清单
function toPrintMx(data,e)
{
	    var aaz031 = data.aaz031;
	    var aae011 = Base.getValue("aae011");
		var reportName = "centerCalBfd_mx.raq";
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz031="+aaz031+
				 ";aae011="+aae011); 
}

//导出银行报盘数据
function fn_bptygs(data,e)
{
	var aaf002 =  data.aaf002;
	var aaz031 =  data.aaz031;
	var param = {};
	param["dto.aaz031"] = data.aaz031;
	param["dto.aaf002"] = data.aaf002;
	if("95599" == aaf002){
		Base.submit("","centerCalPaymentAction!bpWZ_lh.do",param,null,false,function(data){
			var reportName = "centerCalBp_bank_lh.raq";
			var aad061 = data.fieldData.reslutDto.aad061;
			var yae602 = data.fieldData.reslutDto.yae602;
	        var yae594 = "农行 "+aad061+"元";
	        yae594 = encodeURIComponent(encodeURIComponent(yae594));
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=3&file="+reportName+"&"+
					"srcType=file&columns=0&saveAsName="+yae594+"&excelFormat=2003&"+
					"paramString=yae602="+yae602);
	
		});
	}else{
	    location.href="<%=path%>/medicalbenefit/calculation/centerCalPaymentAction!bpWZ.do?dto.aaz031="+aaz031+"&dto.aaf002="+aaf002+"&dto.aaz086="+data.aaz086;   
	}
}
$(document).ready(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>