<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构结算抽审</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tbr1" >
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<ta:text id="aaz272Temp" key="当前医疗机构_医疗费用结算事件ID(临时用的)" readOnly="true" display="false"/>
			<ta:text id="aka028Temp" key="当前医疗机构_结算类型(临时用的)" readOnly="true" display="false"/>
			<ta:text id="aae030Temp" key="当前结算类型_开始日期(临时用的)" readOnly="true" display="false"/>
			<ta:text id="aae031Temp" key="当前结算类型_终止日期(临时用的)" readOnly="true" display="false"/>
			<ta:text id="aae209Temp" key="当前结算类型_结算年月(临时用的)" readOnly="true" display="false"/>
			<ta:text id="aaz002Temp" key="当前结算类型_业务日志ID(临时用的)" readOnly="true" display="false"/>
			<ta:text id="aaz107Temp" key="当前结算类型_定点医疗机构ID(临时用的)" readOnly="true" display="false"/>
		</ta:box>
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" cssStyle="margin:5px;">
			<ta:text  id="akb020"  key="医疗机构编号" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构ID、名称，可自动完成查询" required="true" labelWidth="160" />
			<ta:text id="akb021" key="医疗服务机构名称" readOnly="true" labelWidth="160" span="2"/>
			<ta:selectInput id="akb022" key="医疗服务机构类型" collection="AKB022" readOnly="true" labelWidth="160" />
			<ta:selectInput id="akb023" key="定点医疗服务机构类别" collection="AKB023" readOnly="true" labelWidth="160" />
			<ta:selectInput id="aaa027" key="统筹区编码" collection="AAA027" readOnly="true" labelWidth="160"/>
		</ta:panel>
		<ta:panel id="pnlJSLX" key="结算类型信息(背景色为蓝色的表示已经放大比例抽取过)" height="150" cssStyle="margin:5px;margin-bottom:-5px;" expanded="false" scalable="false">
			<ta:datagrid id="dgrdJSLX" fit="true" haveSn="true" selectType="checkbox" rowColorfn="fnColor1" forceFitColumns="true">
				<ta:datagridItem id="flag" key="有没有被抽审过(0表示没抽审过,1表示已抽审过)" hiddenColumn="true" />
				<ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz002" key="业务日志ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz107" key="定点医疗机构ID" hiddenColumn="true" />
				<ta:datagridItem id="yka539" key="抽审比例" hiddenColumn="true" />
				<ta:datagridItem id="yka540" key="放大比例" hiddenColumn="true" />
				<ta:datagridItem id="aka028" key="结算类型" collection="AKA028" align="center" />
				<ta:datagridItem id="aae030" key="开始日期" align="center" dataType="date" showDetailed="true"/>
				<ta:datagridItem id="aae031" key="结束日期" align="center" dataType="date" showDetailed="true"/>
				<ta:datagridItem id="aae209" key="结算年月" align="center" showDetailed="true"/>
				<ta:datagridItem id="akb079" key="结算人次" align="center" showDetailed="true"/>
				<ta:datagridItem id="akb065" key="医疗费总额合计" align="center" dataType="number" showDetailed="true" width="120"/>
				<ta:datagridItem id="akb066" key="个人账户支付金额合计" align="center" dataType="number" showDetailed="true" width="150"/>
				<ta:datagridItem id="akb067" key="个人现金支付金额" align="center" dataType="number" showDetailed="true" width="120"/>
				<ta:datagridItem id="akb068" key="统筹支付金额合计" align="center" dataType="number" showDetailed="true" width="120"/>
			</ta:datagrid>
		</ta:panel>
		<ta:box id="bxCS1" cssStyle="margin:5px;background-color:grey;" cols="2">
			<ta:selectInput id="csbl" key="抽审比例" data="[{'id':'1','name':'10%'},{'id':'2','name':'20%'},{'id':'3','name':'30%'}]" labelWidth="120" columnWidth="0.3"/>
			<ta:buttonLayout align="left" cssClass="no-padding">
				<ta:button id="btnRandomget" key="随机抽取" onClick="toRandomGet()" icon="icon-find" toolTip="根据结算类型对医疗服务机构结算费用随机抽取" />
				<ta:button id="btnSaveRandomGet" key="保存抽审信息" onClick="toSaveRandomGet()" icon="icon-ok" />
			</ta:buttonLayout>
		</ta:box>
		<ta:box id="bxCS2" cssStyle="margin:5px;margin-bottom:-5px;background-color:grey;" cols="3" > 
			<ta:number id="csts" key="抽审条数" readOnly="true" labelWidth="120" columnWidth="0.3"/>
			<ta:number id="zfy" key="总费用" precision="2" readOnly="true"/>
			<ta:text id="yka540" key="放大比例" readOnly="true" />
			<ta:text id="yka539" key="抽审比例" readOnly="true" display="false"/>
		</ta:box>
		<ta:panel id="pnlRYJS" key="随机抽审信息(人员医疗结算信息)" height="200" cssStyle="margin:5px;">
			<ta:datagrid id="dgrdRYJS" fit="true" haveSn="true" rowColorfn="fnColor2" forceFitColumns="true">
				<ta:datagridItem id="aaz216" key="人员医疗结算事件ID" hiddenColumn="true"/>
				<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="true" />
				<ta:datagridItem id="aab001" key="人员所在单位ID" hiddenColumn="true" />
				<ta:datagridItem id="aab999" key="人员所在单位管理码" align="center" width="140" hiddenColumn="true"/>
				<ta:datagridItem id="aac003" key="姓名" align="center" width="90"/>
				<ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" width="80"/>
				<ta:datagridItem id="aae044" key="单位名称" align="center" width="140"/>
				<ta:datagridItem id="aac066" key="参保身份" collection="AAC066" align="center" width="80"/>
				<ta:datagridItem id="aae117" key="支付标志" collection="AAE117" align="center" width="80" />
				<ta:datagridItem id="aae191" key="财务支付单据号" align="center" width="100"/>
				<ta:datagridItem id="aae196" key="单据数" align="center" width="80" />
				<ta:datagridItem id="aka030" key="结算类别" collection="AKA030" align="center" width="80"/>
				<ta:datagridItem id="aka070" key="退费结算标志" collection="AKA070" align="center" width="90" hiddenColumn="true"/>
				<ta:datagridItem id="aka010" key="就诊结算日期" align="center" width="90"/>
				<ta:datagridItem id="yka032" key="支付地点" collection="YKA032" align="center" width="80"/>
				<ta:datagridItem id="akc264" key="医疗费总额"align="center" width="80"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
//结算类型信息表格 多选框选中时的操作
function fnGridChecked(rowdata){
	if(rowdata.flag=="1"){
		Base.alert("此行数据已抽审过!","warn");
		rowdata.checked=false;
		return false;
	}
}
//结算类型信息表格颜色
function fnColor1(data){
	if(data.flag=="1"){
		return 'blue';
	}
}
//随机抽审信息表格的颜色
function fnColor2(data){
	return 'red';
}
//随机抽取
function toRandomGet(){
	var gridSelected=Base.getGridSelectedRows("dgrdJSLX");
	var yka539=Base.getValue("csbl");
	if(gridSelected==null||gridSelected==""){
		Base.alert("请选择抽审类型","warn");
	}else if(gridSelected.length>1){
		Base.alert("每次只能随机抽审一种结算类型","warn");
	}else if(gridSelected[0].flag=="1"){
		Base.alert("该结算类型已经抽取过,请重新选择!","warn");
	}else{
		if(yka539==null||yka539==""){
			Base.alert("请选择抽审比例!","warn");
			Base.focus("yka539");
			return;
		}
		Base.clearGridData("dgrdRYJS");//清空随机抽审中的信息
		Base.setEnable("btnSaveRandomGet");
		Base.setValue("aaz272Temp",gridSelected[0].aaz272);// 每次只抽选一种类型;当前医疗机构_医疗费用结算事件ID(临时用的)
		Base.setValue("aka028Temp",gridSelected[0].aka028);// 每次只抽选一种类型,当前医疗机构_结算类型(临时用的)
		Base.setValue("aae030Temp",gridSelected[0].aae030);// 每次只抽选一种类型,当前结算类型_开始日期(临时用的)
		Base.setValue("aae031Temp",gridSelected[0].aae031);// 每次只抽选一种类型,当前结算类型_终止日期(临时用的)
		Base.setValue("aae209Temp",gridSelected[0].aae209);// 每次只抽选一种类型,当前结算类型_结算年月(临时用的)
		Base.setValue("aaz002Temp",gridSelected[0].aaz002);// 每次只抽选一种类型,当前结算类型_业务日志ID(临时用的)
		Base.setValue("aaz107Temp",gridSelected[0].aaz107);// 每次只抽选一种类型,当前结算类型_定点医疗机构ID(临时用的)
		var parameter={"dto['aaz272']":gridSelected[0].aaz272,"dto['yka539']":yka539};
		Base.submit("","randomAuditAction!toRandomGet.do",parameter,false,null,null);
	}
}
//保存 抽审信息
function toSaveRandomGet(){
	var gridRyjs=Base.getGridData("dgrdRYJS");//随机抽审出的信息
	var gridJslx=Base.getGridData("dgrdJSLX");//结算类型信息
	var aaz272Temp=Base.getValue("aaz272Temp");
	var yka539=Base.getValue("yka539");//抽审比例
	var yka540=Base.getValue("yka540");//放大比例
	
	if(gridRyjs==null||gridRyjs==""){
		Base.alert("没有随机抽审数据,不能保存！","warn");
		return;
	}
	
	Base.confirm("确定保存抽审信息吗? ",function(yes){
		if(yes){
			for(var i=0;i<gridJslx.length;i++){
				if(gridJslx[i].aaz272==aaz272Temp){
					gridJslx[i].yka539=yka539;
					gridJslx[i].yka540=yka540;
					gridJslx[i].flag="1";
				}
			}
			Base.refreshGrid("dgrdJSLX");
			
			var parameter={};
			var grdStr=Ta.util.obj2string(gridRyjs);
			parameter["csxx"]=grdStr;//抽审数据
			Base.submit("form1","randomAuditAction!toSaveCSXX.do",parameter,false,null,null);
		}
	});
}
	
//保存
function toSave(){
	var allInfo=Base.getGridData("dgrdJSLX");
	if(Base.validateForm("form1")){
		if(allInfo==null||allInfo==""){
			Base.alert("没有审核信息！","warn");
			return;
		}else{
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					var parameter={};
					var dtaStr=Ta.util.obj2string(allInfo);
					parameter["gridAll"]=dtaStr;
					Base.submit("form1","randomAuditAction!toSave.do",parameter,false,null,null);
				}
			}); 
		}
	}
}
//RPC回调函数,获取医疗服务机构信息
function fn_getHospital(){
	Base.clearData("bxCS2");
	Base.setValue("yka539","");
	Base.hideObj("bxCS2");
	Base.clearGridData("dgrdRYJS");
	Base.clearGridData("dgrdJSLX");
	Base.submit("akb020","randomAuditAction!toQueryHospitalInfo.do");
}
//初始化页面
$(document).ready(function() {
	$("body").taLayout();
	$("form").css("overflow","auto");
	$("body").css("overflow","hidden");
	initializeSuggestFramework(1,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
});
</script>
<%@ include file="/ta/incfooter.jsp"%>