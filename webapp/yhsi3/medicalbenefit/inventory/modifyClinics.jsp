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
		<ta:text id="aaz231" key="社保三大目录ID" readOnly="true" display="false" />
		<ta:text id="aaz234" key="社保三大目录维护事件ID" readOnly="true" display="false" />
		<ta:text id="flag" readOnly="true" display="false" value="modifyClinics"/>
		<ta:panel  id="fdtBaseinfo" key="社保中心目录基本信息" cols="3" >
			<ta:text id="ake001" key="社保三大目录编码" readOnly="true" labelWidth="150" required="true"/>
			<ta:text id="ake002" key="社保三大目录名称" labelWidth="150" onChange="fnGetMnemonicCode('ake002',fnZjm)" span="2" maxLength="200"/>
			<ta:selectInput id="ake003" key="三大目录类别" collection="AKE003" value="2" readOnly="true" labelWidth="150" required="true" />
			<ta:text id="aka020" key="拼音助记码" maxLength="50" labelWidth="150" />
			<ta:text id="aka021" key="五笔助记码" maxLength="50" labelWidth="150" />
			<ta:selectInput id="aka022" key="医疗使用标志" collection="AKA022" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="ala011" key="工伤使用标志" collection="ALA011" labelWidth="150" required="true" display="false" />
			<ta:selectInput id="ama011" key="生育使用标志" collection="AMA011" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="aja006" key="限门诊使用标志" collection="AJA006" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="aka063" key="医疗发票项目类别" collection="AKA063" labelWidth="150"  reverseFilter="false"  required="true"/>
			<ta:selectInput id="aka065" key="收费项目等级"  collection="AKA031"  labelWidth="150" readOnly="true" />
			<ta:selectInput id="ake103" key="价格定比例" labelWidth="150" collection="AKA032" required="true" />
			<ta:box cols="2">
				<ta:text id="akb020" key="服务机构编码" labelWidth="150" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="akb021" key="服务机构名称"  span="2"  labelWidth="150" readOnly="true"/>
			<ta:selectInput id="ake004"  key="进口使用标志"  data="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" labelWidth="150" />
			<ta:text id="aka052" key="使用单位" labelWidth="150"/>
		    <ta:text id="ake101" key="省目录编码" maxLength="50" labelWidth="150"  />
			<ta:text id="ake102" key="自定义编码" maxLength="50" labelWidth="150" />
			<ta:date id="aae030" key="原开始日期" showSelectPanel="true" labelWidth="150" required="true" readOnly="true"/>
			<ta:date id="aae030_new" key="新开始日期" labelWidth="150" required="true" showSelectPanel="true" onChange="fn_date()"/>		
			<ta:text id="yke005" key="项目内涵" maxLength="4000" labelWidth="150" span="3"/>
			<ta:text id="yke006" key="除外内容" maxLength="4000" labelWidth="150"  span="3"/>
			<ta:text id="aae013" key="备注" maxLength="200" labelWidth="150"  span="3" />
			
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
						<ta:datagridEditor type="number" max="1" min="0" precition="2" />
					</ta:datagridItem>
		
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlXjdy"  key="社保药品项目限价定义参数(点击空白行,即可编辑数据)" height="230px" scalable="false"  expanded="false">
				<ta:datagrid id="dgXjdy"  fit="true" haveSn="true" forceFitColumns="true" >
					<ta:datagridItem id="akb095" key="限价医院等级" collection="AKB096" showDetailed="true" align="center" />
					<ta:datagridItem id="aka068" key="定价上限金额" dataType="number"  showDetailed="true" dataAlign="right" align="center">
						<ta:datagridEditor type="number" precition="2"  min="0" max="999999999999" />
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
		Base.focus("ake001");
	   
	   
	});
	//rpc回调
	function callbackFunHos() {
		
	};
	//由于只有一个可输入框时,焦点设置
	$("#ake001").keydown(function(e){
		if(e.keyCode==13)
		{
			setTimeout(function(){Base.focus("ake002");},20);
		}
	});
 
	//助记码
    function fnZjm(O){
	    Base.setValue("aka020",O[0]);
	    Base.setValue("aka021",O[1]);
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
					Base.submit('form1,dgZfbl,dgXjdy','modifyClinicsAction!toSave.do',param,false,false,null); 
				}
			});
		}else{
		  Base.alert("带红星的必录或者输入项超长！");
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
	function fn_date(){
	  var aae030 = Base.getValue("aae030");//原开始时间
	  var aae030_new = Base.getValue("aae030_new");//新开始时间
	  if(aae030_new < aae030){
	     Base.alert("新的开始时间不能小于原开始时间");
	     return false;
	  }
	  return true;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>