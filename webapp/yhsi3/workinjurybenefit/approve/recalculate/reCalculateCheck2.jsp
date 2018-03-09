<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>工伤待遇重算审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="待遇审批[S]" icon="icon-save" hotKey="S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" disabled="true"/>
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
		
		<ta:fieldset id="jbxxfset" key="人员基本信息" cols="4" cssStyle="margin:5px auto;padding-bottom:10px;padding-right:20px" >
		    <ta:text id="aac003" key="姓名" required="true" cssStyle="margin-top:8px"  readOnly="true"/>
			<ta:text id="aac002" key="公民身份证号码" cssStyle="margin-top:8px" required="true" labelWidth="120" span="2" readOnly="true"/>
			<ta:text id="aac001" key="人员ID" required="true" cssStyle="margin-top:8px" readOnly="true" display="false"/>
			<ta:selectInput id="aac060" key="生存状态" cssStyle="margin-top:8px" collection="AAC060" readOnly="true"  />
			<ta:text id="aab999" key="单位管理码" cssStyle="margin-top:8px"  readOnly="true" />
			<ta:text id="aae044" key="单位名称" cssStyle="margin-top:8px" labelWidth="120" span="2" readOnly="true"/>
			<ta:text id="aab001" key="单位ID" cssStyle="margin-top:8px"  readOnly="true" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" cssStyle="margin-top:8px" readOnly="true"  />
	    </ta:fieldset>
	    
		<ta:panel id="gsxx" key="本次人员工伤认定信息" height="83px" bodyStyle="margin:0px">
			<ta:datagrid id="gsxxList" fit="true" selectType="radio"
				onSelectChange="fnGsxxSelectChange" forceFitColumns="true">
				<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz151" key="鉴定ID" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="alc020" key="工伤发生时间">
				</ta:datagridItem>					
				<ta:datagridItem id="alc027" key="工伤类别" collection="ALC027"  hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040">
				</ta:datagridItem>
				<ta:datagridItem id="alc060" key="护理等级" collection="ALC060">
				</ta:datagridItem>
				<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021">
				</ta:datagridItem>
				<ta:datagridItem id="alc029" key="认定结论" collection="ALC029">
				</ta:datagridItem>
				<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027">
				</ta:datagridItem>
				<ta:datagridItem id="ala017" key="职业病" collection="ALA017">
				</ta:datagridItem>
				<ta:datagridItem id="alc040" key="因公死亡(失踪)日期"  hiddenColumn="true">
				</ta:datagridItem>					
			</ta:datagrid>
		</ta:panel>
		
		 <ta:box cols="2">
			<ta:panel id="dyxx_ls" key="历史待遇信息" 
				bodyStyle="margin:0px">
				<ta:datagrid id="dyxxList_ls" forceFitColumns="true">
					<ta:datagridItem id="aaa036_ls" key="待遇项目" collection="AAA036">
					</ta:datagridItem>
					<ta:datagridItem id="aae128_ls" key="核发金额">
					</ta:datagridItem>
					<ta:datagridItem id="aae016_ls" key="复核标志" collection="AAE016">
					</ta:datagridItem>
					<ta:datagridItem id="aae036_ls" key="经办时间">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
			<ta:box height="176px">
				<ta:tabs fit="true">
					<ta:tab key="本次待遇信息" >
						<ta:datagrid id="dyxxList" forceFitColumns="true" >
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
					<ta:tab key="产生待遇补扣信息" >
						<ta:datagrid id="dybkxx">
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="140px">
							</ta:datagridItem>
							<ta:datagridItem id="aae129" key="核发金额"  width="140px">
							</ta:datagridItem>
							<ta:datagridItem id="aaa078" key="补扣类型"  width="140px" collection="AAA078">
							</ta:datagridItem>
							<ta:datagridItem id="aae003" key="对应款所属期"  width="140px">
							</ta:datagridItem>
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016"  width="140px">
							</ta:datagridItem>
					    </ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:box>
		</ta:box>	
		<!-- <ta:panel id="recalculateInfo" key="工伤待遇重算信息录入" cols="2">				
			<ta:selectInput id="yle002" key="重算类型" data="[{'id':'1','name':'社平工资变更重算'},{'id':'2','name':'伤残鉴定变更重算'}]" labelWidth="130" required="true"/>
			<ta:selectInput id="flag2" key="一次性待遇补扣标志" data="[{'id':'1','name':'产生'},{'id':'2','name':'不产生'}]" labelWidth="180" required="true"/>
			<ta:selectInput id="flag1" key="定期待遇补扣标志"  data="[{'id':'1','name':'产生'},{'id':'2','name':'不产生'}]" labelWidth="130" required="true"/>				
			<ta:selectInput id="flag3" key="是否延用定期待遇支付方式" data="[{'id':'0','name':'不延用'},{'id':'1','name':'延用'}]" labelWidth="180" required="true"/>
			<ta:text id="aaz127" key="工伤认定信息ID" readOnly="true" display="false"/>
		</ta:panel>	 -->
		
		<ta:fieldset id="ffxxlr" key="一次性发放信息录入" cols="3" cssStyle="margin-left:3px">
			<ta:text id="aaz127" key="工伤认定信息ID" readOnly="true"/>
			<ta:selectInput id="aae145" key="支付方式 " required="true" collection="AAE145" value="11" onSelect="checkRequired" filter="13,21,22,41" />
			<ta:selectInput id="aac059" key="领取人证件类型 " required="true" collection="AAC059" value="1" />
			<ta:text id="aae136" key="领取人证件号" required="true" />
			<ta:text id="aae133" key="领取人姓名  " required="true" />
			<ta:selectInput id="aaf002" key="银行类别" collection="AAF002" required="true" />
			<ta:text id="aae010" key="银行账号" required="true" />
			<ta:text id="aae007" key="邮政编码" />
			<ta:text id="aae006" key="详细地址" span="2"/>
		</ta:fieldset>		
	</ta:form>
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
function fnGsxxSelectChange(rowsData,n){
	if(rowsData == ""){
		return false;
	}
	Base.setValue("aaz127",rowsData[0].aaz127);
	Base.submit("aac001", "reCalculateCheck2Action!queryHistory.do",{"dto['aaz127']":rowsData[0].aaz127,"dto['aaz151']":rowsData[0].aaz151});
}

//页面布局控制
$(document).ready(function(){
	$("body").taLayout();
	$("form").css("overflow","auto");
	checkRequired();
});
</script>
<%@ include file="/ta/incfooter.jsp"%>