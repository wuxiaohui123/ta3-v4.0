<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>被征地农民认定</title>
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
			<ta:panel key="征地信息" cols="3" id="fltLand" scalable="false" expanded="false">
			    <ta:selectInput id="yac301" key="城市(县、镇)规划区内或外" required="true" labelWidth="190" collection="YAC301"/>
			    <ta:text id="yac300" key="征地项目或批次" required="true" labelWidth="190" maxLength="50" onChange="fnChang(Base.getValue('yac300'))"/>
			    <ta:number id="yac302" key="征地后家庭人均耕地面积(亩)" required="true" labelWidth="190" min="0" precision="2"/>
			    <ta:selectInput id="aac010" key="户口所在地" labelWidth="190" collection="AAB301" islevel="true" isMustLeaf="true" maxVisibleRows="10" filter="450401" required="true"/>
			    <ta:text id="aae005" key="联系电话" required="true" labelWidth="190" maxLength="25"/>
			    <ta:text id="yac303" key="镇人民政府(街道办事处)" required="true" labelWidth="190"/>
			    <ta:text id="aae013" key="备注" labelWidth="190" maxLength="50" span="3"/>
			</ta:panel>
			<ta:panel key="银行账号信息" cols="3" id="fltBank" scalable="false" expanded="false">
			    <ta:text id="aaz065" key="开户银行帐号ID" labelWidth="130" maxLength="20" onChange="sfwQueryUtil(2,'getBankAf07',Base.getValue('aaz065'))"/>
	            <ta:text id="aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
	            <ta:selectInput id="aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
	            <ta:text id="aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
	            <ta:text id="aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
			</ta:panel>
			<ta:tabs id="tab" fit="true">
			    <ta:tab id="tab1" key="个人参保信息">
					<ta:datagrid id="dgCBInfo" fit="true">
					    <%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab2" key="事件流程记录">
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
		initializeSuggestFramework(2, null, 'aaz065', 400, 80, 2, fnSelect2, 0, false);  
	});
	
	//根据个人编号的查询个人信息的回调方法
	function fn_queryInfoPerson(){
		if (g_Suggest!=""){ 
			Base.setValue('aac001',g_Suggest[2]);
			Base.submit("aac001", "landAcquisitionPeasantAction!toQuery.do");  //查询信息
		}
	}
	function fnSelect2(){
	    Base.setValue("aaz065",g_Suggest[0]);
	    Base.setValue("aae044",g_Suggest[1]);
	    Base.submit("aaz065", "landAcquisitionPeasantAction!toQueryBank.do");  //查询信息
	    Base.focus("aae010");    
	}
	//保存
	function fnSave(){
	    var aaz065 = Base.getValue("aaz065");
	    var aaf002 = Base.getValue("aaf002");
	    var aae009 = Base.getValue("aae009");
	    var aae010 = Base.getValue("aae010");
	    if(aaz065!=''||aaf002!=''||aae009!=''||aae010!=''){
	        if(aaz065==''||aaf002==''||aae009==''||aae010==''){
	            alert("请填写完整银行账号信息！");
	            return;
	        }
	    }
		Base.submit("form1", "landAcquisitionPeasantAction!toSave.do");  //保存信息
	}
	
	function fnChang(yac300){
		var yac300 = Base.getValue("yac300");
		var yac300_new = yac300.replace("\\", "/");
		Base.setValue("yac300",yac300_new);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>