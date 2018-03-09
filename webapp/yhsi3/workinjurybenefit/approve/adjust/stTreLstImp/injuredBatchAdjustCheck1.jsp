<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>injuredbatchAdjust</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
   <ta:pageloading />
	<ta:form id="form1" fit="true">
	<ta:toolbar id="tlb">
	    <ta:buttonLayout align="center" span="3">
	       <ta:button id="saveBtn" key="批量调整审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();"  asToolBarItem="true" />
		   <ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	    </ta:buttonLayout>
	</ta:toolbar>
	  <ta:panel id="procInc" key="审核信息">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>		
		 </ta:panel>
		<ta:panel id="qCon" key="查询条件" cols="3" >
		 		
		  <%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
	      <ta:selectInput id="aaa135" key="调整文号" span = "2" showKey="true" maxVisibleRows="10" />
	      <ta:text id="aae212" key="调整年月" readOnly="true" />
	      <ta:text id="yab003" key="经办机构" display="false" />
	      <ta:text id="fhjc" display="false" key="复核级次" />
		</ta:panel>
		<ta:tabs id="tabs1" fit="true" >  
		   <ta:tab id="tab2" key="调资人员待遇信息"  > 
		      <ta:datagrid id="list2" fit="true" border="true"  forceFitColumns="true">  
		         <ta:datagridItem id="aaz257" key="享受定期待遇人员ID" width="140px" align="center" hiddenColumn="true"/>  
			     <ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="right" width="80"/>  
			     <ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="right" width="80"/>  
			     <ta:datagridItem id="aac003" key="姓名" align="center" width="80" />  
			     <ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="right" width="120" hiddenColumn="true"/> 
			     <ta:datagridItem id="aaa036" key="待遇类别" align="center" collection="AAA036" width="100"/>
			     <ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center"  width="80"/>  
			     <ta:datagridItem id="alc060" key="护理等级" collection="ALC060" align="center"  width="80"/>
			     <ta:datagridItem id="aae144" key="供养关系" collection="AAE144" align="center"  width="80"/>  
			     <ta:datagridItem id="aae192" key="调整前金额"  dataAlign="right" align="center"  width="80" formatter="convertState"/> 
			     <ta:datagridItem id="aae193" key="调整后金额"  dataAlign="right" align="center"  width="80" formatter="convertState"/> 
			     <ta:datagridItem id="aae176" key="每月增资额"  dataAlign="right" align="center"  width="80" formatter="convertState"/>  
			     <ta:datagridItem id="aae041" key="补发开始年月" align="center" dataAlign="center" width="120"/>  
			     <ta:datagridItem id="aae042" key="补发结束年月" align="center" dataAlign="center" width="120"/>  
			     <ta:datagridItem id="aae058" key="补发总金额"  dataAlign="right" align="center"  width="80" formatter="convertState"/>  
			  </ta:datagrid> 
	       </ta:tab>
	    </ta:tabs>   
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		//$("body").taLayout(); 
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});	
	
	//流程流转
	function submitData(){
		Base.submit("form1", "injuredBatchAdjustCheck1Action!toSave.do");
		Base.setDisabled("saveBtn");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>