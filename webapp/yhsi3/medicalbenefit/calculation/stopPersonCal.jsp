<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报销结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:toolbarItem id="jiaofeiBtn" key="查询缴费信息" icon="xui-icon-query"   onClick="toQueryJiaoFei()"/>
		<ta:toolbarItem id="queryMxBtn" key="查看明细" icon="xui-icon-spotEdit"   onClick="toQueryMx()" />
		<ta:toolbarItem id="closeBtn" key="关闭" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('win_reg');" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj" key="查询条件" cols="3" >
			<ta:text id="aac001" key="个人ID"  required="true" onChange="sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'))"  labelWidth="80"/>
			<ta:date id="aae036_s" key="结算日期(从)"  showSelectPanel="true" labelWidth="120"  />
			<ta:date id="aae036_e" key="结算日期(至)"  showSelectPanel="true" labelWidth="120"  />
		</ta:panel>
		<ta:panel id="panel2" key="登记信息"  fit="true"  >
			<ta:datagrid id="kc21List" fit="true" selectType="radio" >
				<ta:datagridItem id="aac001" key="个人编号" width="100" align="center" dataAlign="center" />
				<ta:datagridItem id="aac003" key="姓名" width="80" align="center" dataAlign="center" />
				<ta:datagridItem id="aac004" key="性别" width="50" align="center" dataAlign="center" collection="AAC004"/>
				<ta:datagridItem id="aac002" key="身份证号" width="150" align="center" dataAlign="center" />
				<ta:datagridItem id="aab003" key="单位名称" width="150" align="center" showDetailed="true"  dataAlign="center" />
				<ta:datagridItem id="akc021" key="人员性质" width="80" align="center" showDetailed="true" dataAlign="center"  collection="AKC021"/>
				<ta:datagridItem id="aae030" key="入院日期" width="90" dataType="date" align="center"/>
				<ta:datagridItem id="aae031" key="出院日期" width="90" dataType="date" align="center"/>
				<ta:datagridItem id="yke014" key="住院号" width="100"  align="center" dataAlign="center"/>
				<ta:datagridItem id="akc291" key="医疗费总额" width="150" align="center" showDetailed="true" dataAlign="right" />
				<ta:datagridItem id="akc228" key="全自费金额" width="150" align="center" showDetailed="true"  dataAlign="right" />
				<ta:datagridItem id="akc268" key="超限价自付金额" width="150" align="center" showDetailed="true"  dataAlign="right"/>
				<ta:datagridItem id="yka318" key="个人比例自付金额" width="150" align="center" showDetailed="true"  dataAlign="right"/>
				<ta:datagridItem id="yka319" key="符合范围部分" width="150" align="center" showDetailed="true"  dataAlign="right"/>
				<ta:datagridItem id="akb081" key="支付金额" width="150" align="center" showDetailed="true"  dataAlign="right"/>
				<ta:datagridItem id="ykc022" key="住院次数" width="80" align="center" showDetailed="true" />
				<ta:datagridItem id="ake053" key="年度统筹范围累计" width="150" align="center" showDetailed="true"  dataAlign="right"/>
				<ta:datagridItem id="yka436" key="年度统筹支付累计" width="150" align="center" showDetailed="true"  dataAlign="right"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" width="150" align="center" showDetailed="true" />
				<ta:datagridItem id="akb021" key="医疗机构名称" width="150" align="center" showDetailed="true" />
				<ta:datagridItem id="akc196" key="出院诊断" width="200"  align="center" dataAlign="center"/>
				<ta:datagridItem id="aaz217" key="就诊流水号" width="130" />
				<ta:datagridItem id="aaz216" key="结算流水号" width="130" />
			</ta:datagrid>
	</ta:panel>
  </ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 500, 7, fn_getPerson, 0, false);
	});
	
	// 人员回调函数
	function fn_getPerson()
	{
		Base.setValue("aac001",g_Suggest[2]);
		toQuery();
	}
	
	// 查询
	function toQuery()
	{
		Base.submit("pnlCxtj","stopPersonCalAction!toQueryReg.do");
	}
	
	// 查询缴费信息
	function toQueryJiaoFei()
	{
		var aac001 = Base.getValue("aac001");
		if("" == aac001 || null == aac001){
			Base.alert("请输入个人ID","warn");
			return;
		}
		var parameter = {};
		parameter["dto['aac001']"] = aac001;
		parameter["dto['aae140']"] = Base.getValue("aae140");
		Base.openWindow("win_jf", "人员缴费信息", "<%=path%>/medicalbenefit/calculation/centerCalRegAction!toQueryJiaoFei.do", parameter, "98%", "95%", null, null, true, "", ""); 
	}
	
	// 查看明细
	function toQueryMx()
	{
		var gridData = Base.getGridSelectedRows("kc21List");
		if("" == gridData || null == gridData){
			Base.alert("请选择数据!","warn");
		}else{
			var param={"dto['aaz217']":gridData[0].aaz217,"dto['aac001']":gridData[0].aac001};
			Base.openWindow('userwin',"明细","<%=path%>/medicalbenefit/calculation/cenCalCancelAction!toDetail.do",param,'90%','95%',null,null,true);
		}
	} 
	
	//保存
	function toSave() 
	{
		var kc21List = Base.getGridSelectedRows('kc21List');
		if(kc21List.length == 0){
			Base.alert("请选择要结算的数据！", 'warn');
			return false;
		}
		var parameter = {};
		parameter["dto['aac001']"] = kc21List[0].aac001;
		parameter["dto['aaz217']"] = kc21List[0].aaz217;
		parameter["dto['aaz216']"] = kc21List[0].aaz216;
		parameter["dto['aae030']"] = kc21List[0].aae030;
		parameter["dto['aae031']"] = kc21List[0].aae031;
		parameter["dto['akb020']"] = kc21List[0].akb020;
		parameter["dto['aka130']"] = kc21List[0].aka130;
		Base.submit("","stopPersonCalAction!toSave.do",parameter);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>