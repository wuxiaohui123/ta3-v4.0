<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>清算审核扣款</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:buttonLayout  id="tbr1" cssStyle="padding:0px;" >
			<ta:toolbarItem id="queryBtn"  key="查询"   icon="xui-icon-query"        onClick="query()"/>
			<ta:toolbarItem id="clearBtn"  key="清条件" icon="xui-icon-spotClear"    onClick="toClear()" />
			<ta:toolbarItem id="btnJf"     key="拒付"   icon="xui-icon-spotSave"     onClick="toSaveJf()" />
			<ta:toolbarItem id="btnQxJf"   key="取消拒付"   icon="xui-icon-spotDelete"  onClick="toQxJf()" />
			<ta:toolbarItem id="btnTg"     key="全部通过"       icon="xui-icon-spotSave"  onClick="toTg('1')" />
			<ta:toolbarItem id="btnQxSh"   key="取消审核"   icon="xui-icon-spotDelete"    onClick="toQxSh()" />
			<ta:toolbarItem id="btnQxTg"   key="全部取消"       icon="xui-icon-spotSave"  onClick="toTg('0')" />
			<ta:toolbarItem id="btnQueryDetail" key="查看明细"   icon="xui-icon-spotEdit"    onClick="toQueryDetail()" />
			<ta:toolbarItem id="btnUpload"      key="导出EXCEL"   icon="xui-icon-spotEdit"    onClick="toUpload()" />
			<ta:toolbarItem id="btnSet"   key="设置" icon="icon-setting"  onClick="toOpen()" />
			<ta:button      id="btnReset"  key="重置"   icon="xui-icon-spotReset"    type="resetPage"  asToolBarItem="true"/>
		</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltCxtj" key="查询条件" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  labelWidth="120" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))" required="true"/>
			<ta:text id="akb021" key="医疗机构名称"  readOnly="true" labelWidth="120"/>
			<ta:selectInput id="yka316"  key="清算类别"  labelWidth="120"  required="true" />
			<ta:text id="akc191" key="发票流水号" labelWidth="120" />
			<ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="结算日期"  showSelectPanel="true" labelWidth="120"  required="true"  columnWidth="0.6"/>
				<ta:date id="aae036_e" key="至"  showSelectPanel="true" labelWidth="15"  columnWidth="0.4"/>
			</ta:box>
			<ta:text id="aac001" key="个人ID" labelWidth="120" onChange="sfwQueryUtil(2,'getAc01ByAae140ForYL',Base.getValue('aac001'))"/>
			<ta:text id="aac003" key="姓名" labelWidth="120"/>
			<ta:selectInput id="yke091" key="拒付状态"  labelWidth="120" collection="YKE091"/>
			<ta:selectInput id="yke090" key="审核状态"  labelWidth="120" data="[{'id':'0','name':'未审核'},{'id':'1','name':'已审核'}]"/>
		</ta:panel>
		<ta:panel id="pnlRYJS" key="人员结算信息" fit="true" >
			<ta:datagrid id="dgRYJS" fit="true"  forceFitColumns="true" haveSn="true"  > 
			   <ta:datagridItem id="aaz208" key="人员医疗保险待遇支付台账ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz217" key="流水号"  hiddenColumn="false" />
			   <ta:datagridItem id="aaz216" key="流水号"  hiddenColumn="false" />
			   <ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="false"/>
			   <ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="false"/>
			   <ta:datagridItem id="yke090" key="审核标记"  align="center" dataAlign="left" maxChart="4"  collection="YKE090" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="yke091" key="拒付标记"  align="center" dataAlign="left" maxChart="4"  collection="YKE091" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aac001" key="保险号" hiddenColumn="false" align="center"   dataAlign="left" showDetailed="true" maxChart="8" formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="aac003" key="姓名"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" formatter="fnFormatter"   sortable="true"/>
			   <ta:datagridItem id="yke112" key="年龄"  align="center" dataAlign="right"  showDetailed="true"  maxChart="2" formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="aac004" key="性别"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AAC004" formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="akc021" key="人员性质" hiddenColumn="false" align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AKC021" formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="akb021" key="医院名称"  align="center" dataAlign="left"  showDetailed="true"  maxChart="9" formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="akc191" key="发票流水号" hiddenColumn="false" align="center" dataAlign="left"  showDetailed="true"  maxChart="9" formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="aae030" key="就诊日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9"  formatter="fnFormatter"  sortable="true"/>
			   <ta:datagridItem id="akc264" key="总费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number"  sortable="true" totals="sum" tatalsTextShow="false"/>
			   <ta:datagridItem id="akb069" key="拒付金额"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9" dataType="number"  sortable="true" totals="sum" />
			   <ta:datagridItem id="akc228" key="自费费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number"  sortable="true" totals="sum" tatalsTextShow="false"/>
			   <ta:datagridItem id="yka319" key="医保范围内费用"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9" dataType="number" sortable="true" totals="sum" tatalsTextShow="false"/>
			   <ta:datagridItem id="ake034" key="个人账户支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number"  sortable="true" totals="sum" tatalsTextShow="false"/>
			   <ta:datagridItem id="tczf" key="统筹支付"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number"  sortable="true" totals="sum" tatalsTextShow="false"/>
			   <ta:datagridItem id="akb081" key="实际支付金额"  align="center" dataAlign="right"  showDetailed="true"  maxChart="9"  dataType="number" sortable="true" totals="sum" tatalsTextShow="false"/>
			   <ta:datagridItem id="aac008" key="待遇状态" hiddenColumn="false" align="center" dataAlign="left"  showDetailed="true"  maxChart="5" collection="AAC008" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aac066" key="参保类型" hiddenColumn="false" align="center" dataAlign="left"  showDetailed="true"  maxChart="6" collection="AAC066" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aab003" key="单位名称" hiddenColumn="false"  align="center" dataAlign="left"  showDetailed="true"  maxChart="12" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aab019" key="单位类型" hiddenColumn="false"  align="center" dataAlign="left"  showDetailed="true"  maxChart="5" collection="AAB019" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aaa027" key="地区"   hiddenColumn="false" align="center" dataAlign="left"  showDetailed="true"  maxChart="9" collection="AAB301" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae011" key="结算人"  hiddenColumn="false" align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AAE011" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae036" key="结算日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9"  formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="yae040" key="操作员"  align="center" dataAlign="left"  showDetailed="true"  maxChart="4" collection="AAE011" formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="yae050" key="审核日期"  align="center" dataAlign="center"  showDetailed="true"  maxChart="9"  formatter="fnFormatter" sortable="true"/>
			   <ta:datagridItem id="aae013" key="备注"  align="center" dataAlign="left"  showDetailed="true"  maxChart="9" formatter="fnFormatter" sortable="true"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"kb01", "akb020", 750, 300, 3, fn_getHosInfo, 0, false);
		initializeSuggestFramework(2,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
	});
	//人员信息回调函数
	function fn_getPerson(){
		   Base.setValue("aac001",g_Suggest[2]);
		   Base.setValue("aac003",g_Suggest[1]);
		}
	// 回调函数fn_getHosInfo
   function fn_getHosInfo(){
	   Base.setValue("akb020",g_Suggest[0]);//getYDHospitalInfo
	   Base.setValue("akb021",g_Suggest[1]);
	   var akb020 = g_Suggest[0];
	   if("990" == akb020||"991" == akb020||"992" == akb020){
	   		Base.setEnable("akb021");
	   		
	   }else{
	   		Base.setReadOnly("akb021");
	   }
	}
	function fnKb01MagifierBack(rowdata){
		   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
		   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	// 获取有效的查询条件
	function getCxtj()
	{
		var ids =  "yka316,akb020,aac001,aac003,yke090,yke091,akc191"
	    	ids +=",aae036_s,aae036_e";
	    return ids;
	}
	
	// 查询必录条件
    function checkCxtj()
    {
	    var akb020  = Base.getValue("akb020");
		if("" == akb020 || null == akb020)
		{
			Base.alert("请输入医院编码!","warn");
			return false;
		}
	    var yka316  = Base.getValue("yka316");
		if("" == yka316 || null == yka316)
		{
			Base.alert("请输入人员类型!","warn");
			return false;
		}
		var aae036_s = Base.getValue("aae036_s");
		var aae036_e = Base.getValue("aae036_e");
		if("" == aae036_s || "" == aae036_e || null == aae036_s || null == aae036_e)
		{
			Base.alert("请输入结算日期!","warn");
			return false;
		}
		return true;
    }
	
	//查询
	function query()
	{
		if(checkCxtj()){
			var ids = getCxtj();
			Base.clearGridData("dgRYJS");
			Base.submit(ids,"detailAuditAction!query.do",null,null,false,function(data){
				Base.setPanelTitle("pnlRYJS","人员结算信息,合计:"+data.fieldData.rows+"人次");
			});
		}
	}
	
	//清空条件
	function  toClear()
	{
	   //Base.clearData("fltCxtj"); 
	   Base.setValue("aaz217");
	   Base.setValue("aac001");
	   Base.setValue("aac003");
	   Base.setValue("yke090");
	   Base.setValue("yke091");
	   Base.setValue("akc191");
	}
	
	//获取勾选数据
	function getGridData()
	{
		//只获取重要的字段
		var data1 = [];
		//医疗机构清算数据
		var dgrdJSLX=Base.getGridSelectedRows("dgRYJS");
		if(1 > dgrdJSLX.length){
			Base.alert("请选择数据！","warn");
		}else{
			var rowdata1 = {};
			$.each(dgrdJSLX,function(indext,rowdata){
				rowdata1 = {};
				rowdata1.aaz217 = rowdata.aaz217;// 人员医疗结算事件ID
				rowdata1.aaz216 = rowdata.aaz216;// 人员医疗结算事件ID
				rowdata1.aaz208 = rowdata.aaz208;// 人员医疗结算事件ID
				data1.push(rowdata1);
			});
		}	
		return data1;
	}
	
	//拒付
	function toSaveJf()
	{
		var dgrdJSLX=Base.getGridSelectedRows("dgRYJS");
		if(1 > dgrdJSLX.length){
			Base.alert("请选择数据！","warn");
			return;
		}
		if("2" == dgrdJSLX[0].yke090){
			Base.alert("已经月度审核,不能做稽核的相关操作!","warn");
			return;
		}
		var parameter={};
		parameter["dto['aaz217']"]=dgrdJSLX[0].aaz217; // 医疗待遇事件ID
		parameter["dto['aaz216']"]=dgrdJSLX[0].aaz216; // 医疗待遇事件ID
		parameter["dto['aaz208']"]=dgrdJSLX[0].aaz208; // 医疗待遇事件ID
		Base.openWindow("w_jf","拒付操作",myPath() + "/process/medicalbenefit/reckoning/detailAuditAction!toJf.do",parameter,"98%","99%",null,null,true,null,null);
	}
	
	// 取消拒付
	function toQxJf()
	{
		var dgrdJSLX=Base.getGridSelectedRows("dgRYJS");
		if(1 > dgrdJSLX.length){
			Base.alert("请选择数据！","warn");
			return;
		}
		if("2" == dgrdJSLX[0].yke090){
			Base.alert("已经月度审核,不能做稽核的相关操作!","warn");
			return;
		}
		var gridData = [];
		var rowdata = {};
		rowdata.aaz217 = dgrdJSLX[0].aaz217;
		rowdata.aaz216 = dgrdJSLX[0].aaz216;
		rowdata.aaz208 = dgrdJSLX[0].aaz208;
		rowdata.aaz212 = dgrdJSLX[0].aaz212;
		rowdata.aac001 = dgrdJSLX[0].aac001;
		gridData.push(rowdata);
		var parameter={};
		parameter.gridData = Ta.util.obj2string(gridData);
		Base.submit("","detailAuditAction!toQxJf.do",parameter);
	}
	
	//全部通过或全部取消
	function toTg(lx)
	{
		if(checkCxtj()){
			var dgrdJSLX=Base.getGridData("dgRYJS");
			if(dgrdJSLX.length < 1){
				Base.alert("没有可操作的数据!","warn");
				return;
			}
			//只获取重要的字段
			var data1 = [];
			var rowdata1 = {};
			$.each(dgrdJSLX,function(indext,rowdata){
			   if("2" != rowdata.yke090){ // 只获取未月度审核的数据
					rowdata1 = {};
					rowdata1.aaz217 = rowdata.aaz217;//人员医疗保险待遇支付台账ID
					rowdata1.aaz216 = rowdata.aaz216;//人员医疗保险待遇支付台账ID
					rowdata1.aaz208 = rowdata.aaz208;//人员医疗保险待遇支付台账ID
					data1.push(rowdata1);
			   }
			});
			var parameter={};
			parameter["dgrdJSLX"]=Ta.util.obj2string(data1);
			parameter["dto['lx']"]=lx;
			Base.submit("akb020","detailAuditAction!toTgAll.do",parameter);
		}
	}
	
	//取消审核
	function toQxSh()
	{
		var dgrdJSLX=Base.getGridSelectedRows("dgRYJS");
		if(1 > dgrdJSLX.length){
			Base.alert("请选择数据！","warn");
			return;
		}
		//只获取重要的字段
		var data1 = [];
		var rowdata1 = {};
		$.each(dgrdJSLX,function(indext,rowdata){
			rowdata1 = {};
			rowdata1.aaz217 = rowdata.aaz217;//人员医疗保险待遇支付台账ID
			rowdata1.aaz216 = rowdata.aaz216;//人员医疗保险待遇支付台账ID
			rowdata1.aaz208 = rowdata.aaz208;//人员医疗保险待遇支付台账ID
			data1.push(rowdata1);
		});
		var parameter={};
		parameter["dgrdJSLX"]=Ta.util.obj2string(data1);
		parameter["dto['yke090']"]="0";
		parameter["dto['lx']"]="0";
		Base.submit("akb020","detailAuditAction!toTgAll.do",parameter);
	}
	
	//查看明细
	function toQueryDetail()
	{
		var data1 = getGridData();
		if(data1.length > 0){
			var params={"dto['aaz217']":data1[0].aaz217,
					    "dto['aaz216']":data1[0].aaz216,
					    "dto['aaz208']":data1[0].aaz208
					    };
			Base.openWindow('detailWin',"明细信息",myPath()+"/process/medicalbenefit/reckoning/detailAuditAction!checkDetail.do", params, "98%", "99%",null,function(){
			},true);
		}
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
	
	// 导出EXCEL
	function  toUpload(){
		
		Base.expGridExcel("dgRYJS");
	}
	
	// 设置
	function toOpen(){
		if(null == columnData || "" == columnData){
		  columnData = getColumnWZ("dgRYJS");
		}
		// 弹出设置框 ,方法来源:medicare.js
	    openGridSet("dgRYJS",columnData,"menuid01031606",null,null,null);
	}
	var columnData = null;
</script>
<%@ include file="/ta/incfooter.jsp"%>