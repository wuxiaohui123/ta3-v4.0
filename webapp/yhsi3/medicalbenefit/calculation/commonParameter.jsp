<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>通用参数维护</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toAdd()" />
		<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	    <ta:date id="sysdate" key="系统年月" display="false" readOnly="true"/>
		<ta:panel  id="infoField" key="通用参数信息" cols="3">
			<ta:text id="r_aaa005" key="参数值" labelWidth="120" />
			<ta:date id="r_aae042" key="开始年月" labelWidth="120" issue="true"  showSelectPanel="true"/>
			<ta:text id="r_aaa001" key="参数类别代码" labelWidth="120" readOnly="true"/>
			<ta:selectInput id="r_aae140" key="险种类型"  collection="aae140" labelWidth="120" readOnly="true"/>
			<ta:text id="r_yab139" key="参保所属机构" labelWidth="120" readOnly="true"/>
			<ta:text id="r_aaa002" key="参数类别名称" labelWidth="120" readOnly="true"/>
			<ta:text id="r_aae041" key="旧的开始时间" labelWidth="120" readOnly="true" display="false" />
		</ta:panel>
		
		<ta:panel id="pnlBzxx" key="医疗通用参数目录信息" fit="true">
			<ta:datagrid id="cp_bzxx" haveSn="true" fit="true" forceFitColumns="true" onRowDBClick="fnEdit">
				<ta:datagridItem id="aae140" key="险种类型 " collection="yl140" width="150" align="center" showDetailed="true" />
				<ta:datagridItem id="yab139" key="参保所属机构"  collection="yab139" width="100" align="center"/>
				<ta:datagridItem id="aae041" key="开始年月" width="100" align="center"/>
				<ta:datagridItem id="aae042" key="终止年月" width="100" align="center"/>
				<ta:datagridItem id="aaa001" key="参数类别代码 "  width="100" align="center" />
				<ta:datagridItem id="aaa002" key="参数类别名称"  width="160" align="center"  showDetailed="true"/>
				<ta:datagridItem id="aaa005" key="参数值"  width="120" align="center" />
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

	function fnEdit(e,data){
		Base.setValue("r_aae140",data.aae140);
		Base.setValue("r_yab139",data.yab139);
		Base.setValue("r_aae041",data.aae041);
		Base.setValue("r_aae042",data.aae041);
		Base.setValue("r_aaa001",data.aaa001);
		Base.setValue("r_aaa002",data.aaa002);
		Base.setValue("r_aaa005",data.aaa005);
		Base.setValue("r_aaa105",data.aaa105);
	}
	
	function toAdd(){
		//系统年月
		var sysdate = Base.getValue("sysdate");
		var r_aae042 = Base.getValue("r_aae042");
		if(""!=sysdate)
		{
			if(""!=r_aae042)
			{
				if(r_aae042<=sysdate)
					return Base.alert("开始年月必须大于当前系统年月<b style='color:red;'>"+sysdate+"</b>","warn");
			}
		}
		Base.confirm("确定要保存吗?", function(btn, callback) {
			if (btn) {
				Base.submit("form1","commonParameterAction!saveAa01.do");
			}
		});
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>