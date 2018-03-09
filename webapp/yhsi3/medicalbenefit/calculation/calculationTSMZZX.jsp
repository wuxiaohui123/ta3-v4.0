<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:buttonLayout id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn"   key="查询审核信息"  icon="xui-icon-query"    onClick="toQuery()"/>
		<ta:toolbarItem id="jiaofeiBtn" key="查询缴费信息" icon="xui-icon-query"     onClick="toQueryJiaoFei()"/>
		<ta:toolbarItem id="addBtn"     key="导入数据"     icon="xui-icon-spotSave"  onClick="toAdd()" />
		<ta:toolbarItem id="cancelBtn"  key="撤销"         icon="xui-icon-spotClear" onClick="toCancel()" />
		<ta:toolbarItem id="shBtn"      key="审核明细"     icon="xui-icon-spotEdit"  onClick="toSh()" />
		<ta:toolbarItem id="printBtn"   key="打印"         icon="xui-icon-spotPrint" hotKey="P" onClick="toPrint()" />
		<ta:toolbarItem id="closeBtn"   key="关闭[C]"      icon="xui-icon-spotReset"  hotKey="c"  onClick="closeWin()"/>
	</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		<ta:text id="aaz217_new" key="就诊事件ID" display="false" />
		<ta:text id="aae011" key="经办人" display="false"/>
		<ta:text id="aaa027" key="分中心" display="false"/>
		<ta:panel id="panel1" key="人员基本信息" cols="3" >
		    <ta:date id="aae001" key="年度"  labelWidth="100"  required="true" showSelectPanel="true"  dateYear="true"/>
			<ta:text id="aac001" key="个人ID" labelWidth="100"  required="true"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="100"/>
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="100" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="100" />
			<ta:selectInput id="yac084" key="退休标志" readOnly="true" collection="YAC084" labelWidth="100" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="100"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="100" display="false"/>
			<ta:text id="aac008" key="待遇状态" readOnly="true" labelWidth="100" />
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="aae240" key="账户余额"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="aae003" key="缴费月"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="cs" key="报销次数"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="zycs" key="住院次数"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="aae030dy" key="待遇开始时间"  readOnly="true"  labelWidth="100" />
			<ta:text id="aka121" key="病种名称"  readOnly="true" span="2" labelWidth="100" />
			<ta:text id="aae180" key="年工资"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="yka120" key="年度统筹累计"  readOnly="true" span="1" labelWidth="100" />
			<ta:text id="yka115" key="起付标准"   readOnly="true"  span="1"  labelWidth="100"  cssInput="color:red;"/>
			<ta:text id="yka115s" key="剩余起付线"   readOnly="true" span="1"  labelWidth="100" cssInput="color:red;"/>
		</ta:panel>
		<ta:panel id="panel2" key="审核记录" fit="true" >
			<ta:datagrid id="kc21List" fit="true"  forceFitColumns="true" haveSn="true" selectType="checkbox"  onRowDBClick="fnRowDbClick">
				<ta:datagridItem id="sfsh" key="是否审核" hiddenColumn="true" />
				<ta:datagridItem id="aaz217_new" key="就诊事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz217" key="就诊事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz216" key="结算事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="个人编号"    hiddenColumn="true"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  dataAlign="left" showDetailed="true"  maxChart="15" formatter="fnFormatter"/>
				<ta:datagridItem id="aae036" key="医院结算时间"  align="center" dataAlign="center" maxChart="7"    sortable="true" formatter="fnFormatter"/>
				<ta:datagridItem id="akc264" key="总费用"      align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false" formatter="fnFormatter"/>
				<ta:datagridItem id="yka319" key="范围内费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false" formatter="fnFormatter"/>
				<ta:datagridItem id="yka318" key="先自付费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false" formatter="fnFormatter"/>
				<ta:datagridItem id="akc228" key="全自费费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false" formatter="fnFormatter"/>
				<ta:datagridItem id="akc268" key="超限额费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false" formatter="fnFormatter"/>
				<ta:datagridItem id="shbzf" key="审核不支付"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false"  formatter="fnFormatter"/>
				<ta:datagridItem id="ake034" key="账户支出"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5" totals="sum" tatalsTextShow="false"  formatter="fnFormatter"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 2, false);
	});
	// 个人ID change事件
	$("#aac001").change(function(){
		sfwQueryUtilForYl(1,'getKc47ListForYL',{"dto.jstj":Base.getValue('aac001'),"dto.aae100":"all"});
	}).keydown(function(e){
		if(13 == getThisKey(e)){
		    if(!$("#aac001_sug_table").length > 0 || $("#aac001_sug_table").is(":hidden")){
				Base.focus("aac003");
		    }else{
		    }
		}
	});

	// 人员回调函数
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.setValue("aac003",g_Suggest[1]);
		Base.setValue("aac002",g_Suggest[0]);
		fn_getPerson_prc();
	}
	
	// 医疗人员回调方法
	function fn_getPerson_prc(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfotsmz.do",
					{"dto['aac001']":Base.getValue("aac001"),"dto['aae001']":Base.getValue("aae001")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg, 'warn');
							Base.setValue("aac001",'');
							return true;
						}
						if(data &&  data.personInfoDto) {
							if(data.personInfoDto.yab139 != Base.getValue('aaa027')){
								Base.setValue("aac001",'');
								Base.alert('非本经办机构的参保人员,不能办理登记!', 'warn');
								return false;
							}
							
							Base.setValue("aac002",data.personInfoDto.aac002);
							Base.setValue("aac003",data.personInfoDto.aac003);
							Base.setValue("aac004",data.personInfoDto.aac004);
							Base.setValue("aac006",data.personInfoDto.aac006);
							Base.setValue("aac008",data.personInfoDto.aac008);
							Base.setValue("aac031",data.personInfoDto.aac031);
							Base.setValue("aab003",data.personInfoDto.aab003);
							Base.setValue("aac066",data.personInfoDto.aac066);
							Base.setValue("yac084",data.personInfoDto.yac084);
							Base.setValue("ykc005",data.personInfoDto.ykc005);
							Base.setValue("ykc006",data.personInfoDto.ykc006);
							Base.setValue("yke112",data.personInfoDto.yke112);
							Base.setValue("aae140",data.personInfoDto.aae140);
							Base.setValue("aae240",data.personInfoDto.aae240);
							Base.setValue("aae003",data.personInfoDto.aae003);
							Base.setValue("cs",data.personInfoDto.cs);
							Base.setValue("aka121",data.personInfoDto.aka121);
							Base.setValue("aae180",data.personInfoDto.aae180);
							Base.setValue("zycs",data.personInfoDto.zycs);
							Base.setValue("aae030dy",data.personInfoDto.aae030);
							Base.setValue("yka120",data.personInfoDto.yka120);
							Base.setValue("ake039",data.personInfoDto.ake039);
							Base.setValue("yka115",data.personInfoDto.yka115);
							Base.setValue("yka115s",data.personInfoDto.yka115s);
						}
					});
	}
		
	// 查询参与结算的数据
    function toQuery()
    {
		Base.clearGridData("kc21List");
    	Base.submit("aaz217_new","calculationTSMZZXAction!toQueryKc24FromKc21k2.do");
    	
    }	
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	 
	// 导入数据 
	function toAdd()
	{
		var aac001 = Base.getValue("aac001"); // 人员ID
		if("" == aac001 || null == aac001){
			Base.alert("请先输入人员ID!","warn",function(){
				Base.focus("aac001");
			});
		}else{
			var param = {};
			param["dto.aac001"] = aac001; // 人员ID
			param["dto.aaz217_new"] = Base.getValue("aaz217_new"); // 慢性病补报销结算事件ID
			top._aaz217_new_mxbbbx = Base.getValue("aaz217_new"); // 慢性病补报销结算事件ID
			Base.openWindow('win_addkc24',"慢性病补报销数据","<%=path%>/medicalbenefit/calculation/calculationTSMZZXAction!toAddKc24.do",param,"80%","80%",null,function(){
				Base.setValue("aaz217_new",top._aaz217_new_mxbbbx);
				toQuery();
			},true);	
		}
	} 
	
	// 明细审核:只允许一条一条的审核明细
	function toSh() 
	{
		var  gridData = Base.getGridSelectedRows("kc21List");
		if(gridData.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		var aaz217 = gridData[0].aaz217;
		var row = gridData[0]._row_;  // 行号
		var aaz217List = [];
		var aaz217Map = {};
		aaz217Map = {};
		aaz217Map.aaz217 = aaz217;
		aaz217List.push(aaz217Map);
		// 参数
	    var param={"dto['aaz217_new']":Base.getValue("aaz217_new"), // 医疗待遇结算事件ID
	    		   "dto['aaz217_old']":aaz217, // 原就诊ID
	    		   "dto['aac001']":Base.getValue("aac001") // 人员ID
	    		   };
	    param.aaz217List = Ta.util.obj2string(aaz217List);
		Base.openWindow('win_mxsh',"明细","<%=path%>/medicalbenefit/calculation/calculationTSMZZXAction!toDetail.do",param,"99%","99%",null,function(){
			toQuery();
			setTimeout(function(){
	        	Base.gotoGridRow("kc21List", row+2);
	        	Base.setSelectRowsByData("kc21List", "[{'aaz217':'"+aaz217+"'}]");
	        },300);
		},true);
	}
	
	//行的双击事件
	function fnRowDbClick(e,data)
	{
		var aaz217 = data.aaz217;
		var row = data.row;
		var aaz217List = [];
		var aaz217Map = {};
		aaz217Map = {};
		aaz217Map.aaz217 = aaz217;
		aaz217List.push(aaz217Map);
		// 参数
	    var param={"dto['aaz217_new']":Base.getValue("aaz217_new"), // 医疗待遇结算事件ID
	    		   "dto['aaz217_old']":aaz217, // 原就诊ID
	    		   "dto['aac001']":Base.getValue("aac001") // 人员ID
	    		   };
	    param.aaz217List = Ta.util.obj2string(aaz217List);
		Base.openWindow('win_mxsh',"明细","<%=path%>/medicalbenefit/calculation/calculationTSMZZXAction!toDetail.do",param,"99%","99%",null,function(){
			toQuery();
	        setTimeout(function(){
	        	Base.gotoGridRow("kc21List", row+2);
	        	Base.setSelectRowsByData("kc21List", "[{'aaz217':'"+aaz217+"'}]");
	        	//Base.getObj("kc21List").setSelectedRows("19,21");
	        },300);
		},true);
	}
	
	// 撤销
	function toCancel()
	{
		var  gridData = Base.getGridSelectedRows('kc21List');
		if(gridData.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		var gridStr=Ta.util.obj2string(gridData);
		var parameter={};
		parameter['gridList']=gridStr;
		Base.submit("form1","calculationTSMZZXAction!toCancel.do",parameter,null,false,function(){
			Base.deleteGridSelectedRows("kc21List");
		});
		
	}
	// 打印
	function toPrint()
	{
		var aac001 = Base.getValue("aac001"); // 个人ID
		var aae011 = Base.getValue("aae011"); // 经办人
		var aaz217 = Base.getValue("aaz217_new"); // 新的医疗待遇结算ID
		var reportName ="CenterJS_TSMXB.raq"; 
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aac001="+aac001+";aae011="+aae011);

	}
	
	// 查询缴费信息
	function toQueryJiaoFei()
	{
		var aac001 = Base.getValue("aac001");
		if("" == aac001 || null == aac001){
			Base.alert("请输入个人ID","warn");
			return;
		}
		var parameter = {};
		parameter["dto['aac001']"] = aac001;
		parameter["dto['aae140']"] = Base.getValue("aae140");
		Base.openWindow("win_jf", "人员缴费信息", "<%=path%>/medicalbenefit/common/commonFunctionAction!toQueryJiaoFei.do", parameter, "98%", "95%", null, null, true, "", ""); 
	}
	
	// 关闭窗口
	function closeWin()
	{
		top.Base.closeWindow("win_reg");
	}
	
	// 列渲染方法
	function fnFormatter(row, cell, value, columnDef, dataContext){
		var sfsh = dataContext.sfsh;
		if("" != sfsh && null != sfsh && "null" != sfsh){
			if("" == value || null == value)
				value = "";
			else
			   value = "<span style='color:blue;'>"+value+"</span>";
		}
		return value;
     }
</script>
<%@ include file="/ta/incfooter.jsp"%>