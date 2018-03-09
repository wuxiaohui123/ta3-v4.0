<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心报销登记撤销</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="clearBtn" key="清条件" icon="xui-icon-spotClear" onClick="Base.clearData('panel1');" />
		<ta:toolbarItem id="DelBtn" key="撤消[D]" icon="xui-icon-spotDelete" hotKey="D" onClick="toDel()" />
		<ta:toolbarItem id="printBtn" key="打印审核表" icon="xui-icon-spotPrint" onClick="toPrint()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aae011" key="经办人" display="false"/>
		<ta:panel id="panel1" key="查询条件" cols="3" >
			<ta:text id="aac001" key="个人ID"/>
			<ta:text id="aac003" key="姓名" />
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  filter="51,52,61,62,71,72" maxVisibleRows="8"/>
			<ta:text id="akb020"  key="医疗机构编号" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2" />
			<ta:box span="1" cols="2" cssStyle="padding:0px;">
				<ta:date id="aae030" key="登记时间" showSelectPanel="true" columnWidth="0.6" cssStyle="margin-left:-2px;"/>
				<ta:date id="aae031" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:selectInput id="aae140" key="险种类型" collection="YL140"  maxVisibleRows="8" />
			<ta:selectInput id="aka078" key="支付类型" collection="AKA078" maxVisibleRows="8" filter="4"/>
		</ta:panel>
		<ta:panel id="panel2" key="撤消信息" cols="3" >
			<ta:text id="aae186" key="撤销原因"  span="3" />
		</ta:panel>
		<ta:panel fit="true" id="panel3" key="登记信息(请先选择一条数据,再点击撤销按钮)" >
			<ta:datagrid id="kc21List" fit="true" haveSn="true" selectType="radio">
				<ta:datagridItem id="aaz217" key="就诊事件ID"  hiddenColumn="true" />
				<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="个人编号"  align="center"  showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="aac003" key="姓名"   align="center"  showDetailed="true" dataAlign="left" maxChart="4" />
				<ta:datagridItem id="aac002" key="身份证号" align="center"  showDetailed="true" dataAlign="left" maxChart="10" />
				<ta:datagridItem id="aab003" key="单位名称" align="center"  showDetailed="true" dataAlign="left" maxChart="10" />
				<ta:datagridItem id="aae140" key="险种类型"   collection="AAE140" align="center"  showDetailed="true" dataAlign="left" maxChart="10" />
				<ta:datagridItem id="aka130" key="医疗支付类别"  collection="AKA130" align="center"  showDetailed="true" dataAlign="left" maxChart="6"/>
				<ta:datagridItem id="aae030" key="开始日期"  align="center"  dataAlign="center" maxChart="6" dataType="date" />
				<ta:datagridItem id="aae031" key="结束日期"  align="center"  dataAlign="center" maxChart="6" dataType="date" />
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center"  showDetailed="true" dataAlign="left" maxChart="10"/>
				<ta:datagridItem id="akb097" key="医疗机构等级"  align="center"  showDetailed="true" dataAlign="left" maxChart="8" collection="AKB096" />
				<ta:datagridItem id="ake013" key="报销原因"  align="center"  showDetailed="true" dataAlign="left" maxChart="9" collection="AKE013" />
				<ta:datagridItem id="aae011" key="经办人"   align="center"  showDetailed="true" dataAlign="left" maxChart="6" collection="AAE011" />
				<ta:datagridItem id="aae036" key="经办时间"  align="center"  showDetailed="true" dataAlign="center" maxChart="15" dataType="datetime"/>
				<ta:datagridItem id="yab003" key="经办机构"  align="center"  showDetailed="true" dataAlign="left" maxChart="6" collection="YAB003"/>
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
    // 查询
	function toQuery(){
    	Base.clearGridData("kc21List");
		Base.submit("panel1","centerCalRegRevokeAction!toQuery.do");
	}
    // 撤销
	function toDel(){
		var kc21List = Base.getGridSelectedRows('kc21List');
		if(kc21List.length == 0){
			Base.alert('请选择要撤消的登记信息', 'warn');
			return false;
		}
		var param = {};
		param.kc21List = Ta.util.obj2string(kc21List);
		Base.setDisabled('DelBtn');
		Base.confirm('确定要撤销吗？',function(yes){
			Base.setEnable('DelBtn');
			if(yes){
				Base.submit("panel1,panel2", "centerCalRegRevokeAction!toDel.do", param, null, false, function(){
					Base.deleteGridSelectedRows("kc21List");
				},null);
			}
		});
	}
    
	//打印审核表
	function toPrint()
	{
		var kc21List = Base.getGridSelectedRows('kc21List');
		if(kc21List.length == 0){
			Base.alert("请选择需要打印的数据!", "warn");
			return false;
		}
		var aae011 = Base.getValue("aae011");
		var aaz217 = kc21List[0].aaz217;
		var aka130 = kc21List[0].aka130;
		var aac001 = kc21List[0].aac001;
		var aae140 = kc21List[0].aae140;
		var ake013 = kc21List[0].ake013;
		var reportName="CenterJS_SHD.raq"; // 职工住院审核单
		if("11" == aka130 || "12" == aka130 || "14"==aka130 || "15" == aka130)
			reportName = "centerBxMxsh_MZ.raq"; // 职工门诊审核单
		if("16" == aka130)
			reportName = "centerBxMxsh_sy.raq"; // 居民生育补贴报销
	    if("340" == aae140){
	        reportName="CenterJS_SHDLX.raq"; // 离休住院审核单
		   if("11" == aka130 || "12" == aka130 || "14"==aka130 || "15" == aka130)
			  reportName = "centerBxMxsh_LXMZ.raq"; // 离休门诊审核单
	    }
		if("13" == aka130 || "13a" == aka130 || "13b" == aka130)
			reportName="CenterJSMXB.raq"; // 中心慢性病审核单
		if("11" == ake013)
			reportName ="CenterJS_TSMXB.raq"; // 慢性病中心补保报销
		if("14" == ake013)
			reportName ="CenterJS_SHD_TB.raq"; // 停保补报销
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aae011="+aae011+";aac001="+aac001);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>