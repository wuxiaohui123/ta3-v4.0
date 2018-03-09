<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>dytzWh</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
   <ta:pageloading />
   <ta:toolbar id="tlb">
   		<ta:button id="queryBtn" icon="xui-icon-query" key="查询信息[Q]"  onClick="query()" hotKey="ctrl+Q" asToolBarItem="true"/>
   		<ta:button id="btnDelete" icon="xui-icon-spotDelete" key="删除[D]"  onClick="todelete()" hotKey="ctrl+d" asToolBarItem="true"/>
   		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="save()" asToolBarItem="true"/>
   		<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true"/>
   </ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel  cols="3" id="fieldest1" key="查询条件">
	      <%@ include file="/yhsi3/comm/tzwhInfo.jsp"%>
		</ta:panel>
		   <ta:panel id="whxx" key="文号信息"  fit="false" height="205px" >  
		      <ta:datagrid id="list"  columnFilter="true"   fit="true" border="true" onRowDBClick="dbclick"  forceFitColumns="true">  
		         <ta:datagridItem field="aaa134" key="调整文号" />  
		         <ta:datagridItem field="aae212" key="调整年月" /> 		         
			     <ta:datagridItem field="aae140" key="险种类别" collection="aae140" />  
			     <ta:datagridItem field="aaa135" key="文号内容" showDetailed="true"/> 
			     <ta:datagridItem id="aae013" key="备注" showDetailed="true"/>  
			     <ta:datagridItem id="aaz095" key="待遇调整ID" hiddenColumn="false" />  
			  </ta:datagrid>  
		   </ta:panel>  
		<ta:panel cssStyle="margin:5px;" cols="4" id="fieldest2" key="文号信息" >
		   <ta:text id="aaz095_1"    key="待遇调整方案ID" display="false"/>
		   <ta:text id="aaa134_1" span="2" key="调整文号" maxLength="100"/>
		   <ta:selectInput id="aae140_1" key="险种类型" collection="aae140" filter="110,120,150,210,410" readOnly="true" reverseFilter="true"/>
		   <ta:date id="aae212_1" key="调整年月" showSelectPanel="true" issue="true"/>
		   <ta:textarea id="aaa135_1"  key="文号内容"  span="4" maxLength="2000" height="40px" columnWidth="0.5"/>
		   <ta:textarea id="aae013_1"  key="备注" maxLength="2000" height="40px" columnWidth="0.5"/>
		</ta:panel>  
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout(); 
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});	
	
	//双击事件
	function dbclick(e,row){
	        Base.clearData('fieldest2');
	        var aaa134 = row.aaa134;
	        Base.setValue("aaa134_1",aaa134);
	        Base.setValue("aae140_1",row.aae140);
	        Base.setValue("aaz095_1",row.aaz095);
	        Base.setValue("aaa135_1",row.aaa135);
	        Base.setValue("aae212_1",row.aae212);
	        Base.setValue("aae013_1",row.aae013);	        
	        Base.setRequired(["aae140_1","aaa134_1",]);
	        Base.setRequired(["aae212_1","aae212_1",]);
	}
	
	//查询支付信息
    function query(){
	    Base.submit("form1","dytzWhAction!queryInfo.do");
	    Base._setEnable("saveBtn", true);
	    Base.clearData('fieldest2');
    }
	//保存数据
	function save(){
	    var aae140 = Base.getValue("aae140_1");
	    var aaa135 = Base.getValue("aaa135_1");
	    var aaa134 =  Base.getValue("aaa135_1");
	    if(aae140 == ''||aaa135 ==''||aaa134 ==''){
	       alert("险种类型或文号内容或文号为空！！");
	    }else{
	      Base.submit("form1", "dytzWhAction!toSave.do");	   
	    }
	}
	//保存数据
	function todelete(){
	    var aaz095 = Base.getValue("aaz095_1");
	    var aaa134 = Base.getValue("aaa134_1");
	    if(aaz095 == ''||aaa134 ==''){
	       alert("调整文号及调整方案为空！");
	    }else{
	      Base.submit("form1", "dytzWhAction!toDelete.do");	   
	    }
	}
	//查询文号信息
	function fn_aaa134() {
		Base.getValue("aaa134");
		Base.submit("form1", "dytzWhAction!queryaaa134.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>