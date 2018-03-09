<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人缴费明细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading/>
    <ta:toolbar id="tlb">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()"  asToolBarItem="true"/>
		<ta:button key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('win_jf');" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form fit="true">
	    <ta:panel id="pnlCx" key="查询条件" cols="3">
	      <ta:text id="aac001" key="当前人员ID" display="false"/>
	      <ta:box cols="2">
		      <ta:date id="aae003_s" key="费款所属期"  issue="true" showSelectPanel="true"  columnWidth="0.6"/>
		      <ta:date id="aae003_e" key="至"  issue="true" showSelectPanel="true"  columnWidth="0.4" labelWidth="15"/>
		  </ta:box>    
	      <ta:selectInput id="aae140" key="险种类型"  collection="YL140" maxVisibleRows="8"/>
	    </ta:panel>  
	    <ta:panel key="缴费信息" fit="true">
	        <ta:tabs fit="true" >
	          <ta:tab id="tbSj"  key="实缴信息" >
				  <ta:datagrid id="yjGrid" haveSn="true" fit="true"  forceFitColumns="true" columnFilter="true">
		             <%@ include file="../common/personjiaofei.jsp"%>
				 </ta:datagrid>
		     </ta:tab>		 
	          <ta:tab id="tbJfjs"  key="缴费基数" >
				  <ta:datagrid id="ac04Grid" haveSn="true" fit="true"  forceFitColumns="true" >
				     <ta:datagridItem id="aae140"  key = "险种类型"  collection="AAE140"  align="center"  dataAlign="center"  sortable="true"  maxChart="6"/>
				     <ta:datagridItem id="aae149"  key = "年月"          align="center"  dataAlign="center"  sortable="true"  maxChart="6"/>
				     <ta:datagridItem id="aac040"  key = "工资"          align="center"  dataAlign="center"  sortable="true"  maxChart="6"/>
				     <ta:datagridItem id="aae180"  key = "人员缴费基数"   align="center"  dataAlign="center"  sortable="true"  maxChart="6"/>
				 </ta:datagrid>
		     </ta:tab>		 
		   </ta:tabs>	 
	  </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnQuery()
	{
	   Base.submit("pnlCx","<%=path %>/medicalbenefit/calculation/centerCalculationAction!toQueryJiaoFeiForJsp.do");	
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>