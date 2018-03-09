<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>离休（二乙）家庭病床年度清算</title>
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
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:number id="aae001" key="年度" labelWidth="120" required="true"/>			
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" required="true" labelWidth="120" filter="17,18,24" reverseFilter="true" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="审核信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="gridInfo" fit="true" haveSn="true" selectType="checkbox">
				
				<ta:datagridItem id="aae001" key="年度" />
				<ta:datagridItem id="akb020" key="医疗机构编号" />
				<ta:datagridItem id="akb021" key="医疗机构名称" />
				<ta:datagridItem id="mzrc" key="门诊总人次" dataAlign="right"/>
				<ta:datagridItem id="mzfy" key="门诊总费" dataAlign="right"/>
				<ta:datagridItem id="mzsjfy" key="门诊实际结算总费" dataAlign="right"/>
				<ta:datagridItem id="mzdjsfy" key="门诊待结算总费用" dataAlign="right"/>
				<ta:datagridItem id="zyrc" key="住院总人次" dataAlign="right"/>
				<ta:datagridItem id="zyfy" key="住院总费用" dataAlign="right"/>
				<ta:datagridItem id="zysjfy" key="住院实际结算总费" dataAlign="right"/>
				<ta:datagridItem id="zyyzffy" key="已经支付结算住院费用" dataAlign="right"/>
				<ta:datagridItem id="zydjsfy" key="住院待结算总费用" dataAlign="right"/>
				<ta:datagridItem id="jtrc" key="家庭病床总人次" dataAlign="right"/>
				<ta:datagridItem id="jtfy" key="家庭病床总费用" dataAlign="right"/>
				<ta:datagridItem id="jtsjfy" key="家庭病床实际结算总费" dataAlign="right"/>
				<ta:datagridItem id="jtdjsfy" key="家庭病床待结算总费用" dataAlign="right"/>
				<ta:datagridItem id="jffy" key="拒付费用" dataAlign="right"/>
				<ta:datagridItem id="akb069" key="本年度扣减金额" dataAlign="right"/>
				<ta:datagridItem id="ndyzffy" key="年结算应付定点机构总额" dataAlign="right"/>
				<ta:datagridItem id="ndyjzffy" key="年度已经支付给定点机构" dataAlign="right"/>
				<ta:datagridItem id="yzfjehj" key="应支付金额合计" dataAlign="right"/>
				<ta:datagridItem id="akb068" key="统筹支付" dataAlign="right"/>
				<ta:datagridItem id="ake034" key="个帐支付" dataAlign="right"/>
				<ta:datagridItem id="yae051" key="审核日期" width="100" />
				<ta:datagridItem id="yae041" key="审核人" width="100" collection="AAE011"/>
				<ta:datagridItem id="yae042" key="结算人" width="100" collection="AAE011"/>
				<ta:datagridItem id="yae052" key="结算日期" width="100" />
				<ta:datagridItem id="lsh" key="流水号" />
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fnSetRedBorder();
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
							Base.setValue("akb022",data.hospitalInfoDto.akb022);
							Base.setValue("akb097",data.hospitalInfoDto.akb097);
							Base.setValue("akb021",data.hospitalInfoDto.akb021);
							Base.clearGridData("gridInfo");
							Base.submit("akb020","reckoningYearLXAction!toQueryHospitalInfo.do");
						}
					});
	}
		
	//查询
	function query(){
		Base.submit('form1','reckoningYearLXAction!toQueryHospitalInfo.do');
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
			//有无审核信息
			var gridInfo=Base.getGridData("gridInfo");//表格中所有数据 
			var gridSelected=Base.getGridSelectedRows("gridInfo");//选中的表格数据
			
			if(gridSelected.length == 0){
				Base.alert("请勾选要审核信息!","warn");
				return false;
			}
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					var gridStr=Ta.util.obj2string(gridSelected);
					var parameter={};
					parameter['gridInfo']=gridStr;
					Base.submit("form1","reckoningYearLXAction!save.do",parameter,null,false,null,null);
				}
			});
		}else{
			Base.alert("有红星的为必输项!","warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>