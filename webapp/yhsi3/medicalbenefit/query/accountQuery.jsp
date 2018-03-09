<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人账户信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
			<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="q"   onClick="toQuery()" />
			<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="r"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:panel id="pnlCxtj"  key="查询条件"  cols="3">
			    <ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="80" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				   </ta:buttonLayout>
			    </ta:box>
		        <ta:text id="aac003"  key="姓名"     readOnly="true"  labelWidth="80"/>
			    <ta:selectInput id="ykc005" key="人员类型" collection="YKC005" filter="1101,1102,2101,4101,4102,5101" labelWidth="80"/>
			    <ta:box cols="2">
					<ta:text id="aab001" key="单位ID" labelWidth="80" onChange="getAb01Info()" columnWidth="0.9"/>
					<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
					   <ta:button id="ogniSmallBtn" key="?" onClick="showOgniWindow()" />
					</ta:buttonLayout>
			    </ta:box>
			    <ta:text id="aab003"  key="单位名称"  readOnly="true"   labelWidth="80" />
			    <ta:selectInput id="aaa119" key="账户类型" collection="AAA119" filter="31,39" reverseFilter="true" labelWidth="80"/>
			    <ta:box id="bxAaae240"  span="1" cols="2">
				    <ta:number id="aae240_min"  key="账户余额"  labelWidth="80" min="0"  columnWidth="0.6"/>
				    <ta:number id="aae240_max"  key="至"       labelWidth="15" max="99999999.99"  columnWidth="0.4"/>
				</ta:box>    
			    <ta:selectInput id="aaa027" key="统筹区"    labelWidth="80"/>
		    </ta:panel>
		    <ta:panel  id="accountInfo" key="个人账户信息"  fit="true">
				<ta:datagrid id="accountList"  fit="true"  haveSn="true" snWidth="30" >
				     <ta:datagridItem id="aac001" key="人员ID" width="110" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aac003" key="姓名" width="110" showDetailed="true" align="center"/>
				     <ta:datagridItem id="yab139" key="统筹区" collection="aab034" width="110" showDetailed="true" align="center"/>
				     <ta:datagridItem id="aab001" key="单位编号" width="110" showDetailed="true" align="center"/>
				     <ta:datagridItem id="aab003" key="单位名称" width="110" showDetailed="true" align="center"/>
			         <ta:datagridItem id="aac004" key="性别" collection="AAC004" width="80" showDetailed="true"  align="center"/>
			         <ta:datagridItem id="ykc005" key="人员类型" collection="ykc005" width="80" showDetailed="true"  align="center"/>
			         <ta:datagridItem id="aac002" key="身份证号码" width="140" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aaz500" key="卡号" width="160" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aaa119" key="账户类型" collection="AAA119" width="200" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae240" key="账户余额" dataAlign="right" width="110" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae238" key="本金" dataAlign="right" width="110" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae239" key="利息" dataAlign="right" width="110" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae357" key="账户支出总额" dataAlign="right" width="110" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae206" key="账户建立年月" width="120" showDetailed="true" hiddenColumn="true" align="center"/>
				     <ta:datagridItem id="aae237" key="账户终结日期" width="120" showDetailed="true" hiddenColumn="true"  align="center"/>
				     <ta:datagridItem id="aac062" key="账户建立原因" collection="AAC062" width="150" hiddenColumn="true" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae100" key="当前有效标志" collection="AAE100" width="120" showDetailed="true"  align="center"/>
				     <ta:dataGridToolPaging url="accountQueryAction!toQuery.do" selectExpButtons="1,2,3" submitIds="baseInfo" pageSize="500" ></ta:dataGridToolPaging>
				</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
   // 人员ID change事件
   function callbackFunPerson(){
	   
	}

    // 人员ID change事件
    //单位窗口回调函数
	function callbackFunOgni(){
    }
  
	//查询
	function toQuery() {
		var aac001 = Base.getValue("aac001");
		var aab001 = Base.getValue("aab001");
		if((null == aac001 || "" == aac001)&&
		   (null == aab001 || "" == aab001)
		   ){
			  Base.alert("人员ID和单位ID必须输入一个!","warn");
			  return false;
			}else{
				Base.clearGridData("accountList");
				Base.submit("pnlCxtj","accountQueryAction!toQuery.do");
			}
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>