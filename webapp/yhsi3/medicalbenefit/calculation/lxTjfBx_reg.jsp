<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>离休二乙体检费报销登记</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="ButtonLayout1" >
			<ta:button id="regBtn"     key="保存"    icon="xui-icon-spotAdd"        onClick="toSave()"  asToolBarItem="true"/>
			<ta:button id="closeBtn"   key="退出"    icon="xui-icon-spotClose"      onClick="closeWin()"  asToolBarItem="true"/>
		</ta:toolbar>
	<ta:form id="form1" fit="true">  
	     <ta:text id="aaz217" key="登记流水号" display="false"/>
	     <ta:text id="aaa027" key="分中心" display="false"/>
		 <ta:panel id="pnlDj" key="登记信息" cols="3" >
			<ta:text id="akb020"  key="医疗机构编号"  required="true"  labelWidth="120"   popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称"   required="true"  labelWidth="120" span="2"/>
			<ta:selectInput id="bxlb" key="报销类型" required="true"  labelWidth="120"  onSelect="fnSelected"/>
			<ta:date id="aae030" key="开始日期"      required="true"  showSelectPanel="true"  labelWidth="120"/>
			<ta:date id="aae031" key="结束日期"      required="true"  showSelectPanel="true"  labelWidth="120"/>
			<ta:number id="akc264"  key="总费用"     precision="2"    required="true"  max="9999999999" labelWidth="120"/>
			<ta:number id="akc227"  key="总人数"     required="true"  max="9999999999" labelWidth="120"/>
			<ta:text id="aae013" key="备注"         labelWidth="120" />
		    <ta:text id="aac001" key="个人ID"    labelWidth="120"/>
			<ta:text id="aac003" key="姓名"      readOnly="true"  labelWidth="120"/>
			<ta:text id="aac002" key="身份证号"  readOnly="true"  labelWidth="120"/>
		</ta:panel> 
   </ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 800, 300, 7, fn_getPerson, 0, false);
	});
	
	// 个人ID change事件
	$("#aac001").change(function(){
    	sfwQueryUtilDY(1,'getAc01ByAae140ForYL',Base.getValue('aac001'),null,'340')
	});

	// 人员回调函数
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.setValue("aac003",g_Suggest[1]);
		Base.setValue("aac002",g_Suggest[0]);
	}
	
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata)
	 {
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	   Base.setEnable("regBtn");	
	}
	 
	// 关闭窗口
	function closeWin()
	{
		top.tjtxbbx_aaz217 = Base.getValue("aaz217");
		top.Base.closeWindow("win_reg");
	}
	
	//报销类型 选择
	function fnSelected(key,value)
	{
	   if ("1" == value) // 选择个人时,自动将人数设置为1,并将个人ID设置为必录入项
	   {
		   Base.setValue("akc227","1");
		   Base.setRequired("aac001");
	   }else{
		   Base.setValue("akc227","");
		   Base.setDisRequired("aac001");
	   }
	}
	
	//保存
    function toSave()
	{
		if(Base.validateForm("form1"))
		{
			var param = {};
			Base.setDisabled("regBtn");
			Base.submit("form1","lxTjfBxAction!toSaveReg.do",param);
		}
	}
	
	// 以下代码未用
	//增加
	function toAdd()
	{
		var aaz217 = Base.getValue("aaz217");
		var aac001 = Base.getValue("aac001");
		if("" == aaz217 || null == aaz217){
			Base.alert("请保存后再增加人员信息!","warn");
			return ;
		}
		if("" == aac001 || null == aac001){
			Base.alert("请输入人员信息!","warn");
			return ;
		}
		Base.setDisabled("addBtn");
		Base.submit("form1","lxTjfBxAction!toSaveLxtjfBxRegMx.do");
	}
	
	// 修改
	function toEdit()
	{
		Base.setEnable("pnlDj");	
	}
	
	// 删除
	function toDel()
	{
		var gridData = Base.getGridSelectedRows("dgLx");
		if("" == gridData || null == gridData){
			Base.alert("请选择需要删除的数据!","warn");
			return;
		}
		var param = {};
		param.gridData = Ta.util.obj2string(gridData);
		Base.submit("form1","lxTjfBxAction!toDeleteLxtjfBxRegMx.do",param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>