<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心药品诊疗项目维护</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btn0" key="查询" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="btn1" key="新增" icon="xui-icon-spotSave"  hotKey="S" onClick="toAdd()" />
		<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltQuery" key="查询条件"  cols="4">
	    	 <ta:date id="aae001" key = "年度"          showSelectPanel="true"  dateYear="true" />
		     <ta:date id="aae036_s" key = "经办时间(从)"  showSelectPanel="true"  />
		     <ta:date id="aae036_e" key = "经办时间(至)"  showSelectPanel="true"  />
		     <ta:text id="zjm"     key="助记码"   labelWidth="100"/>
		     <ta:text id="ake001"  key="目录编码" labelWidth="100"/>
		     <ta:selectInput id="ake003"  key="目录类别"  collection="AKE003"  labelWidth="100"  readOnly="true"/>
		     <ta:selectInput id="aka031"  key="医保大类"  collection="AKA031"  labelWidth="100" />
		     <ta:selectInput id="aka063"  key="项目隶属"  collection="AKA063"  labelWidth="100" maxVisibleRows="8"/>
		     <ta:selectInput id="ake004"  key="进口使用标志"  data="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" labelWidth="100" />
		     <ta:selectInput id="aka022"  key="医疗使用标志"    collection="AKA022"  labelWidth="100" display="false"/>
		     <ta:selectInput id="aja006"  key="限门诊使用标志"  collection="AJA006"  labelWidth="100" display="false" />
		     <ta:selectInput id="ala011"  key="工伤使用标志"  collection="ALA011"  labelWidth="100"  display="false" />
		     <ta:selectInput id="ama011"  key="生育使用标志"  collection="AMA011"  labelWidth="100" display="false" />
		     <ta:text id="aka070"  key="剂型"     labelWidth="100" />
		     <ta:text id="ake002"  key="目录名称" labelWidth="100"  span="2"/>
		</ta:panel>
		<ta:panel id="pnlMLXX" fit="true" key="项目信息"  >
		     <ta:datagrid id="dgMLXX"  fit="true" haveSn="true"  snWidth="40" >
		         <ta:datagridItem id="edit" key="修改" icon="icon-edit" click="toModifyNew" width="40" align="center"  />
		         <ta:datagridItem id="stop" key="停用" icon="icon-remove" click="toStopNew" width="40" align="center"  />
		         <ta:datagridItem id="aaz231" align="center" key="社保三大目录ID"  width="150"  hiddenColumn="false"/>
		         <ta:datagridItem id="ake001" align="center" key="目录编码"   showDetailed="true" dataAlign="left"  maxChart="5"/>
		         <ta:datagridItem id="ake101" align="center" key="省目录编码"  showDetailed="true" dataAlign="left"  maxChart="5"/>
				 <ta:datagridItem id="ake002" align="center" key="目录名称"   showDetailed="true" dataAlign="left"  maxChart="15"/>
				 <ta:datagridItem id="aka070" align="center" key="剂型"     hiddenColumn="true" showDetailed="true" dataAlign="left"  maxChart="5"   />
				 <ta:datagridItem id="ake003" align="center" key="目录类别"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKE003"/>
				 <ta:datagridItem id="aka052" align="center" key="使用单位"    showDetailed="true" dataAlign="left"  maxChart="6"/>
				 <ta:datagridItem id="aka065" align="center" key="医保大类"     showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA031"/>
                 <ta:datagridItem id="ake103" align="center" key="价格定比例标志" showDetailed="true" dataAlign="left"  maxChart="6" collection="AKA032"/>
			     <ta:datagridItem id="aka065" align="center" key="收费项目等级"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA031"/>				 
				 <ta:datagridItem id="aka057" align="center" key="先自付比例"   showDetailed="true" dataAlign="right"  maxChart="5"  />
				 <ta:datagridItem id="sjxj"   align="center" key="三级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="ejxj"   align="center" key="二级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="yjxj"   align="center" key="一级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="akb020" align="center" key="医院编码"     showDetailed="true" dataAlign="left"  maxChart="5" />
				 <ta:datagridItem id="aka063" align="center" key="项目隶属"     showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA063" />
				 <ta:datagridItem id="ake004" align="center" key="进口使用标志"     showDetailed="true" dataAlign="left"  maxChart="5"  collectionData="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" />
				 <ta:datagridItem id="aja006" align="center" key="限门诊使用标志"    showDetailed="true" dataAlign="left"  maxChart="7"    collection="AJA006"  hiddenColumn="false" />
				 <ta:datagridItem id="ala011" align="center" key="工伤使用标志"    showDetailed="true" dataAlign="left"  maxChart="5"    collection="ALA011"  hiddenColumn="false"  />
				 <ta:datagridItem id="ama011" align="center" key="生育使用标志"     showDetailed="true" dataAlign="left"  maxChart="5"  collection="AMA011"  hiddenColumn="false" />
				 <ta:datagridItem id="aka022" align="center" key="医疗使用标志"     showDetailed="true" dataAlign="left"  maxChart="5"   collection="AKA022"  hiddenColumn="false" />
				 <ta:datagridItem id="aae013" align="center" key="备注"       showDetailed="true" dataAlign="left"  maxChart="15" />
				 <ta:datagridItem id="aae014" align="center" key="经办人"      showDetailed="true"  dataAlign="left"  maxChart="4"  />
				 <ta:datagridItem id="aae036" align="center" key="经办时间"    showDetailed="true"  dataAlign="left"  maxChart="8" />
				 <ta:datagridItem id="yke005" align="center" key="项目内涵"   showDetailed="true" dataAlign="left"  maxChart="5"/>
				 <ta:datagridItem id="yke006" align="center" key="除外内容"   showDetailed="true" dataAlign="left"  maxChart="5"/>
				 <ta:datagridItem id="aka020" align="center" key="拼音助记码"   showDetailed="true" dataAlign="left"  maxChart="5"/>
				 <ta:datagridItem id="aka021" align="center" key="五笔助记码"  showDetailed="true" dataAlign="left"  maxChart="5"/>
		    </ta:datagrid>		 
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
	    $("body").taLayout();
    });  
    // 查询
	function toQuery(){
		Base.clearGridData("dgMLXX");
		Base.submit("fltQuery","clinicsAction!toQuery.do");
	}
	// 新增
	function toAdd(){
		if(Base.getValue("ake003") == "3"){
			Base.openWindow('userwin',  "服务实施项目新增", myPath()+"/process/medicalbenefit/inventory/newClinicsAction.do?dto.ake003_q=3",
					null, '95%', '90%', null, null, true);
		}else if(Base.getValue("ake003") == "4"){
			Base.openWindow('userwin',  "材料项目新增", myPath()+"/process/medicalbenefit/inventory/newClinicsAction.do?dto.ake003_q=4",
					null, '95%', '90%', null, null, true);
		}else{
			Base.openWindow('userwin',  "诊疗项目新增", myPath()+"/process/medicalbenefit/inventory/newClinicsAction.do",
				null, '95%', '90%', null, null, true);
		}
	}
	
	// 修改
	function toModify(){
		var d_data = Base.getGridSelectedRows("dgMLXX");
		if(d_data == null || d_data == ""){
			Base.alert("请勾选数据");
			return;
		}
		Base.openWindow('userwin',  "项目修改", myPath()+"/process/medicalbenefit/inventory/modifyClinicsAction!execute.do",
				{"dto['aaz231']" : d_data[0].aaz231}, '95%', '90%', null, null, true);
	}
	//双击修改
	function toModifyDB(e,rowdata){
		Base.openWindow('userwin',  "项目修改", myPath()+"/process/medicalbenefit/inventory/modifyClinicsAction!execute.do",
				{"dto['aaz231']" : rowdata.aaz231}, '95%', '90%', null, null, true);
	}
	
	// 停用
	function toStop(){
		var d_data = Base.getGridSelectedRows("dgMLXX");
		if(d_data == null || d_data == ""){
			Base.alert("请勾选数据");
			return;
		}
		Base.openWindow('userwin',  "项目停用", myPath()+"/process/medicalbenefit/inventory/stopClinicsAction.do",
				{"dto['aaz231']" : d_data[0].aaz231}, '95%', '90%', null, null, true);
	}
    // 修改
	function toModifyNew(rowdata){
		Base.openWindow('userwin',  "项目修改", myPath()+"/process/medicalbenefit/inventory/modifyClinicsAction!execute.do",
				{"dto['aaz231']" : rowdata.aaz231}, '95%', '90%', null, null, true);
	}
	// 停用
	function toStopNew(rowdata){
		Base.openWindow('userwin',  "项目停用", myPath()+"/process/medicalbenefit/inventory/stopClinicsAction.do",
				{"dto['aaz231']" : rowdata.aaz231}, '95%', '90%', null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>