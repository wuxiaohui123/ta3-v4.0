<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构结算初审</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="结算[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:selectInput id="akb022" key="医疗机构类型" collection="AKB022" labelWidth="120" />
			<ta:selectInput id="akb097" key="医疗机构等级" collection="AKB096" labelWidth="120" />
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" labelWidth="120" />
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="审核信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="dgrdAuditInfo" fit="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="true"/>
				<ta:datagridItem id="aaz107" key="定点医疗机构ID" hiddenColumn="true"/>
				<ta:datagridItem id="akb020" key="定点医疗机构ID" hiddenColumn="true"/>
				<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="true"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" width="150" align="center" />
				<ta:datagridItem id="yka316" key="清算类别" collection="yka316" showDetailed="true" width="100" align="center"/>
				<ta:datagridItem id="aae030" key="开始日期" showDetailed="true" width="100" dataType="date" align="center" dataAlign="center"/>
				<ta:datagridItem id="aae031" key="终止日期" showDetailed="true" width="100" dataType="date" align="center" dataAlign="center"/>
				<ta:datagridItem id="akb079" key="结算人次" width="80" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="akb065" key="医疗费总额" width="120" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="akb066" key="个人账户支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="akb067" key="个人现金支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum" hiddenColumn="true"/>
				<ta:datagridItem id="ake039" key="基本医疗基金支付" width="120" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="ake029" key="大额基金支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="ake035" key="公补基金支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="ake041" key="居民医疗基金支付" width="120" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="ake043" key="特殊基金支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="yle001" key="工伤基金支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
				<ta:datagridItem id="ame001" key="生育基金支付" width="100" align="center" dataAlign="right" dataType="number" totals="sum"/>
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
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
							Base.clearGridData("dgrdAuditInfo");
							Base.submit("akb020","reckoningAuditAction!toQueryHospitalInfo.do");
						}
					});
	}
		
	//查询
	function query(){
		Base.submit('form1','reckoningAuditAction!toQueryHospitalInfo.do');
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
			//有无审核信息
			var gridInfo=Base.getGridData("dgrdAuditInfo");//表格中所有数据 
			var gridSelected=Base.getGridSelectedRows("dgrdAuditInfo");//选中的表格数据
			
			if(gridSelected.length == 0){
				Base.alert("请勾选要审核信息!","warn");
				return false;
			}
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					var gridStr=Ta.util.obj2string(gridSelected);
					var parameter={};
					parameter['gridInfo']=gridStr;
					Base.submit("form1","reckoningAuditAction!save.do",parameter,null,false,null,null);
				}
			});
		}else{
			Base.alert("有红星的为必输项!","warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>