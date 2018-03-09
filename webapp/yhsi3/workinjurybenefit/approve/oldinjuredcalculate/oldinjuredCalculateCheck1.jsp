<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>老工伤审批</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body style="margin:0px;padding:0px" >
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="待遇审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认" asToolBarItem="true" display="false" />
		    <ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>

		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>

			<ta:panel id="jbxxfset" key="人员基本信息" cols="3"
				cssStyle="margin:0px auto;padding-bottom:10px;padding-right:0px">
				<ta:text id="aac001" key="人员ID" readOnly="true" />
				<ta:text id="aac003" key="姓 名" readOnly="true" />
				<ta:text id="aac002" key="身份证号码" readOnly="true" />
				<ta:text id="aab001" key="单位ID" readOnly="true" />
				<ta:text id="aae044" key="单位名称" span="2" readOnly="true" />
				<ta:text id="aab999" key="单位管理码" display="false" />
				<ta:selectInput id="aac060" key="生存状态" cssStyle="margin-top:8px"
					collection="AAC060" display="false" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116"
					cssStyle="margin-top:8px" display="false" />
			</ta:panel>

			<!-- 初始化工伤认定信息 -->
			<ta:panel id="gsrdxx" key="工伤信息" height="80px">
				<ta:datagrid id="gsxxList"   forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc020" key="工伤时间" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc029" key="认定结论" collection="ALC029" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017" align="center" dataAlign="center">
					</ta:datagridItem>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="140" align="center" dataAlign="center">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
            <%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
			<ta:panel height="130px">
	            <ta:tabs  fit="true">
	                <ta:tab id="dqdyxx" key="本次核定信息" selected="true">
						<ta:datagrid id="dqdyxxList" forceFitColumns="true" fit="true">
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae128" key="核发金额" align="center" dataAlign="right"/>
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center"/>
						</ta:datagrid>
				     </ta:tab>
					 <ta:tab id="dybtxx" key="补发核定信息">
						<ta:datagrid id="dqbfxxList" forceFitColumns="true" fit="true">
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036"  align="center" dataAlign="center"/>
							<ta:datagridItem id="aae128" key="核发金额"  align="center" dataAlign="right" totals="sum" totalsAlign="right" tatalsTextShow="false"/>
							<ta:datagridItem id="aae016" key="复核标志"  collection="AAE016" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae003" key="对应所属期"  align="center" dataAlign="center"/>
						</ta:datagrid>
					 </ta:tab>
			     </ta:tabs>
		  </ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("form").css("overflow","auto");
		fnChange();
	});
 	
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
		
		Base.submit("form1", "oldinjuredCalculateCheck1Action!toSave.do");
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

</script>
<%@ include file="/ta/incfooter.jsp"%>
