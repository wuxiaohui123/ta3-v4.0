<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>maintainBIEmployee</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" asToolBarItem="true" type="resetPage"/>
		<ta:button id="verityBtn" key="审核记录" icon="icon-save" onClick="verityHistorySuggestView();" asToolBarItem="true" display="false"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	 <ta:panel fit="true">
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="个人基本信息" cssStyle="overflow:auto">
				<ta:panel id="fldryxx" key="人员信息" cols="3" >
					<ta:text id="isNew" display="false" value="0"/>
					<ta:box cols="2">
						<ta:text id="aac001" key="个人编号" labelWidth="120" maxLength="20" columnWidth="0.9" required="true" 
							onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码,姓名,人员ID"/>
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()"/>
						</ta:buttonLayout>
					</ta:box>
					<ta:selectInput id="aac058" key="证件类型" collection="AAC058" required="true" labelWidth="120" selectFirstValue="true"/>
					<ta:text id="aac002" key="证件号码" required="true" maxLength="18" labelWidth="120" onChange="fnChange(Base.getValue('aac002'))"/>
					<ta:text id="aac003" key="姓名" labelWidth="120" maxLength="60" required="true"/>
					<ta:selectInput id="aac004" key="性别" readOnly="true" collection="AAC004" labelWidth="120" required="true"/>
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" showSelectPanel="true" required="true"/>
					<ta:text id="age" key="年龄" labelWidth="120"  readOnly="true"/>
					<ta:date id="yac581" key="身份证有效开始时间" readOnly="true" labelWidth="120" showSelectPanel="true"  />
					<ta:date id="yac582" key="身份证有效截止时间" readOnly="true" labelWidth="120" showSelectPanel="true"  />
					<ta:date id="aac007" key="参加工作时间" required="true" labelWidth="120" showSelectPanel="true"/>
					<ta:selectInput id="aac012" key="个人身份" collection="AAC012" labelWidth="120" required="true"/>
					<ta:selectInput id="aja004" key="农民工标示" collection="AJA004" labelWidth="120" required="true"  />
					<ta:selectInput id="aac118" key="被征地农民标识" collection="AAC118" labelWidth="120" required="true" display="false"/>
					<ta:selectInput id="aac064" key="转业军人标识" collection="AAC064" labelWidth="120" required="true" display="false"/>
					<ta:selectInput id="yac584" key="参战军人标识" collection="YAC584" labelWidth="120"  required="true" display="false"/>
					<ta:selectInput id="aac005" key="民族" collection="AAC005" labelWidth="120"/>
					<ta:selectInput id="aac011" key="学历" collection="AAC011" labelWidth="120"/>
					<ta:selectInput id="aac017" key="婚姻状况" collection="AAC017" labelWidth="120"/>
					<ta:selectInput id="aac016" key="就业状态" collection="AAC016" labelWidth="120"/>
					<ta:selectInput id="yac030" key="在编人员标识" collection="YAC030" labelWidth="120" onSelect="yac030Change"/>
					<ta:selectInput id="aac033" key="健康状况" collection="AAC033" labelWidth="120"/>
					<ta:selectInput id="aab301" key="所属行政区代码" collection="AAB301" labelWidth="120" islevel="true" isMustLeaf="true"/>
					<ta:text id="aae013_per" key="备注" span="3" labelWidth="120" maxLength="200"/>
				</ta:panel>
				<ta:panel id="fldry" key="荣誉信息" cols="3" >
					<ta:selectInput id="aac014" key="专业技术职务等级" collection="AAC014" labelWidth="120"/>
					<ta:selectInput id="aac015" key="国家职业资格等级" collection="AAC015" labelWidth="120"/>
					<ta:selectInput id="aac020" key="行政职务" collection="AAC020" labelWidth="120"/>
				</ta:panel>
				<ta:panel id="fldlx" key="联系信息" cols="3" >
					<ta:text id="aae006" key="地址" labelWidth="120" span="2" maxLength="200" required="true"/>
					<ta:text id="aae007" key="邮政编码" labelWidth="120" validType="zipcode" maxLength="6" />
					<ta:text id="aae004" key="联系人姓名" labelWidth="120" maxLength="60"/>
					<ta:text id="aae005" key="联系人电话" labelWidth="120" validType="mobile" maxLength="50" required="true"/>
					<ta:text id="yae107" key="移动电话" labelWidth="120" validType="mobile" maxLength="50"/>
					<ta:text id="aae159" key="联系电子邮箱" validType="email" labelWidth="120"  maxLength="50" />
				</ta:panel>
				<ta:panel id="fldhj" key="户籍信息" cols="3" >
					<ta:selectInput id="aac009" key="户口性质" labelWidth="120" islevel="true" isMustLeaf="true" />					
					<ta:text id="aac010" key="户口所在地" labelWidth="120" maxLength="100" required="true"/>
					<ta:text id="aab401" key="户口簿编号" labelWidth="120" validType="nochinese" maxLength="20" />
				</ta:panel>
			</ta:tab>
			
			<ta:tab id="Tabgrcb" key="个人参保信息">
				<ta:text id="insNum" key="已参保险种数量" display="false"/>
				<ta:panel id="fltUnit" key="单位基本信息" cols="3" >
                    <ta:box cols="2">
						<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" columnWidth="0.9" 
							onChange="sfwQueryUtil_newRPC(2,'getAb01String',{'dto.inputString':Base.getValue('aab001')});" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()"/>
						</ta:buttonLayout>
					</ta:box>
                    <ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" maxVisibleRows="10" />
					<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />
				</ta:panel>
				
				<ta:text id="a110" display="false"/>
			    <ta:text id="a120" display="false"/>
				<ta:text id="a210" display="false"/>
				<ta:text id="a310" display="false"/>
				<ta:text id="a320" display="false"/>
				<ta:text id="a330" display="false"/>
				<ta:text id="a340" display="false"/>
				<ta:text id="a350" display="false"/>
				<ta:text id="a370" display="false"/>																									
				<ta:text id="a410" display="false"/>
				<ta:text id="a510" display="false"/>	
				
				<ta:text id="ykc005110" display="false"/>			    
				<ta:text id="ykc005120" display="false"/>
				<ta:text id="ykc005210" display="false"/>
				<ta:text id="ykc005310" display="false"/>
				<ta:text id="ykc005320" display="false"/>
				<ta:text id="ykc005330" display="false"/>			
				<ta:text id="ykc005340" display="false"/>				
				<ta:text id="ykc005370" display="false"/>																									
				<ta:text id="ykc005410" display="false"/>
				<ta:text id="ykc005510" display="false"/>
				
				<ta:text id="ykc006110" display="false"/>			    
				<ta:text id="ykc006120" display="false"/>
				<ta:text id="ykc006210" display="false"/>
				<ta:text id="ykc006310" display="false"/>
				<ta:text id="ykc006320" display="false"/>	
				<ta:text id="ykc006330" display="false"/>		
				<ta:text id="ykc006340" display="false"/>				
				<ta:text id="ykc006370" display="false"/>																									
				<ta:text id="ykc006410" display="false"/>
				<ta:text id="ykc006510" display="false"/>			
                <%@ include file="/yhsi3/commonJSP/xzlx_gr.jsp"%>
				
				<ta:panel cols="3" id="fltCB" >
					<ta:number id="aac040" key="工资" labelWidth="120" readOnly="true" required="true" precision="2" max="99999999" asAamount="true" amountPre="￥" onChange="checkMoney()"/>
					<ta:selectInput id="aac066" key="参保身份" collection="AAC066" filter="2" labelWidth="120" required="true" selectFirstValue="true" onSelect="setAllAae140Change"/>					
					<ta:selectInput id="aab033" key="征收方式" required="false" collection="aab033" onSelect="fnAab033" labelWidth="120" selectFirstValue="true" display="false"/>
					<ta:selectInput id="aac013" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" onSelect="setAllAae140Change"/>
					<ta:date id="aac049" key="首次参保年月" labelWidth="120" required="true" showSelectPanel="true" issue="true" onChange="checkAllTime('aac049');"/>	                  
					<ta:date id="ajc050" key="本次参加工作日期" showSelectPanel="true" labelWidth="120" onChange="checkAllTime('ajc050');"/>
				</ta:panel>
				
				<ta:tabs id="tbs_xzxx" fit="true">
					<ta:tab id="tb_cbxx" key="单位参保信息">
		    			<ta:datagrid id="cb_grid" forceFitColumns="true" fit="true">
							<ta:datagridItem id="aab001_cb" key="单位ID" width="100" align="center" dataAlign="left"/>
							<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="180" align="center" dataAlign="left"/>
							<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" align="center" dataAlign="left" width="100"/>
							<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100" align="center" dataAlign="right"/>
							<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="240" align="center" dataAlign="left"/>
							<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="150" align="center" dataAlign="left"/>
							<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="245" align="center" dataAlign="left"/>
						</ta:datagrid>
					</ta:tab>
                    <%@ include file="/yhsi3/commonJSP/xzlx_tab_gr_maintain.jsp"%>	
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
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");
		initializeSuggestFramework(1, null, 'aac001', 990, 200, 10, fn_queryInfoPerson, 2, false);
		initializeSuggestFramework(2, null, 'aab001', 900, 200, 7, fnGetFocus, 1, false);
		setYkc();
	});
	
	function callRyRPC(){
		sfwQueryUtil_newRPC(1,'getAac001_c',{"dto['inputString']":Base.getValue('aac001')});
	}
	
	function showRyRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
	}
	
    function showDwRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
    }
    
	function fn_setRyData(){
		Base.setValue("aac001",g_Suggest[2])
		Base.submit("aac001","maintainBIEmployeeAction!toQueryPerson.do",{"dto['aab001']":g_Suggest[10]},null,null,function(){
			var param = uptAOlData("form1");
		});
		Base.setValue("aac001", parent.getValue('aac001'));
	}
	
	function fn_setDwData(){
		Base.submit(null,"maintainBIEmployeeAction!getUnitInsu.do",{"dto['aab001']":aab001});
		Base.setValue("aab001", parent.getValue('aab001'));
	}
	
	function fnGetFocus(){
		if(g_Suggest!=""){
			Base.setValue("aab001",g_Suggest[1]);
			var aab001 = g_Suggest[1];
			Base.submit(null,"maintainBIEmployeeAction!getUnitInsu.do",{"dto['aab001']":aab001});
		}
	}

	//人员回调函数
	function fn_queryInfoPerson(){
	   setYkc();
	   Base.setValue("isNew","0");
	   Base.setValue("a110","");
	   Base.setValue("a120","");
	   Base.setValue("a210","");
	   Base.setValue("a310","");
	   Base.setValue("a320","");
	   Base.setValue("a330","");
	   Base.setValue("a340","");
	   Base.setValue("a350","");
	   Base.setValue("a370","");
	   Base.setValue("a410","");
	   Base.setValue("a510","");
	   
	   Base.setValue("ykc005110","");
	   Base.setValue("ykc005120","");
	   Base.setValue("ykc005210","");
	   Base.setValue("ykc005310","");
	   Base.setValue("ykc005320","");
	   Base.setValue("ykc005330","");
	   Base.setValue("ykc005340","");
	   Base.setValue("ykc005370","");
	   Base.setValue("ykc005410","");
	   Base.setValue("ykc005510","");
	   
	   Base.setValue("ykc006110","");
	   Base.setValue("ykc006120","");
	   Base.setValue("ykc006210","");
	   Base.setValue("ykc006310","");
	   Base.setValue("ykc006320","");
	   Base.setValue("ykc006330","");
	   Base.setValue("ykc006340","");
	   Base.setValue("ykc006370","");
	   Base.setValue("ykc006410","");
	   Base.setValue("ykc006510","");
	   
	   Base.clearData("fltUnit");
	   Base.clearData("fltCB");
	   Base.clearGridData("cb_grid");
		if (g_Suggest!=""){ 
			Base.setValue("aac001",g_Suggest[2])
			Base.submit("aac001","maintainBIEmployeeAction!toQueryPerson.do",{"dto['aab001']":g_Suggest[10]},null,null,function(){
				var param = uptAOlData("form1");
			});
   		}
   		Base.setEnable("saveBtn");
	}
	
	
	
	//判断在编标识
	function yac030Change(value,key){
		if(Base.getValue("yac030") == "1"){
			Base.getJson(myPath()+"/process/publicBusiness/manageEmployee/maintainbiemployee/maintainBIEmployeeAction!toQueryAab019.do",{"dto['aac001']":Base.getValue("aac001")},function(data){
				var aab019arr = eval(data.fieldData.aab019str);
				for(var i = 0; i < aab019arr.length; i++){
					if(aab019arr[i].aab019 == "30" || aab019arr[i].aab019 == "58" || aab019arr[i].aab019 == "55"){
						return;
					}
				}
				Base.alert("只有参保单位属于机关、全额拨款事业单位或参照公务员事业单位才能选择在编标识","warn");
				Base.setValue("yac030", "0");
				return false;
			});
		}
	}
	
	//根据身份证获取出生日期和性别
	function fnChange(idCard){
		var aac058 = Base.getValue("aac058");
		var birthday = Base.getIdCardBirthday(idCard);
		//证件类型为身份证相关才检验
		if(aac058==1){		
			var checkFlag = new clsIDCard(idCard);
	        if (!checkFlag.IsValid()) {
	           Base.alert("输入的身份证号无效,请输入真实的身份证号！");  
	           Base.setEnable("aac058,aac002");
	 		   Base.focus("aac002");     
	           return ;
	        }
	        strs=birthday.split("-");
			var month = strs[1];
			var day = strs[2];
			var year = strs[0];
			if(parseInt(month)<10){
				month = "0" + month;
			}
			if(parseInt(day)<10){
				day = "0" + day;
			}
			birthday = year + "-" + month + "-" + day;
			Base.setValue("aac006",birthday);
			//性别判断
			var gender;
	        if(idCard.length == 18) {
                gender = idCard.substr(16, 1);
            }else if(idCard.length != 18){
	        	Base.focus("aac002");
	        	alert("身份证格式不对，只能录入18位有效的身份证！");
	        	Base.setDisabled("saveBtn");
	        	return ;
	        }
	        sex = gender % 2 == 0 ? '2' : '1';
		    Base.setValue("aac004",sex);
		}
		Base.submit('aac002,aac058','maintainBIEmployeeAction!toCheckAac002.do',null,null,false,null,function(){
		    Base.openWindow("ourWin","参保信息详情",myPath()+"/process/publicBusiness/manageEmployee/registeremployee/registerEmployeeEditAction.do",{"dto['aac002']":idCard,"dto['aac058']":aac058},"95%","90%",null,null,true);
		});
	}
	
	function setYkc(){
		var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];
		var len = aae140Arr.length;
		for(i = 0; i < len; i++){
			Base.setSelectInputDataWidthJson("ykc005_"+aae140Arr[i], Base.getValue("ykc005"+aae140Arr[i]));
			Base.setSelectInputDataWidthJson("ykc006_"+aae140Arr[i], Base.getValue("ykc006"+aae140Arr[i]));
			var array1 = Base.getValue("ykc005"+aae140Arr[i]).split(",");
			var array2 = Base.getValue("ykc006"+aae140Arr[i]).split(",");
		}
	}
	
	function submitData(){
		var param = getAllchgData("form1");
	    var aae140 = ['110','120','210','310','320','330','340','370','410','510'];		
		var len = aae140.length;
		for(i=0;i<len;i++){
			var obj = Base.getValue('a'+aae140[i]);
			var objck = Base.getObj('aae140_'+aae140[i]).checked;
			if(obj == '1'){
				var yaz289 = Base.getValue("yaz289_" + aae140[i]);
				var aaz136 = Base.getValue("aaz136_" + aae140[i]);
				var aac030 = Base.getValue("aac030_" + aae140[i]);
				var ykc005 = Base.getValue("ykc005_" + aae140[i]);
				var ykc006 = Base.getValue("ykc006_" + aae140[i]);
				if((yaz289=='') || (aaz136=='') || (aac030=='') || (ykc005=='') || (ykc006=='')){
					Base.activeTab("Tabgrcb");
					Base.activeTab('tb_aae140_'+aae140[i]);
					Base.alert("请将必输项填写完整，谢谢！","warn");
					return; 
				}
			}
			if(objck){
				if((obj == '') || (obj == null)){
					var aac066 = Base.getValue("aac066_" + aae140[i]);
					var aab033 = Base.getValue("aab033_" + aae140[i]);
					var aac013 = Base.getValue("aac013_" + aae140[i]);
					var aac049 = Base.getValue("aac049_" + aae140[i]);
					var yaz289 = Base.getValue("yaz289_" + aae140[i]);
					var aaz136 = Base.getValue("aaz136_" + aae140[i]);
					var aac030 = Base.getValue("aac030_" + aae140[i]);
					var ykc005 = Base.getValue("ykc005_" + aae140[i]);
				    var ykc006 = Base.getValue("ykc006_" + aae140[i]);
					if((aac066=='') || (aab033=='') || (aac013=='') || (aac049=='') || (yaz289=='') || (aaz136=='') || (aac030=='') || (ykc005=='') || (ykc006=='')){
						Base.activeTab("Tabgrcb");
						Base.activeTab('tb_aae140_'+aae140[i]);
						Base.alert("请将必输项填写完整，谢谢！","warn");
						return; 
					}
				}
			}
		}
		Base.validateTab("infoTb");
		var num = parseInt(Base.getValue("insNum"))*41+1;
        if((param.length == num) || (param.length == 0) || (param.length == 42)){
		   Base.alert("人员信息没有任何改变！","warn");
		   return;
		}
		Base.submit("form1","maintainBIEmployeeAction!toSave.do",{'param':param});
	}
	
	function fnAab033(value,key){
	    var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];		
		if(key!=""){
		    var len = aae140Arr.length;
		    for(i=0; i<len; i++){
		       if(Base.getObj("aab033_" + aae140Arr[i]).checked){
		          Base.setValue("aab033_" + aae140Arr[i], key);
		       }
		    }	
		}
	}
	
	//工资检验
	function checkMoney(){
		var aac040 = Base.getValue("aac040");
		if(parseInt(aac040)>(parseInt(9999999))){
			Base.alert("现输入工资为：【"+aac040+"】，其超出最大值【99999999】，请确认后重新录入！","error");
			Base.setValue("aac040","");
			Base.focus("aac040");
		}
	}
	
	function setAllAae140Change(key,value){
		var aae140Arr = ['110','120','210','310','320','330','340','370','410','510'];		
		var aac013 = Base.getValue("aac013");
		var aac066 = Base.getValue("aac066");
		if(key!=""){
		    var len = aae140Arr.length;
		    for(i=0; i<len; i++){
		        if(Base.getObj("aae140_" + aae140Arr[i]).checked){
		           Base.setValue("aac013_" + aae140Arr[i], aac013);
		           Base.setValue("aac066_" + aae140Arr[i], aac066);
		        }
		    }
		}
	}
	
	function checkAllTime(id){
		var aac006 = Base.getValue("aac006");	//出生日期
		var aac007 = Base.getValue("aac007");	//参工时间
		var aac049 = Base.getValue('aac049');	//首次参保年月
		var ajc050 = Base.getValue('ajc050');	//本次参工时间
		var aae140Str = '110,120,210,310,320,330,340,350,370,410,510';
		var aae140Arr = ['110','120','210','310','320','330','340','350','370','410','510'];
		var len = aae140Arr.length;
		var aac049OLD = aac049;
		//出生日期<参工时间<=首次参保年月<=本次参加工作日期<=个人参保日期
		if((id == "aac006" || id == "aac007") && (aac006 != "" && aac007 != "")){
			if(aac007<aac006){
				Base.alert("【参加工作时间："+aac007+"】不能早于【出生日期："+aac006+"】，请检查后重新录入！","warn");
				Base.setValue(id,"");
				Base.focus(id);
				return false;
			}
		}
		
		if((id == "aac049" || id == "aac007") && (aac049 != "" && aac007 != "")){
			if(aac049<aac007.substring(0,4) + aac007.substring(5,7)){
				if(id == "aac007"){
					Base.alert("【参加工作时间："+aac007+"】不能晚于【首次参保年月："+aac049+"】，请检查后重新录入！","warn");
				}
				else{
					Base.alert("【首次参保年月："+aac049+"】不能早于【参加工作时间："+aac007+"】，请检查后重新录入！","warn");
				}
				Base.setValue(id,"");
				Base.focus(id);
				return false;
			}
			// 设置每个险种的aac049，为了针对每个险种修改
			for(var i=0;i<len;i++){
		    	var checkObj = Base.getObj('aae140_'+aae140Arr[i]);
		    	if(checkObj == undefined){
		    		continue;
		    	}
		    	var ck = checkObj.checked;
		    	if(ck){
		    		Base.setValue("aac049_" + aae140Arr[i], aac049);
		    	}
		    }
		}
		
		if((id == "aac049" || id == "ajc050") && (aac049 != "" && ajc050 != "")){
			if(ajc050.substring(0,4) + ajc050.substring(5,7)<aac049){
				if(id == "aac049"){
					Base.alert("【首次参保年月："+aac049+"】不能晚于【本次参工日期："+ajc050+"】，请检查后重新录入！","warn");
				}
				else{
					Base.alert("【本次参工日期："+ajc050+"】不能早于【首次参保年月："+aac049+"】，请检查后重新录入！","warn");
				}
				Base.setValue(id,"");
				Base.focus(id);
				return false;
			}
		}
		
		// 个人参保日期ID拼接字符串
		var index = aae140Str.indexOf(id);
		var aae140 = id;
		if(index != -1){
			id = "aac030_" + id;
			var aac030 = Base.getValue(id);
			if(aac030 != "" && ajc050 != ""){
				if(aac030 < ajc050){
					Base.alert(getAae140Name(aae140)+" 个人参保日期【"+aac030+"】不能早于本次参加工作日期【"+ajc050+"】!","warn");
                    Base.setValue(id, '');							
					Base.activeTab('tab_'+aae140);
					Base.focus(id);
					return false;
				}
			}
		}
		
		if(id == "ajc050" && ajc050 != ""){
			var cks = false;
		    for(var i=0;i<len;i++){
		    	var checkObj = Base.getObj('aae140_'+aae140Arr[i]);
		    	if(checkObj == undefined){
		    		continue;
		    	}
		    	var ck = checkObj.checked;
		    	if(ck){
		    		cks = true;
		    		Base.setValue("ajc050_" + aae140Arr[i], ajc050);
		    	}
		    }
		    //单位参保时间
		    var rows = Base.getGridData("cb_grid");
			if(cks){
				Base.confirm('将个人参保日期和本次参加工作日期同步吗？',function(yes,callback){
			    	if(yes){
			    	    for(var i=0;i<len;i++){
			    	    	var checkObj = Base.getObj('aae140_'+aae140Arr[i]);
					    	if(checkObj == undefined){
					    		continue;
					    	}
					    	var ck1 = checkObj.checked;
					    	if(ck1){
					    	    for(var j = 0;j < rows.length;j++){
					    		    if(aae140Arr[i]==rows[j].aae140_cb){
					    		        var aab050_cb = rows[j].aab050_cb;
					    		        if(Base.getValue("ajc050")<(aab050_cb.substr(0,10))){
					    		            Base.alert("本次参加工作日期【"+ajc050+"】不能早于单位参保时间【"+aab050_cb.substr(0,10)+"】!","warn");
					    		            Base.setValue("ajc050", '');
					    		            return;
					    		        }
					    		    }
							    }
					    	}
					    }
			    		for(var i=0;i<len;i++){
			    			Base.setValue('aac030_'+aae140Arr[i],ajc050);
			    			Base.setValue('aae206_'+aae140Arr[i],ajc050.substr(0,4)+ajc050.substr(5,2));
			    		}
			    	}else{
			    		//个人参保时间 和 本次参加工作时间 校验及赋值
						for(var i=0;i<len;i++){
						    //个人参保日期提前全部附上本次参加工作日期
						    var checkObj = Base.getObj('aae140_'+aae140Arr[i]);
					    	if(checkObj == undefined){
					    		continue;
					    	}
							var ck = checkObj.checked;
							if(ck){
								var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
								if((aac030 != '') && (ajc050 > aac030)){
									Base.alert("本次参加工作日期【"+ajc050+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!","warn");
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
	}
	

	// 构造函数，变量为15位或者18位的身份证号码	
	function clsIDCard(CardNo) {
	  this.Valid=false;
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  if(CardNo!=null)this.SetCardNo(CardNo);
	}
	// 设置身份证号码，15位或者18位
	clsIDCard.prototype.SetCardNo = function(CardNo) {
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  CardNo=CardNo.replace(" ","");
	  var strCardNo;
	  if(CardNo.length==18) {
	    pattern= /^\d{17}(\d|x|X)$/;
	    if (pattern.exec(CardNo)==null)return;
	    strCardNo=CardNo.toUpperCase();
	  } else {
	    pattern= /^\d{15}$/;
	    if (pattern.exec(CardNo)==null)return;
	    strCardNo=CardNo.substr(0,6)+'19'+CardNo.substr(6,9)
	    strCardNo+=this.GetVCode(strCardNo);
	  }
	  this.Valid=this.CheckValid(strCardNo);
	}
	// 校验身份证有效性
	clsIDCard.prototype.IsValid = function() {
	  return this.Valid;
	}
	// 返回生日字符串，格式如下，1981-10-10
	clsIDCard.prototype.GetBirthDate = function() {
	  var BirthDate='';
	  if(this.Valid)BirthDate=this.GetBirthYear()+'-'+this.GetBirthMonth()+'-'+this.GetBirthDay();
	  return BirthDate;
	}
	// 返回生日中的年，格式如下，1981
	clsIDCard.prototype.GetBirthYear = function() {
	  var BirthYear='';
	  if(this.Valid)BirthYear=this.ID18.substr(6,4);
	  return BirthYear;
	}
	// 返回生日中的月，格式如下，10
	clsIDCard.prototype.GetBirthMonth = function() {
	  var BirthMonth='';
	  if(this.Valid)BirthMonth=this.ID18.substr(10,2);
	  if(BirthMonth.charAt(0)=='0')BirthMonth=BirthMonth.charAt(1);
	  return BirthMonth;
	}
	// 返回生日中的日，格式如下，10
	clsIDCard.prototype.GetBirthDay = function() {
	  var BirthDay='';
	  if(this.Valid)BirthDay=this.ID18.substr(12,2);
	  return BirthDay;
	}
	// 返回性别，1：男，0：女
	clsIDCard.prototype.GetSex = function() {
	  var Sex='';
	  if(this.Valid)Sex=this.ID18.charAt(16)%2;
	  return Sex;
	}
	// 返回15位身份证号码
	clsIDCard.prototype.Get15 = function() {
	  var ID15='';
	  if(this.Valid)ID15=this.ID15;
	  return ID15;
	}
	// 返回18位身份证号码
	clsIDCard.prototype.Get18 = function() {
	  var ID18='';
	  if(this.Valid)ID18=this.ID18;
	  return ID18;
	}
	// 返回所在省，例如：上海市、浙江省
	clsIDCard.prototype.GetLocal = function() {
	  var Local='';
	  if(this.Valid)Local=this.Local;
	  return Local;
	}
	clsIDCard.prototype.GetVCode = function(CardNo17) {
	  var Wi = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
	  var Ai = new Array('1','0','X','9','8','7','6','5','4','3','2');
	  var cardNoSum = 0;
	  for (var i=0; i<CardNo17.length; i++)cardNoSum+=CardNo17.charAt(i)*Wi[i];
	  var seq = cardNoSum%11;
	  return Ai[seq];
	}
	clsIDCard.prototype.CheckValid = function(CardNo18) {
	  if(this.GetVCode(CardNo18.substr(0,17))!=CardNo18.charAt(17))return false;
	  if(!this.IsDate(CardNo18.substr(6,8)))return false;
	  var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
	  if(aCity[parseInt(CardNo18.substr(0,2))]==null)return false;
	  this.ID18=CardNo18;
	  this.ID15=CardNo18.substr(0,6)+CardNo18.substr(8,9);
	  this.Local=aCity[parseInt(CardNo18.substr(0,2))];
	  return true;
	}
	clsIDCard.prototype.IsDate = function(strDate) {
	  var r = strDate.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/);
	  if(r==null)return false;
	  var d= new Date(r[1], r[2]-1, r[3]);
	  return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[2]&&d.getDate()==r[3]);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>