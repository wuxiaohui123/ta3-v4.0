<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构结算稽核(门诊统筹)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
	     <ta:buttonLayout  id="tbr1" cssStyle="padding:0px;" >
			<ta:toolbarItem id="btnQuery"     key="查询"   icon="xui-icon-query"        onClick="query()"/>
			<ta:toolbarItem id="btnClear"     key="清条件" icon="xui-icon-spotClear"    onClick="toClear()"/>
			<ta:toolbarItem id="btnSh"        key="审核"   icon="xui-icon-edit2"        onClick="toShMx()" />
			<ta:toolbarItem id="btnCancelSh"  key="取消审核"   icon="xui-icon-spotDelete"  onClick="toTg('0')" />
			<ta:toolbarItem id="btnTg"        key="通过"       icon="xui-icon-spotSave"     onClick="toTg('1')" />
			<ta:toolbarItem id="btnTgAll"     key="全部通过"   icon="xui-icon-spotSave"     onClick="toSaveAll('1')" />
			<ta:toolbarItem id="btnCancelAll" key="全部取消"   icon="xui-icon-spotDelete"    onClick="toSaveAll('0')" />
			<ta:toolbarItem id="btnQueryDetail" key="查看明细"   icon="xui-icon-show"    onClick="toQueryDetail()" />
			<ta:toolbarItem id="btnUpload"      key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
			<ta:toolbarItem id="btnSet"         key="设置" icon="icon-setting"  onClick="toOpen()" />
			<ta:button      id="btnReset"       key="重置"   icon="xui-icon-spotReset"    type="resetPage"  asToolBarItem="true"/>
		</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltCxtj" key="查询条件" cols="4" >
			<ta:text id="akb020" key="医疗机构编码"  display="false"/>
			<ta:text id="akb021" key="医疗机构名称"  span="2" labelWidth="100" required="true"  popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:selectInput id="yka316" key="人员类型"  labelWidth="90" collection="YKA316"  required="true" widthPercentage="100%" maxVisibleRows="10" filter="19" reverseFilter="true" value="19"/>
			<ta:text id="aac001" key="保险号" labelWidth="90"/>
			<ta:box span="2" cols="2">
			   <ta:box  columnWidth="0.05" cssStyle="margin-top:5px;margin-left:10px;">
			      <ta:checkbox id="aae036_check" key="" labelStyle="width:0px;" /> 
			   </ta:box>
			   <ta:box columnWidth="0.95" cols="2" cssStyle="padding:0px;">
					<ta:date id="aae036_s" key="结算日期"  required="true" showSelectPanel="true" labelWidth="70"/>
					<ta:date id="aae036_e" key="至"  showSelectPanel="true" labelWidth="15" />
				</ta:box>
			</ta:box>	
			<ta:text id="aac003" key="姓名" labelWidth="90"/>
			<ta:text id="akc191" key="门诊流水号" labelWidth="90"/>
			<ta:box span="2" cols="2">
			   <ta:box  columnWidth="0.05" cssStyle="margin-top:5px;margin-left:8px;">
			      <ta:checkbox id="aae031_check" key="" labelStyle="width:0px;" /> 
			   </ta:box>
			   <ta:box columnWidth="0.95" cols="2" cssStyle="padding:0px;">
					<ta:date id="aae031_s" key="就诊日期"  showSelectPanel="true" labelWidth="70"/>
					<ta:date id="aae031_e" key="至"  showSelectPanel="true" labelWidth="15" />
				</ta:box>
			</ta:box>	
			<ta:selectInput id="aac008"  key="医疗待遇"  collection="AAC008"  labelWidth="90"/>   
			<ta:selectInput id="yke090" key="审核标记"  labelWidth="90" data="[{'id':'0','name':'未审'},{'id':'1','name':'已审'}]"/>
			<ta:box span="2" cols="2">
			   <ta:box  columnWidth="0.05" cssStyle="margin-top:5px;margin-left:10px;">
			      <ta:checkbox id="yae050_check" key="" labelStyle="width:0px;" /> 
			   </ta:box>
			   <ta:box columnWidth="0.95" cols="2" cssStyle="padding:0px;">
					<ta:date id="yae050_s" key="审核日期"  showSelectPanel="true" labelWidth="70"/>
					<ta:date id="yae050_e" key="至"  showSelectPanel="true" labelWidth="15" />
				</ta:box>
			</ta:box>	
		</ta:panel>
		<ta:panel id="pnlRYJS" key="人员结算信息" fit="true" >
			<ta:datagrid id="dgRYJS" fit="true"  forceFitColumns="true" haveSn="true" > 
			   <ta:datagridItem id="aaz208" key="人员医疗保险待遇支付台账ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz216" key="医疗待遇结算事件ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz217" key="医疗待遇结算事件ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz212" key="人员医疗费用复核扣款事件ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="false"/>
			   <ta:datagridItem id="yke090" key="审核标记"  align="center" dataAlign="left" maxChart="4" collection="YKE090"  formatter="fnFormatter"  sortable="true"/>
                <ta:datagridItem id="aac001" key="保险号"  align="center"   dataAlign="left" showDetailed="true" maxChart="8" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="aac003" key="姓名"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="yke112" key="年龄"  align="center" dataAlign="right"  showDetailed="true"  maxChart="2" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="aac004" key="性别"  align="center" dataAlign="left"  showDetailed="true"  maxChart="2" collection="AAC004" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="akc021" key="人员性质"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AKC021" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="akb021" key="医院名称"  align="center" dataAlign="left"  showDetailed="true"  maxChart="12" formatter="fnFormatter" sortable="true"/>
				 <ta:datagridItem id="aae030" key="就诊日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="akc264" key="总费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="yka318" key="个人比例自付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="akc228" key="自费费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="akc268" key="超限额自费"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"   dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="yka319" key="医保范围内费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="7"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="akb069" key="拒付金额"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"  sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="ake034" key="个人账户支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="6"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="yka115" key="起付线"  align="center" dataAlign="right"  showDetailed="true"  maxChart="4"  dataType="number"  sortable="true"/>
				 <ta:datagridItem id="yka059" key="统筹内个人支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="7"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="tczf" key="统筹支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9" dataType="number"   sortable="true" totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="yka063" key="本次超封顶线金额"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number"   sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="ake053" key="年度医保支付范围内累计"  align="center" dataAlign="right"  showDetailed="true"  maxChart="12"  dataType="number"  sortable="true"  totals="sum" tatalsTextShow="false" totalsAlign="right"/>
				 <ta:datagridItem id="aac008" key="待遇状态"  align="center" dataAlign="left"  showDetailed="true"  maxChart="5" collection="AAC008" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="aac066" key="参保类型"  align="center" dataAlign="left"  showDetailed="true"  maxChart="5" collection="AAC066" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="aab003" key="单位名称"  align="center" dataAlign="left"  showDetailed="true"  maxChart="11" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="aab019" key="单位类型"  align="center" dataAlign="left"  showDetailed="true"  maxChart="5" collection="AAB019" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="akb097" key="医院级别"  align="center" dataAlign="left"  showDetailed="true"  maxChart="5"  collection="AKB097" formatter="fnFormatter"  sortable="true"/>
				 <ta:datagridItem id="akc191" key="发票流水号"  align="center" dataAlign="left"  showDetailed="true"  maxChart="8" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae011" key="结算人"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AAE011" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae036" key="结算日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9"  formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="yae050" key="审核日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9"  formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="yae040" key="操作员"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AAE011" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae013" key="备注"  align="center" dataAlign="left"  showDetailed="true"  maxChart="9" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae017" key="拒付说明"  align="center" dataAlign="left"  showDetailed="true"  maxChart="9" formatter="fnFormatter" sortable="true"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
    // 放大镜的回调方法	
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	// 列渲染方法
	function fnFormatter(row, cell, value, columnDef, dataContext){
		var yke090 = dataContext.yke090;
		if("1" == yke090 || "2" == yke090){
			if("" == value || null == value)
				value = "";
			else
			    value = "<span style = 'color:blue;'>"+value+"</span>";
		}
		return value;
    }
	
	//查询
	function query()
	{
	    // 医疗信息为必录入项
		var akb021  = Base.getValue("akb021");
		if("" == akb021 || null == akb021)
		{
			Base.alert("请输入医院名称!","warn",function(){
				Base.focus("akb021");
			});
			return false;
		}
	    // 人员类型为必录入项
		var yka316  = Base.getValue("yka316");
		if("" == yka316 || null == yka316)
		{
			Base.alert("请输入人员类型!","warn",function(){
				Base.focus("yka316");
			});
			return false;
		}
		// 查询字段
		var ids =  "akb020,yka316,aac001,aac003,akc191,aac008,yke090";
		// 检查结算日期是否被勾选,如果选中,则作为查询条件
		var flag = $("#aae036_check")[0].checked;
	    if(flag){
	    	ids +=",aae036_s,aae036_e";
	    	var aae036_s = Base.getValue("aae036_s");
	    	if("" == aae036_s || null == aae036_s){
	    		Base.alert("结算时间段不能为空!","warn",function(){
	    			Base.focus("aae036_s");
	    		});
	    		return;
	    	}
	    	var aae036_e = Base.getValue("aae036_e");
	    	if("" == aae036_e || null == aae036_e){
	    		Base.alert("结算时间段不能为空!","warn",function(){
	    			Base.focus("aae036_e");
	    		});
	    		return;
	    	}
	    }else{
	    	Base.alert("请勾选结算时间!","warn");
	    	return;
	    }
	   // 检查出院日期是否被勾选,如果选中,则作为查询条件
	    flag = $("#aae031_check")[0].checked;  
	    if(flag)
	    	ids +=",aae031_s,aae031_e";
	   // 检查审核日期是否被勾选,如果选中,则作为查询条件
	    flag = $("#yae050_check")[0].checked;  
	    if(flag)
	    	ids +=",yae050_s,yae050_e";
		// 清空表格数据
		Base.clearGridData("dgRYJS");
		// 查询结算数据
		Base.submit(ids,"detailAuditMztcAction!query.do",null,null,false,function(data){
			Base.setPanelTitle("pnlRYJS","人员结算信息,合计:"+data.fieldData.rows+"人次");
		});
	}
	//清空条件
	function  toClear()
	{
	   //Base.clearData("fltCxtj"); 
	   Base.setValue("aac001"); // 个人ID
	   Base.setValue("aac003"); // 姓名
	   Base.setValue("yke014"); // 住院号
	   Base.setValue("aka122"); // 登记病种类型
	   Base.setValue("aka120"); // 登记病种编码
	   Base.setValue("aac008"); // 参保状态
	   Base.setValue("yka095"); // 审核病种类型
	   Base.setValue("aka123"); // 审核病种编码
	   Base.setValue("yke090"); // 是否审核
	}
	
	//取消审核 :未用
	function toShQx()
	{
		var gridSelected = Base.getGridSelectedRows("dgRYJS");
		if("" == gridSelected || null == gridSelected)
		{
			Base.alert("请先选中列表中的数据!","warn");
			return ;
		}
		// 如果已经月度审核,不能做稽核操作
		if("2" == gridSelected[0].yke090){
			Base.alert("已经月度审核,不能做稽核的相关操作!","warn");
			return;
		}
		var parameter = {};
		parameter["dto['aaz217']"]=gridSelected[0].aaz217; // 医疗待遇申请事件ID
		parameter["dto['aaz216']"]=gridSelected[0].aaz216; // 医疗待遇申请事件ID
		parameter["dto['aaz208']"]=gridSelected[0].aaz208; // 医疗待遇申请事件ID
		parameter["dto['aac001']"]=gridSelected[0].aac001; // 人员ID
		parameter["dto['yka095']"]=""; // 审核病种类型
		parameter["dto['aka123']"]=""; // 审核病种编码
		parameter["dto['akc197']"]=""; // 审核病种名称
		parameter["dto['akc199']"]=""; // 审核诊断
		parameter["dto['yke090']"]="0"; // 稽核结果
		parameter["dto['akb069']"]=0; // 实际拒付费用
		// 保存数据
		Base.submit("","detailAuditMxbAction!toSh.do",parameter);
	}
	
	//通过 
	function toTg(lx)
	{
		var gridSelected = Base.getGridSelectedRows("dgRYJS");
		if("" == gridSelected || null == gridSelected)
		{
			Base.alert("请先选中列表中的数据!","warn");
			return ;
		}
		if("2" == gridSelected[0].yke090){
			Base.alert("已经月度审核,不能做稽核的相关操作!","warn");
			return;
		}
		//只获取重要的字段
		var data1 = [];
		var rowdata1 = {};
		$.each(gridSelected,function(indext,rowdata){
			rowdata1 = {};
			rowdata1.aaz217 = rowdata.aaz217;//人员医疗保险待遇支付台账ID
			rowdata1.aaz216 = rowdata.aaz216;//人员医疗保险待遇支付台账ID
			rowdata1.aaz208 = rowdata.aaz208;//人员医疗保险待遇支付台账ID
			data1.push(rowdata1);
		});
		var parameter={};
		parameter["dgrdJSLX"]=Ta.util.obj2string(data1);
		parameter["dto['yke090']"]=lx;
		Base.submit("akb020","detailAuditMztcAction!toSaveJH.do",parameter,null,false,function(){
			query();
		},null);
	}
	
	//全部通过或取消 
	function toSaveAll(lx)
	{
		var dgrdJSLX=Base.getGridData("dgRYJS");
		if(1 > dgrdJSLX.length){
			Base.alert("没有数据！","warn");
		}else{
			//只获取重要的字段
			var data1 = [];
			var rowdata1 = {};
			$.each(dgrdJSLX,function(indext,rowdata){
				if ( "2" != rowdata.yke090 ) // 如果已经审核,则不做处理
				{   
					rowdata1 = {};
					rowdata1.aaz217 = rowdata.aaz217;//人员医疗保险待遇支付台账ID
					rowdata1.aaz216 = rowdata.aaz216;//人员医疗保险待遇支付台账ID
					rowdata1.aaz208 = rowdata.aaz208;//人员医疗保险待遇支付台账ID
					data1.push(rowdata1);
				}
			});
			var parameter={};
			parameter["dgrdJSLX"]=Ta.util.obj2string(data1);
			parameter["dto['yke090']"]=lx;
			Base.submit("akb020","detailAuditMztcAction!toSaveJH.do",parameter,null,false,function(){
				query();
			},null);
		}
	}
	//查看明细
	function toQueryDetail()
	{
		var gridSelected = Base.getGridSelectedRows("dgRYJS");
		if("" == gridSelected || null == gridSelected)
		{
			Base.alert("请先选中列表中的数据!","warn");
			return ;
		}
		var parameter={};
		parameter["dto['aaz217']"]=gridSelected[0].aaz217;
		parameter["dto['aaz216']"]=gridSelected[0].aaz216;
		parameter["dto['aaz208']"]=gridSelected[0].aaz208;
		parent.Base.openWindow('detailWin',"明细信息","<%=path%>/process/medicalbenefit/reckoning/detailAuditMztcAction!checkDetail.do", parameter, "98%", "98%",null,function(){
		},true);
	}
	
	// 审核弹出界面
	function toShMx()
	{
		var gridSelected = Base.getGridSelectedRows("dgRYJS");
		if("" == gridSelected || null == gridSelected)
		{
			gridSelected = Base.getGridData("dgRYJS");
			if("" == gridSelected || null == gridSelected)
				return Base.alert("请先选中列表中的数据!","warn");
		}
		// 如果已经月度审核,不能做稽核操作
		if("2" == gridSelected[0].yke090){
			Base.alert("已经月度审核,不能做稽核的相关操作!","warn");
			return;
		}
		var parameter={};
		parameter["dto['aaz217']"]=gridSelected[0].aaz217;
		parameter["dto['aaz216']"]=gridSelected[0].aaz216;
		parameter["dto['aaz208']"]=gridSelected[0].aaz208;
		parent.Base.openWindow("w_sh","审核","<%=path%>/process/medicalbenefit/reckoning/detailAuditMztcAction!toOpenSh.do", parameter, "99%", "99%",null,function(){
			query();
		},true);
	}
	
	// 导出EXCEL
	function  toUpload(){
		
		Base.expGridExcel("dgRYJS");
	}
	
	// 打印
	function toPrint() 
	{
		var param = {};
		param["dto.yka316_yw"] = Base.getValue("yka316_yw");
		param["dto.aae036_s"] = Base.getValue("aae036_s");
		param["dto.aae036_e"] = Base.getValue("aae036_e");
		parent.Base.openWindow("w_jh","稽核打印","<%=path%>/process/medicalbenefit/reckoning/detailAuditMztcAction!toPrint.do", param, "99%", "99%",null,null,true);
	}
	
	// 设置
	function toOpen(){
		if(null != columnData && "" != columnData){
		  // 弹出设置框 ,方法来源:medicare.js
	      openGridSet("dgRYJS",columnData,"menuid01031614",null,null,null);
		}
	}
	var columnData = null;
	//获取datagrid列名称数据 存入columnData1
	$(document).ready(function() { columnData = getColumnWZ("dgRYJS");});
</script>
<%@ include file="/ta/incfooter.jsp"%>