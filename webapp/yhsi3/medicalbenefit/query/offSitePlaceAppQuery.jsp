<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>异地安置申请查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="Q"   onClick="toQuery()" />
		<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fltCxtj"  key="查询条件"  cols="3">
			<ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="80" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				   </ta:buttonLayout>
			    </ta:box>
			<ta:text id="aac003"  key="姓名"    labelWidth="80"  readOnly="true"/>
		    <ta:selectInput id="akc021" key="人员类别" labelWidth="80" collection="akc021"/>
			<ta:box cols="2">
					<ta:text id="aab001" key="单位ID" labelWidth="80" onChange="getAb01Info()" columnWidth="0.9"/>
					<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
					   <ta:button id="ogniSmallBtn" key="?" onClick="showOgniWindow()" />
					</ta:buttonLayout>
			    </ta:box>
			<ta:text id="aab003"  key="单位名称"    labelWidth="80"  readOnly="true"/>
		    <ta:selectInput id="sfhtcq" key="是否回统筹" labelWidth="80" data="[{'id':'1','name':'是'},{'id':'0','name':'否'}]" />
		    <ta:date id="aae001"  key="年度" showSelectPanel="true"  dateYear="true" labelWidth="80" />
			<ta:box id="bxSj" cols="2">
				<ta:date id="aae030" key="申请日期"  showSelectPanel="true" labelWidth="80"  columnWidth="0.6"/>
			    <ta:date id="aae031" key="至"  showSelectPanel="true" labelWidth="15"   columnWidth="0.4"/>
		    </ta:box>
			<ta:box id="bxSj" cols="2">
				<ta:date id="aae036_s" key="登记日期"  showSelectPanel="true" labelWidth="80"  columnWidth="0.6"/>
			    <ta:date id="aae036_e" key="至"  showSelectPanel="true" labelWidth="15"   columnWidth="0.4"/>
		    </ta:box>
		</ta:panel>
		<ta:panel id="fltOffSiteInfo" key="安置地申请信息" fit="true">
			<ta:datagrid id="dgKc45" haveSn="true" fit="true" >
				<ta:datagridItem id="aac001" key="个人ID"  align="center"  maxChart="8"/>
				<ta:datagridItem id="aac003" key="姓名"  align="center"  maxChart="8"/>
				<ta:datagridItem id="aac004" key="性别" collection="AAC004"  align="center"  maxChart="2"/>
				<ta:datagridItem id="aac002" key="身份证号"  align="center"   maxChart="9" showDetailed="true"/>
				<ta:datagridItem id="akc021" key="人员类别"  align="center"  collection="AKC021" maxChart="4" showDetailed="true"/>
				<ta:datagridItem id="aab001" key="单位ID"  align="center"   maxChart="6" showDetailed="true"/>
				<ta:datagridItem id="aab003" key="单位名称"  align="center"   maxChart="20" showDetailed="true"/>				
				<ta:datagridItem id="aae030" key="开始时间"   align="center"  dataAlign="center" maxChart="7"/>
				<ta:datagridItem id="aae031" key="结束时间"   align="center"  dataAlign="center" maxChart="7"/>
				<ta:datagridItem id="aae013" key="医院"  align="center"  showDetailed="true"  maxChart="25"/>
				<ta:datagridItem id="aae006" key="详细地址"   align="center"  showDetailed="true"  maxChart="8"/>
				<ta:datagridItem id="akc030" key="申请原因"   align="center"  showDetailed="true"  maxChart="8"/>
				<ta:datagridItem id="aae005" key="联系电话"   align="center"  showDetailed="true"  maxChart="8"/>
				<ta:datagridItem id="aaa027" key="统筹区"     collection="AAB034"  align="center"  maxChart="5" />
				<ta:datagridItem id="aae011" key="登记人"     collection="AAE011"  align="center"  maxChart="5" />
				<ta:datagridItem id="aae036" key="登记时间"   align="center"  dataAlign="center" maxChart="7"/>
				<ta:dataGridToolPaging url="offSitePlaceAppQueryAction!toQuery.do" selectExpButtons="1,2,3" submitIds="fltPersonInfo" pageSize="500" ></ta:dataGridToolPaging>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	// 人员ID change事件
	function callbackFunPerson() {
		toQuery();
	}

	// 人员ID change事件
	//单位窗口回调函数
	function callbackFunOgni() {
		toQuery();
	}

	//查询
	function toQuery() {
		Base.clearGridData("dgKc45");
		Base.submit("fltCxtj", "offSitePlaceAppQueryAction!toQuery.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>