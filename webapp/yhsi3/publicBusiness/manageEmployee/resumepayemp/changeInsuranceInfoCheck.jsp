<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>changeInsuranceInfoCheck</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading/>
	<ta:toolbar id="toolbarUnit">
		<ta:button id="btnSave" key="保存[S]" hotKey="ctrl+S" icon="xui-icon-spotSave" onClick="submitData();" asToolBarItem="true"/>
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>			
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestViewGg2.jsp"%>
		</ta:panel>
		<ta:text id="fhjc" display="false" key="复核级次"/>
		<ta:panel id="fltPerson" key="个人基本信息" cols="3" >		  
		    <ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" readOnly="true"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120"/>
			<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="120" readOnly="true"/>
			<ta:selectInput id="aac058" key="证件类型" labelWidth="120" collection="aac058" readOnly="true"/>
			<ta:text id="aac002" key="证件号码" readOnly="true" labelWidth="120"/>
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120"/>
			<ta:text id="aaz002" key="业务日志ID" display="false" />
        </ta:panel>
        <ta:panel id="pnlcheck" fit="true" expanded="false">
	        <ta:tabs id="changeTabs" fit="true">
	        	<ta:tab id="changeTb1" key="经办信息">
						<ta:datagrid id="changeInfoGrid" forceFitColumns="true" groupingBy="aac050" snWidth="30" fit="true">
							<ta:datagridItem id="aac050" key="变更类型" align="center" width="80"
								collectionData="[{'id':'1','name':'暂停缴费','py':'ztjf'},{'id':'2','name':'恢复缴费','py':'hfjf'},{'id':'3','name':'终止缴费','py':'zzjf'},{'id':'4','name':'险种新增','py':'xzxz'},{'id':'5','name':'统筹内转出','py':'tcnzc'},{'id':'6','name':'统筹内转入','py':'tcnzr'}]" />
							<ta:datagridItem id="aab001" key="单位编号" align="center" width="90" />
							<ta:datagridItem id="aae044" key="单位名称" align="center" showDetailed="true" width="160" />
							<ta:datagridItem id="aac001" key="个人编号" align="center" width="90" />
							<ta:datagridItem id="aac003" key="姓名" align="center" showDetailed="true" width="80" />
							<ta:datagridItem id="aae140" key="险种类型" align="center" showDetailed="true" width="180" collection="AAE140" />
							<ta:datagridItem id="aae035" key="变更日期" align="center" dataAlign="center" width="150" />
							<ta:datagridItem id="aae160" key="变更原因" align="center" showDetailed="true" width="220" collection="AAE160" />
							<ta:datagridItem id="aae013" key="备注" align="center" showDetailed="true" width="200" />
							<ta:datagridItem id="aab033" key="征收方式" hiddenColumn="true" />
							<ta:datagridItem id="aac013" key="用工形式" hiddenColumn="true" />
							<ta:datagridItem id="aac066" key="参保身份" hiddenColumn="true" />
							<ta:datagridItem id="ajc050" key="本次参工日期" hiddenColumn="true" />
							<ta:datagridItem id="aac049" key="首次参保年月" hiddenColumn="true" />
							<ta:datagridItem id="aae041" key="开始年月" hiddenColumn="true" />
							<ta:datagridItem id="aaz136" key="基数核定规则参数ID" hiddenColumn="true" />
							<ta:datagridItem id="yaz289" key="征缴规则类型ID" hiddenColumn="true" />
							<ta:datagridItem id="aac030" key="个人参保日期" hiddenColumn="true" />
							<ta:datagridItem id="aac040" key="工资" hiddenColumn="true" />
							<ta:datagridItem id="aaz159" key="人员参保关系ID" hiddenColumn="true" />
						</ta:datagrid>
					</ta:tab>
	        	<ta:tab id="tab_caseInfo" key="事件流程记录">
				    <%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
	        </ta:tabs>
       </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
		Base.setValue('aae013','');
	});
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	//保存单位参保登记信息审核信息
	function submitData(){
		var changeInfoRows = Base.getGridData('changeInfoGrid');
		if(changeInfoRows==''){
			Base.alert('没有经办信息，请核实！','warn');
			return;
		}else{
			Base.submit('form1','changeInsuranceInfoCheckAction!toSave.do');
			Base.setDisabled('btnSave');
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
