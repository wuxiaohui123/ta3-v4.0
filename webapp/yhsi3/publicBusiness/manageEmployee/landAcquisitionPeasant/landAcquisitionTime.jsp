<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>征地时间认定</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>  
	<body class="no-scrollbar" style="padding:0px;margin:0px" >
		<ta:pageloading />
		<ta:toolbar id="tld">
			<ta:button key="保存[S]" icon="xui-icon-spotSave" hotKey="s" asToolBarItem="true" id="saveBtn" onClick="fnSave();"/>
			<ta:button key="重置[R]" icon="xui-icon-spotReset" hotKey="r" asToolBarItem="true" id="resetBtn" type="resetPage"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
	    	<ta:panel key="个人信息" cols="3" id="fltPerson" scalable="false" expanded="false">
			    <ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="190" required="true" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="190"/>
				<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="190" readOnly="true"/>
				<ta:selectInput id="aac058" key="证件类型" labelWidth="190" collection="aac058" readOnly="true"/>
				<ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="190"/>
				<ta:date id="aac006" key="出生日期" labelWidth="190" readOnly="true"/>
			</ta:panel>
			<ta:panel key="认定时间" cols="3" id="fltTime" scalable="false" expanded="false">
			    <ta:box span="3" cols="3">
				    <ta:date id="aae041" key="开始年月" required="true" showSelectPanel="true" issue="true" labelWidth="190" onChange="fnChangeAAE041()"/>
				    <ta:date id="aae042" key="结束年月" required="true" showSelectPanel="true" issue="true" labelWidth="190" onChange="fnChangeAAE042()"/>
				    <ta:selectInput id="yae825" key="变更类型" required="true" collection="YAE825" labelWidth="190" value="1" readOnly="true"/>
			    </ta:box>
			    <ta:buttonLayout span="3">
			     	<ta:button id="addBtn" key="增加" icon="xui-icon-spotAdd" onClick="fnAdd()"/>
				</ta:buttonLayout>
			</ta:panel>
			<ta:tabs id="tab" fit="true">
				<ta:tab id="tab_cbInfo" key="参保信息">
			    	<ta:datagrid id="dgCBInfo" fit="true" haveSn="true">
			        	<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
			        </ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_tj" key="缴费信息统计">
			    	<ta:datagrid id="tjGrid" haveSn="true" fit="true" forceFitColumns="true" columnFilter="true">
						<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
					    <ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
					    <ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="12"></ta:datagridItem>
					    <ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
					    <ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
				    	<ta:datagridItem id="aae078" key="到帐标志" collection="aae078" align="center" sortable="true" maxChart="4"></ta:datagridItem>
				    	<ta:datagridItem id="aae201" key="缴费月数" maxChart="4"  align="center"  tatalsTextShow="false" totals="sum" formatter="fnFormatterTJ"></ta:datagridItem>
					</ta:datagrid>
			    </ta:tab>
			    <ta:tab id="tab1" key="征地信息" cols="3">
			    	<ta:text id="yac301" key="城市(县、镇)规划区内或外" labelWidth="190" maxLength="6" readOnly="true"/>
					<ta:text id="yac300" key="征地项目或批次" labelWidth="190" maxLength="50" readOnly="true"/>
					<ta:number id="yac302" key="征地后家庭人均耕地面积(亩)" labelWidth="190" min="0" precision="2" readOnly="true"/>
					<ta:text id="aac010" key="户口所在地" labelWidth="190" maxLength="50" readOnly="true"/>
					<ta:text id="aae005" key="联系电话" labelWidth="190" maxLength="25" readOnly="true"/>
					<ta:text id="yac303" key="镇人民政府(街道办事处)" labelWidth="190" maxLength="50" readOnly="true"/>
					<ta:text id="aae013" key="备注" maxLength="50" span="3" readOnly="true" labelWidth="190"/>
				</ta:tab>
				<ta:tab id="tab2" key="补贴时间认定明细">
			    	<ta:datagrid id="dgTimeInfo" fit="true" haveSn="true">
			             <%--
			            <ta:datagridItem id="anniu1" icon="xui-icon-spotDelete" key="删除" click="fnDelete1" maxChart="2" align="center"></ta:datagridItem>
			             --%>
			            <ta:datagridItem id="aac001" key="个人编号" maxChart="20" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae041" key="开始时间" maxChart="18" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae042" key="结束时间" maxChart="18" align="center"></ta:datagridItem>
			        	<ta:datagridItem id="aae201" key="月数" maxChart="16" align="center"></ta:datagridItem>
			    	</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab3" key="认定时间">
			        <ta:datagrid id="dgRDTime" fit="true" haveSn="true">
			            <ta:datagridItem id="anniu2" icon="xui-icon-spotDelete" key="删除" click="fnDelete2" maxChart="2" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aac001" key="个人编号" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae041" key="开始时间" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae042" key="结束时间" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="aae201" key="月数" maxChart="12" align="center"></ta:datagridItem>
			            <ta:datagridItem id="yae825" key="变更类型" maxChart="12" collection="YAE825" align="center"></ta:datagridItem>
			    	</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab4" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>

<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");
		Base.setDisabled("saveBtn");
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 2, false);
	});
	
	//根据个人编号的查询个人信息的回调方法
	function fn_queryInfoPerson(){
		if (g_Suggest!=""){ 
			Base.setValue('aac001',g_Suggest[2]);
			Base.submit("aac001", "landAcquisitionTimeAction!toQuery.do");  //查询信息
		}
	}
	
	//开始时间
	function fnChangeAAE041(){
	    var aae041 = Base.getValue("aae041");
	    var aae042 = Base.getValue("aae042");
	    //先校验开始时间与结束时间
	    if(aae041!="" && aae042!=""){
	        if(aae041>aae042){
	            alert("开始时间不能大于结束时间!");
	            Base.setValue("aae041","");
	            return;
	        }
	    }
	    //与已有的认定时间校验
	    var dgTimeInfo = Base.getGridData("dgTimeInfo");
	    if(dgTimeInfo.length>0){
	        for(var i=0;i<dgTimeInfo.length;i++){
		        var aae041_dg = dgTimeInfo[i].aae041;
		        var aae042_dg = dgTimeInfo[i].aae042;
		        if(aae041_dg<=aae041&&aae042_dg>=aae041){
		            alert("此认定时间已存在!");
		            Base.activeTab("tab2");
		            Base.setValue("aae041","");
		            return;
		        }
		    }
	    }
	    //与已添加的时间校验
	    var dgRDTime = Base.getGridData("dgRDTime");
	    if(dgRDTime.length>0){
	        for(var i=0;i<dgRDTime.length;i++){
		        var aae041_rd = dgRDTime[i].aae041;
		        var aae042_rd = dgRDTime[i].aae042;
		        if(aae041_rd<=aae041&&aae042_rd>=aae041){
		            alert("此认定时间已添加!");
		            Base.setValue("aae041","");
		            return;
		        }
		    }
	    }
	}
	
	//结束时间
	function fnChangeAAE042(){
	    var aae041 = Base.getValue("aae041");
	    var aae042 = Base.getValue("aae042");
	    //先校验开始时间与结束时间
	    if(aae041!=""&&aae042!=""){
	        if(aae041>aae042){
	            alert("结束时间不能小于开始时间!");
	            Base.setValue("aae042","");
	            return;
	        }
	    }
	    //与已有的认定时间校验
	    var dgTimeInfo = Base.getGridData("dgTimeInfo");
	    if(dgTimeInfo.length>0){
	        for(var i=0;i<dgTimeInfo.length;i++){
		        var aae041_dg = dgTimeInfo[i].aae041;
		        var aae042_dg = dgTimeInfo[i].aae042;
		        if(aae041_dg<=aae042&&aae042_dg>=aae042){
		            alert("此认定时间已存在!");
		            Base.setValue("aae042","");
		            Base.activeTab("tab2");
		            return;
		        }
		    }
	    }
	    //与已添加的时间校验
	    var dgRDTime = Base.getGridData("dgRDTime");
	    if(dgRDTime.length>0){
	        for(var i=0;i<dgRDTime.length;i++){
		        var aae041_rd = dgRDTime[i].aae041;
		        var aae042_rd = dgRDTime[i].aae042;
		        if(aae041_rd<=aae042&&aae042_rd>=aae042){
		            alert("此认定时间已添加!");
		            Base.setValue("aae042","");
		            return;
		        }
		    }
	    }
	}
	function fnFormatterTJ(row, cell, value, columnDef, dataContext) {
        if(dataContext.aae078=='0'){
            return  "<span style='color:red;'>"+dataContext.aae201+"</span>";
        }else if(dataContext.aae078=='1'){
            return  "<span style='color:green;'>"+dataContext.aae201+"</span>";
        }else if(dataContext.aae078=='2'){
            return  "<span style='color:blue;'>"+dataContext.aae201+"</span>";
        }
    }
	//增加
	function fnAdd(){
	    var aae041 = Base.getValue("aae041");
	    if(aae041==""||aae041==null){
	        alert("请填写开始时间");
	        return;
	    }
	    var aae042 = Base.getValue("aae042");
	    if(aae042==""||aae042==null){
	        alert("请填写结束时间");
	        return;
	    }
	    var rowdata = Base.getGridData("dgRDTime");
	    var param = {};
	    param.d2List = Ta.util.obj2string(rowdata);
	    Base.submit("aac001,aae041,aae042,yae825","landAcquisitionTimeAction!toAdd.do",param,null,false,function(){
	        Base.setValue("aae041","");
	        Base.setValue("aae042","");
	    });
	}
	
	//删除
	/*
	function fnDelete1(){
	    
	}
	*/
	
	//删除已添加的信息
	function fnDelete2(data,e){
	    Base.confirm("确认删除登帐信息？",function(yes){
		       if (yes) {
		           Base.deleteGridRow("dgRDTime",data.row);
		       }
		    });
	}
	
	//保存
	function fnSave(){
	    var rowdata = Base.getGridData("dgRDTime");
	    if(rowdata.length==0){
	        alert("请增加认定时间！");
	        return;
	    }
	    var param = {};
	    param.d2List = Ta.util.obj2string(rowdata);
		Base.submit("fltPerson", "landAcquisitionTimeAction!toSave.do",param);  //保存信息
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>