<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>employeeSupplement</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="alt+Q" onClick="queryDWRY();"  asToolBarItem="true" />
		<ta:button id="checkBtn" key="检测[C]" icon="icon-find" hotKey="alt+C" onClick="checkDATA();"  asToolBarItem="true" />
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:box id="procInc">
			
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="单位基本信息" cssStyle="overflow:auto">
				<ta:panel id="fltUnit" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="isNew" display="false" value="0"/>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:box cols="2">
						<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC()" columnWidth="0.9" />
						<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
							<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
						</ta:buttonLayout>  
					</ta:box>
					<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" maxVisibleRows="10" />
					<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />
				</ta:panel>
				<%@ include file="/yhsi3/publicBusiness/manageEmployee/employeesupplement/esc_xzlx_gr.jsp"%>
				<ta:tabs id="tabsInfo" fit="true">
					<ta:tab id="tb_cbxx" key="单位参保信息"  >
		    		   <ta:datagrid id="cb_grid" fit="true">
		    				<ta:datagridItem id="aab001_cb" key="单位ID" align="center" width="100"/>
				    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="170" align="center" dataAlign="left" />
							<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100" align="center" dataAlign="center" />
							<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100" align="center" dataAlign="left" />
							<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100"   align="center" dataAlign="left" />
							<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="220" align="center" dataAlign="left" showDetailed="true"/>
							<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="170" align="center" dataAlign="left" />
							<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="140" align="center" dataAlign="left" />
					   </ta:datagrid>
					</ta:tab>
					<ta:tab id="tb_rycbInfo" key="添加参保人员" >
						<ta:datagrid id="dg_grcbInfo"   fit="true"  selectType="checkbox" columnFilter="true">
							<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" width="100"></ta:datagridItem>
							<ta:datagridItem id="aac003" key="姓名" showDetailed="true" align="center" dataAlign="left" width="100"></ta:datagridItem>
							<ta:datagridItem id="aac002" key="身份证" showDetailed="true" align="center" dataAlign="right" width="140"></ta:datagridItem>
							<ta:datagridItem id="aae140_110" key="企业养老" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_120" key="机关养老" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_210" key="失业" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_310" key="基本医疗" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_330" key="大病补助" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_320" key="公务员补充" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_370" key="企业补充" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_340" key="离休二乙" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_410" key="工伤" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
							<ta:datagridItem id="aae140_510" key="生育" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:tab>
			<ta:tab id="Tabgrcb" key="个人参保信息">
                <%@ include file="/yhsi3/commonJSP/xzlx_gr.jsp"%>									
				 <ta:panel cols="3" id="fltCB" expanded="false" scalable="false">
					<ta:selectInput id="aac066" key="参保身份" filter="2" collection="aac066" labelWidth="120" required="true" selectFirstValue="true"/>
					<ta:selectInput id="aac013" key="用工形式" required="true" selectFirstValue="true" onSelect="fnAac013" collection="aac013" labelWidth="120" />
					<ta:date id="aac049" key="首次参保年月"    labelWidth="120" issue="true"  required="true"  onChange="fnSetAac049();" showSelectPanel="true"/>
					<ta:date id="ajc050" key="本次参加工作日期"  labelWidth="120" required="true"  onChange="fnSetAjc050();" showSelectPanel="true"/>
					<ta:text id="aae140s" key="复选框中选择的险种" display="false"/>
				</ta:panel>
				
				<ta:tabs id="tbs_xzxx" fit="true">
					<ta:tab id="tb_cbxx2" key="单位参保信息" >
						<ta:datagrid id="cb_grid2" fit="true" >
				    				<ta:datagridItem id="aab001_cb" key="单位ID" align="center" width="100"/>
						    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="170" align="center" dataAlign="left" />
									<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100" align="center" dataAlign="center" />
									<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100" align="center" dataAlign="left" />
									<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100"   align="center" dataAlign="left" />
									<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="220" align="center" dataAlign="left" showDetailed="true"/>
									<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="170" align="center" dataAlign="left" />
									<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="260" align="center" dataAlign="left" />
						</ta:datagrid>
					</ta:tab>
                   	<%@ include file="/yhsi3/commonJSP/xzlx_tab_gr.jsp"%>	
				</ta:tabs>
				
			</ta:tab>
			
			<ta:tab id="tb_sucAc22" key="参保信息校验成功信息">
						<ta:datagrid id="sucAc22" haveSn="true"  columnFilter="true" fit="true">
							<ta:datagridItem id="newold" key="参保类型" align="center"  width="80" collectionData="[{'id':'0','name':'新参保','py':'xcb'},{'id':'1','name':'续保','py':'xb'}]"/>
							<ta:datagridItem id="aac003" key="姓名" align="center"  width="90" showDetailed="true"/>
							<ta:datagridItem id="aac002" key="证件号码" align="center"  width="160" showDetailed="true"/>
							<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" width="180" showDetailed="true"/>
							<ta:datagridItem id="aac001" key="人员ID" align="center" width="120" showDetailed="true"/>
							<ta:datagridItem id="aac066" key="参保身份" align="center" width="120" collection="aac066" showDetailed="true"/>
							<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" width="160" showDetailed="true"/>
							<ta:datagridItem id="ajc050" key="本次参加工作日期" align="center" dataAlign="center" width="160" showDetailed="true"/>
							<ta:datagridItem id="yaz289" key="征缴规则类型ID" align="center" collection="YAZ289" width="220" showDetailed="true"/>
							<ta:datagridItem id="aaz136" key="基数核定规则参数ID" align="center" collection="AAZ136" width="160" showDetailed="true"/>
							<ta:datagridItem id="aac040" key="工资" width="100" align="center" dataAlign="center" showDetailed="true" >
								<ta:datagridEditor type="number" max="999999"/>
							</ta:datagridItem>
							<ta:datagridItem id="aaz159" key="人员参保关系ID" align="center" width="160" hiddenColumn="false"/>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tb_errAc22" key="参保信息校验失败信息">
						<ta:button id="expFailInsFile" key="导出失败信息" icon="icon-ok" cssStyle="margin:10px;" onClick="fnExpFile('errAc22');"/>
							<ta:datagrid id="errAc22" haveSn="true"  columnFilter="true" fit="true">
								<ta:datagridItem id="yae238" key="失败原因" align="center" width="160" showDetailed="true" formatter="fnFormatter"/>
								<ta:datagridItem id="newold" key="参保类型" align="center"  width="80" collectionData="[{'id':'0','name':'新参保','py':'xcb'},{'id':'1','name':'续保','py':'xb'}]"/>
								<ta:datagridItem id="aac003" key="姓名" align="center"  width="90" showDetailed="true"/>
								<ta:datagridItem id="aac002" key="证件号码" align="center"  width="160" showDetailed="true"/>
								<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" width="180" showDetailed="true"/>
								<ta:datagridItem id="aac001" key="人员ID" align="center" width="120" showDetailed="true"/>
								<ta:datagridItem id="aac066" key="参保身份" align="center" width="120" collection="aac066" showDetailed="true"/>
								<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" width="160" showDetailed="true"/>
								<ta:datagridItem id="ajc050" key="本次参加工作日期" align="center" dataAlign="center" width="160" showDetailed="true"/>
								<ta:datagridItem id="yaz289" key="征缴规则类型ID" align="center" collection="YAZ289" width="220" showDetailed="true"/>
								<ta:datagridItem id="aaz136" key="基数核定规则参数ID" align="center" collection="AAZ136" width="160" showDetailed="true"/>
								<ta:datagridItem id="aac040" key="工资" width="100" align="center" dataAlign="center" showDetailed="true"/>
								<ta:datagridItem id="aaz159" key="人员参保关系ID" align="center" width="160" hiddenColumn="false"/>
							</ta:datagrid>
					</ta:tab>
				<ta:tab id="sjlcTb" key="事件流程记录" >
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, '', 'aab001', 900, 200, 7, fnCheckAae140, 1, false);
		//setYkc();		 
	});
	//单位编号RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']":Base.getValue('aab001')});
	}
	function showDwRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	function fn_setDwData(){
		Base.submit(null,"employeeSupplementAction!getUnitInsu.do",{"dto['aab001']":aab001},null,false,function(data){
		    //单位管理类型：01表示普通单位，02表示灵活就业虚拟单位
			var yab019 = Base.getValue("yab019");
		    //如果是灵活就业单位，则不展示工资输入项，反之，则展示并为必输入项
		    if("02"==yab019)
		    {
               Base.setValue("aac040","");
               Base.setDisRequired("aac040");
               Base.hideObj("aac040");
		    }
		    else
		    {
               Base.setValue("aac040","");
               Base.setRequired("aac040");
               Base.showObj("aac040");
		    }
		},null);  
	}
	//通过输入单位ID和选中保险类型查询出该单位参加参加了其中一种或一种以上的保险的人员的信息，显示在datagrid里面
	function queryDWRY(){
		//从多选框中获取要查询的险种的类型
		// 是否被选择
		var ary = ['110','120','210','310','330','320','370','340','410','510'];
		var resultStr="";
     	for(var i=0;i<ary.length;i++){
     		var flag=Base.getObj("aae140_c_"+ary[i]).checked;
     		 if(flag){
	     		if(i==ary.length-1){
	     			resultStr+=ary[i];
	     		}else{
	     			resultStr+=ary[i];
	     			resultStr+=",";
	     		}
     		} 
		}
		if(resultStr==""){
			Base.alert("请选择查询的险种","warn");
			return false;
		}
		Base.submit("form1","employeeSupplementAction!queryDWRY.do",{"dto['aae140s']":resultStr});
	}
	
	//save
	function submitData(){
			//从成功的datagrid中获取数据然后调用存储过程，插入到数据库中
			var sucAc22 = Base.getGridData('sucAc22');
			if(sucAc22!=''){
				var param = {};
				if(Base.validateForm("form1")){
					param.sucAc22 = Ta.util.obj2string(sucAc22);
					Base.submit('form1','employeeSupplementAction!toSave.do',param);
				}
			}else{
				Base.alert('没有任何正确的数据，请核实！','warn');
			}
			
	}
	
	function fnAab033(value,key){
	    var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];		
		if(key!=""){
		    var len = aae140Arr.length;
		    for(i=0; i<len; i++){
		       Base.setValue("aab033_" + aae140Arr[i], key);
		    }	
		}
	} 
	
	function fnAac013(value,key){
	    var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];		
		if(key!=""){
		    var len = aae140Arr.length;
		    for(i=0; i<len; i++){
		       Base.setValue("aac013_" + aae140Arr[i], key);
		    }
		}
	}
	// 更具单位编号，查询出单位的基本信息，单位参保信息，单位参加的险种的类型（多选框）
	function fnCheckAae140 (){
	    var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];
	    var len = aae140Arr.length;
		for(i=0;i<len;i++){
			Base.setValue('aae140_'+aae140Arr[i],null);
			Base.setValue('aab050_'+aae140Arr[i],null);
			Base.setValue('aab033_'+aae140Arr[i],null);
			Base.setValue('aac013_'+aae140Arr[i],null);
			Base.setValue('yaz289_'+aae140Arr[i],null);
			Base.setValue('aaz136_'+aae140Arr[i],null);
			Base.setValue('aac030_'+aae140Arr[i],null);
		}
		if (g_Suggest!=""){ 
			Base.setValue("aab001",g_Suggest[1]);
		    var aab001 = g_Suggest[1];
		    Base.setValue("isNew","0");
		    var len = aae140Arr.length;
		    for(i=0; i<len; i++){
		       Base.hideObj("tab_" + aae140Arr[i]);
		       Base.hideObj("aae140_" + aae140Arr[i]);		       
		    }	
		    //全选复选框默认不选中
		    Base.setValue("aae140_all",false);
			Base.submit(null,"employeeSupplementAction!getUnitInsu.do",{"dto['aab001']":aab001},null,false,function(data){
			    //单位管理类型：01表示普通单位，02表示灵活就业虚拟单位
				var yab019 = Base.getValue("yab019");
			    //如果是灵活就业单位，则不展示工资输入项，反之，则展示并为必输入项
			    if("02"==yab019)
			    {
                   Base.setValue("aac040","");
                   Base.setDisRequired("aac040");
                   Base.hideObj("aac040");
			    }
			    else
			    {
                   Base.setValue("aac040","");
                   Base.setRequired("aac040");
                   Base.showObj("aac040");
			    }
			},null);  
   		}
	}
	//判断个人参保时间 
	function fnCheckAllInsTime(id){
		//var aac007 = Base.getValue("aac007");//参工时间
		var aac049 = Base.getValue("aac049");//首次参保时间
		var ajc050 = Base.getValue("ajc050");//本次参保时间
		var aac030 = Base.getValue("aac030_"+id);//个人参保时间 aac030_110
		if(aac030 != ''){
			//与首次参保日期作比较
			if(aac049 != ''){
		        ///////////首次参保年月转成日期格式 start ///////////
				if( 6 > aac049.length){
					alert("请输入【首次参保年月】的正确格式，如：201301");
					Base.setValue("aac049","");
					Base.focus("aac049");
					return false;
				}
				var aac049Msg = aac049;
				aac049 = aac049.substring(0,4)+"-"+aac049.substring(4,6)+"-"+"01";
				///////////首次参保年月转成日期格式 end ///////////
				if(aac030 < aac049){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于首次参保年月【"+aac049Msg+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tab_'+id);
					Base.focus("aac030_"+id);
					return false;
				}
			}
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(aac030 < ajc050){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于本次参加工作日期【"+ajc050+"】!");
					//Base.setValue("aac030_"+id,'');
                    Base.setValue("aac030_" + id, '');							
					Base.activeTab('tab_'+id);
					Base.focus("aac030_"+id);
					return false;
				}
				
			}
		}
	}
	
	//校验首次参保时间
	function fnSetAac049(){
		var aac049 = Base.getValue('aac049');//首次参保年月
		var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		if(aac049 != ''){
	        ///////////首次参保年月转成日期格式 start ///////////
			if( 6 > aac049.length){
				alert("请输入【首次参保年月】的正确格式，如：201301");
				Base.setValue("aac049","");
				Base.focus("aac049");
				return false;
			}
			var aac049Msg = aac049;
			aac049 = aac049.substring(0,4)+"-"+aac049.substring(4,6)+"-"+"01";
			///////////首次参保年月转成日期格式 end ///////////
			
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(ajc050 < aac049){
					alert("首次参保年月【"+aac049Msg+"】不能晚于本次参加工作日期【"+ajc050+"】!");
					Base.setValue('aac049','');
					Base.focus('aac049');
					return false;
				}
			}
			//与个人参保日期做比较
	        var aae140Arr = ['110','120','210','310','320','330','340','350','370','410','510'];
			var len = aae140Arr.length;
			for(var i=0;i<len;i++){
				//检查id是否存在 
			    if($('#aae140_' + aae140Arr[i]).length<1)
			    	continue;  
				var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
				if(ck){
					var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
					if((aac030 != '') && (aac049 > aac030)){
						alert("首次参保年月【"+aac049Msg+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!");
						Base.setValue('aac049','');
						Base.activeTab('tab_'+aae140Arr[i]);
						return false;
					}
					Base.setValue("aae206_110",Base.getValue("aac049"));
				}
			}
		}
	}
	
	//本次参加工作日期校验
	function fnSetAjc050(){
		//var aac007 = Base.getValue('aac007');//参加工作日期
		var aac049 = Base.getValue('aac049');//首次参保日期
		var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		//与个人参保日期做比较
	    var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];
	    var len = aae140Arr.length;		
		if(ajc050 != ''){
			//与本次参加工作日期作比较
			if(aac049 != ''){
				///////////首次参保年月转成日期格式 start ///////////
				if( 6 > aac049.length){
					alert("请输入【首次参保年月】的正确格式，如：201301");
					Base.setValue("aac049","");
					Base.focus("aac049");
					return false;
				}
				var aac049Msg = aac049;
				aac049 = aac049.substring(0,4)+"-"+aac049.substring(4,6)+"-"+"01";
				///////////首次参保年月转成日期格式 end ///////////
				if(ajc050 < aac049){
					alert("本次参加工作日期【"+ajc050+"】不能早于首次参保年月【"+aac049Msg+"】!");
					Base.setValue('ajc050','');
					Base.focus('ajc050');
					return false;
				}
			}
			var cks = false;
		    for(var i=0;i<len;i++){
		    	var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
		    	if(ck){
		    		cks = true;
		    	}
		    }
			if(cks){
				Base.confirm('将个人参保日期和本次参加工作日期同步吗？',function(yes,callback){
			    	if(yes){
			    		for(var i=0;i<len;i++){
			    			Base.setValue('aac030_'+aae140Arr[i],ajc050);
			    		}
			    	}else{
			    		//个人参保时间 和 本次参加工作时间 校验及赋值
						for(var i=0;i<len;i++){
						    //个人参保日期提前全部附上本次参加工作日期
							var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
							if(ck){
								var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
								if((aac030 != '') && (ajc050 > aac030)){
									alert("本次参加工作日期【"+ajc050+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!");
									Base.setValue('ajc050', '');
									Base.activeTab('tab_'+aae140Arr[i]);
									return false;
								}
							}
						}
					}
	    		});
			}else{
				for(var i=0;i<len;i++){
			    	Base.setValue('aac030_'+aae140Arr[i],'');
			    }
			}
		}
		//险种的参保时间与本次参保时间一致
		for(i=0;i<len;i++){		
		    Base.setValue("aac030_" + aae140Arr[i], ajc050);
		}
		 
	}
	
	//险种名字
	function getAae140Name(id){
		if(id == '110'){
			return '企业养老';
		}else if(id == '120'){
			return '机关养老';
		}else if(id == '210'){
			return '失业';
		}else if(id == '310'){
			return '基本医疗';
		}else if(id == '320'){
			return '公务员补充';		
		}else if(id == '330'){
			return '大病补助';		
		}else if(id == '340'){
			return '离休';		
		}else if(id == '350'){
			return '二乙';		
		}else if(id == '370'){
			return '企业补充';		
		}else if(id == '410'){
			return '工伤';
		}else if(id == '510'){
			return '生育';
		}
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	function checkDATA(){
		//用来检测数据的正确性，检测新参保人员添加险种的依存关系
		var grcbList = Base.getGridSelectedRows("dg_grcbInfo");
		var param={};
		param.grcbList=Ta.util.obj2string(grcbList);
		if(grcbList.length==0){
			Base.alert("请在人员参保信息中勾选参保的人员","warn");
			return false;
		} 
		var resultStr=getSelectAae140_c("aae140_");
		if(resultStr==null||resultStr==""){
			Base.alert("请在个人参保信息中的tab中选择要添加的险种","warn");
			return false;
		}else{
			Base.setValue("aae140s",resultStr);
		}   
		Base.submit('form1','employeeSupplementAction!checkData.do',param);
	}
	
	//获取被勾选的险种类型，返回数组
	function getSelectAae140_c(pre){
		var ary = ['110','120','210','310','330','320','370','340','410','510'];
		var resultStr="";
     	for(var i=0;i<ary.length;i++){
     		var flag=Base.getObj(pre+ary[i]).checked;
     		 if(flag){
	     		if(i==ary.length-1){
	     			resultStr+=ary[i];
	     		}else{
	     			resultStr+=ary[i];
	     			resultStr+=",";
	     		}
     		} 
		}
		return resultStr;
	}
	
	//导出错误文件
	function fnExpFile(gridId){
		var rows = Base.getGridData(gridId);
		if(rows != ""){
			Base.expGridExcel(gridId);
		}else{
			Base.alert("没有错误数据需要导出,请确认!","warn");
		}
	}
	//错误原因颜色控制
	function fnFormatter(row, cell, value, columnDef, dataContext){
		return "<span style='color:red;'>"+dataContext.yae238+"</span>";
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>