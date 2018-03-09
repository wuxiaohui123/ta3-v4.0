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
	       <ta:button id="queryBtn" icon="xui-icon-query" key="查询信息[Q]"  onClick="query()" hotKey="ctrl+Q" asToolBarItem="true"/>
	       <ta:button id="saveBtn" icon="xui-icon-spotSave" key="待遇调整[S]" hotKey="ctrl+S" onClick="save()" asToolBarItem="true"/>
	       <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true"/>
	    </ta:buttonLayout>
	</ta:toolbar>
		<ta:panel id="qCon" key="查询条件" cols="3" >	
		  <%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>   
	      <ta:selectInput id="aaa134" key="调整文号" collection="TZWH" span = "2" showKey="true" labelWidth="130" maxVisibleRows="10" onSelect="fnSetAa40"  />
	      <ta:text id="aaz095" key="调整方案ID" display="false" labelWidth="130"/>
	      <ta:text id="aae212" key="调整年月" readOnly="true" labelWidth="130"/>
	      <ta:text id="yab003" key="经办机构" display="false" labelWidth="130"/>
	      <ta:textarea id="aaa135" key="文号内容" span="2"  height="40px" readOnly="true" labelWidth="130">	</ta:textarea>
	      <ta:textarea id="aae013" key="备注"  height="40px" readOnly="true" labelWidth="130">	</ta:textarea>
		</ta:panel>
		<ta:tabs id="tabs1" fit="true" >  
		   <ta:tab id="tab1" key="可参与调资人员信息"  > 
		      <ta:datagrid id="list" fit="true" border="true" forceFitColumns="true"   columnFilter="true"  selectType="checkbox" haveSn="true">  
		         <ta:datagridItem id="aaz257" key="享受定期待遇人员ID" width="140px" align="center" hiddenColumn="true" />  
			     <ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="right" width="100"/>  
			     <ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="right" width="100"/>  
			     <ta:datagridItem id="aac003" key="姓名" align="center" width="80" />  
			     <ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="right" width="120" hiddenColumn="true"/>  
			     <ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" align="center"  width="100"/>
			     <ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center"  width="80"/>  
			     <ta:datagridItem id="alc060" key="护理等级" collection="ALC060" align="center"  width="80"/> 
			     <ta:datagridItem id="aae144" key="供养关系" collection="AAE144" align="center"  width="80"/>    
			     <ta:datagridItem id="aae210" key="待遇开始年月" align="center" dataAlign="center" width="100"/>  
			     <ta:datagridItem id="yac001" key="最大发放期号" align="center" dataAlign="center" width="100"/>   
			     <ta:datagridItem id="zje" key="待遇合计" align="center" dataAlign="right"  width="80" formatter="convertState"/>  
			     <ta:datagridItem id="yab003" key="经办机构" collection="YAB003" align="center"  hiddenColumn="true"/>  
			  </ta:datagrid>  
	       </ta:tab>
		   <ta:tab id="tab2" key="已调资人员待遇信息"  > 
		      <ta:datagrid id="list2" fit="true" border="true"  forceFitColumns="true" columnFilter="true" haveSn="true" >  
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
		   <ta:tab id="tab3" key="本次调资错误信息"  > 
		      <ta:datagrid id="list3" fit="true" border="true" onRowDBClick="dbclick"  forceFitColumns="true">  
			     <ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="right" width="100"/>  
			     <ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="right" width="100"/>  
			     <ta:datagridItem id="aac003" key="姓名" align="center" width="100" />  
			     <ta:datagridItem id="aac002" key="身份证号" align="center" dataAlign="right" width="120" />  
			     <ta:datagridItem id="appcode" key="错误代码" align="center" width="100"/>  
			     <ta:datagridItem id="errmsg" key="错误信息" align="center" width="280" showDetailed="true" />  
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
	
	//双击事件
	function dbclick(e,row){
	        Base.clearData('fieldest2');
	        var aaa134 = row.aaa134;
	        Base.setValue("aaz095",row.aaz095);
	}
	
	//查询基本信息
    function query(){
        var aaa134 = Base.getValue("aaa134");
        if(aaa134 == ''){
	       alert("请选择调整文号进行查询！");
	    }else{
	       Base.submit("form1","injuredBatchAdjustAction!queryInfo.do");
	    }        
    }
	//保存数据
	function save(){
	   var aaa134 = Base.getValue("aaa134");
        if(aaa134 == ''){
	       alert("调整文号不能为空！");
	    }else{
	       
	       var selectRows = Base.getGridSelectedRows("list") ;
           var tempAaa121 = "";
           var vAaa121 = "";
	       if(selectRows.length == 0){
		      alert("请勾选列表数据！");
		      return false;
	         }
	      var prm ={};
          prm.list = Ta.util.obj2string(selectRows);
	      Base.submit("form1","injuredBatchAdjustAction!toSave.do",prm,null,null,function(data){
	       });
	    }        
	}
	// 选择下拉列表赋值
	function fnSetAa40(value,key) {
	     Base.submit("form1","injuredBatchAdjustAction!queryAa40.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>