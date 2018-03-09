<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病报销增加单据</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:buttonLayout id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn"   key="查询"       icon="xui-icon-query"        onClick="toQuery()"/>
		<ta:toolbarItem id="saveBtn"    key="导入"       icon="xui-icon-spotSave"     onClick="toSave()" />
		<ta:toolbarItem id="closeBtn"   key="关闭"       icon="xui-icon-spotReset"    onClick="toCloseWin()"/>
	</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj" key="查询条件" cols="3" >
	       <ta:text id="aac001"  key="人员ID"  required="true"/>
	       <ta:text id="aac003"  key="姓名" readOnly="true" />
		   <ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="结算时间" showSelectPanel="true" columnWidth="0.6"  required="true"/>
				<ta:date id="aae036_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
		   </ta:box>
		   <ta:text id="akb020"  key="医疗机构编号" popWin="true"  popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
		   <ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2"/>
		</ta:panel>
		<ta:panel id="panel2" key="消费记录" fit="true" >
			<ta:datagrid id="kc24List" fit="true" haveSn="true"  selectType="radio">
				<ta:datagridItem id="akc191" key="医院流水号"     align="center"  dataAlign="left" showDetailed="true"  maxChart="5" />
				<ta:datagridItem id="aac001" key="个人编号"     align="center"  dataAlign="left" showDetailed="true"  maxChart="7" />
				<ta:datagridItem id="aac003" key="姓名"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4" />
				<ta:datagridItem id="akc021" key="人员性质"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4" collection="AKC021"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  dataAlign="left" showDetailed="true"  maxChart="15" />
				<ta:datagridItem id="aka130" key="就诊类型"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4" collection="AKA130"/>
				<ta:datagridItem id="aae030" key="入院日期"  align="center"  dataAlign="left" showDetailed="true"  maxChart="6" />
				<ta:datagridItem id="aae031" key="出院日期"  align="center"  dataAlign="left" showDetailed="true"  maxChart="6" />
				<ta:datagridItem id="yke021" key="住院天数"  align="center"  dataAlign="right" showDetailed="true"  maxChart="4" />
				<ta:datagridItem id="akc196" key="出院诊断"  align="center"  dataAlign="left" showDetailed="true"  maxChart="10" />
				<ta:datagridItem id="aae036" key="结算时间"     align="center" dataAlign="center" maxChart="7"   sortable="true"/>
				<ta:datagridItem id="akc264" key="总费用"      align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akc228" key="全自费费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akc268" key="超限额费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka318" key="先自付费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka319" key="范围内费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka115" key="起付线"    align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="tczf"   key="统筹支付"    align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka059"   key="统筹比例自付"    align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="ake034" key="账户支出"    align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="xjzf"   key="现金支付"      align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="aae001" key="年度"         align="center"  dataAlign="center" showDetailed="true"  maxChart="2" />
				<ta:datagridItem id="aac004" key="性别"         align="center"  dataAlign="left" showDetailed="true"  maxChart="2" collection="AAC004"/>
				<ta:datagridItem id="aab003" key="单位名称"         align="center"  dataAlign="left" showDetailed="true"  maxChart="10" />
				<ta:datagridItem id="aab019" key="单位类型"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4" collection="AAB019"/>
				<ta:datagridItem id="yka032" key="支付地点"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4" collection="YKA032"/>
				<ta:datagridItem id="aaz217" key="就诊流水号"     align="center"  dataAlign="left"  maxChart="5" />
				<ta:datagridItem id="aaz216" key="结算流水号"     align="center"  dataAlign="left"  maxChart="5" />
				<ta:datagridItem id="aaz208" key="待遇支付流水号"  align="center"  dataAlign="left"  maxChart="7" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
	});
	
	// 个人ID change事件
	$("#aac001").change(function(){
		Base.setValue("aac003","");
		sfwQueryUtilForYl(1,'getAc01ByAae140ForYL',{"dto.jstj":Base.getValue('aac001')});
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
       var aae036_s = Base.getValue("aae036_s");
       var aae036_e = Base.getValue("aae036_e");
       if(("" == aae036_s || null == aae036_s) && ("" == aae036_e || null == aae036_e)){
    	   Base.alert("请输入结算日期范围!","warn");
       }else{
		   Base.submit("pnlCxtj","calculationGWYAction!toQueryBxsj.do");
       }
	}
	
	//保存
	function toSave()
	{
	    // 参与结算的数据 
		var gridSelected = Base.getGridSelectedRows("kc24List");
		if(gridSelected.length == 0){
			Base.alert("请选择需要补报销的消费信息!","warn");
			return false;
		}
		top._akc191_gwybx.Base.setValue("aaz217",gridSelected[0].aaz217);
		top._akc191_gwybx.Base.setValue("aaz216",gridSelected[0].aaz216);
		top._akc191_gwybx.Base.setValue("aaz208",gridSelected[0].aaz208);
		top._akc191_gwybx.Base.setValue("akc191",gridSelected[0].akc191);
		top._akc191_gwybx.Base.setValue("aac001",gridSelected[0].aac001);
		top._akc191_gwybx.Base.setValue("aac003",gridSelected[0].aac003);
		top._akc191_gwybx.Base.setValue("aac004",gridSelected[0].aac004);
		top._akc191_gwybx.Base.setValue("akc021",gridSelected[0].akc021);
		top._akc191_gwybx.Base.setValue("yke112",gridSelected[0].yke112);
		top._akc191_gwybx.Base.setValue("aab003",gridSelected[0].aab003);
		top._akc191_gwybx.Base.setValue("aab019",gridSelected[0].aab019);
		top._akc191_gwybx.Base.setValue("aae030",gridSelected[0].aae030);
		top._akc191_gwybx.Base.setValue("aae031",gridSelected[0].aae031);
		top._akc191_gwybx.Base.setValue("aae001",gridSelected[0].aae001);
		top._akc191_gwybx.Base.setValue("yke021",gridSelected[0].yke021);
		top._akc191_gwybx.Base.setValue("akb021",gridSelected[0].akb021);
		top._akc191_gwybx.Base.setValue("akc196",gridSelected[0].akc196);
		top._akc191_gwybx.Base.setValue("yka058",gridSelected[0].yka115);
		top._akc191_gwybx.Base.setValue("yka059",gridSelected[0].yka059);
		toCloseWin();
	}
	
	// 关闭窗口
	function toCloseWin()
	{
		parent.Base.closeWindow("win_akc191");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>