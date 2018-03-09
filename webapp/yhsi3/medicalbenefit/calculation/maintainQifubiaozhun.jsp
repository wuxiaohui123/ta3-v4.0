<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>起付线维护</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()"/>
		<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		
		<ta:panel  id="queryField" key="查询条件" cols="3">
		    <ta:selectInput id="aae140" key="险种"  collection="yl140" labelWidth="120"/>
			<ta:selectInput id="ykc007" key="人员类别"  collection="ykc007" labelWidth="120"/>
			<ta:selectInput id="aka130" key="医疗类别"  collection="aka130" labelWidth="120"/>
			<ta:selectInput id="akb096" key="起付线医院等级"  collection="akb096" labelWidth="120"/>
		</ta:panel>
		
		<ta:panel id="pnlBzxx" key="起付线目录信息" fit="true">
			<ta:datagrid id="dg_bzxx" haveSn="true" fit="true" forceFitColumns="true">
				<ta:datagridItem id="edit" key="修改" width="50" align="true" icon="icon-edit" click="editKa11"/>
				<ta:datagridItem id="pause" key="停用" width="50" align="true" icon="icon-remove" click="pauseKa11"/>
			 	<ta:datagridItem id="aaz156" key="起付标准ID" width="150" align="true" hiddenColumn="true"/>
				<ta:datagridItem id="aae140mc" key="险种名称"  width="180" align="center" />
				<ta:datagridItem id="ykc007" key="人员类别 " collection="YKC007" width="120" align="center" />
				<ta:datagridItem id="aka130" key="医疗类别" collection="aka130" width="120" align="center" />
				<ta:datagridItem id="akb096" key="起付线医院等级" collection="akb096" width="120" align="center" />
				
				<ta:datagridItem id="aka151" key="起付标准额"  showDetailed="true" width="120" align="center" />
				<ta:datagridItem id="aae030" key="开始日期"  dataType="date" width="120" align="center" />
				<ta:datagridItem id="aae031" key="终止日期" dataType="date"  width="120" align="center" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fnSetRedBorder();
	});
	
	function  query(){
		Base.submit("queryField", "maintainQifubiaozhunAction!queryKa11.do");
	}

	//新增起付线信息
	function toAdd(){
		Base.openWindow('userwin',  "起付线新增", "maintainQifubiaozhunAction!addKa11.do",null, '90%', '70%', null, null, true);
	}
	
	//修改列表中某条起付线信息
	function editKa11(data,e){
		if(data.aae031 != null){
			Base.alert("该条数据已被修改过，不能再次修改");
			return;			
		}
		
		Base.openWindow('userwin',  "起付线修改", "maintainQifubiaozhunAction!editKa11.do",
						{"dto['aaz156']" : data.aaz156}, '90%', '70%', null, null, true);
	}
	
	//停用列表中某条起付线信息
	function pauseKa11(data,e){
		Base.confirm("确定要停用吗?", function(btn, callback) {
				if (btn) {
					if(data.aae031 != null){
						Base.alert("该条数据已被停用，不能再次停用");
						return;			
					}
					Base.submit("", "maintainQifubiaozhunAction!pauseKa11.do", {"dto['aaz156']" : data.aaz156}, null, false, null, null);
				}
			});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>