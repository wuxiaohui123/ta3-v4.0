<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>未正常退休人员查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="toolbar1">
   			<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="toQuery();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="icon-reload" hotKey="R" type="resetPage" asToolBarItem="true"/>
	   </ta:toolbar>
		<ta:form id="form" fit="true">
	      	<ta:box id="hideArea">
				<ta:text id="yae099" key="业务日志ID" display="false" />
			</ta:box>
       		<ta:panel id="pan1" key="查询条件" cols="3">
				<ta:date id="start" key="开始时间" showSelectPanel="true"   onChange="fn_dateValidate('start')"/>
		    	<ta:date id="end" key="结束时间" showSelectPanel="true"  onChange="fn_dateValidate('end')"/>
            </ta:panel>
			<ta:panel id="pan2" key="未正常退休人员信息 " fit="true" >
	        	<ta:datagrid id="unitSIGrid" forceFitColumns="true"  fit="true" haveSn="true" columnFilter="true">
			    	<ta:datagridItem id="aac001" key="个人编号" align="center" totalsAlign="center" />
			    	<ta:datagridItem id="aac002" key="身份证号码" align="center" totalsAlign="center" />
			    	<ta:datagridItem id="aac003" key="姓名" align="center" totalsAlign="center"  />
			      	<ta:datagridItem id="yae099" key="业务流水号" align="center" totalsAlign="center" />
			      	<ta:datagridItem id="yae823" key="前置业务" align="center" totalsAlign="center" showDetailed="true"/>
			      	<ta:datagridItem id="yae824" key="自动业务" align="center" totalsAlign="center" showDetailed="true"/>
			      	<ta:datagridItem id="yae355" key="错误内容" align="center" totalsAlign="center" showDetailed="true"/>  
			      	<ta:datagridItem id="yae822" key="本行数据发生时间" align="center" totalsAlign="center"  showDetailed="true" dataType="date"/> 
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">	
	$(document).ready(function() {
		$("body").taLayout();
	});
	//查询
	function toQuery(){
		Base.submit("pan1","wzctxPensionQueryAction!toQuery.do");
	}
	//控制时间	
	function fn_dateValidate(id){
	   if(id=="start"){	     
	      if(!Base.getValue("end")==""&&!Base.getValue("start")==""&&Base.getValue("start")>Base.getValue("end")){
	        Base.alert("开始时间不能大于结束时间");
	        Base.setValue("start","");
	      }
	   }
	   if(id=="end"){
	      if(!Base.getValue("end")==""&&!Base.getValue("start")==""&&Base.getValue("start")>Base.getValue("end")){
	         Base.alert("开始时间不能大于结束时间");
	         Base.setValue("end","");
	      }
	   }
	}



</script>
<%@ include file="/ta/incfooter.jsp"%>		