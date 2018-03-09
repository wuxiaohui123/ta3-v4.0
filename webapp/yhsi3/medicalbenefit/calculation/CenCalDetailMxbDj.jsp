<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>结算信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	   <ta:toolbar id="ButtonLayout1">
            <ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('win_dj');"  />
       </ta:toolbar>
       <ta:form id="form2" fit="true">
		<ta:panel id="pnlDjHz" key="单据汇总信息"  fit="true"  expanded="false" scalable="false">
			<ta:datagrid id="dgDj" fit="true" forceFitColumns="true" haveSn="true">
				<ta:datagridItem id="akb020" key="医疗机构编码"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="10"/>
				<ta:datagridItem id="aae072" key="单据号"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"/>
				<ta:datagridItem id="akc271" key="就诊日期" dataType="date"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"/>
				<ta:datagridItem id="mxsl" key="费用条数" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				<ta:datagridItem id="aae019" key="单据费用" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
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