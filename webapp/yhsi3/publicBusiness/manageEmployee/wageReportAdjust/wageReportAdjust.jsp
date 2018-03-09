<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>wageReportEmpAdjust</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:form id="form1" fit="true" >
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave();" asToolBarItem="true"/>
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true"/>
		</ta:toolbar>
	  <ta:box id="procInc">
		
		<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
	  </ta:box>
	  <ta:panel id="pnl" key="基本信息" cols="3" expanded="false" scalable="false">
	    <ta:text id="jobid"  key="服务名" labelWidth="120" required="true" maxLength="20" display="false"/>
	    <ta:text id="aae001" key="社平工资所属年度" labelWidth="120" required="true" maxLength="4"/>
        <ta:date id="zxsj" key="开始执行时间"  labelWidth="120" showSelectPanel="true" datetime="true"/>
        <ta:selectInput id="flag" key="调整类型" labelWidth="120" data = "[{'id':'1','name':'社平工资公布','py':'spgzgb'},{'id':'2','name':'到期末申报自动处理','py':'dqmsbzdcl'}]"/>	  
      </ta:panel>
	  <ta:panel id="fltUnit" key="单位基本信息" cols="3"  expanded="false" scalable="false">
		<ta:text id="aab001" key="单位编号" labelWidth="120" maxLength="20" onChange="sfwQueryUtil(1,'getAab001',Base.getValue('aab001'));" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
	    <ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
	    <ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
	    <ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
	    <ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
	 </ta:panel>
	</ta:form>
	
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1, 'ab01', 'aab001', 900, 200, 7, fnQuery, 0, false);
	});
	function fnQuery(){
		if (g_Suggest!=""){ 
		    Base.setValue("aab001",g_Suggest[1]);
		    Base.submit("fltUnit","wageReportAdjustAction!toQuery.do");
		}
	}
   //保存
   function fnSave(){
     Base.submit("form1","wageReportAdjustAction!toSave.do");
   }
	
</script>
<%@ include file="/ta/incfooter.jsp"%>