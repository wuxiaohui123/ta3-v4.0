<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>WorkinjuryDeclaration</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
		
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			 
			<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
			<ta:panel id="fset1" cols="3" key="人员基本信息">
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<ta:text id="aab001_dq" key="当前单位ID" readOnly="true" labelWidth="130" />
				<ta:text id="aab999_dq" key="当前单位管理码" readOnly="true" labelWidth="130" />
				<ta:text id="aae044_dq" key="当前单位名称" readOnly="true" labelWidth="130" />
			</ta:panel>
			<!-- 录入工伤认定登记信息 -->
			<ta:panel id="gssbxx" key="工伤申报登记" cols="3">
				<ta:text id="aaz128" key="工伤申报id" display="false" labelWidth="130" />
				<%@ include file="/yhsi3/benefit/common/unitBaseInfo.jsp"%>
				<ta:date id="alc020" key="工伤发生时间" showSelectPanel="true" required="true" validNowTime="left" onChange="timealert();" labelWidth="130" />
				<ta:text id="alc005" key="工伤申报备案编号" required="true" labelWidth="130" />
				<ta:selectInput id="alc021" key="伤害程度" required="true" collection="ALC021" onSelect="validateALC021" labelWidth="130" />
				<ta:selectInput id="alc022" key="伤害部位" required="true" collection="ALC022" labelWidth="130" />
				<ta:selectInput id="ala023" key="与受伤害人关系" required="true" collection="ALA023" labelWidth="130" value="3" />
				<ta:selectInput id="ylc035" key="工伤人员类别" required="true" collection="YLC035" labelWidth="130" value="1" filter="3" />
				<ta:date id="alc026" key="报告日期" showSelectPanel="true" required="true" validNowTime="left" onChange="yhjb_bgtimepd()" labelWidth="130" />
				<ta:date id="alc040" key="死亡/失踪日期" showSelectPanel="true" required="true" validNowTime="left" onChange="timealert();" labelWidth="130" />
				<ta:text id="aca111" key="职业/工种" labelWidth="130" />
				<ta:selectInput id="ala017" key="职业病" collection="ALA017" labelWidth="130" />
				<ta:text id="alc007" key="诊断机构" labelWidth="130" />
				<ta:text id="aac042" key="申报人姓名" labelWidth="130" />
				<ta:selectInput id="aac043" key="申报人证件类型" collection="AAC043" value="1" labelWidth="130" />
				<ta:text id="aac044" key="申报人证件号码" maxLength="18" labelWidth="130" />
				<ta:number id="aac045" key="申报人电话" max="9999999999999" labelWidth="130" />
				<ta:text id="aac046" key="申报人地址" labelWidth="130" />
				<ta:textarea id="alc006" span="3" key="伤害事件情况" height="40px" />
				<ta:textarea id="alc014" span="3" key="诊断意见" height="40px" />
			</ta:panel>
			<!-- 历史工伤申报列表，可修改或删除选中项 -->
			<ta:panel key="工伤历史申报信息" id="lssbxx">
				<ta:datagrid id="lc30Grid" haveSn="true" snWidth="20">
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
					<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
					<ta:datagridItem id="aaz128" key="工伤申报ID" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
					<ta:datagridItem id="aae044" key="单位名称" />
					<ta:datagridItem id="aac042" key="申报人姓名" />
					<ta:datagridItem id="alc020" key="工伤发生时间" width="120" />
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" />
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" />
					<ta:datagridItem id="ala023" key="与受伤害人关系" collection="ALA023" width="120" />
					<ta:datagridItem id="alc026" key="报告日期" />
					<ta:datagridItem id="alc005" key="申报备案编号" width="120" />
					<ta:datagridItem id="alc007" key="诊断机构" />
					<ta:datagridItem id="aca111" key="职业/工种" collection="ACA111" />
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017" />
					<ta:datagridItem id="ylc035" key="工伤人员类别" collection="YLC035" width="120" />
					<ta:datagridItem id="alc040" key="因工死亡(失踪)日期" width="140" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>

	</body>
</html>
<script type="text/javascript">
	//初始化页面布局
	$(document).ready(function() {
		$("form").css("overflow","auto");
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
			Base.submit("fset1", "workinjuryDeclarationAction!queryPersonInfo.do");  
		}, true);
	}
	
	//单位信息RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, function(){
			Base.submit("fset1,aab001,aae044", "workinjuryDeclarationAction!insureInfo.do");  
		}, true);
	}
	
	//回调函数查询初始化页面信息
	function fn_queryInfo(){ //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
   		if (g_Suggest!=""){ 
   		    fn_setPersonBaseInfoData();
   			Base.setValue("aac044",g_Suggest[0]);
   			Base.setValue("aac042",g_Suggest[1]);	
			Base.submit("fset1", "workinjuryDeclarationAction!queryPersonInfo.do");  
   		}
	}
	
	function fn_ab01Info(){ //fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
   		if (g_Suggest!=""){ 
   		    fn_setUnitBaseInfoData();
			Base.submit("fset1,aab001,aae044", "workinjuryDeclarationAction!insureInfo.do");  
   		}
	}

	//保存经办信息
	function submitData(){
		if(!Base.validateForm("gssbxx")){
			Base.hideMask();
			return false;
		}
		
		//操作选择
		var aaz128 = Base.getValue("aaz128");
		if(aaz128 != null && aaz128 != ""){
			if(!confirm("确认更新？")){ 
				return false; 
			}
		}

		Base.submit("form1", "workinjuryDeclarationAction!toSave.do",null,null,null,function callBack(){
			//Base.setGridColumnHidden("lc30Grid","btnDelete");
			//Base.setGridColumnHidden("lc30Grid","btnUpdate");
		});
	}
	
	//时间点是否参加工伤保险
	function timealert(){
		var alc020 = Base.getValue("alc020");
		var alc040 = Base.getValue("alc040");
		var aab001 = Base.getValue("aab001");
		if(aab001 == null || aab001 == ""){
			return false;
		}
		
		if ((alc020 != null && alc020 != "" )&&(alc040 != null && alc040 != "" )){
		   if (alc020 > alc040){
		        alert("工伤发生时间晚于失踪或死亡时间，请核实！")
		        Base.setValue("alc040","");
				Base.focus(alc040);
		    }
		}
		
		//工伤
		if(alc020 != null && alc020 != "" ){
			Base.submit("fset1","workinjuryDeclarationAction!insureInfo.do",{"dto['timePoint']":alc020,"dto['aab001']":aab001,"dto['aae044']":Base.getValue("aae044")});
		}
		//工亡 
		if(alc040 != null && alc040 != "" ){
			//Base.setValue("alc020",alc040);
			Base.submit("fset1","workinjuryDeclarationAction!insureInfo.do",{"dto['timePoint']":alc040,"dto['aab001']":aab001,"dto['aae044']":Base.getValue("aae044")});
		}
	}
	
	//修改申报信息
	function fnUpdate(data,e){
	 	Base.setValue("aaz128",data.aaz128);
	 	Base.submit("fset1","workinjuryDeclarationAction!getByAaz128.do",{"dto['aaz128']":Base.getValue("aaz128")},null,null);
	 	validateALC021();
	 }
	
	//删除申报信息
	function fnDelRow(data,e){
		var aaz128 = data.aaz128;
		var row = data.row;
		Base.confirm("确认要删除?",function(btn, callback,options) {
		if (btn) {	
			Base.submit("fset1,procInc", "workinjuryDeclarationAction!toSave.do",{"dto['aaz128']":aaz128,"dto['yae587']":"3"},null,null,null);
			}
		});
	}
	
	//伤害程度为受伤时工伤死亡、失踪时间，工亡类别不可录入
	function validateALC021(){
		var alc021 = Base.getValue("alc021");
		if(alc021 == null || alc021 == ""){
			return false;
		}
	    if("2"==alc021||"3"==alc021){
			Base.setValue("alc040","");
			Base._setIsRequired("alc040",false);
			Base._setIsRequired("alc020",true);
			Base.setReadOnly("alc040");
			Base._setReadOnly("alc020",false);
	    }
	    else{
			Base._setIsRequired("alc040",true);
			Base._setReadOnly("alc040",false);
			
			//判断操作不是更新
			var aaz127 = Base.getValue("aaz127");
			if(aaz127 != null && aaz127 != ""){
				return false; 
			}
			//不能认定两次死亡或失踪，更新不判断
			var rowData = Base.getGridData("lc30Grid");
			for(var i=0;i< rowData.length;i++){
				if(rowData[i].alc021 == "1" || rowData[i].alc021 == "4"){
					Base.alert("该人员已进行过失踪或死亡申报!");
					Base.setValue("alc021","");
					return false;
				}
			}
	    }
	}
	
	function yhjb_bgtimepd(){
	   var alc026 = Base.getValue("alc026");
	   var alc020 = Base.getValue("alc020");
	   
	   if ((alc026 != null && alc026 != '')&&(alc020 != null && alc020 != "" )){
	      if (alc026 < alc020){
	           alert("工伤发生时间晚于报告时间，请核实！")
		       Base.setValue("alc026","");
			   Base.focus(alc026);
	       }
	   }
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>
