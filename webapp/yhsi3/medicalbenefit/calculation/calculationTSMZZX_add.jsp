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
		<ta:toolbarItem id="closeBtn"   key="关闭"       icon="xui-icon-spotReset"    onClick="parent.Base.closeWindow('win_addkc24')"/>
	</ta:buttonLayout>
	<ta:form id="form1" fit="true">
	    <ta:text id="aaz217_new"  key="新的结算事件ID"  display="false"/>
		<ta:panel id="pnlCxtj" key="查询条件" cols="3" >
	       <ta:text id="aac001"  key="人员ID"  display="false"/>
		   <ta:box span="1" cols="2">
				<ta:date id="aae036_s" key="结算时间" showSelectPanel="true" columnWidth="0.6"  required="true"/>
				<ta:date id="aae036_e" key="至" labelWidth="15" showSelectPanel="true" columnWidth="0.4"/>
		   </ta:box>
		   <ta:text id="akb020"  key="医疗机构编号" popWin="true"  popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
		   <ta:text id="akb021" key="医疗机构名称" readOnly="true" />
		</ta:panel>
		<ta:panel id="panel2" key="消费记录：注意账户已经全额支付的记录这里不展示" fit="true" >
			<ta:datagrid id="kc24List" fit="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="aaz217" key="就诊事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz216" key="结算事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz208" key="结算事件ID" hiddenColumn="true" />
				<ta:datagridItem id="akc191" key="医院流水号"     align="center"  dataAlign="left" showDetailed="true"  maxChart="5" />
				<ta:datagridItem id="aac001" key="个人编号"     align="center"  dataAlign="left" showDetailed="true"  maxChart="7" />
				<ta:datagridItem id="aac003" key="姓名"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4" />
				<ta:datagridItem id="akc021" key="人员性质"         align="center"  dataAlign="left" showDetailed="true"  maxChart="4"  collection="AKC021"/>
				<ta:datagridItem id="aab003" key="单位名称"         align="center"  dataAlign="left" showDetailed="true"  maxChart="8" />
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  dataAlign="left" showDetailed="true"  maxChart="15" />
				<ta:datagridItem id="akb097" key="医疗机构等级"  align="center"  dataAlign="left" showDetailed="true"  maxChart="6"  collection="AKB097"/>
				<ta:datagridItem id="aae036" key="结算时间"     align="center" dataAlign="center" maxChart="7"   sortable="true"/>
				<ta:datagridItem id="akc264" key="总费用"      align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akc228" key="全自费费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="akc268" key="超限额费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka318" key="先自付费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="yka319" key="范围内费用"  align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="ake034" key="账户支出"    align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
				<ta:datagridItem id="xjzf" key="现金支付"      align="center"  dataAlign="right" showDetailed="true"  maxChart="5"  totals="sum"  tatalsTextShow="false"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
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
	function toQuery()
	{
       var aae036_s = Base.getValue("aae036_s");
       var aae036_e = Base.getValue("aae036_e");
       if(("" == aae036_s || null == aae036_s) && ("" == aae036_e || null == aae036_e)){
    	   Base.alert("请输入结算日期范围!","warn");
       }else{
		   Base.submit("pnlCxtj","calculationTSMZZXAction!toQuery.do");
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
		var gridStr=Ta.util.obj2string(gridSelected);
		var parameter={};
		parameter['gridInfo']=gridStr;
		Base.submit("aaz217_new,aac001","calculationTSMZZXAction!toSave.do",parameter,null,false,function(data){
			   top._aaz217_new_mxbbbx = data.fieldData.aaz217_new; // 慢性病补报销结算事件ID
		   });
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>