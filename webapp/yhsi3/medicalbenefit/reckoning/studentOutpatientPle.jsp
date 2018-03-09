<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生门诊保证金拨付</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="toQuery()"/>
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="ctrl+S" onClick="fnSave()"/>
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="ctrl+R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		
		<ta:panel id="pnlQuery" key="查询条件(点击查询按钮进行模糊查询)" cols="3">
			<ta:date id="aae001_q" key="年度" showSelectPanel="true" dateYear="true" labelWidth="140"/>
			<ta:text id="aae044_q" key="单位名称" bpopTipMsg="可输入单位ID或单位名称" labelWidth="140"/>
		</ta:panel>
		
		<ta:panel id="pnlPayMsg" key="拨付信息" cols="3">
			<ta:text id="aaz272" key="医疗机构费用结算事件ID" labelWidth="120" readOnly="true" display="false"/>
			<ta:text id="aae001" key="年度" labelWidth="140" readOnly="true" display="false"/>
			<ta:text id="aab001" key="单位ID" labelWidth="140" readOnly="true" required="true"/>
			<ta:text id="aae044" key="名称" labelWidth="140" span="2" readOnly="true"/>
			<ta:number id="akb079" key="结算人次" labelWidth="140" readOnly="true"/>
			<ta:number id="akb098" key="包干标准" labelWidth="140" readOnly="true"/>
			<ta:number id="akb100" key="包干总拨付金额" labelWidth="140" readOnly="true" />
			<ta:number id="akb099" key="其中已经结算金额" labelWidth="140" readOnly="true"/>
			<ta:number id="akb082" key="预留比例" labelWidth="140" readOnly="true"/>
			<ta:number id="akb090" key="预留金额" labelWidth="140" readOnly="true"/>
			<ta:number id="akb101" key="预留金额已经拨付金额" labelWidth="140" readOnly="true"/>
			<ta:number id="akb081" key="已拨付金额" labelWidth="140" readOnly="true" />
			<ta:number id="akb069" key="预留金额扣款金额" labelWidth="140"  precision="2" required="true" max="9999999" min="0" readOnly="true" onChange="fnChangeAkb069(this)"/>
			<ta:text id="aaz002" key="业务日志ID" labelWidth="140" readOnly="true" display="false"/>
		</ta:panel>
	
		<ta:panel id="pnlSchool" key="待拨付学校(双击查看应拨付信息)" fit="true">
			<ta:datagrid id="dgSchool" forceFitColumns="true" onRowDBClick="fnDBClick">
				<ta:datagridItem id="aab001" key="单位ID" align="center" hiddenColumn="true"></ta:datagridItem>
				<ta:datagridItem id="aae001" key="年度" align="center" dataAlign="center" width="30" showDetailed="true"></ta:datagridItem>
				<ta:datagridItem id="aae044" key="名称" align="center"  showDetailed="true"></ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
		
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fnSetRedBorder();
	});
	//改变年度查询条件
	function toQuery(){
		/*清空表单 begin*/
		Base.setValue("aaz272", "");
		Base.setValue("aae001", "");
		Base.setValue("aab001", "");
		Base.setValue("aae044", "");
		Base.setValue("akb079", "");
		Base.setValue("akb098", "");
		Base.setValue("akb100", "");
		Base.setValue("akb099", "");
		Base.setValue("akb082", "");
		Base.setValue("akb090", "");
		Base.setValue("akb101", "");
		Base.setValue("akb081", "");
		Base.setValue("akb069", "");
		Base.setValue("aaz002", "");
		/*清空表单 end*/
		
		//置灰保存按钮
		Base.setDisabled('btnSave');
		
		Base.setReadOnly('akb069');
		
		//清空列表
		Base.clearGridData('dgSchool');
		
		Base.submit(
		'aae001_q,aae044_q',
		'studentOutpatientPleAction!toQuery.do');
	}
	//双击列表的行
	function fnDBClick(e,rowdata){
		var aab001 = rowdata.aab001;
		var aae001 = rowdata.aae001;
		Base.submit('',
					'studentOutpatientPleAction!toQueryDetail.do',
					{"dto['aab001']":aab001,"dto['aae001']":aae001});
	}
	
	//点击保存按钮
	function fnSave(){
		Base.setDisabled('btnSave');
		Base.confirm('确定拨付保证金吗?',function(yes,fnCall){
			Base.setEnable('btnSave');
			if(yes){
				Base.submit(
				'form1',
				'studentOutpatientPleAction!toSave.do');
			}
		});
	}
	//改变扣款金额
	function fnChangeAkb069(obj){
		var akb069 = obj.value;//预留金额扣款金额
		var akb090 = Base.getValue('akb090');//预留金额
		var akb101 = Base.getValue('akb101');//预留金额已经拨付金额
		var balance = akb090 - akb101;
		if(balance >= 0){
			if(akb069 > balance){
				Base.setValue('akb069','');
				Base.alert('输入的扣款金额【' + akb069 + '】不能大于预留金额和预留金额已拨付金额的差【' + balance + '】','warn');
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>