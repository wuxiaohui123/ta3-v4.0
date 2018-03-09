<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>batchAdjust</title>
<%@ include file="/ta/inc.jsp"%>
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
		<ta:panel id="qCon" key="调整条件" cols="3" >  
	      <ta:selectInput id="aaa134" key="调整文号" required="true" collection="TZWH" span = "1" showKey="true" maxVisibleRows="10" onSelect="fnSetAa40" labelWidth="130" />
	      <ta:text id="aae212" key="调整年月" readOnly="true" labelWidth="130"/>
	      <ta:text id="aae176" key="最低工资" readOnly="true" labelWidth="130"/>
	      <ta:text id="yab003" key="经办机构" display="false" labelWidth="130"/>
	      <ta:textarea id="aaa135" key="文号内容" span="3" height="50" labelWidth="130" readOnly="true">	</ta:textarea>
		  <ta:selectInput id="yae230"  collection="YAE230"  labelWidth="130" cssStyle="color:red" key="是否产生补扣" value="1"/>
		  <ta:text id="aae013"   labelWidth="130" key="备注" span="3" maxLength="50" /> 
		</ta:panel>
		<ta:tabs id="tabs1" fit="true" >  
		   <ta:tab id="tab1" key="可参与调资人员信息"  > 
		      <ta:datagrid id="list" fit="true" border="true" onRowDBClick="dbclick"  forceFitColumns="true" selectType="checkbox" >  
		         <ta:datagridItem id="aaz257" key="享受定期待遇人员ID" width="140px" align="center" hiddenColumn="true" />  
			     <ta:datagridItem id="aab001" key="单位ID" align="center" width="100"/>  
			     <ta:datagridItem id="aac001" key="人员ID" align="center" width="100"/>  
			     <ta:datagridItem id="aac003" key="姓名" align="center" width="100" />  
			     <ta:datagridItem id="aac002" key="身份证号" align="center" width="120" />  
			     <ta:datagridItem id="aae116" key="待遇发放状态" collection="AAE116" align="center"  width="100"/>  
			     <ta:datagridItem id="aae210" key="待遇享受开始年月" align="center"  width="120"/>  
			     <ta:datagridItem id="yac001" key="个人最大发放期号" align="center"  width="120"/>  
			     <ta:datagridItem id="ajc072" key="本次失业缴费月数" align="center"  width="120"/>  
			     <ta:datagridItem id="zje" key="待遇合计" align="center" dataAlign="right"  width="100"/>  
			     <ta:datagridItem id="yab003" key="经办机构" collection="YAB003" align="center"  hiddenColumn="true"/>  
			  </ta:datagrid>  
	       </ta:tab>
		   <ta:tab id="tab2" key="已调资人员待遇信息"  > 
		      <ta:datagrid id="list2" fit="true" border="true"  forceFitColumns="true">  
		         <ta:datagridItem id="aaz257" key="享受定期待遇人员ID" width="140px" align="center" hiddenColumn="true"/>  
			     <ta:datagridItem id="aab001" key="单位ID" align="center"  width="100"/>  
			     <ta:datagridItem id="aac001" key="人员ID" align="center"  width="100"/>  
			     <ta:datagridItem id="aac003" key="姓名" align="center" width="100" />  
			     <ta:datagridItem id="aac002" key="身份证号" align="center" width="120" />  
			     <ta:datagridItem id="aae188" key="每月增资额"  dataAlign="right" align="center"  width="100"/>  
			     <ta:datagridItem id="aae041" key="补发开始年月" align="center"  width="100"/>  
			     <ta:datagridItem id="aae042" key="补发结束年月" align="center"  width="100"/>  
			     <ta:datagridItem id="aae058" key="补发总金额"  dataAlign="right" align="center"  width="100"/>  
			  </ta:datagrid>  
	       </ta:tab>
		   <ta:tab id="tab3" key="本次调资错误信息"  > 
		      <ta:datagrid id="list3" fit="true" border="true" onRowDBClick="dbclick"  forceFitColumns="true">  
			     <ta:datagridItem id="aab001" key="单位ID" align="center" width="100"/>  
			     <ta:datagridItem id="aac001" key="人员ID" align="center" width="100"/>  
			     <ta:datagridItem id="aac003" key="姓名" align="center" width="100" />  
			     <ta:datagridItem id="aac002" key="身份证号" align="center" width="120" />  
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
	        Base.setValue("aaz095",row.aaz095);
	        Base.setValue("aaa135",row.aaa135);
	        Base.setRequired(["aae140_1","aaa134_1",]);
	   		Base._setReadOnly(["aae140_1"],true);
	}
	
	//查询基本信息
    function query(){
        var aaa134 = Base.getValue("aaa134");
        if(aaa134 == ''){
	       alert("请选择调整文号进行查询！");
	    }else{
	       Base.submit("form1","umeBatchAdjustAction!queryInfo.do");
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
	      Base.submit("form1","umeBatchAdjustAction!toSave.do",prm,null,null,function(data){
	       });
	    }        
	}
	
	// 选择下拉列表赋值
	function fnSetAa40(value,key) {
	     Base.submit("form1","umeBatchAdjustAction!queryAa40.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>