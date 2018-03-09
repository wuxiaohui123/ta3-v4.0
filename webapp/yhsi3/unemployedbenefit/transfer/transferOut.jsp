<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>TransferInto</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true"/>
				 <ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="P" asToolBarItem="true" disabled="true"/> 
				<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
	    		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:text id="sysdate" key="系统时间" display="false" />
		<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
			<ta:panel id="procInc" key="审核信息" >
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
			</ta:panel>
			<ta:panel id="fld_emp" cols="3" key="基本信息">
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130"/>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称"  readOnly="true" labelWidth="130" span="2"/>
				<ta:text id="yje004" key="失业证号" readOnly="true" labelWidth="130" />
				<ta:text id="ajc090" key="失业时间" readOnly="true" labelWidth="130" />
				<ta:text id="ajc094" key="失业登记日期" readOnly="true" labelWidth="130" display="false"/>
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" readOnly="true" labelWidth="130" />
				<ta:text id="yac001" key="个人最大发放期号" readOnly="true" labelWidth="130" />
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
				<ta:text id="yac001_next" key="个人最大发放期号的下期" display="false" />
			</ta:panel>			
			<ta:tabs id="tabs" height="130" >
                <ta:tab id="tab2" key="转移金额信息">
					<ta:panel id="zyjexx" key="" bodyStyle="margin:0px" hasBorder="false" fit="true" cols="4">
						<ta:number id="yjc004" key="失业保险金总额" labelWidth="130" readOnly="true" precision="2"/>
					    <ta:number id="yjc005" key="基本医疗保险费" labelWidth="130" readOnly="true" precision="2"/>
  				        <ta:number id="yjc009" key="大病救助保险费" labelWidth="130" readOnly="true" precision="2"/>
						<ta:number id="yjc006" key="职业培训介绍补贴" labelWidth="130" readOnly="true" precision="2"/>
						<ta:selectInput id="sfbz" key="是否转基金" collection="sfbz" value="1" labelWidth="130" required="true"/>
					</ta:panel>
			    </ta:tab>			
			    <ta:tab id="tab1" key="待遇信息">
						<ta:datagrid id="ac61List" fit="true">
							<ta:datagridItem id="aaa036" key="待遇项目" showDetailed="true" dataAlign="left" align="left" width="275px" collection="AAA036"/>
							<ta:datagridItem id="aae041" key="待遇开始年月" showDetailed="true"  dataAlign="center" align="center" width="275px" />
							<ta:datagridItem id="aae042" key="待遇结束年月" showDetailed="true"  dataAlign="center" align="center" width="275px"  />
							<ta:datagridItem id="aae019" key="<font color='red'>待遇金额</font>" showDetailed="true"  dataAlign="right" align="right" width="275px" formatter="convertState" dataType="number" />
						</ta:datagrid>
                </ta:tab>
			</ta:tabs>
			<ta:panel id="zyxx" key="转移后社会保险机构信息" cols="3" fit="true" hasBorder="false" >
				<ta:selectInput id="aae160" key="转出原因" required="true" labelWidth="180" collection="AAE160" value="2404" readOnly="true" bpopTipMsg="true"/>
				<ta:text id="aac076" key="转移单位名称" labelWidth="180" required="true"/>				
				<ta:text id="aac077" key="转移社保机构名称" labelWidth="180" required="true"/>
	            <ta:selectInput id="yad169" key="支付对象" required="true" labelWidth="180" collection="YAD169" value="31" readOnly="true" display="false" bpopTipMsg="true"/>
	            <ta:selectInput id="yaf012" key="转移社保机构开户银行类别" collection="AAF002" required="true"  onSelect="getAAE008" maxVisibleRows="8" labelWidth="180" bpopTipMsg="true"/>
	            <ta:text id="yaf001" key="转移社保机构开户银行名称" required="true" labelWidth="180" />		            
	            <ta:text id="aae010" key="转移社保机构银行账号" required="true" labelWidth="180"/>	
				<ta:text id="aae009" key="转移社保机构户名" required="true" labelWidth="180"/>
				<ta:number id="aac079" key="转移社保机构邮政编码" labelWidth="180" max="999999" min="100000" alignLeft="true"/>
				<ta:text id="aae005" key="转移社保机构联系电话" required="true" labelWidth="180"/>
				<ta:text id="aae387" key="转移社保机构传真" required="true" labelWidth="180"/>							 
				<ta:text id="aae006" key="转移社保机构详细地址" required="true" labelWidth="180" span="2"/>           
	            <ta:selectInput id="aae145" key="支付方式" required="true" labelWidth="180" collection="AAE145" value="11" filter="11,14" reverseFilter="true" onSelect="checkRequired" isAutoExtend="false" />
	            <ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002" required="true" onSelect="getAAE044" maxVisibleRows="8" labelWidth="180" display="false"/>
	            <ta:selectInput id="aaz009" key="代发机构名称" required="true" collection="AAZ009" maxVisibleRows="8" allowInputOtherText="true" labelWidth="180" display="false"/>
 	            <%-- <ta:selectInput id="yaf013" key="开户银行编号"  showKey="true" onSelect="fnsetaaf001" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130"/> --%>
	            <ta:selectInput id="yaf011" key="银行同城异地标志" required="true" labelWidth="180" collection="YAF011" value="1" display="false"/>
	            <ta:textarea id="aae013_1" key="备注" span="3" cssStyle="height:48px;" labelWidth="180" />						
			</ta:panel>
			
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
		var aae145 = Base.getValue("aae145");
	   	if(aae145 == "11"){
	   		Base._setReadOnly(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"],false);
	   		Base.showObj(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]);  		  		
	   	}	
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow13.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aac002,aac003,aae140", "transferOutAction!queryBaseInfo.do", null, null, null, function() {
				var grid = Base.getObj("ad12List");
				var rows = [];
				rows.push(0);
				//设置指定行被选中
				grid.setSelectedRows(rows);
			});	
		}, true);
	}
	
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
	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aac002,aac003,aae140", "transferOutAction!queryBaseInfo.do", null, null, null, function() {
				var grid = Base.getObj("ad12List");
				var rows = [];
				rows.push(0);
				//设置指定行被选中
				grid.setSelectedRows(rows);
			});
		}
	}

	function fn_ab01Info() {
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
		}
	}

	//保存经办信息
	function submitData() {
		Base.submit("form1", "transferOutAction!toSave.do", null, null, null, null);
	}

	//覆盖公用js方法，以便填充退休申报单位名称对应数据,如果不需要录入退休申报单位则将此方法直接删除既可。
	function fn_ab01Infotx() {
		Base.setValue("aab071", g_Suggest[1]);
		if (g_Suggest[0] == '' || g_Suggest[0] == null)
			Base.setValue("aab999_1", g_Suggest[1]);
		else
			Base.setValue("aab999_1", g_Suggest[0]);
		Base.setValue("aae044_1", g_Suggest[2]);
	}

	function getAAE044() {
		Base.submit("aaf002,aae140", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE044_1.do");
	}
	function getAAE008(){    
	    Base.setValue("yaf001","");
		Base.submit("yaf012", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE008.do");
	}
	function fnsetaaf001(){
		   Base.submit("yaf013", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAf07AAE044.do");
	}
	function checkRequired(){
		return false;//暂时不调用
		var aae145 = Base.getValue("aae145");
	   	if(aae145 == "11"){
	   		Base.setDisRequired(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]);
	   		Base.setRequired(["aae009","aae010","aaf002","aaz009"]);
	   		Base._setReadOnly(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"],false);
	   		Base.showObj(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]);
	   		Base.setValue("aae009","");	
	   		Base.setValue("aae010","");	 
	   		Base.setValue("aaf002","");	 
	   		Base.setValue("aaz009","");	
	   		Base.setValue("yaf012","");	 
	   		Base.setValue("yaf013","");	
	   		Base.setValue("yaf001","");	   		  		
	   	}else if(aae145 == "14"){
	   		Base.setDisRequired(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"]);
	   		Base.setRequired(["aae009","aae010","yaf012"]);
	   		Base._setReadOnly(["aae009","aae010","aaf002","aaz009","yaf001","yaf012","yaf013"],false);
	   		Base._setReadOnly(["aaf002","aaz009"],true);
	   		Base.hideObj(["aaf002","aaz009"]);
	   		Base.showObj(["aae009","aae010","yaf001","yaf012","yaf013"]); 	
	   		Base.setValue("aae009","");	
	   		Base.setValue("aae010","");	 
	   		Base.setValue("aaf002","");	 
	   		Base.setValue("aaz009","");	
	   		Base.setValue("yaf012","");	 
	   		Base.setValue("yaf013","");	
	   		Base.setValue("yaf001","");	  
	   	}else{
	   		alert("支付方式录入错误！");
	   		return false;
	   	}		
	}
	
	function print(){
	    var aaz002 = Base.getValue("aaz002");
	    var aae140 = "210";
	    if(aaz002 == "" || aaz002 == null){
	    	Base.alert("业务日志ID为空,不能打印");
	    	return false;
	    }
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYzyd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz002="+aaz002+";aae140="+aae140);	
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>