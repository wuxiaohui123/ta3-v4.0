<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>机构住院费用年度清算</title>
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
		<ta:panel id="fdstHospital" key="医疗服务机构年度清算信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  required="true" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:date id="aae001" key="年度" labelWidth="120" required="true" dateYear="true"/>
			<ta:selectInput id="yka316" key="清算类别" collection="YKA316" required="true"  labelWidth="120" filter="15,16" reverseFilter="true" />
			<ta:number id="fdbl" key="超支负担比例" labelWidth="120" min="0" max="1" precision="2" required="true"/>
			<ta:number id="jybl" key="节余奖励比例" labelWidth="120" min="0" max="1" precision="2" required="true"/>
			<ta:number id="akb069" key="扣款金额" labelWidth="120" min="0" precision="2"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="3" labelWidth="120"/>
		</ta:panel>
		<ta:tabs id="tabs" fit="true" >
			<ta:tab id="tab1" key="月度清算信息" >
				<ta:datagrid id="dgrdReckoningInfo" fit="true" haveSn="true" headerColumnsRows="2">
					<ta:datagridItem id="akb020" key="医疗机构编号" align="center" showDetailed="true"  dataAlign="left"  maxChart="6"/>
				    <ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true"  dataAlign="left"  maxChart="6" />
			    	<ta:datagridItem id="aae030" key="开始时间"  align="center" showDetailed="true"  dataAlign="center"  maxChart="6" dataType="date"/>
				    <ta:datagridItem id="aae031" key="终止时间"  align="center" showDetailed="true"  dataAlign="center"  maxChart="6" dataType="date"/>				
				    <ta:datagridItem id="yka316" key="清算类别"  align="center" showDetailed="true"  dataAlign="left"  maxChart="6" collection="YKA316"/>
					<ta:datagridItem id="aka122" key="病种类型"  align="center" showDetailed="true"  dataAlign="left"  maxChart="6" collection="AKA122"/>
					<ta:datagridItem id="akb079" key="住院人次"  align="center" showDetailed="true"  dataAlign="right"  maxChart="5" />
					<ta:datagridItem id="akb065" key="住院总费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akc228" key="自费费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka063" key="超限额自费" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka059" key="统筹比例自付" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb069" key="拒付费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="fwnfy" key="本次进入统筹支付范围费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb068" key="统筹基金支付" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka502" key="上月结存或超支费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka500" key="本月定额费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb081" key="本月应支付"  align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb090" key="待结算金额" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb094" key="实际支付"  align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />					
					<ta:datagridItem id="ake034" key="个人账户支付" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka501" key="本月结存或超支费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka502" key="上月结存或超支费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yae041" key="审核人" align="center" showDetailed="true"  dataAlign="left"  maxChart="3"  collection="AAE011"/>
					<ta:datagridItem id="yae051" key="审核日期" align="center" showDetailed="true"  dataAlign="center"  maxChart="6"  dataType="date"/>
					<ta:datagridItem id="yae042" key="结算人" align="center" showDetailed="true"  dataAlign="left"  maxChart="3" collection="AAE011"/>
					<ta:datagridItem id="yae052" key="结算日期" align="center" showDetailed="true"  dataAlign="center"  maxChart="6" dataType="date"/>
				    <ta:datagridItem id="aaz272" key="流水号" align="center" showDetailed="true"  dataAlign="left"  maxChart="6" />
				</ta:datagrid>
			</ta:tab>
			
			<ta:tab id="tab2" key="汇总信息">
				<ta:datagrid id="gridInfo" haveSn="true" headerColumnsRows="2" fit="true" >
					<ta:datagridItem id="akb020" key="医疗机构编号" align="center" showDetailed="true"  dataAlign="left"  maxChart="6" />
					<ta:datagridItem id="akb021" key="医疗机构名称" align="center" showDetailed="true"  dataAlign="left"  maxChart="6" />
					<ta:datagridItem id="yka316" key="清算类别"  align="center" showDetailed="true"  dataAlign="left"  maxChart="6"  collection="YKA316" />
					<ta:datagridItem id="akb079" key="住院总人次"  align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzrc" key="普通病种住院总人次" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzrc" key="特殊病种住院人次"  align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzrc" key="单病种住院次数" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb065" key="住院总费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzfy" key="普通病种住院总费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzfy" key="特殊病种住院总费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzfy" key="单病种住院总费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb068" key="住院统筹支付" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbztc" key="住院统筹支付(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbztc" key="住院统筹支付(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbztc" key="住院统筹支付(单病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka059" key="住院统筹内个人支付" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzgrzf" key="住院统筹内个人支付(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzgrzf" key="住院统筹内个人支付(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzgrzf" key="住院统筹内个人支付(单病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akc228" key="住院个人自费" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzakc228" key="住院个人自费(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzakc228" key="住院个人自费(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzakc228" key="住院个人自费(单病种)"  align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka318" key="住院个人比例自付"  align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzyka318" key="住院个人比例自付(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzyka318" key="住院个人比例自付(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzyka318" key="住院个人比例自付(单病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="yka500" key="结算定额" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzyka500" key="结算定额(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzyka500" key="结算定额(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb081" key="住院应结算总费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzyka500" key="住院应结算总费用(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzyka500" key="住院应结算总费用(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzakb081" key="住院应结算总费用(单病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="akb094" key="已支付结算费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="ptbzakb094" key="已支付结算费用(普通病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="tsbzakb094" key="已支付结算费用(特殊病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
					<ta:datagridItem id="dbzakb094" key="已支付结算费用(单病种)" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />		
					<ta:datagridItem id="akb090" key="待结算住院费用" align="center" showDetailed="true"  dataAlign="right"  maxChart="6" />
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
						}
					});
	}
		
	//查询
	function query()
	{
		var akb020 = Base.getValue("akb020");// 医疗机构编码
		var aae001 = Base.getValue("aae001");// 年度
		var yka316 = Base.getValue("yka316");// 清算类型
		if(""==akb020||null==akb020)
			return Base.alert("请输入医疗机构编码!","warn",function(){Base.focus("akb020");});
		if(""==aae001||null==aae001)
			return Base.alert("请输入年度!","warn",function(){Base.focus("aae001");});
		if(""==yka316||null==yka316)
			return Base.alert("请输入清算类型!","warn",function(){Base.focus("yka316");});
		var parameters = {};
		parameters["dto['akb020']"]=akb020;
		parameters["dto['aae001']"]=aae001;
		parameters["dto['yka316']"]=yka316;
		Base.submit('','reckoningYearZYAction!toQueryHospitalInfo.do',parameters,null,false,null,null);
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					Base.submit("form1","reckoningYearZYAction!save.do",null,null,false,null,null);
				}
			});
		}else{
			Base.alert("有红星的为必输项!","warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>