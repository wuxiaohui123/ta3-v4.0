<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心药品目录新增</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
		<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R"  asToolBarItem="true" onClick="toRest()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true" />
		<ta:button id="btnShjl" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">	
		<ta:panel id="fdstBase" key="药品目录新增" cols="3" expanded="false" scalable="false">
<%--			<ta:text id="ake001" key="社保三大目录编码" maxLength="20"  onChange="checkAke001(this)" labelWidth="150" />--%>
			<ta:text id="ake002" key="社保三大目录名称" maxLength="200" required="true" labelWidth="150" onChange="getZjm('ake002','',10)" span="3"/>
			<ta:selectInput id="ake003" key="三大目录类别" collection="AKE003" value="1"  filter="2,3"  selectFirstValue="true" readOnly="true"   labelWidth="150" />
			<ta:text id="aka020" key="拼音助记码" cssInput="color:red" labelWidth="150" maxLength="50" readOnly="true"/>
			<ta:text id="aka021" key="五笔助记码" cssInput="color:red" labelWidth="150" maxLength="50" readOnly="true"/>
			<ta:text id="aka061" key="通用中文名称" maxLength="200" labelWidth="150"/>
			<ta:text id="aka062" key="英文化学名" maxLength="50" labelWidth="150" />
			
			<ta:selectInput id="aka022" key="医疗使用标志" collection="AKA022" labelWidth="150" required="false" value="1" display="false"/>
			<ta:selectInput id="ala011" key="工伤使用标志" collection="ALA011" labelWidth="150" required="false" value="1" display="false"/>
			<ta:selectInput id="aja006" key="限门诊使用标志" collection="AJA006" labelWidth="150" required="false" display="false"/>
			<ta:selectInput id="ama011" key="生育使用标志" collection="AMA011" labelWidth="150" required="false" value="1"  display="false"/>
			
			<ta:selectInput id="aka063" key="医疗发票项目类别" collection="AKA063" labelWidth="150"  reverseFilter="true" required="true" filter="1,2,3"/>
			<ta:selectInput id="aka065" key="收费项目等级"  collection="AKA065"  labelWidth="150" required="true"   />
			<ta:selectInput id="ake103" key="价格定比例"  collection="AKA032"  labelWidth="150" required="true"  value="0"/>
			<ta:selectInput id="aka070" key="剂型" labelWidth="150" collection="AKA070"  required="true" />
			<ta:box cols="2">
				<ta:text id="akb020" key="服务机构编码" labelWidth="150" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="akb021" key="服务机构名称"  span="2"  labelWidth="150" readOnly="true"/>
				
				
			<ta:selectInput id="ake004"  key="进口使用标志"  data="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" labelWidth="150" value="1"/>
			<ta:selectInput id="aka064" key="处方药标志" collection="AKA064" labelWidth="150" value="0"/>
			<ta:text id="ake101" key="省目录编码" maxLength="50" labelWidth="150" />
			<ta:text id="ake102" key="自定义编码" maxLength="50" labelWidth="150" />
			<ta:date id="aae030" key="开始日期"  required="true" labelWidth="150" isFocusShowPanel="true" showSelectPanel="true"/>
			<ta:textarea id="aae013" key="备注" height="50px" span="3" labelWidth="150" maxLength="100"/>
			<ta:selectInput id="aka036" key="限制使用标志" collection="AKA036" labelWidth="150" value="0" display="false" />
			<ta:text id="yke058" key="每次用量" maxLength="50" labelWidth="150" display="false" />
			<ta:text id="yke062" key="限定天数" maxLength="50" labelWidth="150" display="false" />
			<ta:text id="yke063" key="限制使用范围" maxLength="50" labelWidth="150" display="false" />
			<ta:text id="yke064" key="单处方限制数量" maxLength="50" labelWidth="150" display="false" />
			<ta:selectInput id="yke067" key="儿童用药标志" collection="AMA011" labelWidth="150" display="false" />
			<ta:selectInput id="yke059" key="使用频次" collection="YKE059" labelWidth="150" display="false" />
			<ta:selectInput id="yke060" key="特药标志" collection="YKE060" labelWidth="150" display="false" />
			<ta:selectInput id="aka031" key="分类一" collection="AKA031" labelWidth="150" display="false" />
			<ta:selectInput id="aka032" key="分类二" collection="AKA032" labelWidth="150" display="false" />
			<ta:selectInput id="aka033" key="分类三" collection="AKA033" labelWidth="150" display="false" />
			<ta:selectInput id="aka034" key="分类四" collection="AKA034" labelWidth="150" display="false" />
			<ta:selectInput id="yke065" key="限制使用最小医院等级" collection="YKE065" labelWidth="150" display="false" />
			<ta:textarea id="yke061" key="用法备注" height="50px" span="3" labelWidth="150" maxLength="100" display="false"/>
		</ta:panel>
		<ta:box  id="bxCSXX" cols="2" fit="true">
			<ta:panel id="pnlZfbl"  key="社保三大目录自付比例参数(点击空白行,即可编辑数据)" height="230px" expanded="false" scalable="false"> 
				<ta:datagrid id="dgdZfbl" fit="true" haveSn="true" border="true" forceFitColumns="true" >
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" showDetailed="true" align="center"/>
					<ta:datagridItem id="aka057" key="自付比例" showDetailed="true" align="center" dataAlign="right">
						<ta:datagridEditor type="number" max="1" min="0" precition="2" />
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlXjdy" key="社保药品项目限价定义参数(点击空白行,即可编辑数据)" height="230px" expanded="false" scalable="false">
				<ta:datagrid id="dgdXjdy" fit="true" forceFitColumns="true" haveSn="true" >
					<ta:datagridItem id="akb095" key="限价医院等级"  collection="AKB096" showDetailed="true"  align="center"  />
					<ta:datagridItem id="aka068" key="定价上限金额"  dataType="number"  showDetailed="true"  align="center" dataAlign="right">
						<ta:datagridEditor type="number" precition="2"  min="0" max="999999999999" />
					</ta:datagridItem>
					<ta:datagridItem id="aae030" key="开始日期" dataType="date" showDetailed="true"   align="center" hiddenColumn="true">
						<ta:datagridEditor type="date" />
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
		//fnSetRedBorder();
	});
	//重置
	function toRest(){
		parent.Base.openWindow('userwin',  "药品新增", myPath()+"/process/medicalbenefit/inventory/newDrugsAction!execute.do",
				null, '95%', '90%', null, onClose(), true);
	}
	function onClose(){
		parent.Base.closeWindow('userwin');
	}
	//rpc回调
	function callbackFunHos() {
		
	};
	
	//保存
	function toSave() {
		if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?", function(btn, callback) {
				if (btn) {
					var dgdZfbl=Base.getGridData("dgdZfbl");
					var dgdXjdy=Base.getGridData("dgdXjdy");
					var zfblStr=Ta.util.obj2string(dgdZfbl);
					var xjdyStr=Ta.util.obj2string(dgdXjdy);
					var parameter={};
					parameter['gridXjdy']=xjdyStr;
					parameter['gridZfbl']=zfblStr;
					Base.submit('form1',myPath() + "/process/medicalbenefit/inventory/newDrugsAction!toSave.do",parameter,false);
				}
			});
		}else{
         return false;
			}
	}
	
    //检查统一编码是否存在
    function checkAke001(obj){
    	var ake001=obj.value; //社保三大目录统一编码
    	if(ake001!=null || ake001!=""){
    	   Base.submit("ake001",myPath()+"/process/medicalbenefit/inventory/newDrugsAction!toCheck.do");
    	}
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
			aka057 = 0.1;
			break;
		case 3:
			aka057 = 0.2;
			break;
		case 4:
			aka057 = 1;
			break;
		}
		var aka057List = Base.getGridData('dgdZfbl');
		for(var i = 0; i < aka057List.length; i++){
			if(aka057List[i].aae140 != '410' && aka057List[i].aae140 != '510')
				aka057List[i].aka057 = aka057;
		}
		Base.refreshGrid('dgdZfbl');
	}
	function fn_setAka057Byala011(key, value){
		var aka057 = 0;
		if(value == '1'){
			aka057 = 0;
		}else{
			aka057 = 1;
		}
		var aka057List = Base.getGridData('dgdZfbl');
		for(var i = 0; i < aka057List.length; i++){
			if(aka057List[i].aae140 == '410')
				aka057List[i].aka057 = aka057;
		}
		Base.refreshGrid('dgdZfbl');
	}
	function fn_setAka057Byama011(key, value){
		var aka057 = 0;
		if(value == '1'){
			aka057 = 0;
		}else{
			aka057 = 1;
		}
		var aka057List = Base.getGridData('dgdZfbl');
		for(var i = 0; i < aka057List.length; i++){
			if(aka057List[i].aae140 == '510')
				aka057List[i].aka057 = aka057;
		}
		Base.refreshGrid('dgdZfbl');
	}
	
	
</script>
<%@ include file="/ta/incfooter.jsp"%>