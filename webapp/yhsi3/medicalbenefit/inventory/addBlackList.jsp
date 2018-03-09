<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>黑名单申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" asToolBarItem="true" />
			<ta:button id="backBtn" key="撤销黑名单[T]" icon="xui-icon-spotClose" hotKey="T" onClick="fn_back()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="panel1" key="黑名单新增" cols="3" >
				<ta:selectInput id="aaa028" key="当事人类别" collection="AAA028" onSelect="onSelect" labelWidth="120" required="true" filter="1,2" reverseFilter="true"/> 
				<ta:box cols="2" id="personBox">
					<ta:text id="aac001" key="个人ID" required="true" maxLength="20" labelWidth="120" onChange="getAc01Info(fn_query())" columnWidth="0.9"/>
					<ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
				</ta:box>
				<ta:box cols="2" id="ogniBox">
					<ta:text id="aab001" key="单位ID" labelWidth="120" onChange="getAb01Info(fn_query())" columnWidth="0.9"/>
 					<ta:button id="ogniSmallBtn" key="?" onClick="showOgniWindow()" />
				</ta:box>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120"/>
				<ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" />
				<ta:selectInput id="aae140" key="险种" collection="AAE140" readOnly="true" labelWidth="120" />
				<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="120" />
				<ta:selectInput id="yke035" key="黑名单类型"  labelWidth="120"  collection="YKE035" required="true"/>				
				<ta:text id="yke036" key="封锁原因"  labelWidth="120"  span="2" />
				<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
				<ta:selectInput id="yac299" key="人员类别" readOnly="true" collection="YAC299" labelWidth="120" display="false"/>			
				<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" display="false"/>			
				<ta:selectInput id="aac093" key="最高荣誉称号级别代码（劳模级别）" readOnly="true" collection="AAC093" labelWidth="120" display="false"/>			
				<ta:selectInput id="aja004" key="农民工标识" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>			
				<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" display="false"/>
				<ta:selectInput id="aab020" key="经济类型" readOnly="true" collection="AAB020" labelWidth="120" display="false"/>
				<ta:selectInput id="aab021" key="隶属关系" readOnly="true" collection="AAB021" labelWidth="120" display="false"/>
				<ta:selectInput id="aab065" key="特殊单位类别" readOnly="true" collection="AAB065" labelWidth="120" display="false"/>
				<ta:selectInput id="yab019" key="单位管理类型" readOnly="true" collection="YAB019" labelWidth="120" display="false"/>
				<ta:text id="aab999" key="单位管理码"  readOnly="true" span="2" labelWidth="120" display="false"/>
			</ta:panel>
			<ta:panel id="panel2" key="黑名单历史记录" fit="true">
				<ta:datagrid id="kc62List" fit="true" haveSn="true" forceFitColumns="true" selectType="checkbox">
					<ta:datagridItem id="aaz267" key="封锁事件ID" hiddenColumn="false"/>
					<ta:datagridItem id="aaa028" key="当事人类别" align="center" collection="AAA028" width="20" />
					<ta:datagridItem id="aaz010" key="当事人编号" align="center" width="30" showDetailed="true" />
					<ta:datagridItem id="aac003" key="当事人名称" align="center" width="50" showDetailed="true" />
					<ta:datagridItem id="yke035" key="黑名单类型" collection="YKE035" align="center" width="30" />
					<ta:datagridItem id="aae100" key="有效标志" collection="AAE100" align="center" width="20" hiddenColumn="false"/>
					<ta:datagridItem id="yke036" key="封锁原因" align="center" showDetailed="true" />
					<ta:datagridItem id="aae016" key="新增复核标志" collection="AAE016" align="center" width="20" />
					<ta:datagridItem id="yke248" key="撤销复核标志" collection="AAE016" align="center" width="20" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.setValue('yke035','01');
		Base.setValue("aaa028","2");
		onSelect();
	});
	//单位回调函数
	function callbackFunOgni(){
		fn_query();
	}
	//人员窗口回调函数
	function callbackFunPerson(){
		getAc01Info(fn_query());
    }
	function onSelect(){
		if(Base.getValue('aaa028') == '2'){
			Base.showObj('personBox,aac003,yab139,aae140');
			Base.hideObj('ogniBox,aae044');
			Base.setValue('aab001','');
			Base.setValue('aae044','');
		}else if(Base.getValue('aaa028') == '1'){
			Base.showObj('ogniBox,aae044');
			Base.hideObj('personBox,aac003,yab139,aae140');
			Base.setValue('aac001','');
			Base.setValue('aac003','');
			Base.setValue('yab139','');
			Base.setValue('aae140','');
			Base.setValue('aac066','');
			Base.setValue('yac299','');
			Base.setValue('aac020','');
			Base.setValue('aac093','');
			Base.setValue('aja004','');
		}
	}
	//保存页面信息
	function fn_query(){
		Base.submit("aac001,aab001", "addBlackListAction!toQuery.do");
	}
	//保存页面信息
	function toSave(){
		Base.submit('form1','addBlackListAction!toSave.do');
	}
	//撤销
	function fn_back(){
	    var d_data = Base.getGridSelectedRows("kc62List");
		if(d_data == null || d_data == ""){
			Base.alert("请勾选数据");
			return;
		}
		for(var i = 0; i < d_data.length; i++){
			if(d_data[i].aae016 == "0"){
			   Base.alert("不能撤销，当事人名称为"+d_data[i].aac003+"已新增申请还未复核！",'warn');
			   return false;
			}
			if("0" == d_data[i].aae016_2){
	           Base.alert("不能撤销，当事人名称为"+d_data[i].aac003+"已撤销申请还未复核！",'warn');
	           return false;
	         }
		}
		var parameter = {};
  	    parameter["dto['aac001']"] = Base.getValue("aac001");
  	    parameter["dto['aab001']"] = Base.getValue("aab001");
  	    parameter.kc62List = Ta.util.obj2string(d_data);
		Base.submit(null,'addBlackListAction!toBack.do',parameter);   
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
