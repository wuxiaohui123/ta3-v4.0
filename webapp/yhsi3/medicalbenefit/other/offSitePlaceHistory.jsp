<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>异地安置申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnClose" key="退出" icon="xui-icon-spotClose"   onClick="toColse()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
	    <ta:panel id="pnlKc45"  key="异地安置历史记录" fit="true">
		    <ta:datagrid  id="dgKc45"  fit="true"  forceFitColumns="true"  haveSn="true"  snWidth="20">
		        <ta:datagridItem  id="aae030"  key="申请日期"  align="center"  dataAlign="center"  maxChart="6"/>
		        <ta:datagridItem  id="aae031"  key="回统筹日期"  align="center"  dataAlign="center"  maxChart="6"/>
		        <ta:datagridItem  id="aae013"  key="安置医院"  align="center"  dataAlign="center"  maxChart="45"/>
		        <ta:datagridItem  id="aae005"  key="联系电话"  align="center"  dataAlign="center"  maxChart="6"/>
		        <ta:datagridItem  id="aae011"  key="申请登记人"  align="center"  dataAlign="center"  maxChart="5"  collection="AAE011"/>
		        <ta:datagridItem  id="aae036"  key="申请登记时间"  align="center"  dataAlign="center"  maxChart="8"/>
		        <ta:datagridItem  id="yae041"  key="回统筹登记人"  align="center"  dataAlign="center"  maxChart="6"  collection="AAE011"/>
		        <ta:datagridItem  id="yae051"  key="回统筹登记时间"  align="center"  dataAlign="center"  maxChart="8"/>
		        <ta:datagridItem  id="aac001"  key="个人ID"  align="center"  dataAlign="center"  maxChart="6"/>
		        <ta:datagridItem  id="aac003"  key="姓名"    align="center"  dataAlign="center"  maxChart="3"/>
		        <ta:datagridItem  id="aac002"  key="身份证号"  align="center"  dataAlign="center"  maxChart="9"/>
		        <ta:datagridItem  id="aab001"  key="单位ID"  align="center"  dataAlign="center"  maxChart="6"/>
		        <ta:datagridItem  id="aab003"  key="单位名称"  align="center"  dataAlign="center"  maxChart="9"/>
		        <ta:datagridItem  id="akc021"  key="人员性质"  align="center"  dataAlign="center"  maxChart="4"  collection="AKC021"/>
		    </ta:datagrid>
	    </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function  toColse()
	{
		parent.Base.closeWindow("win_history");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>	