<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构门诊（购药）费用年度清算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="清算[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="医疗服务机构年度费用结算信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" required="true" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:number id="aae001" key="年度" labelWidth="120" required="true"/>
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" required="true" labelWidth="120" filter="10,11,12,13,14,19" reverseFilter="true" />			
			<ta:number id="akb069" key="扣款金额" labelWidth="120" min="0" precision="2"/>
		</ta:panel>
		<ta:tabs id="tabs" fit="true" >
			<ta:tab id="tab1" key="月度清算信息" >
			 <ta:datagrid id="dgrdReckoningInfo" fit="true" haveSn="true" headerColumnsRows="2">
				<ta:datagridItem id="akb020" key="医疗机构编号" align="center" showDetailed="true" dataAlign="left"  maxChart="6"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true" dataAlign="left"  maxChart="8"/>
				<ta:datagridItem id="aae030" key="开始时间" align="center" showDetailed="true" dataAlign="center"  maxChart="6"  dataType="date"/>
				<ta:datagridItem id="aae031" key="终止时间" align="center" showDetailed="true" dataAlign="center"  maxChart="6" dataType="date" />				
				<ta:datagridItem id="yka316" key="清算类别" align="center" showDetailed="true" dataAlign="left"  maxChart="6" collection="YKA316" />
				<ta:datagridItem id="akb079" key="核准主记录数" align="center" showDetailed="true" dataAlign="right"  maxChart="6" dataType="number"/>
				<ta:datagridItem id="akb065" key="核准总费用" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>
				<ta:datagridItem id="fwnfy" key="核准医保费用" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>
				<ta:datagridItem id="ake034" key="核准个人账户支付总费用" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>
				<ta:datagridItem id="akc228" key="自费费用" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>		
				<ta:datagridItem id="akb069" key="拒付费用" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>
				<ta:datagridItem id="akb081" key="应支付"  align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>
				<ta:datagridItem id="akb094" key="实际支付" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>
				<ta:datagridItem id="akb090" key="待结算金额" align="center" showDetailed="true" dataAlign="right"  maxChart="5"/>				
				<ta:datagridItem id="yae051" key="审核日期" align="center" showDetailed="true" dataAlign="center"  maxChart="5"  dataType="date"/>
				<ta:datagridItem id="yae041" key="审核人" align="center" showDetailed="true" dataAlign="left"  maxChart="5" collection="AAE011"/>
				<ta:datagridItem id="yae042" key="结算人" align="center" showDetailed="true" dataAlign="left"  maxChart="5" collection="AAE011"/>
				<ta:datagridItem id="yae052" key="结算日期" align="center" showDetailed="true" dataAlign="center"  maxChart="5" />				
				<ta:datagridItem id="aaz272" key="流水号" align="center" showDetailed="true" dataAlign="center"  maxChart="5" />
			  </ta:datagrid>
			</ta:tab>
			<ta:tab id="tab2" key="汇总信息">
				<ta:datagrid id="gridInfo" haveSn="true" fit="true" forceFitColumns="true">
					<ta:datagridItem id="akb020" key="医疗机构编号"  align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="yka316" key="清算类别"  align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316" />
					<ta:datagridItem id="akb079" key="实际发生人次"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb065" key="实际发生费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb081" key="应结算总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb094" key="实际支付总额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb090" key="待结算金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
	});
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("akb020","");
							return false;
						}
						if(data && data.hospitalInfoDto) {
							Base.setValue("akb021",data.hospitalInfoDto.akb021);
							Base.clearGridData("dgrdAuditInfo");
						}
					});
	}
		
	//查询
	function query(){
		Base.submit('form1','reckoningYearMZAction!toQueryHospitalInfo.do');
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
			//有无审核信息
			var gridInfo=Base.getGridData("gridInfo");//表格中所有数据 	
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					Base.submit("form1","reckoningYearMZAction!save.do",null,null,false,null,null);
				}
			});
		}else{
			Base.alert("有红星的为必输项!","warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>