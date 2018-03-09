<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body cssStyle="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" height="85px">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="fset1" cols="4" key="组织信息">
			<ta:selectInput id="aae140" key="险种" collection="AAE140" display="false" />
			<ta:selectInput id="aaa033" key="角色类型" collection="aaa033" labelWidth="130" required="true" filter="010,040" reverseFilter="true" onSelect="resetinfo" value="010" />
			<ta:box cols="2">
				<ta:text id="aaz001" key="组织编号" maxLength="20" labelWidth="130" required="true" columnWidth="0.9" onChange="callZzRPC();" bpopTipMsg="机构编码、机构名称" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showZzRPCBtn" key="?" onClick="showZzRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<%-- <ta:text id="aaz001" key="组织编号" onChange="sfwQueryUtil(3,'getAaz001',Base.getValue('aaz001'))"  bpopTipMsg="机构编码、机构名称" labelWidth="130" required="true" /> --%>
			<ta:text id="aae044" key="组织名称" labelWidth="130" span="2" readOnly="true" />
			<ta:text id="newBZ" key="新增标志" display="false" />
		</ta:panel>

		<ta:panel id="ffxxlr" key="银行发放信息" cols="3">
			<ta:text id="aaz099" key="待遇发放信息ID" display="false" />
			<ta:selectInput id="aae145" key="支付方式 " required="true" labelWidth="130" collection="AAE145" value="14" onSelect="checkRequired" filter="12,21" />
			<ta:text id="aae136" key="领取人证件号" required="true" readOnly="true" labelWidth="130" />
			<ta:text id="aae133" key="领取人姓名  " required="true" readOnly="false" labelWidth="130" />
			<ta:text id="aae010" key="银行账号" required="true" labelWidth="130" />
			<ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002" required="true" onSelect="getAAE044" maxVisibleRows="8" labelWidth="130" display="false" />
			<ta:selectInput id="aaz009" key="代发机构名称" required="true" collection="AAZ009" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" display="false" />
			<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" onSelect="getAAE008" maxVisibleRows="8" labelWidth="130" required="true" />
			<ta:selectInput id="yaf013" key="开户银行编号" onSelect="fnsetaaf001" showKey="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" />
			<ta:text id="yaf001" key="开户银行名称" labelWidth="130" />
			<ta:selectInput id="yaf011" key="银行同城异地标志" required="true" labelWidth="130" collection="YAF011" value="0" />
			<ta:text id="aae007" key="邮政编码" maxLength="6" readOnly="true" labelWidth="130" display="false" />
			<ta:text id="aae006" key="详细地址" span="2" readOnly="true" labelWidth="130" display="false" />

			<ta:selectInput id="aae145_old" key="支付方式" labelWidth="130" collection="AAE145" value="11" display="false" filter="12" />
			<ta:text id="aae136_old" key="领取人证件号" required="true" labelWidth="130" display="false" />
			<ta:text id="aae133_old" key="领取人姓名  " required="true" labelWidth="130" display="false" />
			<ta:selectInput id="aaf002_old" key="代发银行类别" collection="AAF002" display="false" maxVisibleRows="8" labelWidth="130" />
			<ta:text id="aaz009_old" key="代发机构名称" display="false" labelWidth="130" />
			<ta:text id="aae010_old" key="银行账号" display="false" labelWidth="130" />
			<ta:selectInput id="yaf012_old" key="开户银行类别" collection="AAF002" display="false" maxVisibleRows="8" labelWidth="130" />
			<ta:text id="yaf013_old" key="开户银行编号" display="false" labelWidth="130" />
			<ta:text id="yaf001_old" key="开户银行名称" labelWidth="130" display="false" />
			<ta:text id="yaf011_old" key="银行同城异地标志" display="false" labelWidth="130" />
			<ta:text id="aae007_old" key="邮政编码" maxLength="6" readOnly="true" labelWidth="130" display="false" />
			<ta:text id="aae006_old" key="详细地址" span="2" readOnly="true" labelWidth="130" display="false" />

		</ta:panel>
		<ta:panel id="ae19a1Panel" key="变更信息" fit="true" bodyStyle="margin:0px">
			<ta:datagrid id="ac19a1Grid" fit="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aaz205" key="人员信息变更明细ID" hiddenColumn="false" width="115" />
				<ta:datagridItem id="aaz206" key="人员信息变更事件ID" hiddenColumn="false" width="115" />
				<ta:datagridItem id="aae155" key="变更项目" width="160" />
				<ta:datagridItem id="aae301" key="变更前值描述" width="160" />
				<ta:datagridItem id="aae123" key="变更前信息" width="160" />
				<ta:datagridItem id="aae302" key="变更后值描述" width="160" />
				<ta:datagridItem id="aae124" key="变更后信息" width="160" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="160" />
				<ta:datagridItem id="aae036" key="经办时间" width="160" dataAlign="center" align="center" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		 var aae140 = Base.getValue("aae140",true);
		 if(aae140 == '110'){ //企业养老 
		 	Base.filterSelectInput("aaa033", "010",true);
		 }
		 if(aae140 == '120'){ //机关养老
		 	Base.filterSelectInput("aaa033", "010",true);
		 }
		 if(aae140 == '210'){  //失业
		 	 //Base.filterSelectInput("aaa033", "010,090",true);
			 Base.filterSelectInput("aaa033", "010",true);//暂时只支持参保单位
		 }
		 if(aae140 == '410'){   //工伤
		 	//Base.filterSelectInput("aaa033", "010,040,070,080",true);
			Base.filterSelectInput("aaa033", "010",true);//暂时只支持参保单位
		 }
		 if(aae140 == '510'){    //生育
		 	//Base.filterSelectInput("aaa033", "010,040",true);
			Base.filterSelectInput("aaa033", "010",true);//暂时只支持参保单位
		 }
		 fn_setPaymentInfoPage();
	})

	/* 组织编号RPC */
	function callZzRPC() {
		sfwQueryUtil_newRPC(3, 'getAaz001String', {"dto['inputString']" : Base.getValue("aaz001")});
		//sfwQueryUtil(3,'getAaz001',Base.getValue('aaz001'))
	}
	
	//组织编号RPC
	function showZzRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow10.do", null, 1000, 450, null, function() {
			Base.submit("fset1","paymentInfOrganAction!queryBaseInfo.do",null,null,false,function(data){		   		
				if(data.fieldData.newBZ == '1'){
					Base.confirm("该机构没有发放信息，是否新增？",function(btn, callback,options){		
						if(btn){
						   Base.setValue("newBZ","1");  //1:表示该条记录是新增的	
						   Base.setValue("aae133",Base.getValue("aae044"));
						   Base.setValue("aae136",Base.getValue("aaz001"));
						}else{
						   Base.setValue("aaz001",""); 
                           Base.setValue("aae044",""); 
                           Base.setValue("newBZ","");
                           Base.setValue("aaz099","");
                	   	   Base.setValue("aae145","");
                	   	   Base.setValue("aae133","");
                		   Base.setValue("aaf002",""); 
                		   Base.setValue("aaz009",""); 
                		   Base.setValue("yaf012","");  
                		   Base.setValue("aae010",""); 
                		   Base.setValue("yaf013",""); 
                		   Base.setValue("yaf001",""); 
                		   Base.setValue("aae145_old","");
                	   	   Base.setValue("aae133_old","");
                		   Base.setValue("aaf002_old",""); 
                		   Base.setValue("aaz009_old",""); 
                		   Base.setValue("yaf012_old","");  
                		   Base.setValue("aae010_old",""); 
                		   Base.setValue("yaf013_old",""); 
                		   Base.setValue("yaf001_old",""); 				   
						}
					});
				}else{
					Base.setValue("newBZ","0");  //1:表示该条记录是新增的   
					fn_setPaymentInfoReadOnlyPage();
				}
			});	
		}, true);
	}

	//回调函数	
	function fn_ae10Info(){
	   if (g_Suggest!=""){	
	       var aaz001 = g_Suggest[0]+"";
	       Base.setValue("aaz001",aaz001);
		   Base.submit("fset1","paymentInfOrganAction!queryBaseInfo.do",null,null,false,function(data){		   		
				if(data.fieldData.newBZ == '1'){
					Base.confirm("该机构没有发放信息，是否新增？",function(btn, callback,options){		
						if(btn){
						   Base.setValue("newBZ","1");  //1:表示该条记录是新增的	
						   Base.setValue("aae133",Base.getValue("aae044"));
						   Base.setValue("aae136",Base.getValue("aaz001"));
						}else{
						   Base.setValue("aaz001",""); 
                           Base.setValue("aae044",""); 
                           Base.setValue("newBZ","");
                           Base.setValue("aaz099","");
                	   	   Base.setValue("aae145","");
                	   	   Base.setValue("aae133","");
                		   Base.setValue("aaf002",""); 
                		   Base.setValue("aaz009",""); 
                		   Base.setValue("yaf012","");  
                		   Base.setValue("aae010",""); 
                		   Base.setValue("yaf013",""); 
                		   Base.setValue("yaf001",""); 
                		   Base.setValue("aae145_old","");
                	   	   Base.setValue("aae133_old","");
                		   Base.setValue("aaf002_old",""); 
                		   Base.setValue("aaz009_old",""); 
                		   Base.setValue("yaf012_old","");  
                		   Base.setValue("aae010_old",""); 
                		   Base.setValue("yaf013_old",""); 
                		   Base.setValue("yaf001_old",""); 				   
						}
					});
				}else{
					Base.setValue("newBZ","0");  //1:表示该条记录是新增的   
					fn_setPaymentInfoReadOnlyPage();
				}
			});
	   }
	}
	
    function getAAE044(){
		Base.submit("aaf002,aae140","<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE044.do",null,null,null,function(data){
			   Base.submit(null, "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE008.do",{"dto['yaf012']":Base.getValue("aaf002")});
		});
	}
    function getAAE008(){    
        Base.setValue("yaf001","");
		Base.submit("yaf012", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE008.do");
	}
	function fnsetaaf001(){
	   Base.submit("yaf013", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAf07AAE044.do");
	}

	function checkRequired() {
		var aae044 = Base.getValue("aae044");
		var aae145 = Base.getValue("aae145");
		var aaz001 = Base.getValue("aaz001");

		if (aae044 == null || aae044 == '') {
		} else {
			Base.setValue("aae133", aae044);
		}
		if (aaz001 == null || aaz001 == '') {
		} else {
			Base.setValue("aae136", aaz001);
		}

		if (aae145 == "11") {
			Base.setDisRequired([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "aae006", "aae007", "yaf011" ]);
			Base.setRequired([ "aae010", "aaf002", "aaz009", "yaf011" ]);
			Base._setReadOnly([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "yaf011" ], false);
			Base._setReadOnly([ "aae006", "aae007" ], true);
			Base.hideObj([ "aae006", "aae007" ]);
			Base.showObj([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "yaf011" ]);
			Base.setValue("aaf002", "");
			Base.setValue("aaz009", "");
			Base.setValue("yaf012", "");
			Base.setValue("yaf013", "");
			Base.setValue("yaf001", "");
			Base.setValue("aae006", "");
			Base.setValue("aae007", "");
			Base.setValue("yaf011", "0");
		} else if (aae145 == "12") {
			Base.setDisRequired([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "yaf011" ]);
			Base.setRequired([ "aae006", "aae007" ]);
			Base._setReadOnly([ "aae006", "aae007" ], false);
			Base._setReadOnly([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "yaf011" ], true);
			Base.showObj([ "aae006", "aae007" ]);
			Base.hideObj([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "yaf011" ]);
			Base.setValue("aae010", "");
			Base.setValue("aaf002", "");
			Base.setValue("aaz009", "");
			Base.setValue("yaf012", "");
			Base.setValue("yaf013", "");
			Base.setValue("yaf001", "");
			Base.setValue("aae006", "");
			Base.setValue("aae007", "");
			Base.setValue("yaf011", "");
		} else if (aae145 == "14") {
			Base.setDisRequired([ "aae010", "yaf001", "yaf012", "yaf013", "aae006", "aae007", "yaf011" ]);
			Base.setRequired([ "aae010", "yaf011", "yaf012" ]);
			Base._setReadOnly([ "aae010", "yaf001", "yaf012", "yaf013", "yaf011" ], false);
			Base._setReadOnly([ "aae006", "aae007" ], true);
			Base.hideObj([ "aae006", "aae007", "aaf002", "aaz009" ]);
			Base.showObj([ "aae010", "yaf001", "yaf012", "yaf013", "yaf011" ]);
			Base.setValue("aaf002", "");
			Base.setValue("aaz009", "");
			Base.setValue("yaf012", "");
			Base.setValue("yaf013", "");
			Base.setValue("yaf001", "");
			Base.setValue("aae006", "");
			Base.setValue("aae007", "");
			Base.setValue("yaf011", "0");
		} else if (aae145 == "21") {
			Base.setDisRequired([ "aae010", "aaf002", "aaz009", "yaf001", "yaf012", "yaf013", "aae006", "aae007", "yaf011" ]);
			Base._setReadOnly([ "aae010", "yaf012", "yaf011" ], false);
			Base.showObj([ "aae010", "yaf012", "yaf011" ]);
			Base.hideObj([ "aaf002", "aaz009", "aae006", "aae007" ]);
			Base.setValue("aae010", "");
			Base.setValue("aaf002", "");
			Base.setValue("aaz009", "");
			Base.setValue("yaf012", "");
			Base.setValue("yaf013", "");
			Base.setValue("yaf001", "");
			Base.setValue("aae006", "");
			Base.setValue("aae007", "");
			Base.setValue("yaf011", "");
		} else {
			alert("支付方式录入错误！");
			return false;
		}
		fn_privateContorlAae145();
	}

	function resetinfo() {
		Base.setValue("aaz001", "");
		Base.setValue("aae044", "");
		Base.setValue("newBZ", "");
		Base.setValue("aae136", "");
		Base.setValue("aae145", "");
		Base.setValue("aaf002", "");
		Base.setValue("aaz009", "");
		Base.setValue("yaf012", "");
		Base.setValue("yaf013", "");
		Base.setValue("yaf001", "");
		Base.setValue("aae010", "");
		Base.setValue("aae133", "");
		Base.setValue("aaz099", "");
	}
	//保存经办信息
	function submitData() {
		var aae145 = Base.getValue("aae145");
		var aaf002 = Base.getValue("aaf002");
		var aaz009 = Base.getValue("aaz009");
		var yaf012 = Base.getValue("yaf012");
		var yaf013 = Base.getValue("yaf013");
		var yaf001 = Base.getValue("yaf001");
		var aae010 = Base.getValue("aae010");
		var aae133 = Base.getValue("aae133");

		var aae145_old = Base.getValue("aae145_old");
		var aaf002_old = Base.getValue("aaf002_old");
		var aaz009_old = Base.getValue("aaz009_old");
		var yaf012_old = Base.getValue("yaf012_old");
		var yaf013_old = Base.getValue("yaf013_old");
		var yaf001_old = Base.getValue("yaf001_old");
		var aae010_old = Base.getValue("aae010_old");
		var aae133_old = Base.getValue("aae133_old");

		if (aae145_old != aae145 || aaf002_old != aaf002 || aaz009_old != aaz009 || yaf012_old != yaf012 || yaf013_old != yaf013 || yaf001_old != yaf001 || aae010_old != aae010
				|| aae133_old != aae133) {
			Base.submit("form1", "paymentInfOrganAction!toSave.do");

		} else {
			Base.alert("没有变更信息，不能保存！", "error");
		}

	}
	$(document).ready(function() {
		var aae140 = Base.getValue("aae140", true);
		if (aae140 == '110') { //企业养老 
			Base.filterSelectInput("aaa033", "010", true);
		}
		if (aae140 == '120') { //机关养老
			Base.filterSelectInput("aaa033", "010", true);
		}
		if (aae140 == '210') { //失业
			Base.filterSelectInput("aaa033", "010", true);//暂时只支持参保单位
		}
		if (aae140 == '410') { //工伤
			Base.filterSelectInput("aaa033", "010", true);//暂时只支持参保单位
		}
		if (aae140 == '510') { //生育
			Base.filterSelectInput("aaa033", "010", true);//暂时只支持参保单位
		}
		fn_setPaymentInfoPage();
	})
</script>
<%@ include file="/ta/incfooter.jsp"%>
