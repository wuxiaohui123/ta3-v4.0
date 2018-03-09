<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>清算领导审批</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnSave" key="审批[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="查询条件" cols="3" >
		    <ta:date id="aae001" key="年度" labelWidth="120" required="true" dateYear="true"/>
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316"   labelWidth="120"  />
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="3" labelWidth="120"/>
		</ta:panel>
		<ta:tabs id="tabs" fit="true" >
		   <ta:tab id="tab1" key="门诊" >
			<ta:datagrid id="dgrdReckoningInfo" fit="true" haveSn="true"  selectType="checkbox"  forceFitColumns="true">
				    <ta:datagridItem id="akb020" key="医疗机构编号" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true" dataAlign="left" maxChart="6"/>
					<ta:datagridItem id="yka316" key="清算类别"  align="center" showDetailed="true" dataAlign="left" maxChart="6" collection="YKA316" />
					<ta:datagridItem id="akb079" key="实际发生人次" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb065" key="实际发生费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb081" key="应结算总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb094" key="已支付总额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb090" key="待结算金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb069" key="扣款金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="sjzf" key="实际支付" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter" />
			</ta:datagrid>
		  </ta:tab>
		  <ta:tab id="tab2" key="住院" >
			<ta:datagrid id="dgrdReckoningInfozy" fit="true" haveSn="true" selectType="checkbox"  forceFitColumns="true" headerColumnsRows="2">
					<ta:datagridItem id="akb020" key="医疗机构编号" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka316" key="清算类别" align="center" showDetailed="true" dataAlign="right" maxChart="6" collection="YKA316" />
					<ta:datagridItem id="akb079" key="住院总人次" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzrc" key="普通病种住院总人次" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzrc" key="特殊病种住院人次" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzrc" key="单病种住院次数" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb065" key="住院总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzfy" key="普通病种住院总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzfy" key="特殊病种住院总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzfy" key="单病种住院总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb068" key="住院统筹支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbztc" key="住院统筹支付(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbztc" key="住院统筹支付(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbztc" key="住院统筹支付(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka059" key="住院统筹内个人支付" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzgrzf" key="住院统筹内个人支付(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzgrzf" key="住院统筹内个人支付(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzgrzf" key="住院统筹内个人支付(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akc228" key="住院个人自费" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzakc228" key="住院个人自费(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzakc228" key="住院个人自费(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzakc228" key="住院个人自费(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka318" key="住院个人比例自付"  align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzyka318" key="住院个人比例自付(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzyka318" key="住院个人比例自付(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzyka318" key="住院个人比例自付(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka500" key="结算定额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzyka500" key="结算定额(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzyka500" key="结算定额(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb081" key="住院应结算总费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzyka500" key="住院应结算总费用(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzyka500" key="住院应结算总费用(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzakb081" key="住院应结算总费用(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb094" key="已支付结算费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="ptbzakb094" key="已支付结算费用(普通病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="tsbzakb094" key="已支付结算费用(特殊病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="dbzakb094" key="已支付结算费用(单病种)" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>					
					<ta:datagridItem id="akb090" key="待结算费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="akb069" key="扣款金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="sjzf" key="实际支付" align="center" showDetailed="true" dataAlign="right" maxChart="6" formatter="fnFormatter" />
					
					<ta:datagridItem id="yka501" key="结存或超支费用" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka503" key="可超支金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka504" key="机构负担" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka505" key="统筹基金负担" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka506" key="机构超10%负担" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka507" key="可节余金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka508" key="医疗机构节余" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka509" key="统筹基金节余" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="yka510" key="统筹基金滚存金额" align="center" showDetailed="true" dataAlign="right" maxChart="6"/>
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
	function fnFormatter(row, cell, value, columnDef, dataContext)
        {
		return "<span style='color:red;'>"+eval(null==value?0:value)+"</span>";
	}
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
						}
					});
	}
		
	//查询
	function query(){
		Base.submit('form1','reckoningApprovalNDAction!toQueryHospitalInfo.do');
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
		
			var gridSelected=Base.getGridSelectedRows("dgrdReckoningInfo");//选中的表格门诊数据
			var gridSelectedzy=Base.getGridSelectedRows("dgrdReckoningInfozy");//选中的表格住院数据
			if(gridSelected.length == 0 && gridSelectedzy.length == 0){
				Base.alert("请勾选要审核信息!","warn");
				return false;
			}
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){					
					var gridStr=Ta.util.obj2string(gridSelected);
					var gridStr1=Ta.util.obj2string(gridSelectedzy);
					var parameter={};
					parameter['gridInfo']=gridStr
					parameter['gridInfozy']=gridStr1			
					Base.submit("form1","reckoningApprovalNDAction!save.do",parameter,null,false,null,null);
				}
			});
		}else{
			Base.alert("有红星的为必输项!","warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>