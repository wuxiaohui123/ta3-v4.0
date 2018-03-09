<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员参保批量调动</title>
<%@ include file="/ta/inc.jsp"%>
</head>
   <body class="no-scrollbar">
       <ta:pageloading />
       <ta:toolbar id="tlb">
		   <ta:button id="saveBtn"  key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();"  asToolBarItem="true" />
		   <ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true"/>
	   </ta:toolbar>
       <ta:form id="form1" cssStyle="overflow:auto;" fit="true">
       		<ta:box id="procInc">
		       <%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		    </ta:box>
		    
		<ta:box id="unitXb"> 	
			<ta:panel id="fltbase" key="单位基本信息" cols="3">      
	           	<ta:box cols="2">
					<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" columnWidth="0.9" onChange="callDwRPC()" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()"/>
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
				<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
				<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" maxVisibleRows="10" />
				<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />						 
				<ta:text id="aae140" key="单位参保险种" readOnly="true"  labelWidth="120" display="false"/>	           
		   </ta:panel>				   
		    </ta:box> 
		    
		    <!-- 用于初始化隐藏 -->
		    <ta:box id="box1">		    	    
			    <ta:panel id="xzlx" key="续保单位已参保险种" expanded="true" scalable="false" >
					<ta:fieldset cssStyle="border:0px">
						<ta:checkboxgroup id="ckb">
							<ta:box cols="8">
								<ta:box span="1">
									<ta:checkbox id="aae140_all" value="aae140_all" key="全选" onClick="checkedAae140All('all')" />
								</ta:box>
								<ta:box span="1">
									<ta:checkbox id="aae140_110" value="aae140_110" key="企业养老" onClick="checkedAae140('110')" />
									<ta:checkbox id="aae140_120" value="aae140_120" key="事业养老" onClick="checkedAae140('120')" />
								</ta:box>
								<ta:box span="1">
									<ta:checkbox id="aae140_210" value="aae140_210" key="失业" onClick="checkedAae140('210')" />
								</ta:box>
								<ta:box span="1">
									<ta:checkbox id="aae140_310" value="aae140_310" key="基本医疗" onClick="checkedAae140('310')" />
									<ta:checkbox id="aae140_330" value="aae140_330" key="大额救助" onClick="checkedAae140('330')" />
									<ta:checkbox id="aae140_320" value="aae140_320" key="公务员补助" onClick="checkedAae140('320')" />
									<ta:checkbox id="aae140_370" value="aae140_370" key="企业补充" onClick="checkedAae140('370')" />
								</ta:box>			
								<ta:box span="1">
									<ta:checkbox id="aae140_410" value="aae140_410" key="工伤" onClick="checkedAae140('410')" />
								</ta:box>
								<ta:box span="1">
									<ta:checkbox id="aae140_510" value="aae140_510" key="生育" onClick="checkedAae140('510')" />
								</ta:box>
							</ta:box>
						</ta:checkboxgroup>
					</ta:fieldset>
				</ta:panel>
			    			    			    
			    <ta:tabs id="tabs_aae140All" height="85">			    	    
			         <ta:tab key="续保原因设置" cols="2" id="reasonSet">
			            <ta:number id="aac040" key="缴费工资" required="true" max="999999999" labelWidth="120" asAamount="true" amountPre="￥" precision="2"/>
					    <ta:selectInput id="aac066" key="参保身份" required="true" collection="AAC066" labelWidth="120" selectFirstValue="true"/>
					    <ta:selectInput id="aac013" key="用工形式" required="true" collection="AAC013" labelWidth="120" selectFirstValue="true"/>
					    <ta:date id="ajc050" key="本次参保日期" required="true" showSelectPanel="true"  labelWidth="120" />
					    <ta:selectInput id="aae160_z" key="变更原因" labelWidth="120"  collection="AAE160" value="6201" readOnly="true"/>
					    <ta:text id="aae013_z" key="备注" maxLength="100" labelWidth="120" span="2"/>
			         </ta:tab>
			         <!-- 续保单位的征缴规则-->
	   				 <%@ include file="/yhsi3/commonJSP/xzlx_tab_gr.jsp"%>	
	   			</ta:tabs>
			    			    
			    <ta:panel id="fldz" key="录入需要续保的人员" cols="3" expanded="false" scalable="false">
			  	<ta:box cols="2">
					<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()"/>
					</ta:buttonLayout>
				</ta:box>
				   <ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120"/>
				   <ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="120"/>				   
	   			</ta:panel>
			    		    			    
			    <ta:box cols="3" height="400px">
			        <!-- 主单位暂停人员信息 -->
			        <ta:box columnWidth="0.48" fit="true">
			           <ta:tabs fit="true">		           			               
			               <ta:tab id="tab1" key="需要续保人员">
			                   <ta:datagrid id="ac01Old" forceFitColumns="true" columnFilter="true" snWidth="25" haveSn="true" fit="true" selectType="checkbox">
								   <ta:datagridItem click="fnDelRowOld" icon="icon-table_delete" key="删除" width="35" align="center"/>	
								   <ta:datagridItem id="aac001" key="人员编号"/>
								   <ta:datagridItem id="aac003" key="姓名"/>
								   <ta:datagridItem id="aac002" key="证件号码" width="125"/>
								   <ta:datagridItem id="aac040" key="缴费工资">
								          <ta:datagridEditor type="number" min="0" max="999999999999.99" required="true"/>
								   </ta:datagridItem>
								   <ta:datagridItem id="ajc050" key="个人参保日期" width="140"/>							   
								</ta:datagrid>							
			               </ta:tab>
			           </ta:tabs>
			        </ta:box>
			        
			        <!-- 按钮 -->
			        <ta:box id="anjian" cssStyle="padding-top:150px;text-align:center;" columnWidth="0.04" cols="1">
						<div class="fielddiv">
							<ta:button icon="addAllBtn" isShowIcon="true" onClick="addRight()" asToolBarItem="true" />
						</div>
						
						<div class="fielddiv">
							<ta:button icon="delAllBtn" isShowIcon="true" onClick="addLeft()" asToolBarItem="true" />
						</div>
					</ta:box>
			        
			        <!-- 调入的单位框 -->
			        <ta:box columnWidth="0.48" height="400px">		        
			           <ta:tabs fit="true">	    			           
			               <ta:tab id="tab3" key="被调入人员">
			                   <ta:datagrid id="ac01New" forceFitColumns="true" columnFilter="true" snWidth="25" haveSn="true" fit="true" selectType="checkbox">
								   <ta:datagridItem click="fnDelRowNew" icon="icon-table_delete" key="删除" width="35" align="center"/>	
								   <ta:datagridItem id="aac001" key="人员编号"/>
								   <ta:datagridItem id="aac003" key="姓名"/>
								   <ta:datagridItem id="aac002" key="证件号码" width="125"/>
								   <ta:datagridItem id="aac040" key="缴费工资">
								          <ta:datagridEditor type="number" min="0" max="999999999999.99" required="true"/>
								   </ta:datagridItem>	
								   <ta:datagridItem id="ajc050" key="个人参保日期" width="140"/>					   
								</ta:datagrid>							
			               </ta:tab>
			            </ta:tabs>		           
			        </ta:box>		    
			    </ta:box>
			    
		   </ta:box>
	  </ta:form>
  </body>
</html>
<script type="text/javascript">	
	$(document).ready(function() {
		$("body").taLayout();
		$('#aab001').keydown(function(event){
			if(event.keyCode == 13){
				$('#aab001').blur();
				$('#aab001').focus();
			}
		});
		$('#aac001').keydown(function(event){
			if(event.keyCode == 13){
				$('#aac001').blur();
				$('#aac001').focus();
			}
		});
		Base.focus("aab001");	
        initializeSuggestFramework(2, '', 'aab001', 500, 300, 3, fn_queryAb01, 0, false); 
		initializeSuggestFramework(1, '', 'aac001', 700, 200, 6, fn_queryAc01, 0, false);
	});
	
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']":Base.getValue('aab001')});
	}
 	function showDwRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
    }
    
    function fn_setDwData(){
    	Base.submit("form1","employeePlChangeAction!queryUnitInfo.do",null,false,false,function(){
			fnCheckAae140();
		});
    	Base.setValue("aab001", parent.getValue("aab001"));
    }
    
    function callRyRPC(){
		sfwQueryUtil_newRPC(1,'getAc01String',{"dto['inputString']":Base.getValue('aac001')});
	}
 	function showRyRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
    }
    
    function fn_setRyData(){
    	Base.submit("form1","employeePlChangeAction!queryAc20Info.do",{"ac01Old":Ta.util.obj2string(Base.getGridData("ac01Old")),
            		"ac01New":Ta.util.obj2string(Base.getGridData("ac01New"))},false,false,null);
    	Base.setValue("aac001", parent.getValue("aac001"));
    }
    
	//回调函数,查询主单位基本信息
	function fn_queryAb01(){
		if(g_Suggest!=""){
			Base.setValue("aab999",g_Suggest[0]);
			Base.setValue("aab001",g_Suggest[1]);
			Base.setValue("aae044",g_Suggest[2]);
			Base.setValue("aab019",g_Suggest[3]);
			Base.setValue("yab019",g_Suggest[4]);			
			Base.submit("form1","employeePlChangeAction!queryUnitInfo.do",null,false,false,function(){
				fnCheckAae140();
			});
   		}
	}
	
	//续保人员查询
	function fn_queryAc01(){
	  if(g_Suggest!=""){
		Base.setValue("aac001",g_Suggest[2]);	
		Base.setValue("aac002",g_Suggest[0]);	
		Base.setValue("aac003",g_Suggest[1]);
		Base.submit("form1","employeePlChangeAction!queryAc20Info.do",{"ac01Old":Ta.util.obj2string(Base.getGridData("ac01Old")),
			                                                           "ac01New":Ta.util.obj2string(Base.getGridData("ac01New"))},false,false,null);
	  }
	}
	
	
	//根据单位参保险种进行勾选
	function fnCheckAae140(){		
		//全选按钮不选择
		Base.setValue("aae140_all","");
		//全部险种
	    var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];
	    var len = aae140Arr.length;    
	    //界面初始话不显示,不勾选
	    for(i=0;i<len;i++){
	        //不勾选
	    	Base.setValue("aae140_"+aae140Arr[i],"");
	        //隐藏
	    	Base.hideObj("aae140_" +aae140Arr[i]);		  
		}
	    //获取单位参加的险种
	    var aae140sUnit = $('#aae140').val();
	    //根据单位参加的险种进行显示和勾选
	    for(i=0;i<len;i++){
	      if(aae140sUnit.indexOf(aae140Arr[i])>=0){
	    	//勾选
	    	Base.setValue("aae140_"+aae140Arr[i],"aae140_"+aae140Arr[i]);
	    	//显示
	    	Base.showObj("aae140_" +aae140Arr[i]);		
	    	Base.setValue("aae140_all","aae140_all");
	      }	
	    }
	}
	
	//全部勾选按钮
	function checkedAae140All(aae140s){
	  var flag = aae140s;
	  //全部险种
	  var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];
	  var len = aae140Arr.length;
	  //单位险种
	  var aae140sUnit = $('#aae140').val();
	  //如果触发的是全选框,则触发相应的全选框事件
	  if($("#aae140_all").prop('checked')){
		//勾选所有险种
		for(i=0;i<len;i++){
		  if(aae140sUnit.indexOf(aae140Arr[i])>=0){
			//勾选
		    Base.setValue("aae140_"+aae140Arr[i],"aae140_"+aae140Arr[i]);
		    Base.showObj("tab_"+aae140Arr[i]);
		  }		
		}
	  }
	  
	  if(!$("#aae140_all").prop('checked')){
		//取消勾选所有险种
		for(i=0;i<len;i++){
	      if(aae140sUnit.indexOf(aae140Arr[i])>=0){
			//取消勾选
		    Base.setValue("aae140_"+aae140Arr[i],"");
		    Base.hideObj("tab_"+aae140Arr[i]);
		  }	
		}  
	  }
	}
	
	//单个勾选事件
	function checkedAae140(aae140s){
	  //其余触发事件
	  if($("#aae140_"+aae140s).prop('checked')){
		//勾选所有险种
		Base.setValue("aae140_"+aae140s,"aae140_"+aae140s);
		Base.showObj("tab_"+aae140s);
	  }	  
	  if(!$("#aae140_"+aae140s).prop('checked')){
		//取消勾选所有险种
		Base.setValue("aae140_"+aae140s,"");
		Base.hideObj("tab_"+aae140s);
	  }
	  
	  //310和330绑定的触发事件	
	  var flag = aae140s;	 
	  if(flag == "310" && $("#aae140_"+flag).prop('checked')){
		  $("#aae140_330").prop('checked',true);
		  Base.setValue("aae140_330","aae140_330");
		  Base.showObj("tab_330");
	  }
	  if(flag == "310" && !$("#aae140_"+flag).prop('checked')){
		  Base.setValue("aae140_330","");	
		  Base.hideObj("tab_330");
	  }
	  if(flag == "330" && $("#aae140_"+flag).prop('checked')){
		  Base.setValue("aae140_310","aae140_310");
		  Base.showObj("tab_310");
	  }
	  if(flag == "330" && !$("#aae140_"+flag).prop('checked')){
		  Base.setValue("aae140_310","");
		  Base.hideObj("tab_310");
	  }
	  
	  //单位险种
	  var aae140sUnit = $('#aae140').val();	  
	  //全部险种
	  var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];
	  //判断有一个险种没有勾选,则取消全选按钮,相反同样  
	  var isChecked = true;	  
	  for(var i=0;i<aae140Arr.length;i++){		  
		if(aae140sUnit.indexOf(aae140Arr[i])>=0){			
		  if(!$("#aae140_"+aae140Arr[i]).prop('checked')){
			  isChecked = false;
			  continue;  
		  }	
		}		
	  }	  
	  if(isChecked){
		 Base.setValue("aae140_all","aae140_all");
	  }else{
		 Base.setValue("aae140_all","");
	  }
	  
	}
	
	//添加选中行到右边
	function addRight() {
		var selected=Base.getGridSelectedRows("ac01Old");
		if(selected.length==0){
		  return true;
		}
		if(selected && selected.length>0){
			Base.deleteGridSelectedRows("ac01Old");
			var a = Base.getGridData("ac01New");
			for(var i = 0;i < selected.length; i++){
				selected[i].bz = "1";
			}
			a = a.concat(selected);
			Base._setGridData("ac01New", a);
		}else{
			Base.alert("请先选择可选人员","warn");
			return false;
		}
	}
	
	//添加选中右边行到左边
	function addLeft() {
		var selected=Base.getGridSelectedRows("ac01New");
		if(selected && selected.length>0){
			Base.deleteGridSelectedRows("ac01New");
			var a = Base.getGridData("ac01Old");
			for(var i = 0;i < selected.length; i++){
				selected[i].bz = "1";
			}
			a = a.concat(selected);
			Base._setGridData("ac01Old", a);
		}else{
			Base.alert("请先选择可选人员","warn");
			return false;
		}
	}
	
	
	//删除修改的
	function fnDelRowOld(data){
		Base.confirm("确认要删除?",function(btn, callback,options) {
			if (btn) {	
				Base.deleteGridRow('ac01Old',data.row);
			}
		});
	}
	function fnDelRowNew(data){
		Base.confirm("确认要删除?",function(btn, callback,options) {
			if (btn) {	
				Base.deleteGridRow('ac01New',data.row);
			}
		});
	}
	
	//保存经办信息
	function toSave(){ 	
		//构造提交了那些单位参保险种
		var arrayAac001 = "";
		//全部险种
		var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];				
		for(var i=0;i<aae140Arr.length;i++){		
		  if($("#aae140_"+aae140Arr[i]).prop('checked')){
			 arrayAac001 += aae140Arr[i]+",";
		  }	
		}
		if(arrayAac001.length==0){
		  return Base.alert("未勾选有效的险种,请检查!","warn");	
		}
		var aac040 = $("#aac040").val();//缴费工资
		if(aac040 == "" ){
		  return Base.alert("缴费工资不能为空!","warn");	
		}
		var aac066 = $("#aac066").val();//参保身份
		if(aac066 == "" ){
		  return Base.alert("参保身份不能为空!","warn");	
		}
		var aac013 = $("#aac013").val();//用工形式
		if(aac013 == "" ){
		  return Base.alert("用工形式不能为空!","warn");	
		}
		var myData = Base.getGridData("ac01New");
		var param = {};
		if(myData.length == 0){
		  return Base.alert("请添加有效人员进行调入!","warn");
		}		
		Base.confirm("本次共计调入:<span style='color:#ff0000;'>"+myData.length+"</span>人,是否确认提交?", function(btn, callback) {
			if (btn) {
				Base.submit("form1", "employeePlChangeAction!toSave.do",{"dto['aae140sCheck']":arrayAac001,"ac01New":Ta.util.obj2string(Base.getGridData("ac01New"))});
			}
		});
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>			