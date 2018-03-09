<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>保证金拨付初审</title>
		<%@ include file="/ta/inc.jsp"%>
	</head> 
	<body class="yes-scrollbar" >
		<ta:pageloading/>
		<ta:toolbar id="tbr1">
			<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="save()" />
			<ta:button id="btnReset" key="重置[R]" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" type="resetPage"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true" >
			<ta:box id="procInc">
				<%@ include file="/xbpm/common/xbpmInc.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="查询" cols="3" id="fdstBaseinfo" >
				<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
				<ta:date id="aae001" key="年度" dateYear="true" showSelectPanel="true" onChange="query()" labelWidth="120"/>
				<ta:selectInput id="akb022" key="医疗机构类型" collection="AKB022" labelWidth="120" />
				<ta:selectInput id="akb097" key="医疗机构等级" collection="AKB096" labelWidth="120" />
				<ta:selectInput id="yka316" key="清算类别" collection="YKA316" labelWidth="120" />
			</ta:panel>
			<ta:panel id="panel1" key="待拨付保证金信息" fit="true"> 
				<ta:datagrid id="dgrdBzj" haveSn="true" fit="true" selectType="checkbox" >
					<ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="true"/>
					<ta:datagridItem id="aaz107" key="定点医疗机构ID" hiddenColumn="true"/>
					<ta:datagridItem id="akb020" key="定点医疗机构ID" hiddenColumn="true"/>
					<ta:datagridItem id="aaa027" key="统筹区编码" hiddenColumn="true"/>
					<ta:datagridItem id="aae001" key="年度" hiddenColumn="true"/>
					<ta:datagridItem id="akb021" key="医疗机构名称" width="150" align="center" />
					<ta:datagridItem id="yka316" key="清算类别" collection="yka316" showDetailed="true" width="100" align="center"/>
					<ta:datagridItem id="aae030" key="开始日期" showDetailed="true" dataType="date" width="100" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae031" key="终止日期" showDetailed="true" dataType="date" width="100" align="center" dataAlign="center"/>
					<ta:datagridItem id="akc264" key="医疗费总额" width="120" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="akb090" key="保证金总额" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ake034" key="个人账户保证金" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ake039" key="基本医疗保证金" width="120" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ake029" key="大额保证金" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ake035" key="公补保证金" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ake041" key="居民医疗保证金" width="120" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ake043" key="特殊补助保证金" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="yle001" key="工伤保证金" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
					<ta:datagridItem id="ame001" key="生育保证金" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html> 
<script type="text/javascript">
$(document).ready(function () {
	$("body").taLayout();
	fnSetRedBorder();
	initializeSuggestFramework(2,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
});
function fn_getHospital(){
	Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
				{"dto['akb020']":Base.getValue("akb020")},
				function(data){
					if (data.errMsg != null && data.errMsg != ''){
						Base.alert(data.errMsg);
						Base.setValue("akb020","");
						return false;
					}
					if(data && data.hospitalInfoDto) {
						Base.setValue("akb022",data.hospitalInfoDto.akb022);
						Base.setValue("akb097",data.hospitalInfoDto.akb097);
						Base.setValue("akb021",data.hospitalInfoDto.akb021);
						Base.clearGridData("dgrdBzj");
						Base.submit("akb020","recRecognizancePayAction!toQueryHospitalInfo.do");
					}
				});
}
//查询
function query(){
	Base.submit('form1','recRecognizancePayAction!toQueryHospitalInfo.do');
}
//保存
function save(){
	var gridSelected=Base.getGridSelectedRows("dgrdBzj");//选中的表格数据
	if(gridSelected==null||gridSelected==""){
		Base.alert("请选择需要拨付的保证金!","warn");
		return null;
	}
	if(Base.validateForm("form1")){
		var gridStr=Ta.util.obj2string(gridSelected);
		var parameter={};
		parameter['gridInfo']=gridStr;
		Base.submit("form1","recRecognizancePayAction!toSave.do",parameter,null,false,null,null);
	}else{
		Base.alert("带红星的为必输项!","warn");
	}
}
</script>
<%@ include file="/ta/incfooter.jsp"%>