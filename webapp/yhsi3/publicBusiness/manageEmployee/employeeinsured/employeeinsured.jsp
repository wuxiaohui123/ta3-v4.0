<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>registerEmployee</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" asToolBarItem="true" type="resetPage" onClick="fnReset();"/>
		<ta:toolbarItem id="closeWinBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" />
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	<ta:panel fit="true">	
		<ta:tabs id="tabsSI" fit="true">
			
			
			<ta:tab id="Tabgrcb" key="个人参保信息">
				<ta:panel id="fltPerson" key="个人基本信息" cols="3" expanded="false" scalable="false">		  
				    <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				    <ta:text id="aac007" key="参加工作时间" display="false"/>
		        </ta:panel>
				<ta:panel id="fltUnit" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'));" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
					<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" maxVisibleRows="10" />
					<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />
				</ta:panel>
				
				<ta:panel id="fltRegister" key="险种选择" expanded="false" scalable="false">
					<ta:checkboxgroup id="cbgp" cssStyle="margin-left:20px;" cols="7">
						<ta:text id="a110" display="false"/>
						<ta:text id="a120" display="false"/>
						<ta:text id="a210" display="false"/>
						<ta:text id="a310" display="false"/>
						<ta:text id="a410" display="false"/>
						<ta:text id="a510" display="false"/>
						<ta:checkbox key="企业养老" id="aae140_110" onClick="fnSelectYL()"/>
						<ta:checkbox key="机关养老" id="aae140_120" onClick="fnSelectJGYL()"/>
						<ta:checkbox key="失业保险" id="aae140_210" onClick="fnSelected('aae140_210')"/>
						<ta:checkbox key="医疗保险" id="aae140_310" onClick="fnSelected('aae140_310')"/>
						<ta:checkbox key="工伤保险" id="aae140_410" onClick="fnSelected('aae140_410')"/>
						<ta:checkbox key="生育保险" id="aae140_510" onClick="fnSelected('aae140_510')"/>
					</ta:checkboxgroup>
				</ta:panel>
				
				<ta:panel cols="3" id="fltCB" expanded="false" scalable="false">
					<ta:number id="aac040" key="工资" labelWidth="120" required="true" precision="2"  asAamount="true" amountPre="￥" onChange="checkMoney()" max="99999999"/>
					<ta:selectInput id="aac066" key="参保身份" collection="aac066" labelWidth="120" required="true" selectFirstValue="true"/>
					<ta:selectInput id="aab033" key="征收方式" required="true" filter="6" collection="aab033" onSelect="fnAab033" labelWidth="120" />
					<ta:selectInput id="aac013" key="用工形式" required="true" onSelect="fnAac013" collection="aac013" labelWidth="120" />
					<ta:date id="aac049" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" onChange="fnSetAac049();"/>
					<ta:date id="ajc050" key="本次参加工作日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnSetAjc050();"/>
				</ta:panel>
				
				<ta:tabs id="tbs_xzxx" fit="true">
					<ta:tab id="tb_cbxx" key="单位参保信息">
		    		   <ta:datagrid id="cb_grid" fit="true">
	    				<ta:datagridItem id="aab001_cb" key="单位ID" width="100"/>
			    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="170"/>
						<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100"/>
						<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100"/>
						<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100" align="center"/>
						<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="220"/>
						<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="170"/>
						<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="260"/>
					   </ta:datagrid>
					</ta:tab>
									
					<ta:tab id="tb_aae140_110" key="企业养老保险">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_110" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_110" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_110" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_110" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_110" key="基数核定规则" labelWidth="120" required="true"/>
						<ta:date id="aac030_110" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAllInsTime('110')"/>
	    			 </ta:box>
					</ta:tab>
					
					<ta:tab id="tb_aae140_120" key="机关养老保险">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_120" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_120" key="征收方式" collection="aab033" labelWidth="120"  display="false"/>
						<ta:selectInput id="aac013_120" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_120" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_120" key="基数核定规则" labelWidth="120" required="true"/>
						<ta:date id="aac030_120" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAllInsTime('120')"/>
	    			 </ta:box>
					</ta:tab>
					
					<ta:tab id="tb_aae140_210" key="失业保险">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_210" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_210" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_210" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_210" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_210" key="基数核定规则" labelWidth="120" required="true"/>
						<ta:date id="aac030_210" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAllInsTime('210')"/>
	    			 </ta:box>
					</ta:tab>
					
					<ta:tab id="tb_aae140_310" key="医疗保险">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_310" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_310" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_310" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_310" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_310" key="基数核定规则" labelWidth="120" required="true"/>
						<ta:date id="aac030_310" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAllInsTime('310')"/>
	    			 </ta:box>
					</ta:tab>
					
					<ta:tab id="tb_aae140_410" key="工伤保险">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_410" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_410" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_410" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_410" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_410" key="基数核定规则" labelWidth="120" required="true"/>
						<ta:date id="aac030_410" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAllInsTime('410')"/>
	    			 </ta:box>
					</ta:tab>
					
					<ta:tab id="tb_aae140_510" key="生育保险">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_510" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_510" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_510" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_510" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_510" key="基数核定规则" labelWidth="120" required="true"/>
						<ta:date id="aac030_510" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnCheckAllInsTime('510')"/>
	    			 </ta:box>
					</ta:tab>
					
				</ta:tabs>
			</ta:tab>
			
			<ta:tab id="sjlcTb" key="事件流程记录" >
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		$("body").css("overflow","hidden");
		Base.hideObj("tb_aae140_110,tb_aae140_120,tb_aae140_210,tb_aae140_310,tb_aae140_410,tb_aae140_510");
		Base.hideObj("aae140_110,aae140_120,aae140_210,aae140_310,aae140_410,aae140_510");
		initializeSuggestFramework(1, 'ac01', 'aac001', 500, 200, 4, fn_queryInfoPerson, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 500, 200, 3, fnCheckAae140, 1, false);
	});
	//人员回调函数
	function fn_queryInfoPerson(){
		if (g_Suggest!=""){ 
			Base.setValue("aac001",g_Suggest[2]);			
			Base.submit("aac001","employeeinsuredAction!getPersonInfo.do");  
   		}
	}
	//获得该人员在该单位参保的险种
	function fn_queryAae140(){
		if (g_Suggest!=""){ 
			Base.hideObj("tb_aae140_110,tb_aae140_120,tb_aae140_210,tb_aae140_310,tb_aae140_410,tb_aae140_510");
			Base.hideObj("aae140_110,aae140_120,aae140_210,aae140_310,aae140_410,aae140_510");
			Base.submit("fltUnit","registerEmployeeAction!toQueryAae140.do");  
			
			Base.setEnable("jstj");
   		}
	}
	
	
	//save
	function submitData(){
			Base.setValue("a110","0");
			Base.setValue("a120","0");
			Base.setValue("a210","0");
			Base.setValue("a310","0");
			Base.setValue("a410","0");
			Base.setValue("a510","0");
			
			if(Base.getObj("aae140_110").checked){
				Base.setValue("a110","1");
			}
			if(Base.getObj("aae140_120").checked){
				Base.setValue("a120","1");
			}
			if(Base.getObj("aae140_210").checked){
				Base.setValue("a210","1");
			}
			if(Base.getObj("aae140_310").checked){
				Base.setValue("a310","1");
			}
			if(Base.getObj("aae140_410").checked){
				Base.setValue("a410","1");
			}
			if(Base.getObj("aae140_510").checked){
				Base.setValue("a510","1");
			}
			
			//根据是否勾选勾选险种来确定点保存时  检验所有的必录项
			var a110 = Base.getObj("aae140_110").checked;
			var a120 = Base.getObj("aae140_120").checked;
			var a210 = Base.getObj("aae140_210").checked;
			var a310 = Base.getObj("aae140_310").checked;
			var a410 = Base.getObj("aae140_410").checked;
			var a510 = Base.getObj("aae140_510").checked;

			if(a110 || a120 || a210 || a310 || a410 || a510){
				Base.validateForm("form1");
				Base.validateTab("infoTb");
			}
			if(!(a110 || a120 || a210 || a310 || a410 || a510)){
				if(confirm("未新增任何险种，确认保存？")){
				    Base.submit('form1','registerEmployeeAction!toSave.do');
				}
			}else{
				var aac040 = Base.getValue("aac040");
				if(aac040 == ''){
					Base.activeTab('Tabgrcb');
					alert('工资不能为空!');
					return;
				}
				var aac066 = Base.getValue("aac066");
				if(aac066 == ''){
					Base.activeTab('Tabgrcb');
					alert('参保身份不能为空!');
					return;
				}
				var aab033 = Base.getValue("aab033");
				if(aab033 == ''){
					Base.activeTab('Tabgrcb');
					alert('征收方式不能为空!');
					return;
				}
				var aac013 = Base.getValue("aac013");
				if(aac013 == ''){
					Base.activeTab('Tabgrcb');
					alert('用工形式不能为空!');
					return;
				}
				var aac049 = Base.getValue("aac049");
				if(aac049 == ''){
					Base.activeTab('Tabgrcb');
					alert('首次参保年月不能为空!');
					return;
				}
				var ajc050 = Base.getValue("ajc050");
				if(ajc050 == ''){
					Base.activeTab('Tabgrcb');
					alert('本次参加工作日期不能为空!');
					return;
				}
				
				var aae140Arr = ['110','120','210','310','410','510'];
				var len = aae140Arr.length;
				for(i=0;i<len;i++){
					var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
					if(ck){
						var aaz136 = Base.getValue('aaz136_'+aae140Arr[i]);
						var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
						var yaz289 = Base.getValue('yaz289_'+aae140Arr[i]);
						if((aaz136=='') || (aac030=='') || (yaz289=='')){
							Base.activeTab('Tabgrcb');
							alert("请将【"+getAae140Name(aae140Arr[i])+"】必输项填写完整!");
							return;
						}
					}
				}
			    Base.submit('form1','employeeinsuredAction!toSave.do');
			}
	}
	
	//养老参保
	function fnSelectYL(){
		if(Base.getObj("aae140_120").checked){
			Base.alert("你已参保基本机关养老保险，不能再参加养老保险","warn");
			Base.getObj("aae140_110").checked = false;
			return;
		}
		if(Base.getObj("aae140_110").checked){
			Base.showObj("tbs_xzxx");
			Base.showObj("tb_aae140_110");
			Base.activeTab("tb_aae140_110");
			Base.setValue("aae140","110");
			Base.hideObj()
			//Base.submit("fltUnit,fltRegister", "registerEmployeeAction!getDetail.do");
		}else{
			Base.hideObj("tb_aae140_110");
		}
	}
	
	//机关养老参保
	function fnSelectJGYL(){
		if(Base.getObj("aae140_110").checked){
			Base.alert("你已参保基本养老保险，不能再参加机关养老保险","warn");
			Base.getObj("aae140_120").checked = false;
			return;
		}
		if(Base.getObj("aae140_120").checked){
			Base.showObj("tbs_xzxx");
			Base.showObj("tb_aae140_120");
			Base.activeTab("tb_aae140_120");
			Base.setValue("aae140","120");
			//Base.submit("fltUnit,fltRegister", "registerEmployeeAction!getDetail.do");
		}else{
			Base.hideObj("tb_aae140_120");
		}
	}
	
	//失业，医疗，生育，工伤
	function fnSelected(id){
		if(Base.getObj(id).checked){
			Base.showObj("tb_"+id);
			Base.activeTab("tb_"+id);
			Base.setValue("aae140",id.substr(7,3));
			//Base.submit("fltUnit,fltRegister", "registerEmployeeAction!getDetail.do");
		}else{
			Base.hideObj("tb_"+id);
		}
	}
	
	//reset
	function fnReset(){
		var aae417 = Base.getValue("aae417");
		var yae248 = Base.getValue("yae248");
		Base.resetForm("form1");
		Base.setValue("aae417",aae417);
		Base.setValue("yae248",yae248);
		
		Base.hideObj("tb_aae140_110,tb_aae140_120,tb_aae140_210,tb_aae140_310,tb_aae140_410,tb_aae140_510");
		Base.hideObj("aae140_110,aae140_120,aae140_210,aae140_310,aae140_410,aae140_510");
		
		Base.setEnable("aac002,aab401,aac005,aac003,aac007,aac009,aac058");
		Base.setEnable("aac010,aac011,aac012,aac014,aac015,aac016,aac017,aac020,aac033,aac060,aac084");
		Base.setEnable("aae004,aae005,yae107,aae006,aae007,aae159,aja004,aab301,yac011,yac008");
		
		Base.setEnable("saveBtn");
		Base.setEnable("jstj");
		Base.focus("aab999");
	}
	
	function fnAab033(value,key){
		if(key!=""){
			Base.setValue("aab033_510",key);
			Base.setValue("aab033_410",key);
			Base.setValue("aab033_310",key);
			Base.setValue("aab033_210",key);
			Base.setValue("aab033_120",key);
			Base.setValue("aab033_110",key);
		}
	}
	
	function fnAac013(value,key){
		if(key!=""){
			Base.setValue("aac013_510",key);
			Base.setValue("aac013_410",key);
			Base.setValue("aac013_310",key);
			Base.setValue("aac013_210",key);
			Base.setValue("aac013_120",key);
			Base.setValue("aac013_110",key);
		}
	}
	// 根据单位参保险种 显示个人可参保险种
	function fnCheckAae140 (){
		var aae140Arr = ['110','120','210','310','410','510'];
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
			Base.hideObj("tb_aae140_110,tb_aae140_120,tb_aae140_210,tb_aae140_310,tb_aae140_410,tb_aae140_510");
			Base.hideObj("aae140_110,aae140_120,aae140_210,aae140_310,aae140_410,aae140_510");
			Base.submit(null,"employeeinsuredAction!getUnitInsu.do",{"dto['aab001']":aab001});  
   		}
	}
		//邮政编码判断
	function checkPost(){   
		var pattern = /^[0-9]{6}$/;
		var aae007 = Base.getValue("aae007");
		if (pattern.test(aae007)==false){
		Base.alert("非法的邮政编码，请重新录入！","error");
		Base.setValue("aae007","");
		Base.focus("aae007");
		}
	}
	//电子邮箱判断

	function checkMail(){   
		
		var reMail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
 		var aae159 = Base.getValue("aae159");
 		if(!reMail.test(aae159)){
 		Base.alert("无效邮箱地址，请检查后重新录入!","error");
 		Base.setValue("aae159","");
 		Base.focus("aae159");
		}
	}
	//工资检验
	function checkMoney(){
		//var reMoney = /^([1-9][0-9]{1,8})+.[0-9]{2}$/;
		var aac040 = Base.getValue("aac040");
		if(aac040 < 0){
			alert('工资不能为负数!');
			Base.setValue("aac040","");
			Base.focus("aac040");
		}
		if(parseInt(aac040)>(parseInt(99999999))){
			alert("现输入工资为：【"+aac040+"】，其超出最大值【99999999】，请确认后重新录入！");
			Base.setValue("aac040","");
			Base.focus("aac040");
		}
	}
	//判断证件类型 
	function checkaac058(){
		var aac058 = Base.getValue("aac058");
		if(aac058!="1"){
			Base.setValue("aac002","");
			Base.setValue("aac004","");
			Base.setValue("aac006","");
		}
	}
	
	//判断参工时间与出生日期
	function checkworkTime(){
		var aac006 = Base.getValue("aac006");
		var aac007 = Base.getValue("aac007");
		if(aac007<aac006){
			alert("【参工时间："+aac007+"】不能早于【出生日期："+aac006+"】，请检查后重新录入！");
			Base.setValue("aac007","");
			Base.focus("aac007");
			return ;
		}
	}
	
	//判断个人参保时间 
	function fnCheckAllInsTime(id){
		var aac007 = Base.getValue("aac007");//参工时间
		var aac049 = Base.getValue("aac049");//首次参保时间
		var ajc050 = Base.getValue("ajc050");//本次参保时间
		var aac030 = Base.getValue("aac030_"+id);//个人参保时间 aac030_110
		if(aac030 != ''){
			//与参加工作日期作比较
			if(aac007 == ''){
				alert("请先输入参加工作日期!");
				Base.activeTab('infoTb');
				Base.setValue("aac030_"+id,'');
				Base.focus('aac007');
				return;
			}else{
				if(aac007 > aac030){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tb_aae140_'+id);
					Base.focus("aac030_"+id);
					return;
				}
			}
			//与首次参保日期作比较
			if(aac049 != ''){
				if(aac030 < aac049){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于首次参保日期【"+aac049+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tb_aae140_'+id);
					Base.focus("aac030_"+id);
					return;
				}
			}
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(aac030 < ajc050){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于本次参加工作日期【"+ajc050+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tb_aae140_'+id);
					Base.focus("aac030_"+id);
					return;
				}
			}
		}
		
	}
	
	//校验首次参保时间
	function fnSetAac049(){
		var aac007 = Base.getValue('aac007');//参加工作日期
		var aac049 = Base.getValue('aac049');//首次参保日期
		var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		if(aac049 != ''){
			//与参加工作日期作比较
			if(aac007 == ''){
				alert("请先输入参加工作日期!");
				Base.activeTab('infoTb');
				Base.setValue('aac049','');
				Base.focus('aac007');
				return;
			}else{
				if(aac007 > aac049){
					alert("首次参保日期【"+aac049+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue('aac049','');
					Base.focus('aac049');
					return;
				}
			}
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(ajc050 < aac049){
					alert("首次参保日期【"+aac049+"】不能晚于本次参加工作日期【"+ajc050+"】!");
					Base.setValue('aac049','');
					Base.focus('aac049');
					return;
				}
			}
			//与个人参保日期做比较
			var aae140Arr = ['110','120','210','310','410','510'];
			var len = aae140Arr.length;
			for(i=0;i<len;i++){
				var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
				if(ck){
					var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
					if((aac030 != '') && (aac049 > aac030)){
						alert("首次参保日期【"+aac049+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!");
						Base.setValue('aac049','');
						Base.activeTab('tb_aae140_'+aae140Arr[i]);
						return;
					}
				}
			}
		}
	}
	
	//本次参加工作日期校验
	function fnSetAjc050(){
		var aac007 = Base.getValue('aac007');//参加工作日期
		var aac049 = Base.getValue('aac049');//首次参保日期
		var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		if(ajc050 != ''){
			//与参加工作日期作比较
			if(aac007 == ''){
				alert("请先输入参加工作日期!");
				Base.activeTab('infoTb');
				Base.setValue('ajc050','');
				Base.focus('aac007');
				return;
			}else{
				if(aac007 > ajc050){
					alert("本次参加工作日期【"+ajc050+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue('ajc050','');
					Base.focus('ajc050');
					return;
				}
			}
			//与本次参加工作日期作比较
			if(aac049 != ''){
				if(ajc050 < aac049){
					alert("本次参加工作日期【"+ajc050+"】不能早于首次参保日期【"+aac049+"】!");
					Base.setValue('ajc050','');
					Base.focus('ajc050');
					return;
				}
			}
			//与个人参保日期做比较
			var aae140Arr = ['110','120','210','310','410','510'];
			var len = aae140Arr.length;
			for(i=0;i<len;i++){
				var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
				if(ck){
					var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
					if((aac030 != '') && (ajc050 > aac030)){
						alert("本次参加工作日期【"+ajc050+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!");
						Base.setValue('ajc050','');
						Base.activeTab('tb_aae140_'+aae140Arr[i]);
						return;
					}
				}
			}
		}
	}
	
	//险种名字
	function getAae140Name(id){
		if(id == '110'){
			return '企业养老保险';
		}else if(id == '120'){
			return '机关养老保险';
		}else if(id == '210'){
			return '失业保险';
		}else if(id == '310'){
			return '医疗保险';
		}else if(id == '410'){
			return '工伤保险';
		}else if(id == '510'){
			return '生育保险';
		}
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>