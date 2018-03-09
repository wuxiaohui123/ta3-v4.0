<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>家庭病床建床申请查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
    <ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="ctrl+Q"   onClick="toQuery()" />
		<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="ctrl+R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj" key="个人基本信息" cols="3" >
			 <ta:text id="aac001"  key="个人ID" />
		     <ta:text id="aac003"  key="姓名"  />
			 <ta:selectInput id="aaa027" key="统筹区" collection="AAB034"/>
		     <ta:box cols="2">
				<ta:text id="akb020" key="医疗机构编码" labelWidth="100" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			 </ta:box>
			 <ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2"/>
		</ta:panel>
		
		<ta:panel id="hosBedHomeAppInfo" key="家庭病床建床申请信息" fit="true">
				<ta:datagrid id="dgKc46"   columnFilter="true" haveSn="true" snWidth="30" fit="true">
				     <ta:datagridItem id="aac001" key="个人ID" width="100" showDetailed="true" align="center"/>
				     <ta:datagridItem id="aac003" key="姓名"  width="100" showDetailed="true" align="center"/>
			         <ta:datagridItem id="aac004" key="性别" collection="AAC004" width="80" showDetailed="true"  align="center"/>
			         <ta:datagridItem id="aac002" key="身份证号码" width="140" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="akb020" key="医疗机构编号" width="120" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="akb021" key="医疗机构名称" width="220" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae209" key="结算年月"   width="140" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="yka500" key="定额标准"   width="140" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aaa027" key="统筹区编码" collection="aab034" width="140" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="aae100" key="申请有效标志" collection="AAE100" width="120" showDetailed="true"  align="center"/>
				     <ta:datagridItem id="akc030" key="申请原因" width="150" showDetailed="true"  align="center"/>
				     <ta:dataGridToolPaging url="hosBedHomeAppQueryAction!toQuery.do" selectExpButtons="1,2,3" submitIds="appPersonInfo" pageSize="500" ></ta:dataGridToolPaging>
				</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//rpc回调
	function callbackFunHos() {
		
	};
	//查询
	function toQuery() 
	{
		Base.clearGridData("dgKc46");
		Base.submit("pnlCxtj","hosBedHomeAppQueryAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>