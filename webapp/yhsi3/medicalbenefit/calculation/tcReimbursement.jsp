<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>统筹报销比例维护</title>
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
			<ta:selectInput id="akb097" key="医疗机构等级"  collection="akb097" labelWidth="120"/>
		</ta:panel>
		
		<ta:panel id="pnlBzxx" key="基金分段标准目录信息" fit="true">
			<ta:datagrid id="tc_bzxx" haveSn="true" fit="true">
				<ta:datagridItem id="edit" key="修改" width="60" align="true" icon="icon-edit" click="editKa11"/>
				<ta:datagridItem id="pause" key="停用" width="60" align="true" icon="icon-remove" click="pauseKa11"/>
			 	<ta:datagridItem id="aaz131" key="基金分段ID" width="150" align="true" hiddenColumn="true"/>
				<ta:datagridItem id="aae140mc" key="险种类型 " width="120" align="center" showDetailed="true" />
				<ta:datagridItem id="aka047" key="基金支付比例" width="100" align="center"/>
				<ta:datagridItem id="aka048" key="上限金额" width="80" align="center"/>
				<ta:datagridItem id="aka049" key="下限金额" width="80" align="center"/>
				<ta:datagridItem id="aac066" key="参保身份 " collection="aac066" width="80" align="center" />
				<ta:datagridItem id="aka130" key="医疗类别" collection="aka130" width="80" align="center" />
				<ta:datagridItem id="akb097" key="医疗机构等级" collection="akb097" width="120" align="center" showDetailed="true"/>
				<ta:datagridItem id="aae030" key="开始日期"  dataType="date" width="120" align="center" />
				<ta:datagridItem id="aae031" key="终止日期" dataType="date"  width="120" align="center" />
				<ta:datagridItem id="ykc007" key="居民类别" collection="ykc007" width="120" align="center"/>
				<ta:datagridItem id="yac084" key="险种离退休标志" collection="yac084" width="120" align="center"/>
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
		Base.submit("queryField", "tcReimbursementAction!queryKa12.do");
	}

	//新增起付线信息
	function toAdd(){
		Base.openWindow('userwin',  "统筹报销比例新增", "tcReimbursementAction!addKa12.do",null, '90%', '70%', null, null, true);
	}
	
	//修改列表中某条起付线信息
	function editKa11(data,e){
		if(data.aae031 != null){
			Base.alert("该条数据已停用，不能再次修改");
			return;			
		}
		
		Base.openWindow('userwin',  "统筹报销比例修改", "tcReimbursementAction!editKa12.do",
						{"dto['aaz131']" : data.aaz131}, '90%', '70%', null, null, true);
	}
	
	//停用列表中某条起付线信息
	function pauseKa11(data,e){
		Base.confirm("确定要停用吗?", function(btn, callback) {
				if (btn) {
					if(data.aae031 != null){
						Base.alert("该条数据已被停用，不能再次停用");
						return;			
					}
					Base.submit("", "tcReimbursementAction!pauseKa12.do", {"dto['aaz131']" : data.aaz131}, null, false, null, null);
				}
			});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>