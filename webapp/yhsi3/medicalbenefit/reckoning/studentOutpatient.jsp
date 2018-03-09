<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生门诊拨付</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="toQuery()"/>
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="ctrl+S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="panel0" key="查询条件" cols="3">
			<ta:date id="aae001_1" key="年度" dateYear="true" labelWidth="120" showSelectPanel="true" />
		</ta:panel>
		<ta:box id="box1" cols="2" fit="true" >
			<ta:panel id="panel1" key="待拨付学校(双击查询应拨付信息)" height="318" columnWidth="0.3">
				<ta:datagrid id="datagrid1" fit="true" forceFitColumns="true" onRowDBClick="toCountMoney">
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
					<ta:datagridItem id="aae001" key="年度" align="center" dataAlign="center" width="30" />
					<ta:datagridItem id="aae044" key="名称" align="center" dataAlign="left" showDetailed="true" />
				</ta:datagrid>
			</ta:panel>
			<ta:box id="box2" columnWidth="0.7">
				<ta:panel id="panel2" key="拨付信息" cols="3" >
					<ta:date id="aae001" key="年度" dateYear="true" labelWidth="120" showSelectPanel="true" display="false" />
					<ta:text id="aab001" key="单位ID" readOnly="true" labelWidth="120" />
					<ta:text id="aae044" key="名称" readOnly="true" labelWidth="120" span="2" />
					<ta:number id="akb079" key="人次" readOnly="true" labelWidth="120" />
					<ta:number id="akb098" key="包干标准" readOnly="true" labelWidth="120" precision="2" />
					<ta:number id="akb100" key="包干总拨付金额" readOnly="true" labelWidth="120" precision="2" />
					<ta:number id="akb099" key="已经结算支付金额" readOnly="true" labelWidth="120" precision="2" />
					<ta:number id="akb082" key="预留比例" readOnly="true" labelWidth="120" precision="2" />
					<ta:number id="akb090" key="预留金额" readOnly="true" labelWidth="120" precision="2" />
					<ta:number id="akb069" key="统筹审核扣款金额" labelWidth="120" required="true" value="0" precision="2" display="false"/>
					<ta:number id="akb081" key="应支付金额总计" readOnly="true" labelWidth="120" precision="2" />
				</ta:panel>

				
				<ta:panel id="panel3" key="已结算人员信息" height="185px" >
					<ta:datagrid id="datagrid2" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aac001" key="个人编号" hiddenColumn="true" />
						<ta:datagridItem id="aac003" key="姓名" align="center" />
						<ta:datagridItem id="aac002" key="身份证号码" align="center" />
						<ta:datagridItem id="aae030" key="入院时间" align="center" dataAlign="center" dataType="date" />
						<ta:datagridItem id="aae031" key="出院时间" align="center" dataAlign="center" dataType="date" />
						<ta:datagridItem id="akb081" key="报销金额" align="center" dataAlign="right" />
						<ta:dataGridToolPaging url="studentOutpatientAction!toQuery" showButton="false" showCount="false" showExcel="true" showDetails="false" selectExpButtons="3" />
					</ta:datagrid>
				</ta:panel>
			</ta:box>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fnSetRedBorder();
	});
	function toQuery(){
		//清空表单 begin
		Base.setValue("aae001", "");
		Base.setValue("aab001", "");
		Base.setValue("aae044", "");
		Base.setValue("akb079", "");
		Base.setValue("akb098", "");
		Base.setValue("akb100", "");
		Base.setValue("akb099", "");
		Base.setValue("akb082", "");
		Base.setValue("akb090", "");
		Base.setValue("akb081", "");
		//清空表单 end
		
		//清空列表
		Base.clearGridData('datagrid2');
		Base.clearGridData('datagrid1');
		
		//置灰保存按钮
		Base.setDisabled('btnSave');
		
		Base.submit("aae001_1", "studentOutpatientAction!toQuery.do");
	}
	function toCountMoney(e, data){
		Base.setValue('aab001', data.aab001);
		Base.setValue('aae044', data.aae044);
		Base.setValue('aae001', data.aae001);
		Base.submit(null, "studentOutpatientAction!toCountMoney.do?dto.aab001="+data.aab001+"&dto.aae001="+data.aae001);
	}
	function toQueryMoney(){
		if(Base.getValue('aab001') == ""){
			Base.alert("请先选择要拨付的学校", "warn");
			return false;
		}
		Base.submit("panel2", "studentOutpatientAction!toCountMoney.do");
	}
	
	//保存
	function toSave(){
		Base.setDisabled('btnSave');
		Base.confirm("确定要拨付吗?", function(btn, callback) {
			Base.setEnable('btnSave');
			if(btn){
				Base.submit(
				'form1',
				'studentOutpatientAction!toSave.do');
			}
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>