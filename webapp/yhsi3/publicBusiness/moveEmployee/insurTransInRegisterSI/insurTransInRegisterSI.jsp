<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转入登记(省内)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="转入登记[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" enctype="multipart/form-data" methord="post" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人详细信息" id="tab1" cssStyle="overflow:auto;">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<ta:box cols="2">
						<ta:text id="aac001" key="个人编号" labelWidth="180" required="true" maxLength="40" minLength="1" bpopTipMsg="可输入公民身份证号码、姓名及个人编号进行模糊查询" onChange="callRyRPC()" columnWidth="0.9" />
						<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
							<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()" />
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="aac002" key="身份证号" labelWidth="180" readOnly="true" display="true" />
					<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="180" />
					<ta:selectInput id="aac004" key="性别" collection="aac004" readOnly="true" labelWidth="180" />
					<ta:selectInput id="aac005" key="民族" collection="aac005" readOnly="true" labelWidth="180" />
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="180" />
					<ta:date id="aac007" key="参加工作日期" readOnly="true" labelWidth="180" />
					<ta:selectInput id="aae140" key="险种类型" readOnly="true" labelWidth="180" collection="aae140" />
					<ta:selectInput id="aac012" key="个人身份" readOnly="true" collection="aac012" labelWidth="180" />
					<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="180" />
					<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="180" span="2" />
					<ta:selectInput id="aac009" key="户口性质" readOnly="true" labelWidth="180" collection="aac009" />
					<ta:text id="aaz159" key="人员参保关系ID" readOnly="true" labelWidth="180" display="false" />
					<ta:text id="aaz002" key="业务日志ID" readOnly="true" labelWidth="180" display="false" />
					<ta:text id="yae099" key="业务流水号" readOnly="true" labelWidth="180" display="true" />
					<ta:text id="aaz002_ic89" key="联系函业务日志ID" maxLength="50" display="false" />
					<ta:text id="yae099_ic89" key="联系函业务流水号" maxLength="50" display="false" />
					<ta:text id="aaz288" key="征集通知ID" display="false" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" haveSn="true" fit="true">
						<ta:datagridItem id="aac001" key="个人编号" width="100" align="center" dataAlign="center" />
						<ta:datagridItem id="aac003" key="姓名" width="100" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种类型" collection="aae140" width="140" align="center" dataAlign="center" />
						<ta:datagridItem id="aac008" key="个人参保状态" collection="aac008" width="110" align="center" dataAlign="center" />
						<ta:datagridItem id="aac049" key="首次参保年月" width="110" align="center" dataAlign="center" />
						<ta:datagridItem id="aac030" key="系统参保年月" width="110" align="center" dataAlign="center" />
						<ta:datagridItem id="aae206" key="账户建立年月" width="110" align="center" dataAlign="center" />
						<ta:datagridItem id="yae097" key="个人最大做账期号" width="120" align="center" dataAlign="center" />
						<ta:datagridItem id="yab139" key="参保所属机构" collection="yab003" width="180" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="申请信息" id="tab2">
				<ta:panel id="pnlDZXX" key="转移基金登帐信息" expanded="false" scalable="false" height="92">
					<ta:datagrid id="ad12List" enableColumnMove="true" haveSn="true" selectType="radio" border="true" snWidth="30" fit="true">
						<%@ include file="/yhsi3/commonJSP/ad12.jsp"%>
					</ta:datagrid>
				</ta:panel>
				<ta:panel key="联系函信息" cols="3" id="lxh" expanded="false" scalable="false">
					<ta:selectInput id="aac070" key="转移方向" collection="AAC070" readOnly="true" labelWidth="180" />
					<ta:selectInput id="aae173" key="转移类型" collection="AAE173" readOnly="true" labelWidth="180" />
					<ta:text id="aae270" key="联系函编号" maxLength="50" readOnly="true" labelWidth="180" />
					<ta:text id="yac519" key="原个人编号" maxLength="20" readOnly="true" labelWidth="180" />
					<ta:selectInput id="yac250" key="原参保机构行政区划代码" collection="AAB301" maxVisibleRows="10" readOnly="true" labelWidth="180" />
					<ta:text id="yac251" key="原参保机构名称" maxLength="50" readOnly="true" labelWidth="180" />
					<ta:text id="yac252" key="原参保机构联系电话" maxLength="25" readOnly="true" labelWidth="180" />
					<ta:text id="yac253" key="原参保机构地址" maxLength="100" readOnly="true" labelWidth="180" />
					<ta:text id="yac254" key="原参保机构邮编" validType="zipcode" maxLength="6" readOnly="true" labelWidth="180" />
					<ta:text id="yac256" key="原参保地区名称" maxLength="50" readOnly="true" labelWidth="180" />
					<ta:selectInput id="aab299" key="转入地行政区划代码" readOnly="true" collection="AAB301" labelWidth="180" />
					<ta:text id="yac261" key="转入地参保机构名称" display="false" readOnly="true" labelWidth="180" />
					<ta:text id="yae440" key="代办人姓名" maxLength="20" readOnly="true" labelWidth="180" />
					<ta:text id="yae441" key="代办人与转移人员关系" maxLength="20" readOnly="true" labelWidth="180" />
					<ta:text id="yae442" key="代办人电话" maxLength="20" readOnly="true" labelWidth="180" />
					<ta:text id="yae443" key="代办人联系地址" maxLength="100" readOnly="true" labelWidth="180" />
					<ta:text id="yae444" key="代办人邮编" validType="zipcode" maxLength="6" readOnly="true" labelWidth="180" />
					<ta:text id="aaz161" key="人员参保关系转入事件ID" readOnly="true" display="false" labelWidth="180" />
					<ta:text id="aae009" key="户名" readOnly="true" labelWidth="180" />
					<ta:text id="aac078" key="银行账号" readOnly="true" labelWidth="180" />
					<ta:text id="aac080" key="银行行号" readOnly="true" labelWidth="180" />
					<ta:text id="aac155" key="银行名称" readOnly="true" labelWidth="180" />
					<ta:text id="aic113" key="养老保险转移制度方向" display="false" labelWidth="180" />
				</ta:panel>
			</ta:tab>
			<ta:tab key="原参保地接续信息录入" id="tab3" cssStyle="overflow:auto;">
				<ta:panel id="pnlDJXX" key="转入基金登记信息" cols="2" expanded="false" scalable="true">
					<ta:text id="aac003_cw" key="姓名" labelWidth="180" readOnly="true" display="false" />
					<ta:text id="aac002_cw" key="证件号码" labelWidth="180" readOnly="true" display="false" />
					<ta:selectInput id="aae140_cw" key="险种类型" collection="aae140" labelWidth="180" readOnly="true" />
					<ta:text id="yad003" key="财务登帐金额" labelWidth="180" cssInput="color:red" readOnly="true" />
					<ta:date id="aad017" key="登帐时间" labelWidth="180" dateMonth="YYYY-MM-DD" readOnly="true" display="false" />
				</ta:panel>
				<ta:panel id="pnlJXXX" key="原参保地转移接续信息" expanded="false" scalable="true">
					<ta:fieldset key="转移信息" cols="3">
						<ta:date id="zcrq" key="转出日期" required="true" labelWidth="210" showSelectPanel="true" />
						<ta:selectInput id="aae473" key="是否临时账户" collection="yac008" required="true" labelWidth="210" value="0" />
						<ta:text id="zybh" key="转移编号" maxLength="24" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="账户及缴费信息" cols="3">
						<ta:date id="sccbsj" key="首次参保年月" issue="true" required="true" showSelectPanel="true" labelWidth="210" />
						<ta:date id="ddjlgzsj" key="个人账户执行年月" required="true" issue="true" showSelectPanel="true" labelWidth="210" />
						<ta:date id="bz_grjfzzny" key="缴费截止年月" required="true" issue="true" showSelectPanel="true" labelWidth="210" />
						<ta:date id="ddstnxjzsj" key="视同缴费截止年月" issue="true" showSelectPanel="true" labelWidth="210" />
						<ta:date id="dwhrksny" key="单位划入开始年月" issue="true" showSelectPanel="true" labelWidth="210" />
						<ta:date id="grhrksny" key="个人划入开始年月" issue="true" showSelectPanel="true" labelWidth="210" />
						<ta:number id="bz_grzqjfn" key="个人账户前实际缴费年数" max="999" min="0" labelWidth="210" />
						<ta:number id="bz_grzqjfy" key="个人账户前实际缴费月数" max="999" min="0" labelWidth="210" />
						<ta:number id="bz_grjfn" key="个人账户缴费年数" max="999" min="0" labelWidth="210" />
						<ta:number id="bz_grjfy" key="个人账户缴费月数" max="999" min="0" labelWidth="210" />
						<ta:number id="bz_grzdjfn" key="中断缴费年数" max="999" min="0" labelWidth="210" />
						<ta:number id="bz_grzdjfy" key="中断缴费月数" max="999" min="0" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="四年工资信息" cols="3">
						<ta:number id="bz_zqgz92" key="1992年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_zqgz93" key="1993年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_zqgz94" key="1994年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_zqgz95" key="1995年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_zqgz96" key="1996年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_zqgz97" key="1997年缴费工资" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_zqpjzs" key="四年平均缴费指数" max="9999.9999" min="0" precision="4" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="调出调入信息" cols="3">
						<ta:text id="zc_mc" key="调出地社会保险机构名称" maxLength="100" required="true" labelWidth="210" />
						<ta:text id="zr_mc" key="调入地社会保险机构名称" maxLength="100" required="true" labelWidth="210" />
						<ta:text id="dc_aab069" key="调出单位名称" maxLength="100" labelWidth="210" />
						<ta:text id="dr_aab069" key="调入单位名称" maxLength="100" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="截止上年末划入本金利息" cols="3">
						<ta:number id="bz_yic102" key="截止上年末单位划入累计本金" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic104();" labelWidth="210" />
						<ta:number id="bz_yic103" key="截止上年末单位划入累计利息" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic104();" labelWidth="210" />
						<ta:number id="bz_yic104" key="截止上年末单位划入累计本息" max="99999999999999.99" min="0" precision="2" readOnly="true" labelWidth="210" />
						<ta:number id="bz_yic105" key="截止上年末个人划入累计本金" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic107();" labelWidth="210" />
						<ta:number id="bz_yic106" key="截止上年末个人划入累计利息" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic107();" labelWidth="210" />
						<ta:number id="bz_yic107" key="截止上年末个人划入累计本息" max="99999999999999.99" min="0" precision="2" readOnly="true" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="转移当年划入本金利息" cols="3">
						<ta:number id="bz_yic110" key="转移当年单位划入本金" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic112();" labelWidth="210" />
						<ta:number id="bz_yic111" key="转移当年单位划入利息" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic112();" labelWidth="210" />
						<ta:number id="bz_yic112" key="转移当年单位划入本息" max="99999999999999.99" min="0" precision="2" readOnly="true" labelWidth="210" />
						<ta:number id="bz_yic113" key="转移当年个人划入本金" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic115();" labelWidth="210" />
						<ta:number id="bz_yic114" key="转移当年个人划入利息" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic115();" labelWidth="210" />
						<ta:number id="bz_yic115" key="转移当年个人划入本息" max="99999999999999.99" min="0" precision="2" readOnly="true" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="截止97年划入本金利息" cols="3">
						<ta:number id="bz_yic093" key="截止1997年12月单位划入累计本金" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic108();" labelWidth="210" />
						<ta:number id="bz_yic094" key="截止1997年12月单位划入累计利息" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic108();" labelWidth="210" />
						<ta:number id="bz_yic108" key="截止1997年12月单位划入累计本息" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
						<ta:number id="bz_yic095" key="截止1997年12月个人缴费累计本金" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic109();" labelWidth="210" />
						<ta:number id="bz_yic096" key="截止1997年12月个人缴费累计利息" max="99999999999999.99" min="0" precision="2" onChange="fnAddbz_yic109();" labelWidth="210" />
						<ta:number id="bz_yic109" key="截止1997年12月个人缴费累计本息" max="99999999999999.99" min="0" precision="2" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="本年补缴信息" cols="3">
						<ta:number id="bz_yic097" key="本年补历年单位划入本金" max="99999999999999.99" min="0" precision="2" onChange="takeAllMoney();" labelWidth="210" />
						<ta:number id="bz_yic098" key="本年补历年单位划入利息" max="99999999999999.99" min="0" precision="2" onChange="takeAllMoney();" labelWidth="210" />
						<ta:number id="bz_yic099" key="本年补历年个人划入本金" max="99999999999999.99" min="0" precision="2" onChange="takeAllMoney();" labelWidth="210" />
						<ta:number id="bz_yic100" key="本年补历年个人划入利息" max="99999999999999.99" min="0" precision="2" onChange="takeAllMoney();" labelWidth="210" />
						<ta:number id="bz_yic101" key="本年补历年缴费月数" max="999" min="0" labelWidth="210" />
					</ta:fieldset>
					<ta:fieldset key="转出总额" cols="3">
						<ta:number id="grjehj" key="个人账户合计" precision="2" labelWidth="210" />
						<ta:number id="grzhljje" key="个人账户累计金额" precision="2" labelWidth="210" />
						<ta:number id="grzhbj" key="个人账户本金" precision="2" labelWidth="210" />
						<ta:number id="grzhlx" key="个人账户利息" precision="2" labelWidth="210" />
						<ta:number id="bz_yic118" key="统筹基金转移额" max="99999999999999.99" min="0" precision="2" required="true" value="0" labelWidth="210" />
						<ta:number id="zczje" key="转出总金额" precision="2" readOnly="true" labelWidth="210" />
					</ta:fieldset>
				</ta:panel>
			</ta:tab>
			<ta:tab key="历年缴费及个人账户记账信息" id="tab4">
				<ta:panel id="pnl" key="" expanded="false" scalable="ture" fit="true">
					<ta:fieldset>
						<ta:box cols="2">
							<ta:box columnWidth="0.7" height="26">
								<ta:button id="addBtn" key="新增" icon="icon-table_add" onClick="addRow()" />
								<ta:button id="deleteBtn" key="删除" icon="icon-table_delete" onClick="Base.deleteGridSelectedRows('ic91List')" />
								<ta:fileupload key="上传" icon="icon-arrow_up" id="file" submitIds="" url="insurTransInRegisterSIAction!upload.do" />
							</ta:box>
							<ta:box columnWidth="0.3" height="26">
								<div style="width: 15%; padding-left: 0%; padding-top: 7px">
									<a onmouseover="this.style.color = 'RED';" onmouseout="this.style.color = 'rgb(161,161,161)';" id="dto(xzmb)_label" href="insurTransInRegisterSIAction!download.do" style="color: rgb(161, 161, 161); width: 180px;"> <strong> <pre>  >>下载模板<< </pre>
									</strong>
									</a>
								</div>
							</ta:box>
						</ta:box>
					</ta:fieldset>
					<ta:datagrid id="ic91List" snWidth="30" haveSn="true" selectType="checkbox" fit="true">
						<ta:datagridItem id="aab299" key="行政区划" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="text" />
						</ta:datagridItem>
						<ta:datagridItem id="aab300" key="地区名称" maxChart="5" align="center" dataAlign="left" />
						<ta:datagridItem id="aae001" key="年度" maxChart="2" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="2050" min="1950" />
						</ta:datagridItem>
						<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="205012" min="195001" />
						</ta:datagridItem>
						<ta:datagridItem id="aae042" key="终止年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="number" max="205012" min="195001" onChange="fnChangeAae042" />
						</ta:datagridItem>
						<ta:datagridItem id="aae202" key="月数" maxChart="2" align="center" dataAlign="right">
							<ta:datagridEditor type="number" max="12" min="0" />
						</ta:datagridItem>
						<ta:datagridItem id="aae180" key="月缴费基数" maxChart="5" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aaa042" key="单位缴费比例" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="4" max="9999999999.9999" />
						</ta:datagridItem>
						<ta:datagridItem id="aaa043" key="单位划入账户比例" maxChart="8" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="4" max="9999999999.9999" />
						</ta:datagridItem>
						<ta:datagridItem id="aaa041" key="个人缴费比例" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="4" max="9999999999.9999" />
						</ta:datagridItem>
						<ta:datagridItem id="aae381" key="当年记账金额" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aae264" key="其中个人部分" maxChart="6" align="center" dataAlign="right">
							<ta:datagridEditor type="number" precition="2" max="9999999999.99" />
						</ta:datagridItem>
						<ta:datagridItem id="aab191" key="到账年月" maxChart="4" align="center" dataAlign="center">
							<ta:datagridEditor type="issue" max="205012" min="195001" />
						</ta:datagridItem>
						<ta:datagridItem id="aae013" key="备注" maxChart="8" align="center" dataAlign="left" showDetailed="true">
							<ta:datagridEditor type="text" />
						</ta:datagridItem>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus('aac001');
		Base.clearGridData('addlist');
		Base.hideObj('zcxx');
		initializeSuggestFramework(1, "ac01", "aac001", 600, 400, 3, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证		
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransInRegisterSIAction!getEmpInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}

	//典型校验函数					
	//本人首次缴费时间 个人账户建立时间 本地缴费起止时间 默认等于 首次参保地实行个人缴费时间
	function fnAab305() {
		var aab305 = Base.getValue('aab305'); //首次参保地实行个人缴费时间
		if (aab305 != null || aab305 != '') {
			Base.setValue('aac049', aab305); //本人首次缴费时间
			Base.setValue('aac032', aab305); //本人建立个人账户时间
			Base.setValue('aae030', aab305); //在本地缴费起始时间     
			Base.focus('aae031');
		}
	}

	//缴费起止时间校验 且获取缴费总月数
	function fnAae03031() {
		var aae031 = Base.getValue('aae031'); //在本地缴费终止时间 
		var aae030 = Base.getValue('aae030'); //在本地缴费起始时间           
		if ((aae031 != null || aae031 != '') && (aae030 != null || aae030 != '')) {
			if (aae030 > aae031) {
				alert('本地缴费终止时间[' + aae031 + ']早于本地缴费起始时间[' + aae030 + ']!');
				Base.setValue('aae031', '');
				Base.setValue('aae201', '');
				Base.focus('aae031');
				return;
			} else { //201301
				var allMonths = 0;
				var beginYearsOfMonths = parseInt(aae030.substring(0, 4)) * 12 + parseInt(aae030.substring(4, 6));
				var endYearsOfMonths = parseInt(aae031.substring(0, 4)) * 12 + parseInt(aae031.substring(4, 6));
				allMonths = endYearsOfMonths - beginYearsOfMonths + 1;
				Base.setValue('aae201', allMonths);
				Base.focus('aic082');
			}
		}
	}

	//aic102 转移基金总额
	function fnAdd(o) {
		var aic082 = parseFloat(Base.getValue('aic082'));
		var aic083 = parseFloat(Base.getValue('aic083'));
		var aic084 = parseFloat(Base.getValue('aic084'));
		var aic093 = parseFloat(Base.getValue('aic093'));
		var aic089 = parseFloat(Base.getValue('aic089'));
		var allnum = aic082 + aic083 + aic084 + aic093 + aic089;
		Base.setValue('aic102', allnum);
	}

	//报盘导入
	function toInput() {
		Base.submit("form1", "insurTransInRegisterSIAction!check.do");
	}

	//保存
	function toSave() {
		var rowdata = Base.getGridSelectedRows("ic91List");
		var rowdata1 = Base.getGridSelectedRows("ad12List");
		var zcrq = Base.getValue("zcrq");
		var param = {};
		if (rowdata == '' || rowdata == null) {
			Base.alert("请勾选需要保存的信息！");
			return;
		}
		if (zcrq == '' || zcrq == null) {
			alert("转移日期不能为空");
			return;
		}
		param.d2List = Ta.util.obj2string(rowdata);
		param.d12List = Ta.util.obj2string(rowdata1);
		Base.submit("tab1,tab3,tab4", "insurTransInRegisterSIAction!toSave.do", param, null, null, function(data) {
		});
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//个人金额合计
	function takeAllMoney() {
		var bz_yic104 = Base.getValue('bz_yic104');
		var bz_yic107 = Base.getValue('bz_yic107');
		var bz_yic112 = Base.getValue('bz_yic112');
		var bz_yic115 = Base.getValue('bz_yic115');
		var bz_yic097 = Base.getValue('bz_yic097');
		var bz_yic098 = Base.getValue('bz_yic098');
		var bz_yic099 = Base.getValue('bz_yic099');
		var bz_yic100 = Base.getValue('bz_yic100');
		var jehj = new Number(bz_yic104) + new Number(bz_yic107) + new Number(bz_yic112) + new Number(bz_yic115) + new Number(bz_yic097) + new Number(bz_yic098) + new Number(bz_yic099) + new Number(bz_yic100);

		Base.setValue('grjehj', toDecimal(jehj));
		Base.setValue('grzhljje', toDecimal(jehj));
		Base.setValue('zczje', toDecimal(jehj));

		takeAllBJ(); //计算本金
		takeAllLX(); //计算利息
	}

	//本金合计
	function takeAllBJ() {
		var bz_yic102 = Base.getValue('bz_yic102');
		var bz_yic105 = Base.getValue('bz_yic105');
		var bz_yic110 = Base.getValue('bz_yic110');
		var bz_yic113 = Base.getValue('bz_yic113');
		var bz_yic097 = Base.getValue('bz_yic097');
		var bz_yic099 = Base.getValue('bz_yic099');
		var jehj = new Number(bz_yic102) + new Number(bz_yic105) + new Number(bz_yic110) + new Number(bz_yic113) + new Number(bz_yic097) + new Number(bz_yic099);
		Base.setValue('grzhbj', toDecimal(jehj));
	}

	//利息合计
	function takeAllLX() {
		var bz_yic103 = Base.getValue('bz_yic103');
		var bz_yic106 = Base.getValue('bz_yic106');
		var bz_yic098 = Base.getValue('bz_yic098');
		var bz_yic100 = Base.getValue('bz_yic100');
		var jehj = new Number(bz_yic103) + new Number(bz_yic106) + new Number(bz_yic098) + new Number(bz_yic100);
		Base.setValue('grzhlx', toDecimal(jehj));
	}

	function toDecimal(x) {
		var f = parseFloat(x);
		if (isNaN(f)) {
			return;
		}
		f = Math.round(x * 100) / 100;
		return f;
	}

	function fnAddbz_yic104() {
		var bz_yic102 = Base.getValue('bz_yic102');
		var bz_yic103 = Base.getValue('bz_yic103');
		var bz_yic104 = new Number(bz_yic102) + new Number(bz_yic103);
		Base.setValue('bz_yic104', toDecimal(bz_yic104));
		takeAllMoney();
	}

	function fnAddbz_yic107() {
		var bz_yic105 = Base.getValue('bz_yic105');
		var bz_yic106 = Base.getValue('bz_yic106');
		var bz_yic107 = new Number(bz_yic105) + new Number(bz_yic106);
		Base.setValue('bz_yic107', toDecimal(bz_yic107));
		takeAllMoney();
	}

	function fnAddbz_yic112() {
		var bz_yic110 = Base.getValue('bz_yic110');
		var bz_yic111 = Base.getValue('bz_yic111');
		var bz_yic112 = new Number(bz_yic110) + new Number(bz_yic111);
		Base.setValue('bz_yic112', toDecimal(bz_yic112));
		takeAllMoney();
	}

	function fnAddbz_yic115() {
		var bz_yic113 = Base.getValue('bz_yic113');
		var bz_yic114 = Base.getValue('bz_yic114');
		var bz_yic115 = new Number(bz_yic113) + new Number(bz_yic114);
		Base.setValue('bz_yic115', toDecimal(bz_yic115));
		takeAllMoney();
	}

	function fnAddbz_yic108() {
		var bz_yic093 = Base.getValue('bz_yic093');
		var bz_yic094 = Base.getValue('bz_yic094');
		var bz_yic108 = new Number(bz_yic093) + new Number(bz_yic094);
		Base.setValue('bz_yic108', toDecimal(bz_yic108));
	}

	function fnAddbz_yic109() {
		var bz_yic095 = Base.getValue('bz_yic095');
		var bz_yic096 = Base.getValue('bz_yic096');
		var bz_yic109 = new Number(bz_yic095) + new Number(bz_yic096);
		Base.setValue('bz_yic109', toDecimal(bz_yic109));
	}

	function fnAddListInfo() {
		Base.validateForm("addInfo", true);
		var aab300 = Base.getValue('aab300'); //参保地名称
		var aae041 = Base.getValue('aae041'); //开始年月
		var aae042 = Base.getValue('aae042'); //终止年月
		var ys = Base.getValue('ys'); //月数
		var jfgz = Base.getValue('jfgz'); //缴费工资
		var aaa042 = Base.getValue('aaa042'); //单位缴费比例
		var grjf = Base.getValue('grjf'); //个人缴费额
		var aaa041 = Base.getValue('aaa041'); //个人缴费比例
		var dwhb = Base.getValue('dwhb'); //单位划账金额
		var aaa043 = Base.getValue('aaa043'); //单位划账比例
		var aae269 = Base.getValue('aae269'); //当年单位划拨记账利息
		var aae265 = Base.getValue('aae265'); //当年个人记账利息
		var aae382 = Base.getValue('aae382'); //当年个人记账利息
		var aae273 = Base.getValue('aae273'); //当年个人记账利息
		var aae013 = Base.getValue('aae013'); //备注
		var row = {};
		row.aae382 = aae382;
		row.aae273 = aae273;
		row.aab300 = aab300;
		row.aae041 = aae041;
		row.aae042 = aae042;
		row.ys = ys;
		row.jfgz = jfgz;
		row.aaa042 = aaa042;
		row.grjf = grjf;
		row.aaa041 = aaa041;
		row.dwhb = dwhb;
		row.aaa043 = aaa043;
		row.aae269 = aae269;
		row.aae265 = aae265;
		row.aae013 = aae013;
		Base.addGridRowDown('addlist', row);
		Base.setValue('aae041', '');
		Base.setValue('aae042', '');
		Base.setValue('ys', '');
		Base.setValue('jfgz', '');
		Base.setValue('grjf', '');
		Base.setValue('aae265', '');
		Base.setValue('aae382', '');
		Base.setValue('aae273', '');
	}

	function fnDelListInfo() {
		Base.deleteGridSelectedRows('addlist')
	}

	//新增 异步获取比例 传入条件 险种 正确的开始期号 结束期号
	function getInputDetailEditeList() {
		//Base.clearGridData('addlist');   
		var aae041 = Base.getValue('aae041'); //开始年月
		var aae042 = Base.getValue('aae042'); //终止年月			
		var jfgz = Base.getValue('jfgz'); //缴费工资
		var aac001 = Base.getValue('aac001'); //个人编号
		var aaz159 = Base.getValue('aaz159'); //参保关系ID	
		var yab003 = Base.getValue('yab003'); //经办机构		    	   	       
		Base.submit(null, 'insurTransInRegisterSIAction!getInputDetailEditeList.do', {
			"dto['aae041']" : aae041,
			"dto['aae042']" : aae042,
			"dto['jfgz']" : jfgz,
			"dto['aac001']" : aac001,
			"dto['aaz159']" : aaz159,
			"dto['yab003']" : yab003,
			"dto['ys']" : Base.getValue("ys"),
			"dto['aaa043']" : Base.getValue("aaa043"),
			"dto['aaa042']" : Base.getValue("aaa042"),
			"dto['grjf']" : Base.getValue("grjf"),
			"dto['aaa041']" : Base.getValue("aaa041"),
			"dto['dwhb']" : Base.getValue("dwhb"),
			"dto['aae269']" : Base.getValue("aae269"),
			"dto['aae265']" : Base.getValue("aae265"),
			"dto['aae382']" : Base.getValue("aae382"),
			"dto['aae273']" : Base.getValue("aae273"),
			"dto['aae013']" : Base.getValue("aae013")
		}, null, null, function() {
			Base.focus("aae041");
		});
	}

	function fnDelListInfo_1() {
		var tmp_grid = Base.getGridSelectedRows("addlist");
		for (i = 0; i < tmp_grid.length; i++) {
			var aae041 = tmp_grid[i].aae041;
			var aae042 = tmp_grid[i].aae042;
			Base.submit(null, 'insurTransInRegisterSIAction!delDetailEditeList.do', {
				"dto['aae041']" : aae041,
				"dto['aae042']" : aae042,
				"dto['aac001']" : Base.getValue("aac001"),
				"dto['aaz159']" : Base.getValue("aaz159")
			}, null, null, function() {
				Base.focus("aae041");
			});
		}
	}

	//时间校验
	function fnAae041042() {
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		if (aae041 != "") {
			if (aae042 != "") {
				if (aae041.substring(1, 4) != aae042.substring(1, 4)) {
					alert("开始期号与结束期号必须是同一年!");
					Base.setValue("aae042", "");
					Base.focus("aae042");
					return;
				}
				if (aae041 > aae042) {
					alert("开始期号不能晚于结束期号!");
					Base.setValue("aae041", "");
					Base.focus("aae041");
					return;
				}
				Base.setValue("ys", (aae042 - aae041 + 1));
			}
		}
	}

	//校验月数
	function fnys() {
		var ys = Base.getValue("ys");
		if (ys != "") {
			if (parseInt(ys) > 12 || parseInt(ys) <= 0) {
				alert("录入月数错误：月数不能大于12，小于等于0！");
				Base.setValue("ys", "");
				Base.focus("ys");
				return;
			}
		}
	}

	//新增记录
	function addRow() {
		// 检查险种类型、开始年月、结束年月
		Base.addGridRowDown("ic91List", {
			"aab299" : Base.getValue("yac250"),
			"aab300" : Base.getValue("yac256")
		});
	}

	function fnChangeAae042(data, value) {
		var row = data.row + 1;
		var cell = data.cell + 1;
		var rowData = Base.getGridData("ic91List");
		var aae041 = rowData[row - 1].aae041;
		var aae042 = value;

		if ("" == aae041) {
			Base.alert("开始年月不能为空", "warn");
		} else if (aae042.substr(0, 4) != aae041.substr(0, 4)) {
			Base.alert("开始年月和结束年月必须在同一年中", "warn");
		} else {
			if (aae042 < aae041) {
				Base.alert("开始年月不小于结束年月", "warn");
			}
			//var months = (aae042.substr(0,4)-aae041.substr(0,4))*12+(aae042.substr(3,2)-aae041.substr(3,2))+1;
			var months = aae042 - aae041 + 1;
			var para = {
				"aae202" : months
			};
			Base.setGridRowData("ic91List", row, para);
		}
	}

	//双击赋值
	function fnClick(e, rowdata) {
		var yaz160 = rowdata.yaz160;
		var aac001 = rowdata.aac001;
		Base.submit(null, 'insurTransInRegisterSIAction!showInfo.do', {
			"dto['yaz160']" : yaz160,
			"dto['aac001']" : aac001
		});
	}

	/***人员rpc***/
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {
			"dto['inputString']" : Base.getValue('aac001')
		});
	}
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	function fn_setRyData() {
		Base.setReadOnly("aac001");
		Base.submit("from1", "insurTransInRegisterSIAction!getEmpInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
