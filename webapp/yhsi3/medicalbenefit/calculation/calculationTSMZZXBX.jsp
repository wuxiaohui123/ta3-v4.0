<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报销结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn"   key="查询[Q]"  icon="xui-icon-query"       hotKey="Q"  onClick="toQuery()" />
		<ta:toolbarItem id="regBtn"     key="登记"    icon="xui-icon-spotAdd"     onClick="toReg()" />
		<ta:toolbarItem id="modifyBtn"  key="修改"    icon="xui-icon-spotEdit"    onClick="toModify()" />
		<ta:toolbarItem id="cancelBtn"  key="撤销"    icon="xui-icon-spotClear"   onClick="toCancel()" />
		<ta:toolbarItem id="printBtn"   key="打印"    icon="xui-icon-spotPrint"    onClick="toPrint()" />
		<ta:toolbarItem id="checkBtn"   key="查看明细"   icon="xui-icon-show"       onClick="toCheck()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	    <ta:text id="aae011"  key="经办人"  display="false"/>
	 	<ta:text id="aaa027"  key="分中心"  display="false"/>
		<ta:panel id="panel1" key="查询条件" cols="3" >
			<ta:text id="aac001"  key="个人ID" />
			<ta:text id="aac003"  key="姓名"  />
			<ta:selectInput id="aae140" key="险种类型"  collection="YL140"  filter="340"/>
			<ta:text id="akb020"  key="医疗机构编号"  popWin="true"  popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021"  key="医疗机构名称"  readOnly="true"  />
		    <ta:selectInput id="yke056" key="结算状态"  data="[{'id':'0','name':'未结算'},{'id':'1','name':'已结算'}]"  value="0"/>
			<ta:box span="1" cols="2">
				<ta:date id="aae036s" key="登记时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae036e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:box span="1" cols="2">
				<ta:date id="aae030" key="结算时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae031" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
		    <ta:date id="aae001" key="年度" showSelectPanel="true"  dateYear="true"  required="true"/>
		</ta:panel>
		<ta:panel id="panel2" key="报销信息"  fit="true">
			<ta:datagrid id="kc21List" fit="true" haveSn="true" >
				<ta:datagridItem id="yke056" key="结算状态" align="center" dataAlign="left" showDetailed="true" maxChart="6"  collection="YKE056"/>
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" showDetailed="true" maxChart="6"/>
				<ta:datagridItem id="aac003" key="姓名"     align="center" dataAlign="left" showDetailed="true" maxChart="3" />
				<ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="left" showDetailed="true" maxChart="9" />
				<ta:datagridItem id="aab003" key="单位名称" align="center" dataAlign="left" showDetailed="true" maxChart="18" />
				<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" showDetailed="true" maxChart="10" collection="YL140" />
				<ta:datagridItem id="aae030" key="开始日期" align="center" dataAlign="center" showDetailed="true" maxChart="5" />
				<ta:datagridItem id="aae031" key="结束日期" align="center" dataAlign="center" showDetailed="true" maxChart="5" />
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center" dataAlign="left" showDetailed="true" maxChart="15" />
				<ta:datagridItem id="yka115" key="起付线 "    align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="djsl"   key="单据数量 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="aae019" key="总费用 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="akc228" key="全自费 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="akc268" key="超限价 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="yka318" key="先行自付 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="yka319" key="符合范围 "   align="center" dataAlign="right" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="aae011" key="经办人"   align="center" dataAlign="left"  showDetailed="true " maxChart="3"    collection="AAE011" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" showDetailed="true" maxChart="10" />
				<ta:datagridItem id="aaz217" key="就诊流水号"  align="center" dataAlign="center" maxChart="5" />
			</ta:datagrid>
	</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="0" height="0" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 0, false);
	});
	
	// 个人ID change事件
	$("#aac001").change(function(){
		Base.setValue("aac003", "");
		sfwQueryUtilForYl(1,'getKc47ListForYL',{"dto.jstj":Base.getValue('aac001'),"dto.aae100":"all"});
	});

	// 人员回调函数
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.setValue("aac003",g_Suggest[1]);
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
		Base.submit("panel1","calculationTSMZZXAction!toQueryMxbBbx.do");
	}
	
	// 登记
	function toReg()
	{
		var param = {};
		Base.openWindow('win_reg',"慢性病补报销登记","<%=path%>/medicalbenefit/calculation/calculationTSMZZXAction!toReg.do",param,"99%","99%",null,function(){
			
		},true);
	}
	
	// 修改
	function toModify()
	{
		var gridData = Base.getGridSelectedRows("kc21List");
		if("" == gridData || null == gridData){
			Base.alert("请先选择需要修改的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if("01" != yke056 && "02" != yke056){
				Base.alert("已经结算不能修改!","warn");
				return;
			}else{
				var param = {};
				param["dto.aaz217_new"] = gridData[0].aaz217;
				param["dto.aac001"] = gridData[0].aac001;
				param["dto.aae030"] = gridData[0].aae030;
				param["dto.aae031"] = gridData[0].aae031;
				Base.openWindow('win_reg',"慢性病补报销修改","<%=path%>/medicalbenefit/calculation/calculationTSMZZXAction!toModify.do",param,"99%","99%",null,function(){
					
				},true);
			}
		}
	}
	
	// 撤销 
	function  toCancel()
	{
		var gridData = Base.getGridSelectedRows("kc21List");
		if("" == gridData || null == gridData){
			Base.alert("请先选择需要撤销的数据!","warn");
		}else{
			var yke056 = gridData[0].yke056;
			if("01" != yke056 && "02" != yke056){
				Base.alert("已经结算不能撤销!","warn");
				return;
			}else{
				Base.confirm("确定撤销，请注意该撤销会删除本次报销关联的所有明细记录?",function(yes){
					if(yes){
						var param = {};
						param["dto.aac001"] = gridData[0].aac001;
						param["dto.aaz217"] = gridData[0].aaz217;
						Base.submit("","calculationTSMZZXAction!toCancelAll.do",param,null,false,function(){
							Base.deleteGridSelectedRows("kc21List");
						});	
					}
				});
			}
		}	
	}
	
	// 查看明细 
	function toCheck() 
	{
		var  gridData = Base.getGridSelectedRows("kc21List");
		if(gridData.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		// 参数
	    var param={"dto['aaz217_new']":gridData[0].aaz217 // 医疗待遇结算事件ID
	    		   };
		Base.openWindow('win_mx',"明细","<%=path%>/medicalbenefit/calculation/calculationTSMZZXAction!toCheckDetail.do",param,"99%","99%",null,null,true);
		
	}
	
	// 打印
	function toPrint()
	{
		var  gridData = Base.getGridSelectedRows("kc21List");
		if(gridData.length == 0){
			Base.alert("请先选择数据!","warn");
			return false;
		}
		var aac001 = gridData[0].aac001; // 个人ID
		var aae011 = Base.getValue("aae011"); // 经办人
		var aaz217 = gridData[0].aaz217; // 新的医疗待遇结算ID
		var reportName ="CenterJS_TSMXB.raq"; 
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aac001="+aac001+";aae011="+aae011);

	}
	
	//保存预结算0、结算1
	function toSave(jslb) 
	{
		var kc21List = Base.getGridSelectedRows('kc21List');
		if(1 > kc21List.length)
			return Base.alert('请选择要结算的数据！', 'warn');
	    var param = {"dto['jslb']":jslb, // 报销操作
	    		     "dto['ake013']":kc21List[0].ake013, // 报销原因
	    		     "dto['aaz217']":kc21List[0].aaz217 // 医疗待遇申请事件ID
	    		     //"dto['aac001']":kc21List[0].aac001 // 人员ID
	    		     //"dto['aka030']":Base.getValue("aka030") // 结算类别
	    		     };
	    Base.setValue("aac001",kc21List[0].aac001);
		Base.submitForm("form1", null, false, "centerCalculationAction!toSave.do", param);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>