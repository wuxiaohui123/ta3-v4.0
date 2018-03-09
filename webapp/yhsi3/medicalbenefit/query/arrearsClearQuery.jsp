<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医疗欠费特权报销认定</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		   <ta:toolbarItem id="btnQuery"     key="查询[Q]"  icon="xui-icon-query"       hotKey="q"   onClick="toQuery()" />
		   <ta:toolbarItem id="btnDownload"  key="导出"     icon="xui-icon-spotEdit"    onClick="toDownload()" />
		   <ta:button  id="btnReset"  key="重置[R]"   icon="xui-icon-spotReset"   hotKey="r"   asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj"  key="查询条件"  cols="3">
			    <ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="100" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				  </ta:buttonLayout>
			    </ta:box>
		        <ta:text id="aac003"  key="姓名"    readOnly="true"     />
		        <ta:text id="aac002"  key="身份证"  readOnly="true"     />
                <ta:selectInput id="aae100"  key="作废标识"  data="[{'id':'0','name':'已作废'},{'id':'1','name':'未作废'}]"  value="1"/>
                <ta:selectInput id="yke244"  key="使用标识"  data="[{'id':'0','name':'未使用'},{'id':'1','name':'已使用'}]"  />
                <ta:selectInput id="aaa027" key="统筹区"     collection="AAB034" />
                <ta:date id="aae001"   key="年度"         showSelectPanel="true"  dateYear="true"/>
                <ta:date id="aae036_s" key="经办时间(从)"  showSelectPanel="true" />
                <ta:date id="aae036_e" key="经办时间(至)"  showSelectPanel="true" />
		</ta:panel>
		<ta:panel id="arrearsClearInfo" key="医疗欠费特权报销认定信息" fit="true">
			<ta:datagrid id="arrearsClearList"  fit="true"  forceFitColumns="true"  haveSn="true" snWidth="30" >
			     <ta:datagridItem id="yke244"   key="使用标识"   align="center"  maxChart="7" sortable="true"/>
			     <ta:datagridItem id="aae100"   key="作废标识"   align="center"  maxChart="7" sortable="true"/>
			     <ta:datagridItem id="aac001"   key="个人ID"   align="center"  maxChart="7"  sortable="true"/>
			     <ta:datagridItem id="aac003"   key="姓名"     showDetailed="true"  align="center"  maxChart="3"/>
		         <ta:datagridItem id="aac004"   key="性别"     collection="AAC004"   align="center" maxChart="2"/>
		         <ta:datagridItem id="aac002"   key="身份证号" showDetailed="true"  align="center" maxChart="9"/>
                 <ta:datagridItem id="aae013"  key="备注"    showDetailed="true"   align="center"  maxChart="15"/>
                 <ta:datagridItem id="aae011"  key="经办人"     collection="AAE011"    align="center" maxChart="5" sortable="true"/>
                 <ta:datagridItem id="aae036"  key="经办时间"    showDetailed="true"   align="center"  maxChart="9" sortable="true"/>
                 <ta:datagridItem id="aaa027"  key="统筹区" collection="aab034"    align="center" maxChart="5" sortable="true"/>
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
		toQuery(); 
    }
	//查询
	function toQuery() 
	{
		Base.submit("pnlCxtj","arrearsClearQueryAction!toQuery.do");
	}
	
	// 导出
	function toDownload()
	{
		Base.expGridExcel("arrearsClearList");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>