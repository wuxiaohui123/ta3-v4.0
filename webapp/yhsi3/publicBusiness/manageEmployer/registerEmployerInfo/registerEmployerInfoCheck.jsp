<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>registerEmployerInfoCheck</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbarUnit">
		<ta:toolbarItem id="btnSave" key="保存[S]" hotKey="alt+S" icon="xui-icon-spotSave" onClick="fnSave();" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" hotKey="alt+C" icon="xui-icon-spotClose" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<ta:text id="fhjc" display="false" key="复核级次" />
		</ta:panel>

		<ta:panel fit="true" hasBorder="false">
			<ta:box id="fld_dwlx" cols="3">
				<ta:selectInput id="yab019" key="单位管理类型" labelWidth="125" collection="YAB019" readOnly="true" />
			</ta:box>
			<ta:panel fit="true" hasBorder="false">
				<ta:tabs id="tbsSI" fit="true">
					<ta:tab id="tbRegistSI" key="单位基本信息" cssStyle="overflow:auto;">
						<ta:box fit="true">
							<ta:panel id="fld_dwxx" key="单位信息" cols="3" >
								<ta:text id="isTab" key="是否被选中tab" display="false" />
								<ta:text id="aae044" key="单位名称" labelWidth="125" span="2" maxLength="100" required="true"  />
								<ta:text id="aab001" key="单位编号" labelWidth="125" readOnly="true" />
								<ta:text id="aab999" key="单位管理码" labelWidth="125" maxLength="20" />
								<ta:text id="yab559" key="单位档案编号" labelWidth="125" maxLength="20" />
								<ta:selectInput id="aab065" key="特殊单位类别" labelWidth="125" required="true" collection="AAB065"/>
								<ta:selectInput id="aaa149" key="行业风险类别" labelWidth="125" required="true" collection="AAA149" />
								<ta:selectInput id="aab022" key="行业代码" labelWidth="125" required="true" collection="AAB022" />
								<ta:selectInput id="aab019" key="单位类型" labelWidth="125" required="true" collection="AAB019" />
		                        <ta:selectInput id="aab021" key="隶属关系" labelWidth="125" required="true" collection="AAB021" />
								<ta:selectInput id="aab020" key="经济类型" labelWidth="125" required="true" collection="AAB020" />
								<ta:selectInput id="aab301" key="所属行政区代码" labelWidth="125" collection="AAB301" />
								<ta:selectInput id="yab243" key="单位所在地" labelWidth="125" display="true" collection="YAB243" />
								<ta:text id="aae045" key="法人代表姓名" required="true" maxLength="50" labelWidth="125" />
								<ta:text id="aae046" key="法人公民身份证号码" validType="idcard" maxLength="18" labelWidth="125" />
								<ta:text id="aae013_unit" key="备注" labelWidth="125" span="3" maxLength="200" />
							</ta:panel>
							<ta:panel id="fld_gsxx" key="成立信息" cols="3"  >
								<ta:text id="aae053" key="组织机构代码" labelWidth="125" bpopTipPosition="bottom" maxLength="10" required="true" bpopTipMsg="10位字符,只能是'-'或数字并且倒数第二位为'-'" />
								<ta:text id="aab023" key="主管部门" labelWidth="125" maxLength="100" />
								<ta:date id="aae047" key="成立日期" labelWidth="125" />
								<ta:text id="aae048" key="批准成立部门" maxLength="100" labelWidth="125" />
								<ta:date id="aae049" key="批准成立日期" labelWidth="125" />
								<ta:text id="aae051" key="批准成立文号" labelWidth="125" maxLength="100" />
							</ta:panel>
							<ta:panel id="fld_swxx" key="联系信息" cols="3"  >
								<ta:text id="aae006" key="地址" labelWidth="125" maxLength="200" required="true" span="2" />
								<ta:text id="aae007" key="邮政编码" labelWidth="125" validType="zipcode" required="true" maxLength="6" />
								<ta:text id="aae004" key="联系人姓名" labelWidth="125" maxLength="60" required="true" />
								<ta:text id="aae005" key="联系电话" labelWidth="125" required="true" validType="mobile" maxLength="20" />						
								<ta:text id="aae159" key="联系电子邮箱" labelWidth="125" validType="email" maxLength="50" />
							</ta:panel>
							<ta:panel id="fld_dwzg" key="专管员信息" cols="3"  >
								<ta:text id="aab016" key="专管员姓名" labelWidth="125" maxLength="60" required="true"/>
								<ta:text id="aab018" key="专管员联系电话" labelWidth="125" validType="mobile" maxLength="20" required="true" />
								<ta:text id="yab237" key="专管员所在部门" labelWidth="125" maxLength="100" />
							</ta:panel>
							<ta:panel id="fld_gsdzxx" key="工商登记信息" cols="3"  >
								<ta:text id="aab007" key="登记执照号码" labelWidth="125" maxLength="50" />
								<ta:date id="aab008" key="登记发照日期" labelWidth="125" />
								<ta:selectInput id="aab006" key="登记执照种类" labelWidth="125" collection="AAB006"  />
								<ta:text id="aab009" key="有效期限（年）" labelWidth="125" validType="number" maxLength="6"/>
							</ta:panel>
							<ta:panel id="fld_swdzxx" key="税务登记信息" fit="true" cols="3"  >
								<ta:selectInput id="yab240" key="地税征收城市" labelWidth="125" collection="AAB301"  />
								<ta:text id="aaz066" key="税务机构ID" labelWidth="125" maxLength="20" bpopTipMsg="可输入税务机构ID、税务机构名称、税号查询" />
								<ta:text id="yae433" key="税务机构名称" labelWidth="125" maxLength="100"/>
								<ta:text id="aab030" key="税号" labelWidth="125" maxLength="20" />
							</ta:panel>
						</ta:box>
					</ta:tab>

					<ta:tab id="tb_dwtb" key="单位参保信息">
						<%@ include file="/yhsi3/commonJSP/xzlx_dw.jsp"%>
						<ta:panel fit="true">
							<ta:tabs id="tbs_xzxx" fit="true">
								<ta:tab id="tab_110" key="企业养老保险" cssStyle="overflow:auto">
									<ta:panel id="cbxx_110" key="参保信息" cols="3" >
										<ta:selectInput id="110_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="110_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="110_yae097" key="最大做账期号" labelWidth="120" required="true" issue="true" />
										<ta:selectInput id="110_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="110_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="110_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="aaz136" />
										<ta:selectInput id="110_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="yaz289" />
									</ta:panel>
									<ta:panel id="dwyhxx_110" key="单位银行帐号" cols="2" >
										<ta:text id="110_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="110_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_110_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_110_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="110_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="110_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_110" key="社保机构银行帐号" cols="2" >
										<ta:text id="110_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="110_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_110_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_110_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_120" key="机关养老保险" cssStyle="overflow:auto">
									<ta:panel id="cbxx_120" key="参保信息" cols="3" >
										<ta:selectInput id="120_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="120_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="120_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="120_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="120_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="120_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="120_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_120" key="单位银行帐号" cols="2" >
										<ta:text id="120_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="120_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_120_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_120_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="120_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="120_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_120" key="社保机构银行帐号" cols="2" >
										<ta:text id="120_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="120_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_120_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_120_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_210" key="失业保险" cssStyle="overflow:auto">
									<ta:panel id="cbxx_210" key="参保信息" cols="3" >
										<ta:selectInput id="210_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="210_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="210_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="210_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="210_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="210_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="210_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_210" key="单位银行帐号" cols="2" >
										<ta:text id="210_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="210_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_210_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_210_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="210_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="210_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_210" key="社保机构银行帐号" cols="2" >
										<ta:text id="210_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="210_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_210_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_210_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_310" key="医疗保险" cssStyle="overflow:auto">
									<ta:panel id="cbxx_310" key="参保信息" cols="3" >
										<ta:selectInput id="310_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="310_aab050" key="参保日期" labelWidth="130" required="true" />
										<ta:date id="310_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="310_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="310_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="310_akc022" key="医疗保险建帐类型" labelWidth="130" required="true" collection="AKC022"/>
										<ta:selectInput id="310_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="310_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_310" key="单位银行帐号" cols="2" >
										<ta:text id="310_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="310_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_310_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_310_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="310_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="310_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_310" key="社保机构银行帐号" cols="2" >
										<ta:text id="310_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="310_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_310_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_310_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_330" key="大额医疗" cssStyle="overflow:auto">
									<ta:panel id="cbxx_330" key="参保信息" cols="3" >
										<ta:selectInput id="330_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="330_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="330_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="330_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="330_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="330_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="330_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_330" key="单位银行帐号" cols="2" >
										<ta:text id="330_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="330_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_330_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_330_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="330_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="330_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_330" key="社保机构银行帐号" cols="2" >
										<ta:text id="330_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="330_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_330_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_330_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_320" key="公务员补助" cssStyle="overflow:auto">
									<ta:panel id="cbxx_320" key="参保信息" cols="3" >
										<ta:selectInput id="320_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="320_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="320_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="320_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="320_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="320_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="320_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_320" key="单位银行帐号" cols="2" >
										<ta:text id="320_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="320_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_320_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_320_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="320_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="320_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_320" key="社保机构银行帐号" cols="2" >
										<ta:text id="320_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="320_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_320_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_320_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_370" key="企业补充" cssStyle="overflow:auto">
									<ta:panel id="cbxx_370" key="参保信息" cols="3" >
										<ta:selectInput id="370_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="370_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="370_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="370_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="370_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="370_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="370_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_370" key="单位银行帐号" cols="2" >
										<ta:text id="370_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="370_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_370_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40"  />
										<ta:text id="dw_370_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="370_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="370_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_370" key="社保机构银行帐号" cols="2" >
										<ta:text id="370_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="370_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_370_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_370_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_340" key="离休" cssStyle="overflow:auto">
									<ta:panel id="cbxx_340" key="参保信息" cols="3" >
										<ta:selectInput id="340_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="340_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="340_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="340_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="340_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="340_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="340_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_340" key="单位银行帐号" cols="2" >
										<ta:text id="340_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="340_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_340_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_340_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="340_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="340_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_340" key="社保机构银行帐号" cols="2" >
										<ta:text id="340_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="340_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_340_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_340_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_350" key="二乙" cssStyle="overflow:auto">
									<ta:panel id="cbxx_350" key="参保信息" cols="3" >
										<ta:selectInput id="350_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="350_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="350_yae097" key="最大做账期号" labelWidth="120" issue="true" required="true" />
										<ta:selectInput id="350_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="350_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="350_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="350_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_350" key="单位银行帐号" cols="2" >
										<ta:text id="350_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="350_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_350_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_350_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="350_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="350_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_350" key="社保机构银行帐号" cols="2" >
										<ta:text id="350_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="350_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_350_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_350_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_410" key="工伤保险" cssStyle="overflow:auto">
									<ta:panel id="cbxx_410" key="参保信息" cols="3" >
										<ta:selectInput id="410_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="410_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="410_yae097" key="最大做账期号" labelWidth="120" required="true" issue="true" />
										<ta:selectInput id="410_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="410_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="410_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="410_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_410" key="单位银行帐号" cols="2" >
										<ta:text id="410_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="30" />
										<ta:text id="410_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_410_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_410_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="410_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="410_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_410" key="社保机构银行帐号" cols="2" >
										<ta:text id="410_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="410_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_410_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_410_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
								<ta:tab id="tab_510" key="生育保险" cssStyle="overflow:auto">
									<ta:panel id="cbxx_510" key="参保信息" cols="3" >
										<ta:selectInput id="510_aae140" key="险种类型" labelWidth="120" collection="AAE140" readOnly="true" display="false" />
										<ta:date id="510_aab050" key="参保日期" labelWidth="120" required="true" />
										<ta:date id="510_yae097" key="最大做账期号" labelWidth="120" required="true" issue="true" />
										<ta:selectInput id="510_aab033" key="征收方式" labelWidth="120" filter="6" collection="AAB033" required="true" />
										<ta:selectInput id="510_aab051" key="单位参保状态" labelWidth="120" collection="AAB051" display="false" />
										<ta:selectInput id="510_aaz136" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
										<ta:selectInput id="510_yaz289" key="征缴规则" labelWidth="120" span="2" required="true" collection="YAZ289" />
									</ta:panel>
									<ta:panel id="dwyhxx_510" key="单位银行帐号" cols="2" >
										<ta:text id="510_aaz065" key="开户银行账号ID" labelWidth="120" maxLength="20" />
										<ta:text id="510_aae044" key="开户银行名称" labelWidth="120" readOnly="true" maxLength="60" />
										<ta:text id="dw_510_aae010" key="银行账号" labelWidth="120" validType="number" maxLength="40" />
										<ta:text id="dw_510_aae009" key="银行户名" labelWidth="120" maxLength="60" />
										<ta:text id="510_yae106" key="协议号" labelWidth="120" maxLength="20" />
										<ta:selectInput id="510_yaf011" key="银行同城异地标志" labelWidth="120" collection="YAF011" />
									</ta:panel>
									<ta:panel id="sbyhxx_510" key="社保机构银行帐号" cols="2" >
										<ta:text id="510_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" />
										<ta:selectInput id="510_aaf002" key="金融行业机构编码" labelWidth="120" readOnly="true" collection="AAF002"  />
										<ta:text id="sb_510_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
										<ta:text id="sb_510_aae009" key="社保机构银行户名" labelWidth="120" maxLength="60" readOnly="true" />
									</ta:panel>
								</ta:tab>
							</ta:tabs>
						</ta:panel>
					</ta:tab>
					<ta:tab id="tb_fzjg" key="事件流程记录" cssStyle="overflow:auto;">
						<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
					</ta:tab>
				</ta:tabs>
			</ta:panel>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		//隐藏控件
		Base.hideObj('cb_110,cb_120,cb_210,cb_310,cb_410,cb_510,tb_110,tb_120,tb_210,tb_310,tb_410,tb_510,tbs_xzxx');
	});

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	//保存单位参保登记信息审核信息
	function fnSave() {
		var aab001 = Base.getValue('aab001');
		if ("" == aab001) {
			Base.alert('没有需要审核的单位参保登记信息！', 'warn');
			return;
		} else {
			Base.submit('form1', 'registerEmployerInfoCheckAction!toSave.do');
			Base.setDisabled('btnSave');
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>