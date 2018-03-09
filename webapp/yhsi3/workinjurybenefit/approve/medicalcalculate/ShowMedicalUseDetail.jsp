<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
	    <ta:buttonLayout align="center">
	   	 	<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="fnClose()" asToolBarItem="true" />
	    </ta:buttonLayout>
	</ta:toolbar>	
		<ta:panel key="用药信息" fit="true" >	
			<ta:datagrid id="medicalDetail" haveSn="true" fit="true">
				<ta:datagridItem id="aka063" key="医疗发票项目类别"/>
				<ta:datagridItem id="akc225" key="单价"/>
				<ta:datagridItem id="akc226" key="数量"/>
				<ta:datagridItem id="aae019" key="金额"/>
				<ta:datagridItem id="yka536" key="医院项目医院承担部分"/>
				<ta:datagridItem id="aka067" key="药品剂量单位"/>
				<ta:datagridItem id="aka068" key="定价上限金额"/>
				<ta:datagridItem id="aka069" key="自付比例"/>
				<ta:datagridItem id="aka070" key="剂型"/>
				<ta:datagridItem id="aka074" key="规格"/>
				<ta:datagridItem id="ake003" key="三大目录类别"/>
				<ta:datagridItem id="ake006" key="医疗机构三大目录名称"/>
				<ta:datagridItem id="ake007" key="费用发生日期"/>
				<ta:datagridItem id="akc228" key="全自付费金额"/>
				<ta:datagridItem id="ykc120" key="记账序号"/>
				<ta:datagridItem id="yka091" key="开单科室编码"/>
				<ta:datagridItem id="yka092" key="开单科室名称"/>
				<ta:datagridItem id="yka093" key="开单医生编码"/>
				<ta:datagridItem id="yka094" key="开单医生姓名"/>
			</ta:datagrid>
		</ta:panel>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function fnClose(){
		parent.Base.closeWindow("medicalDetailInfo");
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>