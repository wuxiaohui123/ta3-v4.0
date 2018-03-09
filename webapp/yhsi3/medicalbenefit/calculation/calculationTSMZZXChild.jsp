<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave('1')" />
		<ta:toolbarItem id="printBtn" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint()"/>
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotReset" type="resetPage"  hotKey="C" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="panel4" key="费用构成情况" cols="3">
			<ta:number id="aae019" key="总费用" readOnly="true" toolTip="总费用" precision="2" labelWidth="200" />
			<ta:number id="akc228" key="全自费金额" readOnly="true" toolTip="全自费金额" precision="2" labelWidth="200" />
			<ta:number id="akc268" key="超限价自付金额" readOnly="true" toolTip="超限价自付金额" precision="2" labelWidth="200" />
			<ta:number id="yka318" key="先行自付金额" readOnly="true" toolTip="先行自付金额" precision="2" labelWidth="200" />
			<ta:number id="yka319" key="符合范围部分" readOnly="true" toolTip="符合范围部分" precision="2" labelWidth="200" />
		</ta:panel>
		<ta:panel id="tab1" key="医疗信息" cols="3" >
			<ta:text id="aaz216" key="人员结算事件ID" display="false"/>
			<ta:text id="aae011" key="经办人ID" display="false"/>
			<ta:selectInput id="ykc239" collection="YKC239" key="统筹享受类别"   readOnly="true" labelWidth="200" cssStyle="color:red"/>
			<ta:number id="yka249" key="统筹限额标准"  readOnly="true" toolTip="基本医疗统筹限额标准" precision="2" labelWidth="200"/>
			<ta:number id="yka119" key="统筹本年度可支付限额"  readOnly="true"  toolTip="基本医疗本年度可支付限额" precision="2" labelWidth="200" />
			<ta:number id="yka114" key="起付线标准"  readOnly="true"  toolTip="起付线标准" precision="2" labelWidth="200"/>
			<ta:number id="yka115" key="本次起付线"  readOnly="true" required="false"  toolTip="本次起付线" precision="2" labelWidth="200" /> 
			<ta:number id="ake034_out" key="个人账户可支付金额"  readOnly="true"  toolTip="个人账户可支付金额" precision="2" labelWidth="200"/> 
			<ta:number id="akb081" key="总报销金额" readOnly="true" toolTip="总报销金额" precision="2" labelWidth="200" cssStyle="color:red"/>
			<ta:number id="ake039" key="统筹支付金额" readOnly="true" toolTip="基本医疗基金支付金额" precision="2" labelWidth="200" cssStyle="color:blue"/>
			<ta:number id="ake041" key="居民基本医疗支付金额" readOnly="true" toolTip="城镇居民基本医疗支付金额" precision="2" labelWidth="200" cssStyle="color:blue"/>
			<ta:number id="ake043" key="离休二乙支付金额" readOnly="true" toolTip="离休基金支付金额" precision="2" labelWidth="200" cssStyle="color:blue"/>
			<ta:number id="ake034" key="个人账户支出" readOnly="true" toolTip="个人账户支出" precision="2" labelWidth="200" cssStyle="color:blue"/>
		</ta:panel>
		<ta:tabs id="tabs2" height="190" >
			<ta:tab id="tab6" key="银行信息" cols="3" >
				<ta:selectInput id="aaf002" key="金融行业机构编码" collection="AAF002" labelWidth="120" readOnly="true" required="true"/> 
				<ta:text id="yae597" key="开户银行" labelWidth="120" readOnly="true" required="true"/>
				<ta:text id="aae009" key="银行户名" labelWidth="120" readOnly="true" required="true"/>
				<ta:text id="aae010" key="银行账号" labelWidth="120" readOnly="true" required="true"/>
				<ta:selectInput id="yaf011" key="银行同城异地标志" collection="YAF011" labelWidth="120" readOnly="true" required="true"/> 
			</ta:tab>
			
			<ta:tab id="tab5" key="就诊信息" cols="3" >
				<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" labelWidth="120" readOnly="true" filter="51,52,61,62,71,72" /> 
				<ta:date id="aae030" key="开始日期" showSelectPanel="true" labelWidth="120" readOnly="true"/>
				<ta:date id="aae031" key="结束日期" showSelectPanel="true" labelWidth="120" readOnly="true"/>
				<ta:text  id="akb020"  key="医疗机构编号" labelWidth="120" readOnly="true" />
				<ta:text id="akb021" key="医疗机构名称" span="2" labelWidth="120" readOnly="true" />
				<ta:selectInput id="akb022" collection="AKB022" key="医疗机构类别" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="akb097" collection="AKA101" key="医疗机构等级" readOnly="true" labelWidth="120"/>
				<ta:selectInput id="ake013" key="报销原因" collection="AKE013" labelWidth="120" readOnly="true"/>
				<ta:text id="yke015" key="病历号" labelWidth="120" readOnly="true"/>
				<ta:text id="yke014" key="住院号" labelWidth="120" readOnly="true"/>
				<ta:text id="ake020" key="病区床位" labelWidth="120" readOnly="true" />
				<ta:text id="akc196" key="诊断病种" labelWidth="120" readOnly="true"/>
				<ta:text id="ake022" key="入院诊断医生" labelWidth="120" readOnly="true" />
				<ta:text id="ake021" key="出院诊断医生" labelWidth="120" readOnly="true" />
				<ta:text id="ake024" key="症状描述" labelWidth="120" span="2" readOnly="true"/>
			</ta:tab>
			<ta:tab id="tab4" key="登记信息" cols="3" >
				<ta:text id="aaz217" key="人员就诊事件ID" display="false"/>
				<ta:text id="aac001"  key="个人ID" labelWidth="120" readOnly="true"/>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
				<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
				<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
				<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="120" />
				<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="120" />
				<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" />
				<ta:selectInput id="yac084" key="退休标志" readOnly="true" collection="YAC084" labelWidth="120" />
				<ta:selectInput id="ykc005" key="人员类型" readOnly="true" collection="YKC005" labelWidth="120" />
				<ta:selectInput id="aae140" key="险种" collection="AAE140" readOnly="true" labelWidth="120"/>
				<ta:text id="aab001" key="单位ID"  readOnly="true" labelWidth="120" />
				<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
				<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
				<ta:selectInput id="aac005" key="民族" collection="AAC005"  readOnly="true" labelWidth="120" display="false" />
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
	fnSetRedBorder();
	fn_getPerson();
});
function fnPrint(){
	var aaz217 = Base.getValue('aaz217');
	var aaz216 = Base.getValue('aaz216');
	var aae011 = Base.getValue('aae011');
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=centercalMxb.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+"paramString=aaz217="+aaz217+";aaz216="+aaz216+";aae011="+aae011);
}

function toSave(jslb){
	Base.submit('tab4,tab1', 'calculationTSMZZXAction!toSave.do?dto.jslb='+jslb);
}
function fn_getPerson(){
	Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",
				{"dto['aac001']":Base.getValue("aac001")},
				function(data){
					if (data.errMsg != null && data.errMsg != ''){
						Base.alert(data.errMsg);
						Base.setValue("aac001",'');
						return true;
					}
					if(data &&  data.personInfoDto) {
						Base.setValue("yac084",data.personInfoDto.yac084);
						Base.setValue("ykc005",data.personInfoDto.ykc005);
					}
				});
}
</script>
<%@ include file="/ta/incfooter.jsp"%>
