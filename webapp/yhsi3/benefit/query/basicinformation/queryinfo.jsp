<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center">
			<ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('queryinfo');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form" fit="true">
		<ta:tabs fit="true">
			<ta:tab key="定期待遇信息">
				<ta:panel id="dqdy" key="定期待遇信息" fit="true">
					<ta:datagrid id="dqdyxxGrid" fit="true">
						<ta:datagridItem id="aac002" key="证件号码" width="140" />
						<ta:datagridItem id="aac003" key="姓名" />
						<ta:datagridItem id="aae116" key="待遇发放状态" width="100" collection="AAE116" />
						<ta:datagridItem id="aae211" key="待遇核定年月" width="100" />
						<ta:datagridItem id="aae210" key="待遇应享开始年月" width="120" />
						<ta:datagridItem id="yac001" key="个人最大发放期号" width="120" />
						<ta:datagridItem id="aae235" key="待遇享受终止年月" width="120" />
						<ta:datagridItem id="yae036" key="是否参与调待标志" width="120" collection="YAE036" />
						<ta:datagridItem id="aac063" key="供养亲属标志" width="100" collection="AAC063" />
						<ta:datagridItem id="aaa036" key="待遇项目代码" collection="AAA036" width="140" />
						<ta:datagridItem id="aae041" key="开始年月" />
						<ta:datagridItem id="aae042" key="终止年月" />
						<ta:datagridItem id="aae019" key="金额" formatter="convertState" />
						<ta:datagridItem id="aae211" key="待遇核定年月" width="100" collection="YAE036" />
						<ta:datagridItem id="aae174" key="终止核定年月" width="100" collection="AAC063" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="定期待遇发放信息">
				<ta:panel id="dqdyff" key="定期待遇发放信息" fit="true">
					<ta:datagrid id="dqffxxGrid" fit="true">
						<ta:datagridItem id="aac002" key="证件号码" width="140" />
						<ta:datagridItem id="aac003" key="姓名" />
						<ta:datagridItem id="aaa071" key="社会化发放标志" width="100" collection="AAA071" />
						<ta:datagridItem id="aae145" key="待遇发放方式" width="100" collection="AAE145" />
						<ta:datagridItem id="aae133" key="领取人姓名" />
						<ta:datagridItem id="aac059" key="领取人证件类型" width="100" collection="AAC059" />
						<ta:datagridItem id="aae136" key="领取人证件号码" width="100" showDetailed="true" />
						<ta:datagridItem id="aaf002" key="金融行业机构编码" width="120" collection="AAF002" showDetailed="true" />
						<ta:datagridItem id="dfjgmc" key="代发机构名称" width="100" showDetailed="true" />
						<ta:datagridItem id="aae009" key="户名" showDetailed="true" />
						<ta:datagridItem id="aae010" key="银行账号" showDetailed="true" />
						<ta:datagridItem id="yaf001" key="开户银行名称" width="100" />
						<ta:datagridItem id="yaf013" key="开户银行编号" width="100" />
						<ta:datagridItem id="yaf012" key="开户银行类别" width="100" collection="AAF002" />
						<ta:datagridItem id="aae006" key="地址" showDetailed="true" />
						<ta:datagridItem id="aae007" key="邮政编码" />
						<ta:datagridItem id="aae041" key="开始年月" />
						<ta:datagridItem id="aaa126" key="开户状态标志" width="100" collection="AAA126" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="发放期支付记录">
				<ta:panel id="zfxx" key="待遇支付信息" fit="true">
					<ta:datagrid id="ac82Aae002List" fit="true">
						<ta:datagridItem id="aae002" key="做账期号" sortable="true" showDetailed="true" dataAlign="center" />
						<ta:datagridItem id="aae145" key="发放方式" sortable="true" collection="AAE145" width="170" showDetailed="true" />
						<ta:datagridItem id="aae133" key="领取人姓名" sortable="true" showDetailed="true" width="150" dataAlign="center" />
						<ta:datagridItem id="aaf002" key="银行类别" sortable="true" collection="AAF002" width="150" showDetailed="true" />
						<ta:datagridItem id="aae010" key="银行账号" width="150" showDetailed="true" dataAlign="right" />
						<ta:datagridItem id="aae019" key="金额" totals="sum" showDetailed="true" dataAlign="right" width="130" />
						<ta:datagridItem id="yae112" key="是否统筹待遇" sortable="true" collection="YAE112" width="130" showDetailed="true" />
						<ta:datagridItem id="aae117" key="支付标志" sortable="true" collection="AAE117" width="130" showDetailed="true" />
						<ta:datagridItem id="aae036" key="经办时间" sortable="true" showDetailed="true" dataAlign="center" width="150" />
						<ta:datagridItem id="aae357" key="失败原因" sortable="true" collection="AAE357" showDetailed="true" />
						<ta:datagridItem id="aae006" key="邮寄地址" width="200" showDetailed="true" />
						<ta:datagridItem id="aaz220" key="人员应付计划事件ID" hiddenColumn="true" showDetailed="true" />
						<ta:datagridItem id="aac001" key="个人编号" hiddenColumn="true" showDetailed="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});

	function convertState(row, cell, value, columnDef, dataContext) {
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}
<%--	--%>
	
<%--	function fnClose(){--%>
	
<%--		parent.Base.closeWindow("queryinfoAC82");--%>
	
<%--	}--%>
	
<%--	function clearData(){--%>
	
<%--		Base.clearGridDirty("detailGrid");--%>
	
<%--	}--%>
	
</script>
<%@ include file="/ta/incfooter.jsp"%>