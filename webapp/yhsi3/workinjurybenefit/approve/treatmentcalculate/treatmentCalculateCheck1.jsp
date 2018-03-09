<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>工伤待遇审批</title>
		<%@ include file="/ta/inc.jsp"%>	
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
		    <ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印工伤待遇结算表" hotKey="ctrl+P" onClick="print();" asToolBarItem="true"  display="false"/>
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
				<ta:text id="yab003" display="false" key="经办机构" />
			</ta:box>

			<ta:panel id="grjbxx" key="人员基本信息" cols="3">
				<ta:text id="aac001" key="人员ID" readOnly="true" labelWidth="130" />
				<ta:text id="aac003" key="姓 名" readOnly="true"  labelWidth="130"/>
				<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="130" />
				<ta:text id="aab001" key="单位ID" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称" span="2" readOnly="true" labelWidth="130" />
				<ta:text id="aab999" key="单位管理码" display="false" />
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060"
					display="false" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116"
					display="false" />
			</ta:panel>
			<ta:panel id="gsxx" key="人员工伤亡信息" height="83px">
				<ta:datagrid id="gsxxList" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false" align="center" dataAlign="center"  />
					<ta:datagridItem id="alc020" key="工伤时间" dataType="date" align="center" dataAlign="center"/>
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035" align="center" dataAlign="center" />
					<ta:datagridItem id="alc034" key="鉴定时间" dataType="date" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" align="center" dataAlign="center"/>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc060" key="护理等级" collection="ALC060" width="100" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc029" key="认定结论" collection="ALC029" align="center" dataAlign="center"/>
					<ta:datagridItem id="ylc002" key="工亡类别" collection="YLC002" align="center" dataAlign="center"/>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017" align="center" dataAlign="center"/>
					<ta:datagridItem id="alc040" key="死亡(失踪)日期" width="90" align="center" dataAlign="center"/>
					<ta:datagridItem id="ylc040" key="死亡原因" align="center" dataAlign="center"/>
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="htxxlr" key="其他信息录入" cols="3">
				<ta:selectInput id="ylc065" key="解除劳动合同 " labelWidth="130" collection="YLC065" required="true" readOnly="true" />
				<ta:date id="ylc043" key="解除劳动合同日期" validNowTime="left" labelWidth="130" readOnly="true" showSelectPanel="true" />
				<ta:selectInput id="ylc064" key="一次性医疗补助金" labelWidth="130" collection="YLC064" readOnly="true"/>
                <ta:selectInput id="ylc066" key="一次性就业补助金" labelWidth="130" collection="YLC064" readOnly="true" display="false"/>
				<ta:text id="aaz127" key="工伤认定信息ID" display="false" />
				<ta:selectInput id="alc021" key="伤害程度" collection="ALC021" display="false" />
				<ta:selectInput id="ala040" key="伤残等级" collection="ALC021" display="false" />
			</ta:panel>
			<ta:panel id="paymentInfo" key="" >
				<ta:panel id="ffxxsyqk" key="发放信息" cols="3">
				     <ta:selectInput id="ylc026" key="发放信息使用" labelWidth="130" readOnly="true"  required="true"
				                     data="[{'id':'0','name':'一次性待遇和定期待遇相同'},{'id':'1','name':'一次性待遇和定期待遇不同'}]" />
				</ta:panel>
				<%@ include file="/yhsi3/benefit/common/paymentInfoReadOnly.jsp"%>
				<%@ include file="/yhsi3/benefit/common/paymentBaseInfoDQ.jsp"%>
			</ta:panel>


			<ta:tabs id="tabs1" height="153">
				<ta:tab key="核定待遇信息">
					<ta:datagrid id="dqdyxxList" forceFitColumns="true" haveSn="true">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center" dataAlign="center"/>
						<ta:datagridItem id="ala042" key="计算基数" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
						<ta:datagridItem id="ala043" key="计算比例" align="center" dataAlign="right" totals="sum" totalsAlign="right" width="80" tatalsTextShow="false"/>
						<ta:datagridItem id="ala044" key="计算月数" align="center" dataAlign="center" totalsAlign="center" width="80" />
						<ta:datagridItem id="aae128" key="核发金额" align="center" dataAlign="right" totals="sum" totalsAlign="right"/>
						<ta:datagridItem id="aae129" key="计算金额" align="center" dataAlign="right" totals="sum" totalsAlign="right"/>
						<ta:datagridItem id="ylc033" key="第三方赔偿金额" align="center" dataAlign="right" totals="sum" totalsAlign="right"/>
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" align="center" dataAlign="center" />
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab key="补发核定信息">
					<ta:datagrid id="dqbfxxList" haveSn="true" height="120">
						<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" width="300" align="center" dataAlign="center"/>
						<ta:datagridItem id="aae128" key="核发金额" width="300" align="center" dataAlign="right" totals="sum" totalsAlign="right"/>
						<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" width="300" align="center" dataAlign="center"/>
						<ta:datagridItem id="aae003" key="对应所属期" width="300" align="center" dataAlign="center"/>

					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
		</ta:form>	
	    <iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
//开始流转(指定"开始流转"按钮的Action方法)
function submitData(){
	
	Base.submit("form1", "treatmentCalculateCheck1Action!toSave.do",null,null,null,function(){
		Base.setEnable("printBtn");
	});
}

function checkRequired(){
    var aac002 = Base.getValue("aac002");
    var aac003 = Base.getValue("aac003");
	var aae145 = Base.getValue("aae145");
	Base.setValue("aae136",aac002);
	Base.setValue("aae133",aac003);
   	
}

//页面布局控制
$(document).ready(function() {
//	$("body").taLayout();
    var aaz002=Base.getValue("aaz002");
    Base.alert(aaz002);
    Base.setValue("aaz002",aaz002);
	Base.setDisRequired(["yad169_dq","aae145_dq","aae133_dq","aae136_dq","aac059_dq","aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae006_dq","aae007_dq","yaf011_dq"]);
    var fhjc=Base.getValue("fhjc");
		if(fhjc=="1"){
			Base.showObj("printBtn");			
		}
	fn_setPaymentInfoReadOnlyPage();
	var yad169_dq = Base.getValue("yad169_dq");
	if (yad169_dq == "11"){
		Base.showObj("aac059_dq");
	}else{
		Base.hideObj("aac059_dq");
	}
	fn_setPaymentInfoReadOnlyPage_dq();	
});

//打印职工医疗保险费用结算通知书、工伤待遇结算表
function print(){			   
	var aaz002=Base.getValue("aaz002"); 
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GS_dy_jsb.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz002="+aaz002);		
}

/*
//在读取发放信息的时候初始化界面显示
function fn_setPaymentInfoReadOnlyPage(){
	var aae145 = Base.getValue("aae145");
   	if(aae145 == "11"){
   		Base.hideObj(["aae006","aae007"]);
   		Base.showObj(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]); 
   	}else if(aae145 == "12"){
   		Base.showObj(["aae006","aae007"]);
   		Base.hideObj(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]);
   	}else if(aae145 == "14"){
   		Base.hideObj(["aaf002","aaz009","aae006","aae007"]);
   		Base.showObj(["aae010","yaf001","yaf012","yaf013"]); 	
   	}else if(aae145 == "21"){
   		Base.showObj(["aae010","yaf012"]);	   		
   		Base.hideObj(["aaf002","aaz009","yaf001","yaf013","aae006","aae007"]);
   	}		
}*/
</script>
<%@ include file="/ta/incfooter.jsp"%>
