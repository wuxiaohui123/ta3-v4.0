<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构结算申请接受</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fltHospital"  key="查询条件" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:selectInput id="akb022" key="医疗机构类型" collection="AKB022" labelWidth="120"/>
			<ta:selectInput id="akb097" key="医疗机构等级" collection="AKB096" labelWidth="120" />
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" labelWidth="120" />
		</ta:panel>
		<ta:panel id="pnlReckoning" key="结算申请信息" fit="true" >
			<ta:datagrid id="dgrdReckoning"  fit="true" haveSn="true" selectType="checkbox" >
			<ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="true"/>
			<ta:datagridItem id="aaz107" key="定点医疗机构ID" hiddenColumn="true"/>
			<ta:datagridItem id="checkDetail" key="查看报表" icon="icon-find" click="fnClickDgrd2" align="center" width="70"/>
			<ta:datagridItem id="akb021" key="医疗机构名称" width="150" align="center" showDetailed="true" />
			<ta:datagridItem id="yka316" key="清算类别" collection="yka316" showDetailed="true" width="100" align="center"/>
			<ta:datagridItem id="aae030" key="开始日期" showDetailed="true" dataType="date" width="100" align="center" dataAlign="center" dataType="date"/>
			<ta:datagridItem id="aae031" key="终止日期" showDetailed="true" dataType="date" width="100" align="center" dataAlign="center" dataType="date"/>
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
		initializeSuggestFramework(2,"", "akb020", 500, 300, 4, fn_getHospital, 0, false);
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
						}
					});
	}
	//查询
	function query(){
		Base.submit('form1','reckoningAcceptAction!toQueryHospitalInfo.do');
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")) {
			var selectedInfo = Base.getGridSelectedRows("dgrdReckoning");//表格选中数据
			if(selectedInfo.length == 0){
				Base.alert("请选择结算信息!","warn");
			}else {
				var param = {};
				param.selectedList = Ta.util.obj2string(selectedInfo);
				Base.confirm("确定要保存吗?",function(yes){
					if(yes){
						Base.submit("form1,dgrdReckoning","reckoningAcceptAction!toSave.do", param);
					}
				});
			}
		}else{
			Base.alert("有红色星号的为必填内容!","warn");
		}
	}
	// 查询相应的信息
	function fnClickDgrd2(data, e){
		console.log(data);
		if(data.yka316 <= '20'){
			var szPath="reckoningAcceptAction!toCheck.do";
			Base.openWindow("toCheck", "支出核定表", szPath, {"dto['row']":Ta.util.obj2string(data)}, '90%', '90%',null,null,true);//弹出新增窗口 
		}else{
			var szPath="reckoningAcceptAction!toCheck1.do";
			Base.openWindow("toCheck1", "支出核定表", szPath, {"dto['row']":Ta.util.obj2string(data)}, '90%', '90%',null,null,true);//弹出新增窗口 
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>