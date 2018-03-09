<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>特殊疾病用药范围新增</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading/>
    <ta:toolbar id="tlb">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query"     onClick="fnQuery()"  asToolBarItem="true"/>
		<ta:button key="保存[S]" hotKey="S" icon="xui-icon-spotSave"  onClick="fnSave()"   asToolBarItem="true"/>
		<ta:button key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="fnClose()"  asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form fit="true" >
	    <ta:text id="aka120" key="病种编码" display="false"/>
	   <ta:panel id="bxCxtj" cols="5" >
		   <ta:selectInput id="aka063"  key="项目隶属" collection="AKA063"/>
		   <ta:text id="zjm"    key="助记码" />
		   <ta:text id="ake002" key="项目名称" span="2"/>
		   <ta:checkbox id="sfgl" checked="true"   key="过滤已存在的数据" value="1" />
	   </ta:panel>	   
	   <ta:panel id="pnlInfo" cols="5" >
	       <ta:date id="aae030"  key="开始日期"  required="true"  showSelectPanel="true"/>
	   </ta:panel>	   
	   <ta:panel id="pnlKa20" key="中心目录信息" fit="true">
	      <ta:datagrid id="dgKa20"  fit="true"  haveSn="true"  selectType="checkbox" >
	         <ta:datagridItem id="aaz231" align="center" key="目录ID"     hiddenColumn="false"/>
			 <ta:datagridItem id="aka063" align="center" key="项目隶属"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA063"/>
	         <ta:datagridItem id="ake001" align="center" key="目录编码"   showDetailed="true" dataAlign="left"  maxChart="5"/>
			 <ta:datagridItem id="ake002" align="center" key="目录名称"   showDetailed="true" dataAlign="left"  maxChart="30"/>
			 <ta:datagridItem id="aka070" align="center" key="剂型"      showDetailed="true" dataAlign="left"  maxChart="5"   />
			 <ta:datagridItem id="ake003" align="center" key="目录类别"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKE003"/>
			 <ta:datagridItem id="aka065" align="center" key="医保大类"   showDetailed="true" dataAlign="left"  maxChart="5" collection="AKA031"/>
			 <ta:datagridItem id="aka057" align="center" key="先自付比例"   showDetailed="true" dataAlign="right"  maxChart="5"  />
			 <ta:datagridItem id="sjxj"   align="center" key="三级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
			 <ta:datagridItem id="ejxj"   align="center" key="二级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
			 <ta:datagridItem id="yjxj"   align="center" key="一级医院限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
			 <ta:datagridItem id="yjxj1"  align="center" key="一级以下限价"   showDetailed="true" dataAlign="right"  maxChart="6"  />
			 <ta:datagridItem id="akb020" align="center" key="医院编号"       showDetailed="true" dataAlign="left"  maxChart="6" />
			 <ta:datagridItem id="aae013" align="center" key="备注"       showDetailed="true" dataAlign="left"  maxChart="25" />
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
	function fnQuery()
	{
	   Base.clearGridData("dgKa20");
	   Base.submit("bxCxtj","drugsRangAction!toQueryMl.do");
	   Base.focus("ake002");
	}
	
	// 关闭
	function fnClose()
	{
		parent.Base.closeWindow("w_ake001");
	}
	
	// 保存
	function fnSave()
	{
		var aae030 = Base.getValue("aae030");
		if("" == aae030 || null == aae030){
		    Base.alert("请输入开始日期!","warn");
		    return false;s
		}
		// 选择的数据
		var gridData = Base.getGridSelectedRows("dgKa20");
		if("" == gridData || null == gridData){
			Base.alert("请选择目录信息!","warn");
		}else{
			var ka20s = [];
			var ka20 = {};
			$.each(gridData,function(index,rowdata){
				ka20 = {};
				ka20.ake001 = rowdata.ake001;
				ka20.aaz231 = rowdata.aaz231;
				ka20s.push(ka20);
			});
			var parameter = {};
			parameter["dto.aka120"] = Base.getValue("aka120");
			parameter["dto.aae030"] = aae030;
			parameter.ka20s = Ta.util.obj2string(ka20s);
			Base.submit("","drugsRangAction!toSave.do",parameter);
		}
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>