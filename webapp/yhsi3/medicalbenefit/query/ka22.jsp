<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>限价</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
			<ta:toolbarItem id="btnClose" key="关闭[C]" icon="xui-icon-spotClose"  hotKey="c"   onClick="parent.Base.closeWindow('w_xj')" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	   <ta:panel id="pnlXjdy" key="限价参数"  fit="true"  scalable="false"  expanded="false">
			 <ta:datagrid id="dgdXjdy"  fit="true"    forceFitColumns="true" haveSn="true"  snWidth="20">
					<ta:datagridItem id="akb095" align="center" key="医院等级" collection="AKB095"  showDetailed="true"   maxChart="6" /> 
<%--					<ta:datagridItem id="aka070" align="center" key="剂型" collection="AKA070"   showDetailed="true"  maxChart="6"/>--%>
					<ta:datagridItem id="aka068" align="center" key="定价上限金额"  dataType="number"  showDetailed="true" dataAlign="right"  maxChart="7" />
					<ta:datagridItem id="aae030" align="center" key="开始日期" dataType="date" showDetailed="true"  dataAlign="center"  maxChart="6" />
					<ta:datagridItem id="aae031" align="center" key="结束日期" dataType="date"  showDetailed="true"  dataAlign="center"   maxChart="6" />
		     </ta:datagrid>
	   </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>	