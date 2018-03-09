<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊疾病用药范围维护</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave"     key="项目增加"  icon="xui-icon-spotAdd"     hotKey="A"  onClick="toAdd()" />
		<ta:toolbarItem id="btnModify"   key="项目维护"  icon="xui-icon-spotDelete"  hotKey="D"  onClick="toModify()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R"  asToolBarItem="true" type="resetPage"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true"  >
	    <ta:text id="aka120" key="病种编码" display="false"/>
		<ta:box id="bxHz"  fit="true"   layout="border" layoutCfg="{leftWidth:450,noLeftCenterBorder:false}">
			<ta:panel id="pnlMxb" key="慢性病信息"  fit="true" position="left" expanded="false"  scalable="false" >
		        <ta:box id="bxMxb" cols="6">
		           <ta:text id="aka121" key="病种" labelWidth="50" span="5"/>
		           <ta:button id="btnQuery"  key="查询"  icon="xui-icon-query"  onClick="toQuery()" asToolBarItem="true"/>
			    </ta:box>
			    <ta:datagrid id="dgMxb" fit="true" forceFitColumns="true"  onChecked="fnSelectChange" selectType="radio">
					 <ta:datagridItem id="aka120" key="病种编码" hiddenColumn="true" />
					 <ta:datagridItem id="aka121" key="病种名称" align="center"  showDetailed="true"/>
			    </ta:datagrid>
		   </ta:panel>
		  <ta:panel id="pnlXmmx"  key="项目对照明细表"   fit="true"  position="center">
		         <ta:box id="bxXmmx" cols="6" >
		           <ta:text id="ake002" key="项目名称" labelWidth="80" span="5" display="false"/>
			    </ta:box>
			   <ta:datagrid id="dgXmmx" haveSn="true" fit="true"  selectType="radio" columnFilter="true">
					 <ta:datagridItem id="ake001" align="center" key="目录编码"   showDetailed="true" dataAlign="left"  maxChart="5" />
					 <ta:datagridItem id="ake002" align="center" key="目录名称"   showDetailed="true" dataAlign="left"  maxChart="30"/>
					 <ta:datagridItem id="aka070" align="center" key="剂型"      showDetailed="true" dataAlign="left"  maxChart="5"  collection="AKA070" />
					 <ta:datagridItem id="ake003" align="center" key="目录类别"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKE003"/>
					 <ta:datagridItem id="aka065" align="center" key="医保大类"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA065"/>
					 <ta:datagridItem id="aka057" align="center" key="先自付比例"   showDetailed="true" dataAlign="right"  maxChart="5"  />
					 <ta:datagridItem id="sjxj" align="center" key="三级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
					 <ta:datagridItem id="ejxj" align="center" key="二级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
					 <ta:datagridItem id="yjxj" align="center" key="一级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
					 <ta:datagridItem id="yjxj1" align="center" key="一级以下限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
					 <ta:datagridItem  id="aae030" align="center" key="开始日期"   showDetailed="true" dataAlign="center"  maxChart="6" />
					 <ta:datagridItem  id="aae031" align="center" key="结束日期"   showDetailed="true" dataAlign="center"  maxChart="6"  />
					 <ta:datagridItem  id="aae013" align="center" key="备注"       showDetailed="true" dataAlign="left"  maxChart="25" />
					 <ta:datagridItem id="aaz254" align="center" key="流水号"     showDetailed="true"  />
					 <ta:datagridItem id="aka120" align="center" key="病种编码"   showDetailed="true"  />
			  </ta:datagrid>
		</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	// 获取keydown事件key
	function getThisKey(e)
    {
		var isie = (document.all) ? true : false;
		var key;
		var srcobj;
		if (isie) {
			key = e.keyCode;
			srcobj = e.srcElement;
		} else {
			key = e.which;
			srcobj = e.target;
		}
	   return key;	
    }	
	
	// 病种名称的回车事件
	$("#aka121").keydown(function(e) {
		// 回车事件
		if(getThisKey(e) == 13 || getThisKey(e) == 32){
	    	e.cancelBubble = true;
			e.returnValue = false;
			// e.stopPropagation works in Firefox.
			if (e.stopPropagation) {
				e.stopPropagation();
				e.preventDefault();
			}
			// 查询
		   Base.submit("aka121","drugsRangAction!toQueryMxb.do");
		}
	});
	
	// 目录名称的回车事件
	$("#ake002").keydown(function(e) {
		// 回车事件
		if(getThisKey(e) == 13 || getThisKey(e) == 32){
	    	e.cancelBubble = true;
			e.returnValue = false;
			// e.stopPropagation works in Firefox.
			if (e.stopPropagation) {
				e.stopPropagation();
				e.preventDefault();
			}
			var aka120 = Base.getValue("aka120");
			if("" == aka120 || null == aka120){
				Base.alert("请先选择病种!","warn");
			}else{
				// 查询
			   Base.submit("ake002,aka120","drugsRangAction!toQueryXmmx.do");
			}
		}
	});
	
	// 查询
	function toQuery(){
	    Base.submit("aka121","drugsRangAction!toQueryMxb.do");
	}
	
	// 病种列表选中事件 
	function fnSelectChange(rowsData)
	{
		Base.clearGridData("dgXmmx");	
		var aka120 = rowsData.aka120;
		var aka121 = rowsData.aka121;
		Base.setValue("aka120", aka120);
		var parameter={};
		parameter["dto['aka120']"]=aka120; // 病种编码
		Base.submit("","drugsRangAction!toQueryXmmx.do",parameter,null,false,function(){
			Base.setPanelTitle("pnlXmmx","项目对照明细表,当前病种:"+aka121);
		});
	}
	
	// 项目新增
	function toAdd()
	{
		var aka120 = Base.getValue("aka120");
		if("" == aka120 || null == aka120){
			Base.alert("请先选择病种!","warn");
		}else{
			var parameter = {};
			parameter["dto.aka120"] = aka120;
			Base.openWindow("w_ake001", "中心目录信息", myPath()+"/process/medicalbenefit/inventory/drugsRangAction!toAdd.do", parameter, "95%", "90%", null, null, true, "", "");
			//top._child_ka20 = window.self;
		}	
	}

	// 项目维护
	function toModify()
	{
	    var gridData = Base.getGridSelectedRows("dgXmmx");
		if ("" == gridData || null == gridData) {
			Base.alert("请选择需要维护的目录数据!", "warn");
			return false;
		}
		var parameter = {};
		parameter["dto.aka120"] = gridData[0].aka120;
		parameter["dto.aaz254"] = gridData[0].aaz254;
	    Base.openWindow("w_ake001", "特殊疾病目录维护", myPath()+"/process/medicalbenefit/inventory/drugsRangAction!toModify.do", parameter, "95%", "90%", null, null, true, "", "");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>