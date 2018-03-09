<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心诊疗项目修改</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
	  <ta:toolbarItem id="closeBtn"   key="关闭"    icon="xui-icon-spotClose"   onClick="closeWin()"  />
		<ta:button id="btnShjl" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false"/>
	</ta:toolbar>

	<ta:form id="form1" fit="true" >
		 <ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz267" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
	
		<ta:text id="aaz231" key="社保三大目录ID" readOnly="true" display="false" />
		<ta:text id="aaz234" key="社保三大目录维护事件ID" readOnly="true" display="false" />
		<ta:text id="flag" readOnly="true" display="false" value="modifyClinics"/>
		<ta:panel  id="fdtBaseinfo" key="社保中心目录基本信息" cols="3" >
			<ta:text id="ake001" key="社保三大目录编码" readOnly="true" onChange="rpc()" labelWidth="150" required="true"/>
			<ta:text id="ake002" key="社保三大目录名称" labelWidth="150" span="2"/>
			<ta:selectInput id="ake003" key="三大目录类别" collection="AKE003" value="2" readOnly="true" labelWidth="150" required="true" />
			<ta:text id="aka020" key="拼音助记码" maxLength="50" labelWidth="150" />
			<ta:text id="aka021" key="五笔助记码" maxLength="50" labelWidth="150" />
			<ta:selectInput id="aka022" key="医疗使用标志" collection="AKA022" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="ala011" key="工伤使用标志" collection="ALA011" labelWidth="150" required="true" display="false" />
			<ta:selectInput id="ama011" key="生育使用标志" collection="AMA011" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="aja006" key="限门诊使用标志" collection="AJA006" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="aka063" key="医疗发票项目类别" collection="AKA063" labelWidth="150"  reverseFilter="false"  required="true"/>
			<ta:date id="aae030_1" key="上次修改的开始日期" display="false"/>
			<ta:selectInput id="aka065" key="收费项目等级"  collection="AKA031"  labelWidth="150" readOnly="true" />
			<ta:selectInput id="ake103" key="价格定比例" labelWidth="150" collection="AKA032"  required="true" />
			<ta:text id="akb020" key="服务机构编号" labelWidth="150" readOnly="true" />
			<ta:text id="akb021" key="服务机构名称"  span="2"  labelWidth="150" readOnly="true"/>
			<ta:selectInput id="ake004"  key="进口使用标志"  data="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" labelWidth="150" />
			<ta:text id="aka052" key="使用单位" labelWidth="150"/>
		    <ta:text id="ake101" key="省目录编码" maxLength="50" labelWidth="150"  />
			<ta:text id="ake102" key="自定义编码" maxLength="50" labelWidth="150" />
			<ta:date id="aae030" key="开始日期" labelWidth="150" required="true" showSelectPanel="true" readOnly="true"/>		
			<ta:text id="yke006" key="除外内容"  maxLength="4000" labelWidth="150" span="3"  readOnly="true" />				
			<ta:text id="yke005" key="项目内涵" maxLength="4000" labelWidth="150" span="3"  readOnly="true" />
			<ta:text id="aae013" key="备注" maxLength="200" labelWidth="150"  span="3"   readOnly="true" />
			
			<ta:selectInput id="yke002" key="计价单位" display="false" collection="AKA052" labelWidth="150"/>
			<ta:selectInput id="aka033" key="分类三" display="false" collection="AKA033" labelWidth="150"  />
			<ta:selectInput id="aka034" key="分类四" display="false" collection="AKA034" labelWidth="150" />
			
		</ta:panel>
		<ta:box id="bxCs" cols="2" fit="true" >
			<ta:panel id="pnlZfbl" key="社保三大目录自付比例参数(点击空白行,即可编辑数据)" height="230px" scalable="false"  expanded="false">
				<ta:datagrid id="dgZfbl"    haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aac066" key="参保身份" collection="AAC066" showDetailed="true" hiddenColumn="true"/>
					<ta:datagridItem id="aae140" key="险种类型"   showDetailed="true" collection="AAE140" align="center"/>
					<ta:datagridItem id="aka057" key="自付比例"  showDetailed="true" dataAlign="right" align="center">
					</ta:datagridItem>
					
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlXjdy"  key="社保药品项目限价定义参数(点击空白行,即可编辑数据)" height="230px" scalable="false"  expanded="false">
				<ta:datagrid id="dgXjdy"  fit="true" haveSn="true" forceFitColumns="true" >
					<ta:datagridItem id="akb095" key="限价医院等级" collection="AKB096" showDetailed="true" align="center" />
					<ta:datagridItem id="aka068" key="定价上限金额" dataType="number"  showDetailed="true" dataAlign="right" align="center">
					</ta:datagridItem>
					
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"","ake001",500,300,4,fn_callback,0,false);
		Base.focus("ake001");
		Base.filterSelectInput("action", '1,2', true);
	   //fnGetMnemonicCode('ake002',fnZjm);
	   
	});
	
	//由于只有一个可输入框时,焦点设置
	$("#ake001").keydown(function(e){
		if(e.keyCode==13)
		{
			setTimeout(function(){Base.focus("ake002");},20);
		}
	});
	
	
	function rpc(){
		sfwQueryUtil(1,"getKa20Filter",Base.getValue("ake001")+',1');
	} 
	   
	//助记码
    function fnZjm(O){
	    Base.setValue("aka020",O[0]);
	    Base.setValue("aka021",O[1]);
    }
    
    //开始时间和结束时间判断
    function checkDate(obj){
        var aae030 = Base.getValue('aae030');
        var aae030_1 = Base.getValue('aae030_1');
        if(aae030!='' && aae030_1!='' && aae030_1>=aae030){
            obj.value='';
            Base.alert("开始生效日期应晚于上次修改的开始生效日期["+aae030_1+"]");
            return false;
        }
        return true;
    }
    
   //RPC回调函数
	function fn_callback() {
	    Base.resetForm('form1');
		Base.clearGridData("dgZfbl");
		Base.clearGridData("dgXjdy");
		
		Base.setValue("ake001",g_Suggest[0]);
		Base.submit("", "modifyClinicsAction!toClinicsInfo.do", {"dto['aaz231']" : g_Suggest[0]}, null, false, null, null);
	}
	
	//查询数据库
	function query(){
		Base.submit("aaz231","modifyClinicsAction!query.do");
	}
	
	//保存
	function toSave() {
		
	
	    //提交
		if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?", function(btn, callback) {
				if (btn) {
				    var dgZfbl = Base.getGridData('dgZfbl'); 
				    var dgXjdy = Base.getGridData('dgXjdy'); 
					var param={};
			        param.dgZfbl = Ta.util.obj2string(dgZfbl);
			        param.dgXjdy = Ta.util.obj2string(dgXjdy);
					Base.submit('form1,dgZfbl,dgXjdy','modifyClinicsAuditAction!toSave.do',param,false,false,null); 
				}
			});
		}

	}
	
	//重置
	function toReset() {
		Base.confirm("确定要清空数据吗?", function(yes) {
			if (yes) {
				Base.resetForm('form1');
				Base.clearGridData("dgZfbl");
				Base.clearGridData("dgXjdy");
				Base.setValue("ake001", "");
				Base.setValue("ake002", "");
				Base.setValue("ake003", "");
				Base.setValue("aka020", "");
				Base.setValue("aka021", "");
				Base.setValue("aae030", "");
				Base.setValue("aae013", "");
				Base.focus("ake001");
			}
		});
	}
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	function fn_setAka057(key, value){
		var aka057 = 0;
		switch (parseInt(value)) {
		case 1:
			aka057 = 0;
			break;
		case 2:
			aka057 = 0.15;
			break;
		case 3:
			aka057 = 0.3;
			break;
		case 4:
			aka057 = 1;
			break;
		}
		var aka057List = Base.getGridData('dgZfbl');
		for(var i = 0; i < aka057List.length; i++){
			if(aka057List[i].aae140 != '410' && aka057List[i].aae140 != '510')
				aka057List[i].aka057 = aka057;
		}
		Base.refreshGrid('dgZfbl');
	}
	function fn_setAka057Byala011(key, value){
		var aka057 = 0;
		if(value == '1'){
			aka057 = 0;
		}else{
			aka057 = 1;
		}
		var aka057List = Base.getGridData('dgZfbl');
		for(var i = 0; i < aka057List.length; i++){
			if(aka057List[i].aae140 == '410')
				aka057List[i].aka057 = aka057;
		}
		Base.refreshGrid('dgZfbl');
	}
	function fn_setAka057Byama011(key, value){
		var aka057 = 0;
		if(value == '1'){
			aka057 = 0;
		}else{
			aka057 = 1;
		}
		var aka057List = Base.getGridData('dgZfbl');
		for(var i = 0; i < aka057List.length; i++){
			if(aka057List[i].aae140 == '510')
				aka057List[i].aka057 = aka057;
		}
		Base.refreshGrid('dgZfbl');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>