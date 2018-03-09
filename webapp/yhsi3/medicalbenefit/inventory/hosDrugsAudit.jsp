<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>药品目录对码</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"  hotKey="R" asToolBarItem="true" type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj" key="查询条件" cols="3" >
			<ta:box cols="2">
				<ta:text id="akb020" key="医院编码" maxLength="20" labelWidth="120" onChange="getKb01Info()" columnWidth="0.9" />
				<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				  <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="akb021" key="医院名称" readOnly="true" span="2" labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pnlAudit" key="审核信息" cols="3">
			<ta:selectInput id="action" key="审核标志" collection="ACTION" value="1" required="true" filter="0,3" labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pnlDm" key="三目对码已申请信息（双击可查看详细三目对码信息,保存前请勾选数据）" fit="true">
			<ta:datagrid id="dgSmdm" forceFitColumns="true" selectType="checkbox" haveSn="true" fit="true" onRowDBClick="getDetailInfo">
				<ta:datagridItem id="aaz279" key="医疗机构三大目录匹配申请事件ID" hiddenColumn="true" />
				<ta:datagridItem id="aaz002" key="业务日志id" hiddenColumn="true" />
				<ta:datagridItem id="akb020" key="医院编码" hiddenColumn="true" />
				<ta:datagridItem id="akb021" key="医院名称" showDetailed="true" align="center" width="40" />
				<ta:datagridItem id="aae127" key="申请日期" showDetailed="true" align="center" width="20" dataAlign="center" />
				<ta:datagridItem id="aae013" key="备注" showDetailed="true" align="center"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	//rpc回调
	function callbackFunHos() {
		 toQuery();
	};
	
	//查询
	function toQuery(){
	    Base.clearGridData("dgSmdm");
		Base.submit('akb020','hosDrugsAuditAction!toQuery.do');
	}
	
	//双击查看详细三目对码信息
	function getDetailInfo(e,rowdata){
		Base.openWindow("userwin", "本次申请包含的三目对码信息", "hosDrugsAuditAction!toKe11Info.do",
						{"dto['aaz279']":rowdata.aaz279}, '90%', '90%',null,null,true);
	}
	
	//保存
	function toSave() {
		var selectData = Base.getGridSelectedRows("dgSmdm");
		if(selectData == "" || selectData.length < 1){
			Base.alert("请至少选择一行!","warn");
			return;
		}
		if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?", function(btn, callback) {
				if (btn) {
					Base.submit("form1,dgSmdm","hosDrugsAuditAction!toSave.do"); 
				}
			});
		}
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>