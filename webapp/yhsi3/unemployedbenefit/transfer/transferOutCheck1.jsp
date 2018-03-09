<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>TransferInto</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body>
		<ta:pageloading  />
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true"/>
				<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="P" asToolBarItem="true" display="false" disabled="true"/>
	    		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:text id="sysdate" key="系统时间" display="false" />
		<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
			<ta:panel id="procInc" key="审核信息">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
			</ta:panel>
			<ta:panel id="fld_emp" cols="3" key="基本信息">
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130"/>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称"  readOnly="true" labelWidth="130" span="2"/>
				<ta:text id="yje004" key="失业证号" readOnly="true" labelWidth="130" />
				<ta:text id="ajc090" key="失业时间" readOnly="true" labelWidth="130" />
				<ta:text id="ajc094" key="失业登记日期" readOnly="true" labelWidth="130" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" readOnly="true" labelWidth="130" />
				<ta:text id="aae210" key="待遇开始年月" readOnly="true" labelWidth="130" />
				<ta:text id="ajc056" key="待遇终止年月" readOnly="true" labelWidth="130" />
				<ta:number id="ajc001" key="视同缴费月数" readOnly="true" labelWidth="130" />
				<ta:number id="ajc071" key="实际缴费月数" readOnly="true" labelWidth="130" />
				<ta:number id="ajc072" key="累计缴费月数" readOnly="true" labelWidth="130" display="false"/>
				
				<ta:number id="ajc097" key="应享受待遇月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc098" key="已享受遇月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc099" key="剩余享受月数" readOnly="true" labelWidth="130" />
				
				<ta:text id="aaz157" key="参保明细ID" display="false" />
				<ta:text id="aaz159" key="参保关系ID" display="false" />
				<ta:text id="aaz257" key="定期待遇人员ID" display="false" />
				<ta:text id="fhjc" key="当前复核级次" display="false" />
				<ta:text id="yac001_next" key="个人最大发放期号的下期" display="false" />
			</ta:panel>			
			<ta:tabs id="tabs" height="130">
                <ta:tab id="tab2" key="转移金额信息">
				<ta:panel id="zyjexx" key="转移金额信息" bodyStyle="margin:0px" fit="true" cols="4">
				<ta:number id="yjc004" key="失业保险金总额" labelWidth="130" readOnly="true" />
				<ta:number id="yjc005" key="基本医疗保险费" labelWidth="130" readOnly="true"/>
				<ta:number id="yjc009" key="大病救助保险费" labelWidth="130" readOnly="true"/>
				<ta:number id="yjc006" key="职业培训介绍补贴" labelWidth="130" readOnly="true"/>
				</ta:panel>
			    </ta:tab>			
			    <ta:tab id="tab1" key="待遇信息">
					<ta:datagrid id="ac61List" fit="true" >
					<ta:datagridItem id="aaa036" key="待遇项目" showDetailed="true" dataAlign="left" align="left" width="310px" collection="AAA036"/>
					<ta:datagridItem id="aae041" key="待遇开始年月" showDetailed="true" dataAlign="center" align="center" width="310px" />
					<ta:datagridItem id="aae042" key="待遇结束年月" showDetailed="true" dataAlign="center" align="center" width="310px"  />
					<ta:datagridItem id="aae019" key="<font color='red'>待遇金额</font>" showDetailed="true" dataAlign="right" align="right" width="310px" formatter="convertState" dataType="number" />
				</ta:datagrid>
                </ta:tab>
			</ta:tabs>			
			
			<ta:panel id="zyxx" key="转移后社会保险机构信息" bodyStyle="margin:0px" fit="true" cols="3">
				<ta:selectInput id="aae160" key="转出原因"  labelWidth="180" collection="AAE160" value="2404" readOnly="true"/>
				<ta:text id="aac076" key="转移单位名称" labelWidth="180" />
				<ta:text id="aac077" key="转移单位名称" labelWidth="180" />
	            <ta:selectInput id="yad169" key="支付对象" labelWidth="180" collection="YAD169" value="31" readOnly="true" display="false"/>
	            <ta:selectInput id="yaf012" key="转移社保机构开户银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="180"/>
	            <ta:text id="yaf001" key="转移社保机构开户银行名称" readOnly="true" labelWidth="180"/>	
	            <ta:text id="aae010" key="转移社保机构银行账号" labelWidth="180"/>	
				<ta:text id="aae009" key="转移社保机构银行账号" labelWidth="180" />
				<ta:number id="aac079" key="转移社保机构邮政编码" labelWidth="180" max="999999" min="100000" alignLeft="true"/>
				<ta:text id="aae005" key="转移社保机构邮政编码" readOnly="true" labelWidth="180"/>	
				<ta:text id="aae387" key="转移社保机构传真" readOnly="true" labelWidth="180"/>	
				<ta:text id="aae006" key="转移社保机构详细地址" readOnly="true" labelWidth="180" span="2"/>				
	            <ta:selectInput id="aae145" key="支付方式" labelWidth="180" collection="AAE145" value="14" filter="11,14" reverseFilter="true"/>
	            <ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002" maxVisibleRows="8" labelWidth="180" display="false"/>
	            <ta:selectInput id="aaz009" key="代发机构名称" collection="AAZ009" maxVisibleRows="8" allowInputOtherText="true" labelWidth="180" display="false"/>
<%--	            <ta:selectInput id="yaf013" key="开户银行编号"  showKey="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="180"/>--%>
	            <ta:selectInput id="yaf011" key="银行同城异地标志" required="true" labelWidth="180" collection="YAF011" value="1" display="false"/>
	            <ta:textarea id="aae013_1" key="备注" span="3" cssStyle="height:48px;" labelWidth="180" />			
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	//RPC
	function convertState(row, cell, value, columnDef, dataContext){
	    var val = value + '';
		 var x = val.split('.'),x1 = x[0],x2 = x.length > 1 ? '.' + x[1] : '.00',rgx = /(\d+)(\d{3})/;
		 while (rgx.test(x1)) {
		    x1 = x1.replace(rgx, '$1' + ',' + '$2');
		 }
		 value = x1 + x2;
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>"+value+"</div>";
	}	
	//保存经办信息
	function submitData(){
		Base.submit("form1","transferOutCheck1Action!toSave.do",null,null,null,function(){
			Base.setEnable("printBtn");
		});
	}
	
	
	function print(){
	    var aac001 = Base.getValue("aac001");
	    if(aac001 == "" || aac001 == null){
	    	Base.alert("人员id为空,不能打印");
	    	return false;
	    }
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYzyd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001);	
	}
	$(document).ready(function(){
		Base.getJson("<%=path%>/process/comm/processQueryAction!getAae419.do",{"dto['aaz002']":Base.getValue('businessLogID')},function(data){
			if(data.fieldData.aae419=="0"){
				Base.setObj("printBtn");
			}
			if(data.fieldData.aae419 =="1"){
				Base.showObj("printBtn");
			}
		});
		var aae145 = Base.getValue("aae145");
	   	if(aae145 == "11"){
	   		Base._setReadOnly(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"],true);
	   		Base.showObj(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]);  		  		
	   	}	
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>