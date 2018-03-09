<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>路由表查询</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:button id="resetBtn" key="重置[R]" type="resetPage" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="panel1" key="查询条件" cols="3">
				<ta:text id="akb020" key="医院编号" labelWidth="120"  bpopTipMsg="输入医院编号可自动完成查询"  required="true"  onChange="query()"/>
				<ta:text id="akb021" key="医院名称"   readOnly="true" labelWidth="120"/>
			</ta:panel>
			<ta:panel id="panel2" key="查询结果" fit="true" expanded="false" scalable="false">
				<ta:datagrid id="kb01klList" fit="true" forceFitColumns="true">
					<ta:datagridItem id="aaz267" align="center" key="申请事件ID" maxChart="6" showDetailed="true"/>
					<ta:datagridItem id="akb020" align="center" key="医院编号" maxChart="8" showDetailed="true"/>
					<ta:datagridItem id="akb021" align="center" key="医院名称" maxChart="8" showDetailed="true"/>
					<ta:datagridItem id="webserviceurl" align="center" key="医院服务地址" maxChart="26" showDetailed="true"/>
					<ta:datagridItem id="username" align="center" key="用户名" maxChart="8"  showDetailed="true"/>
					<ta:datagridItem id="psw" align="center" key="密码" maxChart="8"  showDetailed="true"/>					
					<ta:datagridItem id="namespace" align="center" key="命名空间" maxChart="18" dataAlign="center" showDetailed="true"/>
					<ta:datagridItem id="ziptype" align="center" key="压缩类型" maxChart="8" dataAlign="center" showDetailed="true"/>
					<ta:datagridItem id="aae030" key="开始日期" align="center" dataAlign="center" maxChart="8" showDetailed="true"/>
					<ta:datagridItem id="aae031" key="结束日期" align="center" dataAlign="center" maxChart="8" showDetailed="true"/>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus('akb020');
	});
	
	//查询数据库
	function query()
	{
		Base.clearGridData("kb01klList");
		Base.submit("akb020","queryKb01klAction!query.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>