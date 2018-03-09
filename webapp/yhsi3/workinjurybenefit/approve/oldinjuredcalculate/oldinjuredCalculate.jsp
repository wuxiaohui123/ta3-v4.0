<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>老工伤待遇审理</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>	
			</ta:panel>	
			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			</ta:panel>

			<!-- 初始化工伤认定信息 -->
			<ta:panel id="gsrdxx" key="工伤信息" height="100px">
				<ta:datagrid id="gsxxList" fit="true" selectType="radio" onSelectChange="fnGsxxSelectChange" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true">
					</ta:datagridItem>
					<ta:datagridItem id="alc020" key="工伤时间" dataType="date">
					</ta:datagridItem>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022">
					</ta:datagridItem>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021">
					</ta:datagridItem>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040">
					</ta:datagridItem>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060">
					</ta:datagridItem>
					<ta:datagridItem id="alc029" key="认定结论" collection="ALC029">
					</ta:datagridItem>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027">
					</ta:datagridItem>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017">
					</ta:datagridItem>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="140">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="bxxxlr" key="其他信息录入" cols="3">
				<ta:text id="aaz127" key="工伤认定ID" readOnly="true" display="false" />
				<ta:number id="scjt" key="伤残津贴" labelWidth="130" required="true" precision="2" asAamount="true" />
				<ta:number id="shhlf" key="生活护理费" labelWidth="130" required="true" precision="2" asAamount="true" />
				<ta:date id="aae041" key="待遇开始享受年月" labelWidth="130" required="true" showSelectPanel="true" issue="true"/>
				<ta:number id="gyfxj" key="供养抚恤金" labelWidth="130" precision="2" asAamount="true" display="false" />
			</ta:panel>
			<ta:box id="paymentInfo">
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
			</ta:box>
            <ta:tabs fit="true">
                <ta:tab id="dqdyxx" key="本次核定信息">
					<ta:datagrid id="dqdyxxList" forceFitColumns="true" haveSn="true">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
						</ta:datagridItem>
						<ta:datagridItem id="aae128" key="核发金额">
						</ta:datagridItem>
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
						</ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间">
						</ta:datagridItem>
					</ta:datagrid>
			     </ta:tab>
				 <ta:tab id="dybtxx" key="补发核定信息">
					<ta:datagrid id="dqbfxxList" forceFitColumns="true" haveSn="true">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="130" align="center" dataAlign="center"/>
						<ta:datagridItem id="aae128" key="核发金额" width="130" align="center" dataAlign="right" totals="sum" totalsAlign="right" tatalsTextShow="false"/>
						<ta:datagridItem id="aae016" key="复核标志" width="120" collection="AAE016" align="center" dataAlign="center"/>
						<ta:datagridItem id="aae003" key="对应所属期" width="120" align="center" dataAlign="center"/>
					</ta:datagrid>
				 </ta:tab>
		     </ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("form").css("overflow","auto");
		fn_FfxxlrInitialization();
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
			Base.submit("","oldinjuredCalculateAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
		}, true);
	}
	
	//回调函数
	function fn_queryInfo(){
	   if (g_Suggest!=""){
		   fn_setPersonBaseInfoData();
		    Base.setValue("aae133",g_Suggest[1]);
			Base.submit("jbxxfset","oldinjuredCalculateAction!queryPersonInfo.do");
	   }
	}
	
	//选择动作
 	function fnGsxxSelectChange(rowsData,n){
 		if(rowsData == ""){
 			return false;
 		}
 		
 		Base.setValue("aaz127",rowsData[0].aaz127);
 		Base.setValue("alc021",rowsData[0].alc021);
 		Base.submit("", "oldinjuredCalculateAction!queryUnitInfo.do",{"dto['aaz127']":rowsData[0].aaz127,"dto['aac001']":Base.getValue("aac001")});
 		fnChange();
 	}
 	
 	//根据待遇类型控制输入页面
	function fnChange(){
		var alc021 = Base.getValue("alc021");
		if(alc021 == null || alc021 == ""){
			return false;
		}
	  	if(alc021=="1" || alc021=="4"){
	  		Base._setReadOnly(["scjt","shhlf"],true);
	  		Base._setIsRequired(["scjt","shhlf"],false);
	  		Base._setReadOnly(["gyfxj"],false);
	  		Base._setIsRequired(["gyfxj"],true);
	  	}else if(alc021=="2" || alc021=="3"){
	  		Base._setReadOnly(["scjt","shhlf"],false);
	  		Base._setIsRequired(["scjt","shhlf"],true);
	  		Base._setReadOnly(["gyfxj"],true);
	  		Base._setIsRequired(["gyfxj"],false);
	  	}
	}
	
	//提交
	function submitData(){
		if(!Base.validateForm("form1")){
			Base.hideMask();
			return false;
		}
		
		var gs = Base.getGridSelectedRows("gsxxList");
		if(gs.length == 0){
			Base.alert("请先选择本次审理的工伤认定信息","error");
			return false;
		}
		
		Base.submit("form1", "oldinjuredCalculateAction!toSave.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
