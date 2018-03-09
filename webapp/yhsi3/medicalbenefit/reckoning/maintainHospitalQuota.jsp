<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构住院定额指标管理</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="新增[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toAdd()" />
		<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel  id="fltHospital" key="查询条件" cols="3">
			<ta:text id="akb020" key="医疗机构编码"  readOnly="true" display="false"/>
			<ta:text id="akb021" key="医疗机构名称"  span="2" labelWidth="120"  popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:selectInput id="yka316" key="人员类别"  collection="YKA316" labelWidth="120"   filter="15,16,18,24"  reverseFilter="true"/>
			<ta:selectInput id="aka122" key="病种名称"  collection="AKA12S"  labelWidth="120" />
			<ta:date id="aae030" key="起始年月"  showSelectPanel="true" labelWidth="120"  issue="true" />
			<ta:date id="aae031" key="终止年月"  showSelectPanel="true" labelWidth="120"  issue="true" />
		</ta:panel>
		<ta:panel id="pnlBzxx" key="机构住院定额信息" fit="true">
			<ta:datagrid id="dg_bzxx" haveSn="true" fit="true"  forceFitColumns="true">
				<ta:datagridItem id="edit" key="修改"   showDetailed="true"  align="center"  dataAlign="center"  maxChart="2"  icon="icon-edit"  click="editKc39"/>
				<ta:datagridItem id="akb020" key="医院编号"  showDetailed="true"  align="center"  dataAlign="left"  maxChart="4"/>
				<ta:datagridItem id="akb021" key="医院名称" showDetailed="true"  align="center"  dataAlign="left"  maxChart="10" />
				<ta:datagridItem id="aka122" key="病种名称" showDetailed="true"  align="center"  dataAlign="left"  maxChart="5" collection="AKA12S" />
				<ta:datagridItem id="yka316" key="人员类别" showDetailed="true"  align="center"  dataAlign="left"  maxChart="5"  collection="YKA316" />
				<ta:datagridItem id="aae002" key="月份"    showDetailed="true"  align="center"  dataAlign="center"  maxChart="4" />
				<ta:datagridItem id="yka500" key="指标金额" showDetailed="true"  align="center"  dataAlign="right"  maxChart="4"/>
				<ta:datagridItem id="aae013" key="备注"      showDetailed="true"  align="center"  dataAlign="left"  maxChart="9"  />
				<ta:datagridItem id="aae011" key="经办人"    showDetailed="true"  align="center"  dataAlign="left"  maxChart="4"   collection="AAE011"/>
				<ta:datagridItem id="aae036" key="经办时间"  showDetailed="true"  align="center"  dataAlign="center"  maxChart="4"  dataType="date" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//医疗机构回调函数
	function fnKb01MagifierBack(rowdata)
	{
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	//查询
	function query()
	{
	  	//清空表格数据，以免出现脏数据
	    Base.clearGridData("dg_bzxx");
		Base.submit("form1", "maintainHospitalQuotaAction!queryKc39.do");
	}

	//新增起付线信息
	function toAdd()
	{
		Base.openWindow('userwin',  "住院定额指标新增", "maintainHospitalQuotaAction!addKc39.do",null, '90%', '70%', null, null, true);
	}
	
	//修改列表中某条起付线信息
	function editKc39(data,e)
	{
		var param = { "dto['akb020']" : data.akb020,
					  "dto['aae002']" : data.aae002,
					  "dto['yka316']" : data.yka316,
				      "dto['aka122']" : data.aka122};
		Base.openWindow('userwin',  "住院定额标准修改", "maintainHospitalQuotaAction!editKc39.do",param, '90%', '70%', null, null, true);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>