<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>支付计划</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body style="margin:0px;padding:0px">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			   <ta:buttonLayout align="center">  
			       <ta:button id="queryBtn" icon="xui-icon-query" hotKey="ctrl+Q" key="查询支付信息"  onClick="query()" asToolBarItem="true"/>  
			        <ta:button id="saveBtn" icon="xui-icon-spotSave" hotKey="ctrl+S" key="支  付"  onClick="submitData()" asToolBarItem="true"/>  
			        <ta:button id="queryResultBtn" icon="xui-icon-query" key="查询支付结果"  onClick="queryResult()" asToolBarItem="true"/> 
			        <ta:button id="toBackBtn" icon="icon-undo" key="支付回退"  onClick="toBack()" toolTip="勾选下面的做账结果后点击" asToolBarItem="true"/> 			        
			        <ta:button id="resetBtn"  key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			    </ta:buttonLayout> 
 	   </ta:toolbar>
		<ta:form id="form1" cssStyle="overflow:hidden;" fit="true" >
		     <ta:panel id="flt_jbxx" key="支付查询" cols="3" >  
		        <ta:selectInput id="aae140" key="险种类别" collection="AAE140" required="true" filter="110,210" reverseFilter="true" display="false" />
		        <ta:date id="aae002" key="支付期号" issue="true"  showSelectPanel="true" required="true"/>  
     		    <ta:selectInput id="aae145" key="发放方式" collection="AAE145" filter="13,22" reverseFilter="false" onSelect="filterData" display="false"/>
		        <ta:text id="aaz031" key="拨付通知ID"  maxLength="20"/>  
		        <ta:selectInput id="aaa079" key="拨付方式" collection="aaa079"/>
		        <ta:selectInput id="aaf002" key="金融行业机构编码" display="false" labelWidth="200" collection="aaf002"/>
		        <ta:text id="aab001" key="单位ID" display="false"/>
		        <ta:text id="aaa121" key="业务类型编码" display="false"/>
		        <ta:text id="yab003" key="经办机构" display="false"/>
		    </ta:panel>   
				<ta:tabs id="tabs1" fit="true" >  
					<ta:tab id="tab1" key="可参与支付的单位"  >  
						  <ta:datagrid id="list1" haveSn="true" fit="true" border="true" forceFitColumns="true" >  
						      <ta:datagridItem id="aae002" key="做账期号" align="center"/>  
					          <ta:datagridItem id="aae140" key="险种类别" collection="aae140" align="center"/>
					          <ta:datagridItem id="aaa079" key="拨付方式" collection="aaa079" align="center"/> 
					          <ta:datagridItem id="aab001" key="单位编号" align="center"/>
					          <ta:datagridItem id="aae044" key="单位名称" align="center"/>
					          <ta:datagridItem id="rs" key="人数" totals="sum" align="center"/>
					          <ta:datagridItem id="aae019" key="金额" totals="sum" align="center"/>  
				          </ta:datagrid>  
					</ta:tab>  
					<ta:tab id="tab2" key="支付结果"> 
						  <ta:datagrid id="list2" heightDiff="50" fit="true" border="true"  forceFitColumns="true" selectType="checkbox" haveSn="true">  
						      <ta:datagridItem id="aaz031" key="拨付通知单ID" align="center" width="60" dataAlign="center"/>
					          <ta:datagridItem id="aae002" key="做账期号" align="center" width="40" dataAlign="center"/>  
					          <ta:datagridItem id="aaa079" key="拨付方式" collection="aaa079" dataAlign="center" align="center" width="60"/> 
					          <ta:datagridItem id="aaz085" key="拨付对象当事人ID" align="center"  dataAlign="center" width="60"/>  
					          <ta:datagridItem id="aab069" key="拨付对象当事人名称" align="center"/>  
					          <ta:datagridItem id="yae002" key="支付人数" totals="sum" dataType="Number" tatalsTextShow="false"  dataAlign="right" align="center" width="45"/>
					          <ta:datagridItem id="aae169" key="拨付总额" totals="sum" dataType="Number" tatalsTextShow="false"  dataAlign="right" align="center" width="60"/>  
					          <ta:datagridItem id="aae145" key="待遇发放方式" collection="AAE145" align="center" dataAlign="center" width="70"/> 
					          <ta:datagridItem id="yad169" key="发放对象" collection="YAD169" align="center" dataAlign="center" width="50"/> 
					          <ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="90"/> 
				          </ta:datagrid> 
				          <ta:panel height="50">
		 	                  <ta:button id="ylbxzfhzspb" key="打印汇总审批表" icon="xui-icon-spotPrint" onClick="printRaq2('1')" asToolBarItem="false" display="false"/>					          		                  
		 	                  <ta:button id="yhdfyljqd" key="打印银行代发清单(个人)" icon="xui-icon-spotPrint" onClick="printRaq('1')" asToolBarItem="false" display="false"/>
				              <ta:button id="gxbtffqkb" key="打印单位拨付清单(单位)" icon="xui-icon-spotPrint" onClick="printRaq('0')" asToolBarItem="false" display="false"/>	
				              <ta:button id="lxjbtqd" key="打印离休津补贴清单(单位)" icon="xui-icon-spotPrint" onClick="printRaq('01')" asToolBarItem="false" display="false"/>		 	                  
		 	                  <ta:button id="ffqdmx" key="发放清单明细" icon="xui-icon-spotPrint" onClick="printFfqd()" asToolBarItem="false" display="false"/>
		 	                  <ta:button id="fyjstzs" key="清单明细" icon="xui-icon-spotPrint" onClick="printTzs()" asToolBarItem="false" display="false"/>
		 	                  <ta:button id="sycjdbjbylbx" key="失业参加大病救助、基本医疗保险支出汇总表" icon="xui-icon-spotPrint" onClick="printRaq1('7')" asToolBarItem="false" display="false"/>
		 	                  <ta:button id="sycjdbbzzfb" key="失业参加大病救助支出汇总表" icon="xui-icon-spotPrint" onClick="printRaq1('8')" asToolBarItem="false" display="false"/>
		 	                  <ta:button id="sycjylzchzb" key="失业参加基本医疗保险支出汇总表" icon="xui-icon-spotPrint" onClick="printRaq1('9')" asToolBarItem="false" display="false"/>
		 	                  <ta:button id="sybxjffhzb" key="失业保险金待遇发放汇总表" icon="xui-icon-spotPrint" onClick="printRaq1('10')" asToolBarItem="false" display="false"/>			             
				              <ta:button id="syzgszffxj" key="失业职工丧葬补助金和抚恤金支付单" icon="xui-icon-spotPrint" onClick="printRaqSY()" asToolBarItem="false" display="false"/>
				          </ta:panel> 
					</ta:tab> 
					<ta:tab id="tab3" key="错误信息" >
						  <ta:datagrid id="list3" fit="true" forceFitColumns="true" >
					          <ta:datagridItem id="aaz031" key="拨付通知单ID" align="center"/>
					          <ta:datagridItem id="aae002" key="做账期号" align="center"/>  
					          <ta:datagridItem id="appcode"  key="错误编号" align="center"/>
					          <ta:datagridItem id="errormsg" key="错误信息"  showDetailed="true" align="center"/>
				          </ta:datagrid>				          
					</ta:tab> 
				</ta:tabs>  
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		var aae140 = Base.getValue('aae140');
		Base.showObj('ylbxzfhzspb,yhdfyljqd');		
		if(aae140 == '110'){
			Base.showObj('gxbtffqkb,yhdfyljqd,ffqdmx,lxjbtqd');
		}
		if(aae140 == '210'){
			Base.showObj('sycjdbjbylbx,sybxjffhzb,syzgszffxj');
		}
		if(aae140 == '410'){
			Base.showObj('fyjstzs');
		}
	});
	
	//过滤界面展示数据
	function filterData(){
	    var aae145 = Base.getValue("aae145");
	    //若为支付方式选银行支付则显示金融机构编码
	    if(aae145 == "11" || aae145 == "41"){
			Base.showObj("aaf002");//金融机构编码
	    }else{//若不为银行支付则隐藏金融机构编码
	    	Base.hideObj("aaf002");
	    }
	    //若为支付方式选单位代发则显示单位ID
		if(aae145 == "31"){
			Base.showObj("aab001");//单位ID
		}else{//若不为单位代发则隐藏单位ID
			Base.hideObj("aab001");
		}  
	}
	
	//查询支付信息
	function query(){
		Base.submit("form1","paymentAction!query.do");
	}
	
	//查询支付结果
	function queryResult(){
		Base.submit("form1","paymentAction!queryResult.do");
	}
	
	function toBack(){
		Base.submit("form1,list2","paymentAction!toBack.do");
	}
	
	//支付
	function submitData(){
		Base.submit("form1","paymentAction!toSave.do");
	}
	
	//打印
	function printRaq(value){
		var rowdata = Base.getGridSelectedRows("list2");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
			reportVals.push(rowdata[i].aaz031);
	    }
		if (value == "0"){
	        var selectNum = eval(rowdata).length;
			if(selectNum > 1){
				 Base.alert("只能选择一条支付结果数据！","warn");
				 return;
			}
			if(rowdata == '' || rowdata == null){
				 Base.alert("请选择一条支付结果数据！","warn");
				 return;
			 }
			var aaz031 = rowdata[0].aaz031;
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=qylxgbjt_paymentinfo_yh.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}else if (value == "01"){
	        var selectNum = eval(rowdata).length;
			if(selectNum > 1){
				Base.alert("只能选择一条支付结果数据！","warn");
				return;
			}
			if(rowdata == '' || rowdata == null){
				Base.alert("请选择一条支付结果数据！","warn");
				return;
			 }
			var aaz031 = rowdata[0].aaz031;
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=qylxgbjt_paymentinfo_lxjbt.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}else if(value == "1"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=yhdfylj_qd.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+reportVals);
		}
	}
	
	//打印
	function printRaq1(value){	   
		var aae002 = Base.getValue("aae002");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var data = Base.getGridSelectedRows("list2");	
		var selectNum = eval(data).length;
		if(selectNum > 1){
			Base.alert("只能选择一条支付结果数据！","warn");
			return;
		}
		if(data == '' || data == null){
			Base.alert("请选择一条支付结果数据！","warn");
			return;
		 }
		var aaz031 = data[0].aaz031;
	    if (value == "7"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=sycjdbjbylbx_paymentinfo.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}else if (value == "8"){
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=sybxcjdbjz_paymentinfo.raq&"
				    +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}else if (value == "9"){	          
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=sybxcjylbx_paymentinfo.raq&"
				    +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}else if (value == "10"){		    
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=sybxpeymentinfo_hz.raq&"
					+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aae002="+aae002+";aae140="+aae140+";aaz031="+aaz031);
			}	
	}
	
	//打印
	function printRaq2(value){	   
		var aae002 = Base.getValue("aae002");
		var aae140 = Base.getValue("aae140");
		var yab003 = Base.getValue("yab003");
		var rowdata = Base.getGridSelectedRows("list2");
		var reportVals = new Array();
		for(var i=0;i < rowdata.length;i++){
			reportVals.push(rowdata[i].aaz031);
	    }
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ylbxj_penymetspb.raq&"
				+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aae002="+aae002+";aae140="+aae140+";yab003="+yab003+";aaz031="+reportVals);
	}
	
	//打印费用结算通知书	
	function printTzs(){			   
		var rowdata = Base.getGridSelectedRows("list2");
	    if (rowdata == '' || rowdata == null){
	       alert("请选择需要打印的数据！");
	    } else {
	        var aaz031 = rowdata[0].aaz031;
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSyljstzs_BF2.raq&"
	        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}
	}
	
	//打印发放清单明细
	function printFfqd(){
	   var rowdata = Base.getGridSelectedRows("list2");
	    if (rowdata == '' || rowdata == null){
	    	alert("请选择需要打印的数据！");
	    } else {
	        var aaz031 = rowdata[0].aaz031;
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=yljffqd.raq&"
	        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
		}
	}
	
	//打印失业死亡职工支付单
	function printRaqSY(){
	    var rowdata = Base.getGridSelectedRows("list2");
	    if (rowdata == '' || rowdata == null){
	    	alert("请选择一条支付成功的数据！");
	        return;
	    }
	    var aaz031 = rowdata[0].aaz031;
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=syzgszffxj_SY.raq&"
	    		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aaz031="+aaz031);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>