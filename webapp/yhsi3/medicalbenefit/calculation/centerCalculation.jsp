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
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
<!-- 		<ta:toolbarItem id="saveBtn" key="预结算[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave('0')" /> -->
		<ta:toolbarItem id="btnReset" key="重置[R]" icon="xui-icon-spotReset"  hotKey="R" onClick="reset()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel1" key="查询条件" cols="3" >
			<ta:text id="aka030" key="结算类别" display="false"/>
			<ta:text id="aac001" key="个人ID" />
			<ta:text id="aac003" key="姓名" readOnly="true" />
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130"  filter="51,52,71,72" maxVisibleRows="8"/>
			<ta:text id="akb020"  key="医疗机构编号" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true"  span="2" />
			<ta:box span="1" cols="2">
				<ta:date id="aae030" key="登记时间" showSelectPanel="true" columnWidth="0.6"/>
				<ta:date id="aae031" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
			</ta:box>	
			<ta:selectInput id="aae140" key="险种类型" collection="YL140"  maxVisibleRows="8"  reverseFilter="true"/>
			<ta:selectInput id="aka078" key="支付类型" collection="AKA078" maxVisibleRows="8" filter="4"/>
		</ta:panel>
		<ta:panel id="panel2" key="登记信息"  fit="true">
			<ta:datagrid id="kc21List" fit="true" haveSn="true"  >
			    <ta:datagridItem id="edit" key="预结算" width="50" align="true" icon="icon-edit" click="toSaveNew"/>
				<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" showDetailed="true" maxChart="6"/>
				<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" showDetailed="true" maxChart="3" />
				<ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="left" showDetailed="true" maxChart="9" />
				<ta:datagridItem id="aab003" key="单位名称" align="center" dataAlign="left" showDetailed="true" maxChart="18" />
				<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" showDetailed="true" maxChart="8" collection="AAE140" />
				<ta:datagridItem id="aka130" key="医疗支付类别" align="center" dataAlign="left" showDetailed="true" maxChart="6" collection="AKA130" />
				<ta:datagridItem id="aae030" key="开始日期" align="center" dataAlign="center" showDetailed="true" maxChart="5" dataType="date"/>
				<ta:datagridItem id="aae031" key="结束日期" align="center" dataAlign="center" showDetailed="true" maxChart="5" dataType="date"/>
				<ta:datagridItem id="aae019" key="总费用" align="center" dataAlign="center" showDetailed="true" maxChart="5" />
				<ta:datagridItem id="yke069" key="单据分数" align="center" dataAlign="center" showDetailed="true" maxChart="4" />
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center" dataAlign="left" showDetailed="true" maxChart="15" />
				<ta:datagridItem id="akb097" key="医疗机构等级" align="center" dataAlign="left" showDetailed="true" maxChart="6" collection="AKB097" />
				<ta:datagridItem id="ake013" key="报销原因" align="center" dataAlign="left" showDetailed="true" maxChart="8" collection="AKE013" />
				<ta:datagridItem id="aae011" key="经办人"  align="center" dataAlign="left" showDetailed="true" maxChart="3" collection="AAE011" />
				<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" showDetailed="true" maxChart="10"  dataType="datetime" />
				<ta:datagridItem id="aaa027" key="经办机构" align="center" dataAlign="left" showDetailed="true" maxChart="9" collection="YAB003"/>
				<ta:datagridItem id="aaz217" key="就诊流水号"  align="center" dataAlign="left"  maxChart="6"/>
			</ta:datagrid>
	</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
		initializeSuggestFramework(2,"", "akb020", 750, 300, 4, fn_getHospital, 0, false);
	});
	
	// 个人ID change事件
	$("#aac001").change(function(){
		sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'));
	});
	
	// 定点医疗机构
	$("#akb020").change(function(){
		sfwQueryUtil(2,'getKb01',Base.getValue('akb020'));
	});
	
	/**
	 * 人员回调方法
	**/
	function fn_getPerson(){
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac003", g_Suggest[1]);
	}
	
	/**
	 * 医疗机构回调方法
	**/
	function fn_getHospital(){
		Base.setValue("akb020", g_Suggest[0]); // 医疗机构编码
		Base.setValue("akb021", g_Suggest[1]); // 医疗机构名称
	}
	 
	/**
	 * 查询
	**/
	function toQuery(){
		Base.clearGridData("kc21List");
		Base.submit("panel1","centerCalculationAction!toQuery.do");
	}
	/**
	 * 查询
	**/
	function reset(){
		Base.clearData("panel1");
		Base.clearGridData("kc21List");
	}
	
	/**
	 * 保存预结算0、结算1
	**/
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
	function toSaveNew(rowdata){
	   var param = {"dto['jslb']":"0", // 报销操作
	    		     "dto['ake013']":rowdata.ake013, // 报销原因
	    		     "dto['aaz217']":rowdata.aaz217 // 医疗待遇申请事件ID
	    		     //"dto['aac001']":kc21List[0].aac001 // 人员ID
	    		     //"dto['aka030']":Base.getValue("aka030") // 结算类别
	    		     };
	    Base.setValue("aac001",rowdata.aac001);
		Base.submitForm("form1", null, false, "centerCalculationAction!toSave.do", param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>