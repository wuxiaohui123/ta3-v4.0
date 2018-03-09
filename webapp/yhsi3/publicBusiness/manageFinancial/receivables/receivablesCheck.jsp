<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>receivablesCheck</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body  >
	<ta:pageloading />
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
	    <ta:toolbar id="tlb">
		    <ta:buttonLayout align="center" span="3">
		       <ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S"  onClick="submitData()" asToolBarItem="true"/>
		       <ta:toolbarItemSeperator />
		       <ta:button id="closeBtn" key="关闭[C]" hotKey="C" icon="xui-icon-spotClose" onClick="closeUnitWin();" asToolBarItem="true"/>
		    </ta:buttonLayout>
		</ta:toolbar>		
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>	
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>	
		<ta:text id="fhjc" key="当前复核级次"  display="false"/>
		<ta:tabs id="tabsPersonWage" height="370">
			<ta:tab id="tabWageInfo" key="单据信息">
			   <ta:panel id="pnlInfo" key="查询结果(待处理单据)" height="150">
				<ta:datagrid id="danjuGrid" fit="true" forceFitColumns="true"  haveSn="true" onRowDBClick="">
			       <ta:datagridItem id="aaz002" key="业务日志ID" align="center" width="120"></ta:datagridItem>
			       <ta:datagridItem id="aaz288" key="征集单ID" align="center" width="100"/>
			       <ta:datagridItem id="aaz010" key="当事人ID" align="center" width="100"/>
			       <ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" width="200"/>
			       <ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" width="100" totals="sum"/>
			       <ta:datagridItem id="aae011" key="经办人" align="center" width="70" collection="aae011"></ta:datagridItem>
				   <ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="130"></ta:datagridItem>
				   <ta:datagridItem id="yab003" key="经办机构" collection="aab301" align="center" width="100"></ta:datagridItem>
				   <ta:datagridItem id="aae013" key="备注" align="center" width="180" showDetailed="true"/>
			    </ta:datagrid>
			    </ta:panel>
			    <ta:text id="aaz010" key="当事人ID" display="false"/>
			    <ta:panel id="pnl2" key="登帐信息" height="160">
				    <ta:datagrid id="infoGrid"  fit="true"  snWidth="30" haveSn="true">
					    <ta:datagridItem id="aad005" key="收款结算类型" align="center" dataAlign="left" width="130" collection="AAD005"/>
						<ta:datagridItem id="yad003" key="收款金额" dataAlign="right" align="center" width="120" totals="sum"/>
						<ta:datagridItem id="aad017" key="收款时间" align="center" width="120" dataAlign="center"/>
						<ta:datagridItem id="aad009" key="缴费凭证编号" showDetailed="true" align="center" width="140" dataAlign="left"/>
						<ta:datagridItem id="yaf010" key="社保机构银行帐号ID"  align="center" width="140" hiddenColumn="false"/>
						<ta:datagridItem id="yae819" key="是否立即实收分配"  align="center" width="140" hiddenColumn="false" collectionData="[{'id':'0','name':'不立即分配'},{'id':'1','name':'立即分配'}]"/>
						<ta:datagridItem id="yae597" key="开户银行名称"  align="center" width="140" hiddenColumn="false"/>
						<ta:datagridItem id="aae010" key="社保机构银行账号"  align="center" width="140" hiddenColumn="false"/>
						<ta:datagridItem id="aae009" key="社保机构银行户名"  align="center" width="140" hiddenColumn="false"/>
						<ta:datagridItem id="aae008" key="银行编号"  align="center" width="140" hiddenColumn="false"/>
						<ta:datagridItem id="yad158" key="征集套账类型——dataGrid"  align="center" width="140" hiddenColumn="false"/>
						<ta:datagridItem id="yad158_m" key="征集套账类型——rpc"  align="center" width="140" hiddenColumn="false"/>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tabCaseRecord" key="事件流程记录">
				 <%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
$(document).ready(function () {
	$("body").taLayout();
	
	$("form").css("overflow","auto");
	$("body").css("overflow","hidden");
});
	
//保存经办信息
function submitData(){
	Base.submit("form1","receivablesCheckAction!toSave.do",null,null,null,function(data){
		Base.setDisabled("btnSave");
		});
}

//关闭窗口
function closeUnitWin(){
    parent.Base.closeWindow('userwin');
}
</script>
<%@ include file="/ta/incfooter.jsp"%>