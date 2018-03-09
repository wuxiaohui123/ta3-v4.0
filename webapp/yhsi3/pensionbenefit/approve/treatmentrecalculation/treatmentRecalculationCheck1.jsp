<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentRecalculationCheck1</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" hotKey="ctrl+S" key="保存[S]" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:tabs fit="true" id="tabs">
			<ta:tab id="txxx" key="退休信息" cssStyle="overflow:auto;" selected="true">
				<ta:panel id="fld_emp" cols="3" key="基本信息">
					<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
					<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
					<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
					<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
					<ta:date id="aac007" key="参加工作时间" labelWidth="130" readonly="true" />
					<ta:date id="aac049" key="养老参保日期" labelWidth="130" readonly="true" display="false" />
					<ta:selectInput id="aac009" key="户口性质" labelWidth="130" collection="aac009" readOnly="true" display="false" />
					<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="aac012" readOnly="true" />
					<ta:selectInput id="aac013" key="用工形式" labelWidth="130" collection="aac013" readOnly="true" />
					<ta:selectInput id="aac011" key="学历" labelWidth="130" collection="aac011" readOnly="true" display="true" />
					<ta:selectInput id="aac017" key="婚姻状况" labelWidth="130" collection="aac017" readOnly="true" display="false" />
					<ta:text id="aac010" key="户口所在地址" labelWidth="130" readOnly="true" />
					<ta:selectInput id="aac008" key="人员状态" labelWidth="130" collection="aac008" readOnly="true" display="false" />
					<ta:text id="aae005_1" key="联系电话" labelWidth="130" readOnly="true" />
					<ta:text id="aae007_1" key="邮政编码" labelWidth="130" readOnly="true" />
					<ta:selectInput id="yab139" key="参保所属机构" labelWidth="130" collection="yab003" readOnly="true" display="false" />
					<ta:text id="aae006_1" key="地址" labelWidth="130" readOnly="true" span="2" />
					<ta:text id="yab003" key="经办机构ID" readOnly="true" display="false" />
					<ta:text id="aaz157" key="参保明细ID" display="false" />
					<ta:text id="aaz159" key="参保关系ID" display="false" />
				</ta:panel>
				<ta:panel id="rytxxx" cols="3" key="人员退休信息">
					<ta:text id="aae199" key="退休申报单位ID" display="false" readOnly="true" />
					<ta:text id="aae044_1" key="退休申报单位名称" labelWidth="130" readOnly="true" span="2" />
					<ta:selectInput id="aac082" key="离退休登记类型" labelWidth="130" collection="aac082" readOnly="true" display="false" />
					<ta:selectInput id="aic161" key="离退休类别" labelWidth="130" collection="aic161" readOnly="true" />
					<ta:date id="aic162" key="离退休日期" labelWidth="130" showSelectPanel="true" readonly="true" />
					<ta:date id="aae210" key="待遇享受开始年月" labelWidth="130" issue="true" showSelectPanel="true" readonly="true" />
					<ta:date id="aae211" key="待遇核定年月" labelWidth="130" issue="true" showSelectPanel="true" readonly="true" />
					<ta:date id="aae041" key="缴费开始年月" labelWidth="130" issue="true" showSelectPanel="true" readonly="true" />
					<ta:date id="aae042" key="缴费终止年月" labelWidth="130" issue="true" showSelectPanel="true" readonly="true" />
					<ta:number id="aae200" key="视同缴费月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
					<ta:number id="aae201" key="实际缴费月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
					<ta:number id="aae204" key="特殊工种折算月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
					<ta:selectInput id="aac014" key="专业技术职务等级" labelWidth="130" collection="aac014" readOnly="true" />
					<ta:selectInput id="aac015" key="国家职业资格等级" labelWidth="130" collection="aac015" readOnly="true" />
					<ta:selectInput id="aac020" key="行政职务(级别)" labelWidth="130" collection="aac020" readOnly="true" />
					<ta:selectInput id="aac081" key="建国前老工人标志" labelWidth="130" collection="aac081" readOnly="true" />
					<ta:selectInput id="aac085" key="原工商业者标志" labelWidth="130" collection="aac085" readOnly="true" />
					<ta:selectInput id="aac093" key="最高荣誉称号级别" labelWidth="130" collection="aac093" readOnly="true" />
					<ta:date id="aac055" key="参加革命工作日期" labelWidth="130" showSelectPanel="true" readonly="true" />
					<ta:selectInput id="aac064" key="退役军人类别" labelWidth="130" collection="aac064" readOnly="true" />
					<ta:selectInput id="aac065" key="退役军衔级别" labelWidth="130" collection="aac065" readOnly="true" />
					<ta:number id="aac056" key="军龄(月)" labelWidth="130" max="999" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="aae203" key="军龄折算月数" labelWidth="130" max="999" min="0" readOnly="true" alignLeft="true" />
					<ta:selectInput id="yic009" key="特殊贡献表彰类型" labelWidth="130" collection="YIC009" readOnly="true" />
					<ta:selectInput id="yic010" key="计划生育类型" labelWidth="130" collection="YIC010" readOnly="true" />
					<ta:selectInput id="ykc005" key="是否事业单位在编人员" labelWidth="130" collection="YAE230" readOnly="true" />
					<ta:number id="yic380" key="统筹应承担金额" labelWidth="130" max="10000" min="0" display="false" readOnly="true" alignLeft="false" />
					<ta:number id="yic381" key="单位应承担金额" labelWidth="130" max="10000" min="0" display="false" readOnly="true" alignLeft="false" />
					<ta:selectInput id="yic436" key="是否区直转入" labelWidth="130" collection="sfbz" readOnly="true" />
					<ta:selectInput id="chchzhbz" key="重汇账户标识" labelWidth="130" collection="SFBZ" readOnly="true" />
					<ta:text id="aaz261" key="退休行政审批ID" display="false" />
					<ta:textarea id="aae013_1" key="备注" labelWidth="130" span="3" height="40px" maxLength="100" readOnly="true" />
				</ta:panel>
				<ta:panel id="rysnjsinfo" cols="3" key="人员四年基数信息" fit="true" cssStyle="overflow:auto;">
					<ta:datagrid id="rysnjsGrid">
						<ta:datagridItem id="aae001" key="年度" sortable="true" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="yic182" key="计算指数所用基数" sortable="true" width="200" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="rycshdqdyxx" key="待遇信息" cssStyle="overflow:auto;">
				<ta:panel id="xbf" cols="3" key="新办法">
					<ta:text id="aic164_new" key="平均缴费指数" labelWidth="130" readOnly="true" />
					<ta:text id="yic259_new" key="平均工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic250_new" key="指数化月平均缴费工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic292_new" key="个人账户养老金计发月数" labelWidth="130" readOnly="true" />
					<ta:text id="aic240_new" key="基础养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic241_new" key="过渡性养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic242_new" key="个人账户养老金" labelWidth="130" readOnly="true" />
					<ta:text id="yic343_new" key="总额" labelWidth="130" readOnly="true" />
				</ta:panel>
				<ta:panel id="ybf" cols="3" key="原办法">
					<ta:text id="aic164_old" key="平均缴费指数" labelWidth="130" readOnly="true" />
					<ta:text id="yic259_old" key="平均工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic250_old" key="指数化月平均缴费工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic292_old" key="个人账户养老金计发月数" labelWidth="130" readOnly="true" />
					<ta:text id="aic240_old" key="基础养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic241_old" key="过渡性养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic242_old" key="个人账户养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic244_old" key="调节金" labelWidth="130" readOnly="true" />
					<ta:text id="yic343_old" key="总额" labelWidth="130" readOnly="true" />
				</ta:panel>
				<ta:panel id="db" cols="3" key="新、老办法对比">
					<ta:text id="yic272" key="过渡期限高比例" labelWidth="130" readOnly="true" />
					<ta:text id="yic411" key="过渡期调账额" labelWidth="130" readOnly="true" />
				</ta:panel>
				<ta:panel id="zhxx" cols="3" key="个人账户信息">
					<ta:number id="aae238" key="账户本金" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="dwjfhzbj" key="单位缴费划转本金" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="grjfhzbj" key="个人缴费划转本金" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="aae239" key="利息" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="dwjfhzlx" key="单位缴费划转利息" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="grjfhzlx" key="个人缴费划转利息" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="aae240" key="账户总金额" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
				</ta:panel>
				<ta:box cols="2" fit="true">
					<ta:panel id="csqxx" key="重算前待遇信息">
						<ta:datagrid id="csqdyxxGrid" haveSn="true" enableColumnMove="false">
							<ta:datagridItem id="aaa036" key="待遇类别" collection="aaa036" sortable="true" width="180" />
							<ta:datagridItem id="aae041" key="开始年月" width="100" />
							<ta:datagridItem id="aae042" key="终止年月" width="100" />
							<ta:datagridItem id="aae019" key="待遇金额" totals="sum" width="180" />
						</ta:datagrid>
					</ta:panel>
					<ta:panel id="cshxx" key="重算后待遇信息">
						<ta:datagrid id="rydqdyxxGrid" haveSn="true" enableColumnMove="false">
							<ta:datagridItem id="aaa036" key="待遇类别" collection="aaa036" sortable="true" width="150" />
							<ta:datagridItem id="aaa085" key="定期待遇标志" width="90" collection="aaa085" />
							<ta:datagridItem id="aae041" key="开始年月" width="90" />
							<ta:datagridItem id="aae042" key="终止年月" width="90" />
							<ta:datagridItem id="aae129" key="核发金额" totals="sum" width="150" />
						</ta:datagrid>
					</ta:panel>
				</ta:box>
			</ta:tab>
			<ta:tab id="rydybtxx" key="人员待遇补退信息" cssStyle="overflow:hidden;">
				<ta:datagrid id="rydybtxxGrid" haveSn="true" enableColumnMove="false" fit="true" columnFilter="true">
					<ta:datagridItem id="aaa078" key="补扣发标志" width="380" collection="AAA078" sortable="true" align="center" />
					<ta:datagridItem id="aae003" key="补扣年月" width="380" align="center" />
					<ta:datagridItem id="aae129" key="补扣总金额" totals="sum" width="380" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="rynjfzsxxL" key="101号文人员年缴费指数信息(老办法)">
				<ta:datagrid id="rynzsxxGridL" columnFilter="true" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="yic066" key="计算办法" collection="yic066" sortable="true" align="center" />
					<ta:datagridItem id="aae001" key="年度" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="aic078" key="本年应缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="aic079" key="本年实缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="yic182" key="基数" align="center" dataAlign="right" />
					<ta:datagridItem id="yic181" key="工资" align="center" dataAlign="right" />
					<ta:datagridItem id="yic183" key="缴费指数" totals="avg" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="rynjfzsxxX" key="54号文人员年缴费指数信息(新办法)">
				<ta:datagrid id="rynzsxxGridX" columnFilter="true" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="yic066" key="计算办法" collection="yic066" sortable="true" align="center" />
					<ta:datagridItem id="aae001" key="年度" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="aic078" key="本年应缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="aic079" key="本年实缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="yic182" key="基数" align="center" dataAlign="right" />
					<ta:datagridItem id="yic181" key="工资" align="center" dataAlign="right" />
					<ta:datagridItem id="yic183" key="缴费指数" totals="avg" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="ryyjfzsxx" key="人员月缴费指数信息" cssStyle="overflow:hidden;">
				<ta:datagrid id="ryyzsxxGrid" haveSn="true" enableColumnMove="false" fit="true" columnFilter="true">
					<ta:datagridItem id="yic066" key="计算办法" width="240" collection="yic066" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="aae003" key="款费所属期" width="240" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="yic182" key="基数" align="center" width="240" dataAlign="right" />
					<ta:datagridItem id="yic181" key="工资" align="center" width="240" dataAlign="right" />
					<ta:datagridItem id="yic183" key="缴费指数" totals="avg" width="240" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">

	//保存经办信息
	function submitData() {
		Base.submit("form1", "treatmentRecalculationCheck1Action!toSave.do", null, null, null, function(data) {
			null;
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
<script type="text/javascript">
	var div = parent.$("#userwin");
	setTimeout(function() {
		div.window("maximize");
	}, 1)
</script>