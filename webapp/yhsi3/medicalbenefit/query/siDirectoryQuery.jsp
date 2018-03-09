<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社保三大目录查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scroller" >
	<ta:pageloading />
	<ta:buttonLayout id="tbr1">
			<ta:toolbarItem id="btnQuery"    key="查询[Q]"         icon="xui-icon-query"  hotKey="q"   onClick="toQuery()" />
			<ta:toolbarItem id="btnQueryBL"  key="查看先自付比例"   icon="xui-icon-show"    onClick="toQueryBL()" />
			<ta:toolbarItem id="btnQueryXJ"  key="查看限价"     icon="xui-icon-spotCheck"      onClick="toQueryXJ()" />
<%--			<ta:toolbarItem id="btnUpload"   key="导出"         icon="xui-icon-spotEdit"      onClick="toUpload()" />--%>
			<ta:toolbarItem id="btnUpload1"   key="导出全部"         icon="xui-icon-spotEdit"      onClick="toUploadMl()" />
			<ta:toolbarItem id="btnClear" key="清条件" icon="xui-icon-spotClear"   onClick="toClear()" />
			<ta:toolbarItem id="btnSet"   key="设置" icon="icon-setting"  onClick="toOpen()" />
			<ta:button id="btnReset"  key="重置" icon="xui-icon-spotReset"   hotKey="r"  asToolBarItem="true"  type="resetPage"/>
	</ta:buttonLayout>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltQuery"  key="查询条件"  cols="4">
		     <ta:date id="aae001"     key = "年度"          showSelectPanel="true"  dateYear="true" />
		     <ta:date id="aae036_s"   key = "经办时间(从)"  showSelectPanel="true"  />
		     <ta:date id="aae036_e"   key = "经办时间(至)"  showSelectPanel="true"  />
		     <ta:text id="zjm"     key="助记码"   labelWidth="100"/>
		     <ta:text id="ake001"  key="目录编码" labelWidth="100"/>
		     <ta:selectInput id="ake003"  key="目录类别"  collection="AKE003"  labelWidth="100" />
		     <ta:selectInput id="aka031"  key="医保大类"  collection="AKA031"  labelWidth="100" />
		     <ta:selectInput id="aka063"  key="项目隶属"  collection="AKA063"  labelWidth="100" maxVisibleRows="8"/>
		     <ta:selectInput id="xj"  key="是否限价"  data="[{'id':'0','name':'否'},{'id':'1','name':'是'}]" labelWidth="100" />
		     
		     <ta:selectInput id="ake004"  key="进口使用标志"  data="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" labelWidth="100" />
		     
		     <ta:selectInput id="aka022"  key="医疗使用标志"    collection="AKA022"  labelWidth="100" />
		     <ta:selectInput id="aja006"  key="限门诊使用标志"  collection="AJA006"  labelWidth="100" />
		     <ta:selectInput id="ala011"  key="工伤使用标志"  collection="ALA011"  labelWidth="100"  />
		     <ta:selectInput id="ama011"  key="生育使用标志"  collection="AMA011"  labelWidth="100" />
		     <ta:text id="aka070"  key="剂型"     labelWidth="100" />
		     <ta:text id="ake002"  key="目录名称" labelWidth="100"  span="1"/>
		     
		</ta:panel>
		<ta:panel id="pnlMLXX"  key="目录信息" fit="true" >
		     <ta:datagrid id="dgMLXX"  fit="true" haveSn="true"  snWidth="40" >
		         <ta:datagridItem id="aaz231" align="center" key="社保三大目录ID"  width="150"  hiddenColumn="false"/>
		         <ta:datagridItem id="ake001" align="center" key="目录编码"   showDetailed="true" dataAlign="left"  maxChart="5"/>
		         <ta:datagridItem id="ake101" align="center" key="区目录编码"   showDetailed="true" dataAlign="left"  maxChart="5"/>
				 <ta:datagridItem id="ake002" align="center" key="目录名称"   showDetailed="true" dataAlign="left"  maxChart="15"/>
				 <ta:datagridItem id="aka070" align="center" key="剂型"      showDetailed="true" dataAlign="left"  maxChart="5"   />
				 <ta:datagridItem id="ake003" align="center" key="目录类别"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKE003"/>
				 <ta:datagridItem id="aka052" align="center"  key="使用单位"    showDetailed="true" dataAlign="left"  maxChart="6"/>
				 <ta:datagridItem id="aka031" align="center" key="医保大类"     showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA031"/>
				 <ta:datagridItem id="aka032" align="center" key="价格定比例"     showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA032"/>
				 <ta:datagridItem id="aka057" align="center" key="先自付比例"   showDetailed="true" dataAlign="right"  maxChart="5"  />
				 <ta:datagridItem id="sjxj" align="center" key="三级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="ejxj" align="center" key="二级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="yjxj" align="center" key="一级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
				 <ta:datagridItem id="aka063" align="center" key="项目隶属"     showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA063" />
				 <ta:datagridItem id="ake004" align="center" key="进口使用标志"     showDetailed="true" dataAlign="left"  maxChart="5"  collectionData="[{'id':'1','name':'否'},{'id':'2','name':'是'}]" />
				 <ta:datagridItem id="aja006" align="center"  key="限门诊使用标志"    showDetailed="true" dataAlign="left"  maxChart="7"    collection="AJA006"   />
				 <ta:datagridItem id="ala011" align="center"  key="工伤使用标志"    showDetailed="true" dataAlign="left"  maxChart="5"    collection="ALA011"   />
				 <ta:datagridItem id="ama011" align="center" key="生育使用标志"     showDetailed="true" dataAlign="left"  maxChart="5"  collection="AMA011" />
				 <ta:datagridItem id="aka022" align="center"  key="医疗使用标志"     showDetailed="true" dataAlign="left"  maxChart="5"   collection="AKA022" />
				 <ta:datagridItem  id="aae013" align="center" key="备注"       showDetailed="true" dataAlign="left"  maxChart="15" />
				 <ta:datagridItem  id="aae011"  align="center"  key="经办人"      showDetailed="true"  dataAlign="left"  maxChart="4"  collection="AAE011"/>
				 <ta:datagridItem  id="aae036"  align="center"  key="经办时间"    showDetailed="true"  dataAlign="left"  maxChart="8" />
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
		//init();
	});
	var columnData = null;
	// 初始化方法
    function init()
    {
    	columnData = getColumnWZ("dgMLXX");
    	var initRow = localStorage.getItem("menuid01030805");
    	if(null != initRow && "" != initRow)
    	{
	    	var ids1 = initRow.split(",");
	    	var flg = true;
	    	$.each(columnData,function(index,rowdata){
	    		flg = true;
	    		for(var i=0;i < ids1.length;i++){
	    			if(rowdata.id == ids1[i])
	    				flg = false;
	    		}
	    		if(flg)
				   Base.setGridColumnHidden("dgMLXX",rowdata.id);
	    	});
    	}
    }
	// 设置弹出设置框 ,方法来源:medicare.js 
	function toOpen(){
		if(null == columnData){
			columnData = getColumnWZ("dgMLXX");
		}
		 openGridSet("dgMLXX",columnData,"menuid01030805",null,null,null);
	}
	
	// 清条件 
	function toClear()
	{
		Base.clearData('fltQuery');
		Base.focus("ake002");
	}
	
	//查询按钮
	function toQuery(){
		//清空数据
		Base.clearGridData("dgMLXX");
		Base.submit("form1","siDirectoryQueryAction!queryMLXX.do",null,null,false,function(){
			Base.focus("ake002"); // 查询完成后,焦点置于目录名称输入项
		});
	}
	
	//先自付比例信息
	function toQueryBL(){
		var aaz231 = "";// 目录ID
		var gridData = Base.getGridData("dgMLXX");
		if("" == gridData || null == gridData){
			return Base.alert("请选择列表数据!","warn");
		}
		var selectedData = Base.getGridSelectedRows("dgMLXX");
		if("" == selectedData || null == selectedData){
			aaz231 = gridData[0].aaz231;
		}else{
			aaz231 = selectedData[0].aaz231;
		}
		Base.openWindow("w_bl","先自付比例",myPath()+"/process/medicalbenefit/query/siDirectoryQueryAction!openBL.do",{"dto['aaz231']":aaz231},"70%","60%",null,null,true);
	}
	//限价
	function toQueryXJ(){
		var aaz231 = "";// 目录ID
		var gridData = Base.getGridData("dgMLXX");
		if("" == gridData || null == gridData)
			return Base.alert("请选择列表数据!","warn");
		var selectedData = Base.getGridSelectedRows("dgMLXX");
		if("" == selectedData || null == selectedData)
			aaz231 = gridData[0].aaz231;
		else
			aaz231 = selectedData[0].aaz231;
		Base.openWindow("w_xj","限价",myPath()+"/process/medicalbenefit/query/siDirectoryQueryAction!openXJ.do",{"dto['aaz231']":aaz231},"70%","60%",null,null,true);
	}
	
	// 导出
	function toUpload()
	{
		Base.expGridExcel("dgMLXX");
	}
	
	// 导出全部目录
	function toUploadMl()
	{
		location.href = myPath()+"/medicalbenefit/common/commonFunctionAction!toUploadMl.do";
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>