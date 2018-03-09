<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WorkinjuryCognizanceQuery</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:box>
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印待遇核定表" onClick="print(1)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn1" icon="xui-icon-spotPrint" key="打印待遇资格证" onClick="print(2)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn2" icon="xui-icon-spotPrint" key="打印年审证" onClick="print(3)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn18_1" icon="xui-icon-spotPrint" key="打印调整基本养老金申报表" onClick="printRC(181)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn18_2" icon="xui-icon-spotPrint" key="打印养老金历年调整表" onClick="printRC(182)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn1a_1" icon="xui-icon-spotPrint" key="打印个人一次性支付审批表" onClick="printZZ(1)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn1a_2" icon="xui-icon-spotPrint" key="打印死亡待遇对比情况表（事业）" onClick="printZZ(2)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn3" icon="xui-icon-spotPrint" key="打印失业证" onClick="printSY()" asToolBarItem="true" display="false" />
		<ta:button id="printBtn4" icon="xui-icon-spotPrint" key="打印审核表" onClick="printM(1)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn5" icon="xui-icon-spotPrint" key="打印结算表" onClick="printM(2)" asToolBarItem="true" display="false" />
		<ta:button id="printBtn31" icon="xui-icon-spotPrint" key="打印失业保险金申领表" onClick="printRaq()" asToolBarItem="true" display="false" />
		<ta:button id="printBtn32" icon="xui-icon-spotPrint" key="打印失业补助金" onClick="printSY_S()" asToolBarItem="true" display="false" />
	</ta:box>
	<ta:box>
	</ta:box>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:selectInput id="aaa076" key="核定类型" collection="AAA076" onSelect="fnShowPrintBtn" />
			<ta:date id="aae210" key="待遇享受开始年月" issue="true" showSelectPanel="true" />
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" columnWidth="0.9" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:box cols="2">
				<ta:text id="aac003" key="姓名" maxLength="20" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入身份证号、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aac002" key="身份证编号" readOnly="true" />
			<ta:text id="aac001" key="个人编号" display="false" />
			<ta:selectInput id="aae016" key="复核标志" collection="AAE016" />
			<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" />
			<ta:date id="aae036_e" key="经办时间止" showSelectPanel="true" />
			<ta:selectInput id="aae110" key="核定标志" collection="AAE110" />
		</ta:panel>
		<ta:panel id="Ac71Panel" key="待遇核定信息" fit="true">
			<ta:datagrid id="Ac71Grid" fit="true" columnFilter="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="zgzcs" key="资格证打印次数" width="120px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="nszcs" key="年审证打印次数" width="120px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aab001" key="单位编号" width="100px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae044" key="单位名称" width="180px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae044_y" key="原单位名称" width="180px" dataAlign="center" align="center" sortable="true" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="100px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz170" key="人员待遇核定事件ID" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac002" key="公民身份号码" width="150px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="100px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aac004" key="性别" width="80px" dataAlign="center" align="center" collection="AAC004" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaa076" key="待遇核定类型" collection="AAA076" width="180px" dataAlign="center" align="center" sortable="true"></ta:datagridItem>
				<ta:datagridItem id="aae210" key="待遇享受开始年月" width="120px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae129" key="核发金额" width="120" dataAlign="right" totals="sum" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="zhfh" key="帐户返还" width="120" dataAlign="right" totals="sum" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="ajc097" key="享受月数" width="120" dataAlign="right" totals="sum" align="center" sortable="true" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae006" key="地址" width="150px" dataAlign="center" align="center" showDetailed="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae005" key="联系电话" width="100px" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae016" key="复核标志" collection="AAE016" width="80px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="aae110" key="处理标志" collection="AAE110" width="80px" dataAlign="center" align="center"></ta:datagridItem>
				<ta:datagridItem id="aae002" key="支付期号" width="100px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz002" key="业务日志编码" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="ykc005" key="是否事业单位在编人员" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz157" key="人员社会保险明细ID" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aaz159" key="人员参保关系ID" width="150px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" maxChart="4" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae036" key="经办时间" width="120px" dataAlign="center" align="center" sortable="true">
				</ta:datagridItem>
				<ta:datagridItem id="yab003" key="经办机构" width="120px" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<br />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();		
		initializeSuggestFramework(1,"ac01","aac003",850,200,7,'',1,false);
		initializeSuggestFramework(2,null,"aab001",700,200,3,'',1,false);	
		var aae140 = Base.getValue("aae140");
		if(aae140 == '210' || aae140 == '410'){
			 Base.showObj("aja004");
		}
		if(aae140 == "210"){
		    Base.setGridColumnShow("Ac71Grid","aae044_y");
		    Base.setGridColumnShow("Ac71Grid","ajc097");
		}
	});
	
	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001DYString', {"dto['inputString']" : Base.getValue("aac003"),"dto['aae140']":Base.getValue("aae140")});
	}

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow14.do", null, 1000, 450, null, null, true);
	}
	
	//单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']" : Base.getValue("aab001")});
	}
	
	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, null, true);
	}
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", Base.getValue("qxkzAction")+"!query.do");
	}
	
	//显示打印按钮
	function fnShowPrintBtn(value,key){
			if(key == "11"){
			    Base.showObj("printBtn");
			    Base.showObj("printBtn1");
			    Base.showObj("printBtn2");
			    Base.hideObj("printBtn18_1");
			    Base.hideObj("printBtn18_2");
			    Base.hideObj("printBtnla_1");
			    Base.hideObj("printBtnla_2");
			    Base.setGridColumnShow("Ac71Grid","zgzcs");
			    Base.setGridColumnShow("Ac71Grid","nszcs");
			}else if(key == "12" || key == "15"){
			    Base.showObj("printBtn");
			    Base.hideObj("printBtn1");
			    Base.hideObj("printBtn2");
			    Base.hideObj("printBtn18_1");
			    Base.hideObj("printBtn18_2");
			    Base.hideObj("printBtnla_1");
			    Base.hideObj("printBtnla_2");
			    Base.setGridColumnHidden("Ac71Grid","zgzcs");
			    Base.setGridColumnHidden("Ac71Grid","nszcs");
			}else if(key == "18"){
			    Base.showObj("printBtn");
			    Base.showObj("printBtn18_1");
			    Base.showObj("printBtn18_2");
			    Base.hideObj("printBtn1");
			    Base.hideObj("printBtn2");
			    Base.hideObj("printBtnla_1");
			    Base.hideObj("printBtnla_2");
			    Base.setGridColumnHidden("Ac71Grid","zgzcs");
			    Base.setGridColumnHidden("Ac71Grid","nszcs");
			}else if(key == "1a"){
			    Base.showObj("printBtn1a_1");
			    Base.showObj("printBtn1a_2");
			    Base.hideObj("printBtn");
			    Base.hideObj("printBtn18_1");
			    Base.hideObj("printBtn18_2");
			    Base.hideObj("printBtn1");
			    Base.hideObj("printBtn2");
			    Base.setGridColumnHidden("Ac71Grid","zgzcs");
			    Base.setGridColumnHidden("Ac71Grid","nszcs");
			}else if(key == "21" || key == "2a"|| key == "27"){
			    Base.hideObj("printBtn32");
			    Base.showObj("printBtn3");
			    Base.showObj("printBtn31");
			}else if(key == "22"){
			    Base.hideObj("printBtn3");
			    Base.hideObj("printBtn31");
			    Base.showObj("printBtn32");
			}else if(key == "51"){
			    Base.showObj("printBtn4");
			    Base.showObj("printBtn5");
			}else if(key == "52"){
			    Base.showObj("printBtn4");
			    Base.showObj("printBtn5");
			}else{
			    Base.hideObj("printBtn");
			    Base.hideObj("printBtn1");
			    Base.hideObj("printBtn2");
			    Base.hideObj("printBtn3");
			    Base.hideObj("printBtn31");
			    Base.hideObj("printBtn32");
			    Base.hideObj("printBtn1");
			    Base.hideObj("printBtn4");
			    Base.hideObj("printBtn5");
			    Base.hideObj("printBtn18_1");
			    Base.hideObj("printBtn18_2");
			    Base.hideObj("printBtnla_1");
			    Base.hideObj("printBtnla_2");
			    Base.setGridColumnHidden("Ac71Grid","zgzcs");
			    Base.setGridColumnHidden("Ac71Grid","nszcs");    
			}
	}

	//打印养老待遇
	function print(num) {
	    var key = Base.getValue("aaa076");
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    if(data == "" || data == null){
	        Base.alert("请选择一条待遇核定信息！");
	    }
	    var aac001 = data[0].aac001;
	    if (aac001 == null || aac001 == "") {
	      Base.alert("个人编号为空,不能打印");
	      return;
	    }
	    var aaz170 = data[0].aaz170;
	    if (aaz170 == null || aaz170 == "") {
	      Base.alert("核定事件ID为空,不能打印");
	      return;
	    }
	    var aaz002 = data[0].aaz002;
	    var aaz157 = data[0].aaz157;
	    var aaz159 = data[0].aaz159;
	    if(key == "11" || key == "18"){   
		    //打印待遇核定表
		    if(num == 1){
		        var ykc005 = data[0].ykc005;     
		        if(ykc005 == '1'){
		            $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyjs_jbyljhdb_74.raq&"
		        		   +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
						   +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz170="+aaz170);
		        }else{
		           if(key == "11"){
		               $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyjs_jbyljhdb_54.raq&"
		            		  +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
							  +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz170="+aaz170);
		           }else if(key == "18"){
		               $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_csdyjs_jbyljhdb_54.raq&"
		            		  +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
							  +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz170="+aaz170);
		          }
		       }
		       //打印待遇资格证
		    }else if(num == 2){
		        var reportVals = new Array();
		        var ids = "";
				for(var i=0;i < data.length;i++){
				    reportVals.push(data[i].aaz002);
				    ids+=data[i].aaz002+",";
				}
		        prm = {"dto['reportfilename']":"i_dyjs_zgz.raq","dto['yae092']":"AC71","dto['yae094']":"AAZ002","dto['ids']":ids};
		        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyjs_zgz.raq&"
		        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
						+"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+reportVals);
				Base.submit("","<%=path%>/workinjurybenefit/query/print/printQueryAction!toSave.do",prm,null,null,function(){
				    Base.submit("form1", Base.getValue("qxkzAction")+"!query.do");
				}); 
		    }else if(num == 3){
		        //打印年审证
		        var reportVals = new Array();
		        var ids = "";
				for(var i=0;i < data.length;i++){
				    reportVals.push(data[i].aaz002);
				    ids+=data[i].aaz002+",";
				}
				prm = {"dto['reportfilename']":"i_dyjs_nsz.raq","dto['yae092']":"AC71","dto['yae094']":"AAZ002","dto['ids']":ids};
		        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyjs_nsz.raq&"
		        		   +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
						   +"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+reportVals);
				Base.submit("","<%=path%>/workinjurybenefit/query/print/printQueryAction!toSave.do",prm,null,null,function(){
				   Base.submit("form1", Base.getValue("qxkzAction")+"!query.do");
				}); 
		    }  
		    
		 }else if(key == "15"){
		     $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ycxtx_yl.raq&"
		    		 +"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					 +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz002="+aaz002+";aaz157="+aaz157+";aaz159="+aaz159);
		 }else if(key == "12"){
		     $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=treatmentLumpsum.raq&"
		    		 +"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					 +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz002="+aaz002+";aaz157="+aaz157+";aaz159="+aaz159);
		 }    
	  }	
  
	//打印养老金历年调整表、调整基本养老金申报表
	function printRC(num) {
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    var aac001 = data[0].aac001;
	    if (aac001 == null || aac001 == "") {
	        Base.alert("个人编号为空,不能打印");
	        return;
	    }
	    var aaz170 = data[0].aaz170;
	    if (aaz170 == null || aaz170 == "") {
	        Base.alert("核定事件ID为空,不能打印");
	        return;
	    }
	    if(num == "181"){
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dycs_tzjbyljsbb.raq&"
	        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz170="+aaz170);
	    }else if(num == "182"){
		    var aaz002 = data[0].aaz002;
		    if (aaz002 == null || aaz002 == "") {
		        Base.alert("业务日志ID为空,不能打印");
		        return;
		    }	      
		    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dycs_dylntzb.raq&"
		    		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz002="+aaz002+";aaz170="+aaz170);
	    }  
	  }
  
	//打印个人一次性支付审批表
	function printZZ(num){
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    var aac001 = data[0].aac001;
		var aaz002 = data[0].aaz002;
		var aab001 = data[0].aab001;
	    var yab003 = data[0].yab003;	    
	    if(num == "1"){
	        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=grzhycxzf_spb_yl.raq&"
	        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002+";aac001="+aac001+";yab003="+yab003);
	    }else if(num == "2"){
	        var ykc005 = data[0].ykc005;
	        if(ykc005!="1"){
	            Base.alert("该人员不是事业单位人员，不能打印死亡待遇对比情况表（事业）！");
	            return;
	        }
		    if(aab001 == "10011896"){
	            $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=TreatmentContrast_lz.raq&"
	            		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002+";aac001="+aac001);
	        }else{
	            $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=TreatmentContrast.raq&"
	            	  +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					  +"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002+";aac001="+aac001);
	        }
	    }
	} 
 
	//打印生育待遇
	function printM(num){
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    if(data == ""||data == null){
	        Base.alert("请选择一条待遇核定信息！");
	    }
	    var aaz002 = data[0].aaz002;
	    var key = Base.getValue("aaa076");
	    if(key == "52"){
	        if(num == 1){
			    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_syjl_shb_query.raq&"
			    		+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
						+"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002);
		    }else if(num == 2){
		        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_zybxjsd_ylf.raq&"
		        		+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
						+"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002);
		    }
		}else if(key == "51"){
		    if(num == 1){	
			    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_syjt_shb_query.raq&"
			    		+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002);
			 }else if(num == 2){
			     $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_zybxjsd.raq&"
			    		+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					    +"serverPagedPrint=no&mirror=no&"+"paramString=aaz002="+aaz002);
			 }
		}
	}	

	//打印失业证
	function printSY(){
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    if(data == "" || data == null){
	        Base.alert("请选择一条待遇核定信息！");
	    }
	    var aac001 = data[0].aac001;
	    if (aac001 == null || aac001 == "") {
	        Base.alert("个人编号为空,不能打印");
	        return;
	    }
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=shiyezheng.raq&"
	    		+"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
				+"serverPagedPrint=no&mirror=no&"+"paramString=aac001=" + aac001);
	}	
	  
	//打印失业待遇
	function printRaq(){
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    if(data == "" || data == null){
	        Base.alert("请选择一条待遇核定信息！");
	    }
	    var aaz002 = data[0].aaz002;
	    var aae140 = Base.getValue("aae140");
	    if(aaz002 == '' || aaz002 == null){
				Base.alert("没有获取到业务日志ID，请联系管理员！");
				return;
		}
		if(aae140 == '' || aae140 == null){
			Base.alert("没有获取到险种信息，请联系管理员！");
			return;
		}
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYbxjslb.raq&"
	    		+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
	    		+ "serverPagedPrint=no&mirror=no&"+ "paramString=aaz002=" + aaz002+";aae140="+aae140);
	}
	
	function printSY_S(){
	    var data = Base.getGridSelectedRows("Ac71Grid");
	    if(data == ""||data == null){
	        Base.alert("请选择一条待遇核定信息！");
	    }
	    var aaz002 = data[0].aaz002;
	    var yab003 = data[0].yab003;
	    if(aaz002 == ''||aaz002 == null){
			Base.alert("没有获取到业务日志ID，请联系管理员！");
			return;
		}
		if(yab003 == ''||yab003 == null){
			Base.alert("没有获取到经办机构信息，请联系管理员！");
			return;
		}
	    
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYswszffxj_slb.raq&" 
	    		+ "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
	    		+ "serverPagedPrint=no&mirror=no&" + "paramString=aaz002=" + aaz002 + ";yab003="+ yab003);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
