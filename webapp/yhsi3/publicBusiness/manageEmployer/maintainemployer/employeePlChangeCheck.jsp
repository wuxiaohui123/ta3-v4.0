<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员参保批量调入审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
   <body class="no-scrollbar">
       <ta:pageloading />
       <ta:toolbar id="tlb">
		   <ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();"  asToolBarItem="true" />
		   <ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
	   </ta:toolbar>
       <ta:form id="form1" cssStyle="overflow:auto;" fit="true">
       
       		<ta:box id="procInc">
		       <%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		    </ta:box>
		    
		    <ta:box id="procInfo">
			    <%@ include file="/yhsi3/comm/veritySuggestViewGg2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次"/>
		    </ta:box>
		    
		    <ta:text id="aab001" key="单位编号" display="false"/>
		     
		    <ta:panel key="人员续保明细" fit="true">
			     <ta:datagrid id="ac22Info" forceFitColumns="true" columnFilter="true" snWidth="30" haveSn="true" fit="true">
			        <ta:datagridItem id="aac001" key="人员编号"/>
			        <ta:datagridItem id="aac003" key="姓名" showDetailed="true"/>
					<ta:datagridItem id="aac002" key="证件号码" width="150"/>
					<ta:datagridItem id="aac004" key="性别"  collection="AAC004" width="40"/>  
			        <ta:datagridItem id="aab001" key="单位编号"/>
			        <ta:datagridItem id="aae044" key="单位名称" width="200" showDetailed="true"/>
			        <ta:datagridItem id="aae140" key="险种类型"  collection="AAE140" width="180" showDetailed="true"/>
			        <ta:datagridItem id="aac013" key="用工形式" collection="AAC013"/>
					<ta:datagridItem id="aac066" key="参保身份" collection="AAC066"/>
					<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center"/>	
					<ta:datagridItem id="ykc005" key="人员类型"  collection="YKC005" width="120" showDetailed="true"/>
					<ta:datagridItem id="ykc006" key="人员类别"  collection="YKC006" width="120" showDetailed="true"/>
					<ta:datagridItem id="aaz136" key="基数核定规则" showDetailed="true" collection="AAZ136" width="200"/>
					<ta:datagridItem id="yaz289" key="征缴规则"     showDetailed="true" collection="YAZ289" width="200"/>
					<ta:datagridItem id="yab139" key="参保所属机构"  width="150" collection="YAB003" showDetailed="true"/>
				</ta:datagrid>			    
		    </ta:panel>		    
	  </ta:form>
  </body>
</html>
<script type="text/javascript">	
	$(document).ready(function() {
		$("body").taLayout();
		
	});
		
	//保存经办信息
	function toSave(){ 	
		Base.submit("form1", "employeePlChangeCheckAction!toSave.do",null,false,false,false,false);
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>			