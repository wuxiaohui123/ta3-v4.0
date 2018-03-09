<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>离休体检费报销</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:buttonLayout id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn"   key="查询[Q]" icon="xui-icon-query"       hotKey="Q"  onClick="toQuery()" />
		<ta:toolbarItem id="regBtn"     key="登记"    icon="xui-icon-spotAdd"     onClick="toReg()" />
		<ta:toolbarItem id="cancelBtn"  key="撤销登记"    icon="xui-icon-spotClear"   onClick="toCancel()" />
		<ta:toolbarItem id="jsBtn"        key="结算"        icon="xui-icon-spotAdd"     onClick="toJs()" />
		<ta:toolbarItem id="cancelJsBtn"  key="撤销结算"    icon="xui-icon-spotClear"   onClick="toCancelJs()" />
		<ta:toolbarItem id="fhBtn"        key="复核"        icon="xui-icon-spotAdd"     onClick="toFh()" />
		<ta:toolbarItem id="cancelFhBtn"  key="撤销复核"    icon="xui-icon-spotClear"   onClick="toCancelFh()" />
		<ta:toolbarItem id="printShBtn"   key="打印审核表"         icon="xui-icon-spotPrint" onClick="toPrintSh()" />
		<ta:toolbarItem id="printJsBtn"   key="打印结算表"         icon="xui-icon-spotPrint" onClick="toPrintJs()" />
		<ta:toolbarItem id="printJsBtn1"   key="打印财务"         icon="xui-icon-spotPrint" onClick="toPrintCw()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:buttonLayout>
	<ta:form id="form1" fit="true">
	    <ta:text id="aae011" key="经办人" display="false"/>
	 	<ta:text id="aaa027" key="分中心" display="false"/>
		<ta:panel id="panel1" key="查询条件" cols="3" >
		    <ta:text id="aac001" key="个人ID"    />
			<ta:text id="aac003" key="姓名"      readOnly="true"  />
			<ta:text id="aac002" key="身份证号"  readOnly="true"  />
			<ta:text id="akb020"  key="医疗机构编号" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"  />
		    <ta:selectInput id="yke056" key="结算状态"  data="[{'id':'0','name':'未结算'},{'id':'1','name':'已结算'}]" />
			<ta:box span="1" cols="2">
				<ta:date id="aae030_s" key="报销时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae030_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="登记时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:box span="1" cols="2">
				<ta:date id="yae051_s" key="复核时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="yae051_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
		</ta:panel>
		<ta:panel id="panel2" key="离休二乙体检费报销信息"  fit="true">
			<ta:datagrid id="kc21List" fit="true" selectType="radio" >
				<ta:datagridItem id="yke056" key="结算状态" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  sortable="true"  collectionData="[{'id':'02','name':'已登记'},{'id':'03','name':'已结算'},{'id':'04','name':'已复核'}]" />
				<ta:datagridItem id="bxlb"   key="报销类别"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  sortable="true"  collectionData="[{'id':'1','name':'个人'},{'id':'2','name':'医院'}]"/>
				<ta:datagridItem id="akb020" key="医疗机构编码"   align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"  />
				<ta:datagridItem id="akb021" key="医疗机构名称"   align="center"  showDetailed="true"  dataAlign="center"  maxChart="15"  />
				<ta:datagridItem id="akc264" key="总费用"   align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="akc227" key="人数"     align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  />
				<ta:datagridItem id="aae030" key="开始日期" align="center"  showDetailed="true"  dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="aae031" key="结束日期" align="center"  showDetailed="true"  dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="aae013" key="备注" align="center"  showDetailed="true"  dataAlign="center"  maxChart="8" />
			    <ta:datagridItem id="aae009" key="银行户名" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" />
				<ta:datagridItem id="aae010" key="银行账号" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" />
				<ta:datagridItem id="aaf002" key="银行类型" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" collection="AAF002"/>
				<ta:datagridItem id="yaf011" key="银行异地标志" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6" collection="YAF011"/>
				<ta:datagridItem id="djr" key="登记人" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AAE011"/>
				<ta:datagridItem id="djsj" key="登记时间" align="center"  showDetailed="true"  dataAlign="center"  maxChart="9"  dataType="datetime" />
				<ta:datagridItem id="aae011" key="结算人" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AAE011"/>
				<ta:datagridItem id="aae036" key="结算时间" align="center"  showDetailed="true"  dataAlign="center"  maxChart="9"  dataType="datetime" />
				<ta:datagridItem id="yae041" key="复核人" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AAE011"/>
				<ta:datagridItem id="yae051" key="复核时间" align="center"  showDetailed="true"  dataAlign="center"  maxChart="9"  dataType="datetime" />
				<ta:datagridItem id="aaz010" key="当事人ID"  align="center"  maxChart="6" />
				<ta:datagridItem id="aae044" key="当事人名称"  align="center"  maxChart="6" />
				<ta:datagridItem id="aaz217" key="登记流水号"  align="center"  maxChart="6" />
				<ta:datagridItem id="aaz216" key="结算流水号"  align="center"  maxChart="6" />
			</ta:datagrid>
	  </ta:panel>
   </ta:form>
   <iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 800, 300, 7, fn_getPerson, 0, false);
	});
	
	// 个人ID change事件
	$("#aac001").change(function(){
    	sfwQueryUtilDY(1,'getAc01ByAae140ForYL',Base.getValue('aac001'),null,'340')
	});

	// 人员回调函数
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.setValue("aac003",g_Suggest[1]);
		Base.setValue("aac002",g_Suggest[0]);
	}
	
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	 // 查询
	 function toQuery()
	 {
	     Base.clearGridData("kc21List");
		 Base.submit("panel1","lxTjfBxAction!toQuery.do"); 
	 }
	 
	// 登记
	function toReg()
	{
		var param = {};
		top.tjtxbbx_aaz217 = ""; 
		Base.openWindow('win_reg',"离休二乙体检费报销登记","<%=path%>/medicalbenefit/calculation/lxTjfBxAction!toOpenReg.do",param,"80%","85%",null,function(){
			var aaz217 = top.tjtxbbx_aaz217;
			if("" == aaz217 || null == aaz217){
				
			}else{
			   Base.submit("","lxTjfBxAction!toQuery.do",{"dto.aaz217":aaz217});
			}
		},true);
	}
	
	// 结算
	function toJs()
	{
		var kc21List = Base.getGridSelectedRows("kc21List");
		if(kc21List.length == 0){
			Base.alert("请选择需要结算的数据!", "warn");
			return false;
		}else{
			var aaz217 = kc21List[0].aaz217; // 就诊流水号
			var yke056 = kc21List[0].yke056; // 结算状态
			if("" == aaz217 || null == aaz217)
				return Base.alert("就诊流水号不能为空!","warn");
			if("01" != yke056 && "02" != yke056)
				return Base.alert("已经结算不能再结算!","warn");
			var param = {};
			param["dto.aaz217"] = aaz217;
			Base.openWindow('win_js',"离休二乙体检费报销结算","<%=path%>/medicalbenefit/calculation/lxTjfBxAction!toOpenJs.do",param,"90%","95%",null,function(){
				if("" == aaz217 || null == aaz217){
					
				}else{
				   Base.submit("","lxTjfBxAction!toQuery.do",{"dto.aaz217":aaz217});
				}
			},true);
		}
	}
	// 复核
	function toFh()
	{
		var kc21List = Base.getGridSelectedRows("kc21List");
		if(kc21List.length == 0){
			Base.alert("请选择需要复核的数据!", "warn");
			return false;
		}else{
			var aaz217 = kc21List[0].aaz217; // 就诊流水号
			var yke056 = kc21List[0].yke056; // 结算状态
			var aaz010 = kc21List[0].aaz010; // 当事人ID
			if("" == aaz217 || null == aaz217)
				return Base.alert("就诊流水号不能为空!","warn");
			if("04" == yke056 )
				return Base.alert("已经复核不能再复核!","warn");
			if("01" == yke056 || "02" == yke056)
				return Base.alert("未结算不能复核!","warn");
			var param = {};
			param["dto.aaz217"] = aaz217;
			param["dto.aaz010"] = aaz010;
			Base.submit("","lxTjfBxAction!toSaveFh.do",param,null,false,function(){
			});
		}
	}
	 
	//撤销 
	function toCancel() 
	{
		var kc21List = Base.getGridSelectedRows("kc21List");
		if(kc21List.length == 0){
			Base.alert("请选择要撤销的记录!", "warn");
			return false;
		}else{
			var aaz217 = kc21List[0].aaz217; // 就诊流水号
			var yke056 = kc21List[0].yke056; // 结算状态
			var aaz010 = kc21List[0].aaz010; // 当事人ID
			if("" == aaz217 || null == aaz217)
				return Base.alert("就诊流水号不能为空!","warn");
			if("01" != yke056 && "02" != yke056)
				return Base.alert("已经结算不能撤销!","warn");
			Base.confirm('确定要撤销吗？',function(yes){
				if(yes){
					var param = {};
					param["dto.aaz217"] = aaz217;
					param["dto.aaz010"] = aaz010;
					Base.submit("","lxTjfBxAction!toCancelReg.do",param,null,false,function(){
						Base.deleteGridSelectedRows("kc21List");
					});
				}
			});
		}
	}
	//撤销结算
	function toCancelJs() 
	{
		var kc21List = Base.getGridSelectedRows("kc21List");
		if(kc21List.length == 0){
			Base.alert("请选择要撤销的记录!", "warn");
			return false;
		}else{
			var aaz217 = kc21List[0].aaz217; // 就诊流水号
			var yke056 = kc21List[0].yke056; // 结算状态
			var aaz010 = kc21List[0].aaz010; // 当事人ID
			if("" == aaz217 || null == aaz217)
				return Base.alert("就诊流水号不能为空!","warn");
			if("01" == yke056 || "02" == yke056)
				return Base.alert("未结算不能撤销!","warn");
			if("04" == yke056)
				return Base.alert("已复核不能撤销!","warn");
			Base.confirm('确定要撤销吗？',function(yes){
				if(yes){
					var param = {};
					param["dto.aaz217"] = aaz217;
					param["dto.aaz010"] = aaz010;
					Base.submit("","lxTjfBxAction!toCancelJs.do",param,null,false,function(){
						Base.deleteGridSelectedRows("kc21List");
					});
				}
			});
		}
	}
	//撤销复核
	function toCancelFh() 
	{
		var kc21List = Base.getGridSelectedRows("kc21List");
		if(kc21List.length == 0){
			Base.alert("请选择要撤销的记录!", "warn");
			return false;
		}else{
			var aaz217 = kc21List[0].aaz217; // 就诊流水号
			var yke056 = kc21List[0].yke056; // 结算状态
			var aaz010 = kc21List[0].aaz010; // 当事人ID
			if("" == aaz217 || null == aaz217)
				return Base.alert("就诊流水号不能为空!","warn");
			if("01" == yke056 || "02" == yke056)
				return Base.alert("未结算不能撤销!","warn");
			if("03" == yke056)
				return Base.alert("未复核不能撤销!","warn");
			Base.confirm('确定要撤销吗？',function(yes){
				if(yes){
					var param = {};
					param["dto.aaz217"] = aaz217;
					param["dto.aaz010"] = aaz010;
					Base.submit("","lxTjfBxAction!toCancelFh.do",param,null,false,function(){
						Base.deleteGridSelectedRows("kc21List");
					});
				}
			});
		}
	}
	
	//打印审核表
	function toPrintSh()
	{
		var kc21List = Base.getGridSelectedRows('kc21List');
		if(kc21List.length == 0){
			Base.alert("请选择需要打印的数据!", "warn");
			return false;
		}
		var aae011 = Base.getValue("aae011");
		var aaz217 = kc21List[0].aaz217;
		var bxlb = kc21List[0].bxlb;
		var reportName="lxtjfBx_sh.raq"; // 审核单_医院
		if ("1" == bxlb)
		   reportName="lxtjfBx_sh_gr.raq"; // 审核单_个人
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011);
	}
	// 打印账务支付单
	function toPrintCw()
	{
	    var kc21List = Base.getGridSelectedRows('kc21List');
		if(kc21List.length == 0){
			Base.alert("请选择需要打印的数据!", "warn");
			return false;
		}
		var aae011 = Base.getValue("aae011");
		var aka130 = kc21List[0].aka130;
		var yke056 = kc21List[0].yke056; // 结算状态
		if("04" != yke056)
			return Base.alert("未复核核不能打印账务支付单!","warn");
		var aaz217 = kc21List[0].aaz217; // 业务流水号
		var reportName = "FinancialPayment_centerCallxtjf.raq";		
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011);
	}
	//打印结算表
	function toPrintJs()
	{
		var kc21List = Base.getGridSelectedRows('kc21List');
		if(kc21List.length == 0){
			Base.alert("请选择需要打印的数据!", "warn");
			return false;
		}
		var aae011 = Base.getValue("aae011");
		var aaz217 = kc21List[0].aaz217;
		var reportName="lxtjfBx_js.raq"; // 审核单
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>