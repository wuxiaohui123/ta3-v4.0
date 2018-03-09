<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构住院情况稽核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
			<ta:toolbarItem id="btnSave" key="审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fltHospital" key="医疗机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="120"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:text id="aac001"  key="个人ID"  onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))"  bpopTipMsg="输入个人ID、身份证号、姓名，可自动完成查询" labelWidth="120"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:selectInput id="yka099" key="病种类型" collection="YKA099" labelWidth="120" />
			<ta:date id="cysj_k" key="出院时间" showSelectPanel="true"   labelWidth="120"/>
			<ta:date id="cysj_j" key="至" showSelectPanel="true"  labelWidth="120"/>
			<ta:selectInput id="aka030" key="结算类别" collection="AKA030" labelWidth="120" />
			<ta:date id="jssj_k" key="结算时间" showSelectPanel="true"  labelWidth="120"/>
			<ta:date id="jssj_j" key="至" showSelectPanel="true"  labelWidth="120"/>
			<ta:selectInput id="yka538" key="审核状态" collection="YKA538" labelWidth="120" />
			<ta:date id="shsj_k" key="审核时间" showSelectPanel="true"  labelWidth="120"/>
			<ta:date id="shsj_j" key="至" showSelectPanel="true" labelWidth="120"/>
			
			<ta:text id="aaz216" key="获取扣款的结算行数" display="false" />
			<ta:text id="aaz272" key="医疗机构费用结算事件ID" display="false" />
		</ta:panel>
		
		<ta:panel id="pnlRandomAudit" key="待稽核信息(双击查看明细)" height="150" expanded="true" fit="true" >
			<ta:datagrid id="dgrdJSLX" fit="true" haveSn="true" selectType="checkbox" onRowDBClick="fnClickDgrd">
				<ta:datagridItem id="aaz216" key="医疗结算事件ID" hiddenColumn="false"/>
				<ta:datagridItem id="aaz272" key="医疗机构费用结算事件ID" hiddenColumn="true"/>
				<ta:datagridItem id="yka538" key="审核标记" width="100" align="center" collection="YKA538"/>
				<ta:datagridItem id="aac001" key="保险号" width="100" align="center"/>
				<ta:datagridItem id="aac003" key="姓名" width="50" align="center"/>
				<ta:datagridItem id="aac004" key="年龄" width="50" align="center"/>
				<ta:datagridItem id="yke112" key="性别" width="50" align="center"/>
				<ta:datagridItem id="akc021" key="人员性质" width="80" align="center" collection="AKC021"/>
				<ta:datagridItem id="akb021" key="医院名称" width="150" align="center"/>
				<ta:datagridItem id="yke014" key="住院号" width="100" align="center"/>
				<ta:datagridItem id="rysj" key="入院日期" width="100" align="center" dataType="date" />
				<ta:datagridItem id="akc264" key="总费用" width="100" align="center"/>
				<ta:datagridItem id="yka318" key="个人比例自付" width="100" align="center"/>
				<ta:datagridItem id="" key="拒付费用" width="100" align="center"/>
				<ta:datagridItem id="" key="自费费用" width="100" align="center"/>
				<ta:datagridItem id="" key="超限额自费" width="100" align="center"/>
				<ta:datagridItem id="" key="范围内费用" width="100" align="center"/>
				<ta:datagridItem id="" key="个人账户支付" width="100" align="center"/>
				<ta:datagridItem id="" key="起付线" width="100" align="center"/>
				<ta:datagridItem id="" key="统筹支付费用" width="100" align="center"/>
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
							Base.clearGridData("dgrdJSLX");
							Base.clearGridData("dgrdRYJS");
							Base.submit("akb020","hospitalizationAuditAction!toQuery.do");
						}
					});
	}
	
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",
					{"dto['aac001']":Base.getValue("aac001")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("aac001",'');
							return true;
						}
						if(data &&  data.personInfoDto) {
							if(data.personInfoDto.yab139 != Base.getValue('aaa027')){
								Base.setValue("aac001",'');
								Base.alert('非本经办机构的参保人员,不能进行审核!', 'warn');
								return false;
							}
							Base.submit('aac001,aae140', 'hospitalizationAuditAction!toQuery.do');
						}
					});
	}
	
	//查询
	function query(){
		Base.submit('form1','hospitalizationAuditAction!toQuery.do');
	}
	
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
			var dgrdJSLX=Base.getGridSelectedRows("dgrdJSLX");
			if(dgrdJSLX.length == 0){
				Base.alert("请勾选需要审核的信息！","warn");
			}else{
				Base.confirm("确定要保存吗?",function(yes){
					if(yes){
						Base.clearGridData("dgrdRYJS");
						var parameter={};
						var grdStr=Ta.util.obj2string(dgrdJSLX);
						parameter["dgrdJSLX"]=grdStr;
						Base.submit("form1","hospitalizationAuditAction!toSave.do",parameter,false,null,null);
					}
				}); 
			}
		}
	}
	
	//查看明细
	function fnClickDgrd(e,data){
		var params={"dto['aaz216']":data.aaz216};
		Base.setValue("row",data.row); //设置操作的行数
		Base.openWindow('detailWin',"明细信息","<%=path%>/process/medicalbenefit/reckoning/hospitalizationAuditAction!toDetail.do", params, "95%", "90%",null,null,true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>