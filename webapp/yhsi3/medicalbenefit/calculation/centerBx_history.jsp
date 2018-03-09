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
            <ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()"  />
            <ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('win_hitory');"  />
       </ta:toolbar>
       <ta:form id="form2" fit="true">
        <ta:panel id="pnlCxtj" key="查询条件" cols="3">
          <ta:text id="aac001" key="人员编码" display="false"/>
          <ta:box span="3" cols="3">
            <ta:date id="aae036_s" key="结算日期(从)"  showSelectPanel="true"  labelWidth="120" />
            <ta:date id="aae036_e" key="结算日期(至)"  showSelectPanel="true"  labelWidth="120" />
          </ta:box>  
            <ta:text id="aab001" key="单位编号" labelWidth="120"  />
            <ta:text id="aab003" key="单位名称" labelWidth="120" span="2" />
        </ta:panel>
		<ta:panel id="panel1" key="结算信息"  fit="true" >
			<ta:datagrid id="kc24List" fit="true" columnFilter="true"  haveSn="true">
				<ta:datagridItem id="aab003" key="单位名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="10"/>
				<ta:datagridItem id="akb021" key="医疗机构名称"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="10"/>
				<ta:datagridItem id="aka130" key="医疗支付类别" collection="AKA130"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"/>
				<ta:datagridItem id="aae030" key="开始日期" dataType="Date"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"/>
				<ta:datagridItem id="aae031" key="结束日期"  dataType="Date"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="6"/>
				<ta:datagridItem id="aae036" key="经办时间"  dataType="date"  align="center"  showDetailed="true"  dataAlign="center"  maxChart="10"/>
				<ta:datagridItem id="akc021" key="人员性质"  collection="AKC021" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"/>
				<ta:datagridItem id="yka115" key="本次起付线"  align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"/>
				<ta:datagridItem id="akb081" key="实际支付金额" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc264" key="医疗费总额" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc228" key="全自付费金额" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc268" key="超限价自付金额" align="center"  showDetailed="true"  dataAlign="right"  maxChart="7"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka318" key="先行自付金额" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka319" key="符合范围部分" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake034" key="个人帐户支出" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka059" key="统筹比例自付" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake039" key="基本医疗基金支出" align="center"  showDetailed="true"  dataAlign="right"  maxChart="8"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake013" key="报销原因"  collection="AKE013" align="center"  showDetailed="true"  dataAlign="left"  maxChart="6"/>
				<ta:datagridItem id="akc291" key="住院费用" align="center"  showDetailed="true"  dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake041" key="城镇居民基本医疗统筹基金支出" align="center"  showDetailed="true"  dataAlign="right"  maxChart="14"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake035" key="公补统筹基金支出" align="center"  showDetailed="true"  dataAlign="right"  maxChart="8"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake043" key="离休专项医疗基金支出" align="center"  showDetailed="true"  dataAlign="right"  maxChart="12"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="aae011" key="经办人"   collection="AAE011" align="center"  showDetailed="true"  dataAlign="left"  maxChart="4"/>
				<ta:datagridItem id="yab003" key="经办机构"  collection="YAB003"  align="center"  showDetailed="true"  dataAlign="left"  maxChart="7"/>	
			</ta:datagrid>
	</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		//initializeSuggestFramework(1, null, 'aab001', 680, 300, 3, fn_getAb01, 1, false);
	});
	function fn_getAb01()
	{
		Base.setValue("aab001",g_Suggest[1]);
		Base.setValue("aab003",g_Suggest[2]);
	}
	
	function toQuery()
	{
		Base.clearGridData("kc24List");
		Base.submit("form2", "<%=path%>/medicalbenefit/calculation/centerCalculationAction!toQueryHistoryForJsp.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>