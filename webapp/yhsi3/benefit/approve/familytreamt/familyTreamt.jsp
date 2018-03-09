<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>供养亲属待遇核定</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]"  hotKey="ctrl+P" onClick="print()" asToolBarItem="true" display="false" disabled="true"/>
			<ta:button id="printBtn1" icon="xui-icon-spotPrint" key="打印"  onClick="printRaq()" asToolBarItem="true" display="false" disabled="true"/>
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
				asToolBarItem="true" display="false" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
				<ta:text id="yab003" display="false" key="经办机构" />
			</ta:box>

			<ta:panel id="grjbxx" key="死亡人员信息" cols="3">
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" />
				<ta:selectInput id="aae140" key="险种" collection="AAE140" display="false" />

				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" span="2" />
				<ta:date id="aae138" key="死亡时间" readOnly="true" labelWidth="130" />
				<ta:selectInput id="yac551" key="丧葬方式" collection="YAC551" labelWidth="130" readOnly="true" />
				<ta:text id="yac001" key="最大发放期" readOnly="true" labelWidth="130" />
			</ta:panel>

			<ta:panel id="gyqslb" key="供养亲属基本信息" height="140px">
				<ta:datagrid id="gyqsjbxxList" selectType="checkbox" fit="true">
					<ta:datagridItem id="aaz257" key="供养亲属定期待遇享受ID" hiddenColumn="true" width="100px" align="center" />
					<ta:datagridItem id="aac002" key="身份证号码" width="100px" align="center" />
					<ta:datagridItem id="aac003" key="姓名" width="100px" align="center" />
					<ta:datagridItem id="aac001_gy" key="个人编号" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="yac520" key="丧失劳动能力" width="100px" collection="AAC086" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae144" key="供养关系" collection="AAE144" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aac086" key="孤寡标志" collection="AAC086" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae210" key="待遇享受开始年月" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aic172" key="享受比例" hiddenColumn="true" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae005" key="联系电话" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" width="100px" align="center" dataAlign="center"/>					
					<ta:datagridItem id="aae145" key="支付方式" collection="AAE145" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aac059" key="领取人证件类型 " width="110px" collection="AAC059" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae136" key="领取人证件号码" width="110px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae133" key="领取人姓名" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae010" key="银行账号" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae007" key="邮政编码" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae006" key="联系地址" width="100px" align="center" dataAlign="center"/>
					<ta:datagridItem id="aae013" key="备注" width="100px" align="center" dataAlign="center"/>
				</ta:datagrid>
			</ta:panel>
			<ta:tabs id="tabs1" fit="true">
				<ta:tab id="tab1" key="待遇信息">
					<ta:panel id="gyqsdyxx" key="供养亲属当前待遇信息" fit="true">
						<ta:datagrid id="gyqsdyxxList" fit="true" selectType="radio">
							<ta:datagridItem id="aac003" key="姓名">
							</ta:datagridItem>
							<ta:datagridItem id="aac002" key="身份证">
							</ta:datagridItem>
							<ta:datagridItem id="aac001" key="个人编号">
							</ta:datagridItem>
							<ta:datagridItem id="aae129" key="核发金额">
							</ta:datagridItem>
							<ta:datagridItem id="aic172" key="享受比例" hiddenColumn="true">
							</ta:datagridItem>
							<ta:datagridItem id="aac086" key="孤寡标志" collection="AAC086">
							</ta:datagridItem>
							<ta:datagridItem id="aae144" key="供养关系" collection="AAE144">
							</ta:datagridItem>
							<ta:datagridItem id="aae210_1" key="开始年月">
							</ta:datagridItem>
							<ta:datagridItem id="aae235" key="结束年月">
							</ta:datagridItem>
							<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" />
							<ta:datagridItem id="aae145" key="支付方式" collection="AAE145" />
							<ta:datagridItem id="aac059" key="领取人证件类型 " width="110px" collection="AAC059" />
							<ta:datagridItem id="aae136" key="领取人证件号码" width="110px" />
							<ta:datagridItem id="aae133" key="领取人姓名" />
							<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" />
							<ta:datagridItem id="aae010" key="银行账号" />
							<ta:datagridItem id="aae007" key="邮政编码" />
							<ta:datagridItem id="aae006" key="联系地址" />
							<ta:datagridItem id="aae005" key="联系电话" />
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
							</ta:datagridItem>
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
				<ta:tab id="tab2" key="补发信息">
					<ta:panel id="dqbfxx" key="补发核定信息" fit="true">
						<ta:datagrid id="dqbfxxList" fit="true">
							<ta:datagridItem id="aac003" key="姓名" width="220" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" align="center" width="220">
							</ta:datagridItem>
							<ta:datagridItem id="aae128" key="核发金额" width="220" align="center">
							</ta:datagridItem>
							<ta:datagridItem id="aae016" key="复核标志" width="250" align="center" collection="AAE016">
							</ta:datagridItem>
							<ta:datagridItem id="aae003" key="对应所属期" width="250" align="center">
							</ta:datagridItem>
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
			</ta:tabs>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">

//人员信息RPC
function showRyRPC() {
	Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
		Base.submit("","familyTreamtAction!queryPersonInfo.do",{"dto['aac001']":Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}, true);
}

function submitData(){	
	var rowData = Base.getGridSelectedRows("gyqsjbxxList");//获得表格所有的JSON数组
	if(rowData == 0){
	   if(rowData_dh == 0)
		{
		 Base.alert("请选择需要核定的供养亲属!","warn");
		 return false;
		}
	}
	var prm ={};
    prm.d2List= Ta.util.obj2string(rowData);
	Base.submit("procInc,grjbxx,gyqsjbxxList","familyTreamtAction!toSave.do",prm,null,null,function(){
		 Base.setEnable("printBtn1");
	});
}

function fn_queryInfo(){
   	if (g_Suggest!=""){ 
   		fn_setPersonBaseInfoData();
		Base.submit("aac001,aae140", "familyTreamtAction!queryPersonInfo.do");  
   	}
}

function print(){
	var aac001 = Base.getValue("aac001");
	var aaz002 = Base.getValue("aaz002");
	var data = Base.getGridSelectedRows("gyqsdyxxList");
	if(data==""||data==null){
	   Base.alert("请选择一条供养亲属待遇信息！");
	   return;
	}
	var aac001_gy = data[0].aac001;
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSgyqs.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aac001="+aac001+";aaz002="+aaz002+";aac001_gy="+aac001_gy);		
}

function printRaq(){
    var aac111 = Base.getValue("aac001");
	var aae140 = Base.getValue("aae140");
	var yab003 = Base.getValue("yab003");
	var data = Base.getGridSelectedRows("gyqsdyxxList");
	if(data==""||data==null){
	    Base.alert("请在'供养亲属当前待遇信息'勾选一条信息！");
	}
	var aac001 = data[0].aac001;
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_gyhd_nsz.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aac001="+aac001+";aac111="+aac111+";aae140="+aae140+";yab003="+yab003);
}

//页面布局控制
$(document).ready(function() {
	var aae140 = Base.getValue("aae140");
	if(aae140 == '410'){
		Base.showObj("printBtn");
		Base.setGridColumnShow('gyqsjbxxList', 'aic172');	
		Base.setGridColumnShow('gyqsdyxxList', 'aic172');
	}else if(aae140=='110')	{
	    Base.showObj("printBtn1");
	}
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
