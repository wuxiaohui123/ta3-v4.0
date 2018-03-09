<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>工伤待遇审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇审批[S]" icon="icon-save" hotKey="S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印" hotKey="ctrl+P" onClick="print();" asToolBarItem="true" display="false"/>
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:fieldset key="审核信息" cols="4" id="fltjb">
			<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" span="2" />
			<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" value="1" span="2" readOnly="true" />
			<ta:textarea id="aae013" span="2" key="审核意见" height="40px"/>
			<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="40px" readOnly="true" />
			<ta:buttonLayout span="2">
				<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
			</ta:buttonLayout>
			<ta:buttonLayout span="2">
				<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
			</ta:buttonLayout>
		</ta:fieldset>
		
		<ta:fieldset id="grjbxx" key="工伤人员信息" cols="4" cssStyle="margin-left:3px" >
			<ta:text id="aac003" key="姓名" required="true" cssStyle="margin-top:8px"  readOnly="true"/>
			<ta:text id="aac002" key="公民身份证号码" cssStyle="margin-top:8px" required="true" labelWidth="120" span="2" readOnly="true"/>
			<ta:text id="aac001" key="人员ID" required="true" cssStyle="margin-top:8px" readOnly="true" display="false"/>
			<ta:selectInput id="aac060" key="生存状态" cssStyle="margin-top:8px" collection="AAC060" readOnly="true"  />
			<ta:text id="aab999" key="单位管理码" cssStyle="margin-top:8px"  readOnly="true" />
			<ta:text id="aae044" key="单位名称" cssStyle="margin-top:8px" labelWidth="120" span="2" readOnly="true"/>
			<ta:text id="aab001" key="单位ID" cssStyle="margin-top:8px"  readOnly="true" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" cssStyle="margin-top:8px" readOnly="true"  />
	    </ta:fieldset>
	    
		<ta:panel id="gsxx" key="人员工伤信息" height="83px"   bodyStyle="margin:0px">
			<ta:datagrid id="gsxxList" fit="true" selectType="radio" >
				<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false" > </ta:datagridItem>
		        <ta:datagridItem id="alc020" key="工伤时间" > </ta:datagridItem>
				<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035" > </ta:datagridItem>
		        <ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" > </ta:datagridItem>
		        <ta:datagridItem id="alc027" key="工伤类别" collection="ALC027" > </ta:datagridItem>
		        <ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" > </ta:datagridItem>
		        <ta:datagridItem id="alc060" key="护理等级" collection="ALC060" > </ta:datagridItem>
		        <ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" > </ta:datagridItem>
		        <ta:datagridItem id="alc029" key="认定结论" collection="ALC029" > </ta:datagridItem>
		        <ta:datagridItem id="ylc002" key="工亡类别" collection="YLC002" > </ta:datagridItem>
		        <ta:datagridItem id="ala017" key="职业病" collection="ALA017" > </ta:datagridItem>
		        <ta:datagridItem id="alc040" key="因公死亡(失踪)日期" > </ta:datagridItem>
		        <ta:datagridItem id="ylc040" key="死亡原因" > </ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
		
		<ta:fieldset id="ffxxlr" key="一次性发放信息录入" cols="3" cssStyle="margin-left:3px">
			<ta:selectInput id="aae145" key="支付方式 " required="true" collection="AAE145" value="11" onSelect="checkRequired" filter="13,21,22,41" />
			<ta:selectInput id="aac059" key="领取人证件类型 " required="true" collection="AAC059" value="1" />
			<ta:text id="aae136" key="领取人证件号" required="true" />
			<ta:text id="aae133" key="领取人姓名  " required="true" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" required="true" />
			<ta:text id="aae010" key="银行账号" required="true" />
			<ta:text id="aae007" key="邮政编码" />
			<ta:text id="aae006" key="详细地址" span="2"/>
			<ta:text id="aaz127" key="工伤认定信息ID" display="false"/>
			<ta:selectInput id="alc021" key="伤害程度" collection="ALC021" display="false"/>
		</ta:fieldset>
		
		<ta:fieldset id="htxxlr" key="合同信息" cols="3" cssStyle="margin-left:3px">
			<ta:selectInput id="jcldht" key="解除合同" readOnly="true" data="[{'id':'0','name':'未解除'},{'id':'1','name':'解除'}]" />
			<ta:selectInput id="ycxlq" key="一次性领取标志" readOnly="true" data="[{'id':'1','name':'不领取'},{'id':'0','name':'领取'}]" />
			<ta:selectInput id="ylc062" key="清退个人账户标志" readOnly="true" collection="YLC062" />
		  	<ta:date id="ylc043" key="解除劳动合同日期 " readOnly="true" showSelectPanel="true" />
			<ta:selectInput id="ycxylbzj" key="一次性医疗补助金" readOnly="true" data="[{'id':'0','name':'不产生'},{'id':'1','name':'产生'}]" />
		</ta:fieldset>
		
		<ta:panel id="dqdyxx" key="当前报销信息">
			 <ta:datagrid id="dqdyxxList" forceFitColumns="true" haveSn="true" >
				<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" > </ta:datagridItem>
		        <ta:datagridItem id="aae128" key="核发金额" > </ta:datagridItem>
		        <ta:datagridItem id="aae016" key="复核标志" collection="AAE016" > </ta:datagridItem>
		        <ta:datagridItem id="aae036" key="经办时间" > </ta:datagridItem>
			</ta:datagrid>
		 </ta:panel>
		
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	
	Base.submit("form1", "treatmentCalculateCheck2Action!toSave.do");
}

function checkRequired(){
    var aac002 = Base.getValue("aac002");
    var aac003 = Base.getValue("aac003");
	var aae145 = Base.getValue("aae145");
	Base.setValue("aae136",aac002);
	Base.setValue("aae133",aac003);
   	if(aae145 == "11"){
   		Base.setDisRequired(["aae006","aae007"]);
   		Base.setRequired(["aae010","aaf002",]);
   		Base._setReadOnly(["aae010","aaf002"],false);
   		Base._setReadOnly(["aae006","aae007"],true);
   	}else if(aae145 == "12"){
   		Base.setDisRequired(["aae010",,"aaf002"]);
   		Base.setRequired(["aae006","aae007"]);
   		Base._setReadOnly(["aae006","aae007"],false);
   		Base._setReadOnly(["aae010","aaf002"],true);
   	}else if(aae145 == "31"||aae145 == "21"||aae145 == "22"){
   		Base.setDisRequired(["aae006","aae007","aae010","aaf002"]);
   		Base._setReadOnly(["aae006","aae007","aae010","aaf002"],false);
   		Base.setValue("aae006","");
   		Base.setValue("aae010","");
   		Base.setValue("aaf002","");
   		Base.setValue("aae007","");
   	}
}


//页面布局控制
$(document).ready(function() {
	$("body").taLayout();
	$("form").css("overflow","auto");
	checkRequired();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>