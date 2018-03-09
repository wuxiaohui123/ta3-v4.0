<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>个人医保信息综合查询</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="toQuery()" />
			<ta:button id="resetBtn" key="重置[R]" type="resetPage" asToolBarItem="true" icon="xui-icon-spotReset" hotKey="R" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel id="fieldset1" key="查询条件" cols="3">
				<ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="120" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="hosSmallBtn" key="?" onClick="showPersonWindow()" />
				   </ta:buttonLayout>
			    </ta:box>
				<ta:text id="aac003" key="姓名"   readOnly="true" labelWidth="120"/>
				<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120"/>
			</ta:panel>
			<ta:panel id="panel1" fit="true">
				<ta:tabs id="tabs1" fit="true">
					<ta:tab key="个人参保信息" id="tab2">
						<ta:panel id="cbinfo" key="参保信息" fit="true">
						<ta:datagrid id="ac20List" haveSn="true" fit="true" >
							<ta:datagridItem id="aac001" align="center" key="个人编号" width="100" showDetailed="true"/>
							<ta:datagridItem id="aae140" align="center" key="险种类型" width="160" collection="AAE140" showDetailed="true"/>
							<ta:datagridItem id="aac008" align="center" key="参保状态" width="80" collection="AAC008" showDetailed="true"/>
							<ta:datagridItem id="aac030" align="center" key="参保日期" width="80"  showDetailed="true"/>
							<ta:datagridItem id="aae041" align="center" key="开始年月" width="90" dataAlign="center" showDetailed="true"/>
							<ta:datagridItem id="aae042" align="center" key="终止年月" width="90" dataAlign="center" showDetailed="true"/>
							<ta:datagridItem id="ykc005" key="特殊人员类型" align="center" dataAlign="center" maxChart="5" collection="YKC005"/>
							<ta:datagridItem id="ykc006" key="特殊人员类别" align="center" dataAlign="center" maxChart="5" collection="YKC006"/>
							<ta:datagridItem id="yac084" key="离退休标识" align="center" dataAlign="center" maxChart="5" collection="YAC084"/>
							<ta:datagridItem id="aic161" key="退休类别" align="center" dataAlign="center" maxChart="5" collection="AIC161"/>
							<ta:datagridItem id="aic162" key="退休日期" align="center" dataAlign="center" maxChart="8"/>
							<ta:datagridItem id="dyxs" key="待遇信息" align="center" dataAlign="center" maxChart="8"></ta:datagridItem>
							<ta:datagridItem id="jfz" key="缴费至" align="center" dataAlign="center" maxChart="3" />
							<ta:datagridItem id="jfy" key="缴费月" align="center" dataAlign="center" maxChart="3" />
							<ta:datagridItem id="yae097" align="center" key="最大做账期号" width="110" showDetailed="true" dataAlign="center"/>
							<ta:datagridItem id="aab001" align="center" key="单位编号" width="100" showDetailed="true" />
							<ta:datagridItem id="aab004" align="center" key="单位名称" width="180" showDetailed="true"/>
							<ta:datagridItem id="yab139" align="center" key="参保所属机构" width="130" collection="AAB301" showDetailed="true"/>
						</ta:datagrid>
						</ta:panel>
					</ta:tab>
					<ta:tab key="个人缴费信息" id="tab3">
						<ta:tabs id="jftabs" fit="true">
							<ta:tab id="jbjftab" key="基本医疗" selected="true">
								<ta:datagrid id="ac43a1List_jb" haveSn="true" fit="true"  forceFitColumns="true">
									<ta:datagridItem id="aae003" align="center" key="缴费年月" width="100" showDetailed="true"  sortable="true"/>
									<ta:datagridItem id="aae079" align="center" key="到账日期" width="100" showDetailed="true"  dataAlign="center" sortable="true"/>
									<ta:datagridItem id="aac040" align="center" key="工资"     width="80"   showDetailed="true"  dataType="number"  sortable="true"/>
									<ta:datagridItem id="aae180" align="center" key="缴费基数" width="100"   showDetailed="true"  dataType="number"  sortable="true"/>
									<ta:datagridItem id="aaa115" align="center" key="应缴类型" width="130" collection="AAA115" showDetailed="true"  sortable="true"/>
									<ta:datagridItem id="aae078" align="center" key="到账标志" width="130" collection="AAE078" showDetailed="true"  sortable="true"/>
									<ta:datagridItem id="yac084" align="center" key="离退休标志" width="100" collection="YAC084" showDetailed="true" sortable="true"/>
									<ta:datagridItem id="yae589" align="center" key="冲销标志" width="100" collection="YAE589" showDetailed="true" sortable="true"/>
									<ta:datagridItem id="aab001" align="center" key="单位编号" width="100" showDetailed="true" sortable="true"/>
									<ta:datagridItem id="aab004" align="center" key="单位名称" width="130" showDetailed="true" sortable="true"/>
									<ta:datagridItem id="yab139" align="center" key="参保所属机构" width="130" collection="AAB301" showDetailed="true"/>
									<ta:datagridItem id="yaz289" align="center" key="征缴规则" width="130" collection="YAZ289" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="jmjftab" key="居民医疗">
								<ta:datagrid id="ac43a1List_jm" haveSn="true" fit="true" forceFitColumns="true">
									<ta:datagridItem id="aae001" align="center" key="年度" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae041" align="center" key="开始年月" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae042" align="center" key="终止年月" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae201" align="center" key="缴费月数" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae079" align="center" key="到账日期" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aaa115" align="center" key="应缴类型" width="130" collection="AAA115" showDetailed="true"/>
									<ta:datagridItem id="aae078" align="center" key="到账标志" width="130" collection="AAE078" showDetailed="true"/>
									<ta:datagridItem id="yac084" align="center" key="离退休标志" width="100" collection="YAC084" showDetailed="true"/>
									<ta:datagridItem id="yae589" align="center" key="冲销标志" width="100" collection="YAE589" showDetailed="true"/>
									<ta:datagridItem id="aab001" align="center" key="单位编号" width="100" showDetailed="true"/>
									<ta:datagridItem id="aab004" align="center" key="单位名称" width="130" showDetailed="true"/>
									<ta:datagridItem id="aab019" align="center" key="单位类型" width="130" collection="AAB019" showDetailed="true"/>
									<ta:datagridItem id="aab020" align="center" key="经济类型" width="130" collection="AAB020" showDetailed="true" hiddenColumn="true"/>
									<ta:datagridItem id="yab139" align="center" key="参保所属机构" width="130" collection="AAB301" showDetailed="true"/>
								    <ta:datagridItem id="yaz289" align="center" key="征缴规则" width="130" collection="YAZ289" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="dejftab" key="大额医疗">
								<ta:datagrid id="ac43a1List_de" haveSn="true" fit="true" forceFitColumns="true">
									<ta:datagridItem id="aae079" align="center" key="到账日期" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae001" align="center" key="年度" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aaa115" align="center" key="应缴类型" width="130" collection="AAA115" showDetailed="true"/>
									<ta:datagridItem id="aae078" align="center" key="到账标志" width="130" collection="AAE078" showDetailed="true"/>
									<ta:datagridItem id="yac084" align="center" key="离退休标志" width="100" collection="YAC084" showDetailed="true"/>
									<ta:datagridItem id="yae589" align="center" key="冲销标志" width="100" collection="YAE589" showDetailed="true"/>
									<ta:datagridItem id="aab001" align="center" key="单位编号" width="100" showDetailed="true"/>
									<ta:datagridItem id="aab004" align="center" key="单位名称" width="130" showDetailed="true"/>
									<ta:datagridItem id="yab139" align="center" key="参保所属机构" width="130" collection="AAB301" showDetailed="true"/>
								    <ta:datagridItem id="yaz289" align="center" key="征缴规则" width="130" collection="YAZ289" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="gwyjftab" key="公务员医疗">
								<ta:datagrid id="ac43a1List_gwy" haveSn="true" fit="true" forceFitColumns="true">
									<ta:datagridItem id="aae002" align="center" key="做账期号" width="100" showDetailed="true"/>
									<ta:datagridItem id="aae003" align="center" key="对应费款所属期" width="100" showDetailed="true" />
									<ta:datagridItem id="aae079" align="center" key="到账年月" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae001" align="center" key="年度" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aaa115" align="center" key="应缴类型" width="130" collection="AAA115" showDetailed="true"/>
									<ta:datagridItem id="aae078" align="center" key="到账标志" width="130" collection="AAE078" showDetailed="true"/>
									<ta:datagridItem id="yac084" align="center" key="离退休标志" width="100" collection="YAC084" showDetailed="true"/>
									<ta:datagridItem id="yae589" align="center" key="冲销标志" width="100" collection="YAE589" showDetailed="true"/>
									<ta:datagridItem id="aab001" align="center" key="单位编号" width="100" showDetailed="true"/>
									<ta:datagridItem id="aab004" align="center" key="单位名称" width="130" showDetailed="true"/>
									<ta:datagridItem id="yab139" align="center" key="参保所属机构" width="130" collection="AAB301" showDetailed="true"/>
								    <ta:datagridItem id="yaz289" align="center" key="征缴规则" width="130" collection="YAZ289" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="lxjftab" key="离休、二乙、老红军医疗">
								<ta:datagrid id="ac43a1List_lx" haveSn="true" fit="true" forceFitColumns="true">
									<ta:datagridItem id="aae002" align="center" key="做账期号" width="100" showDetailed="true"/>
									<ta:datagridItem id="aae003" align="center" key="对应费款所属期" width="100" showDetailed="true" />
									<ta:datagridItem id="aae079" align="center" key="到账年月" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aae001" align="center" key="年度" width="100" showDetailed="true" dataAlign="center"/>
									<ta:datagridItem id="aaa115" align="center" key="应缴类型" width="130" collection="AAA115" showDetailed="true"/>
									<ta:datagridItem id="aae078" align="center" key="到账标志" width="130" collection="AAE078" showDetailed="true"/>
									<ta:datagridItem id="yac084" align="center" key="离退休标志" width="100" collection="YAC084" showDetailed="true"/>
									<ta:datagridItem id="yae589" align="center" key="冲销标志" width="100" collection="YAE589" showDetailed="true"/>
									<ta:datagridItem id="aab001" align="center" key="单位编号" width="100" showDetailed="true"/>
									<ta:datagridItem id="aab004" align="center" key="单位名称" width="130" showDetailed="true"/>
									<ta:datagridItem id="yab139" align="center" key="参保所属机构" width="130" collection="AAB301" showDetailed="true"/>
								    <ta:datagridItem id="yaz289" align="center" key="征缴规则" width="130" collection="YAZ289" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
						</ta:tabs>
					</ta:tab>
					<ta:tab key="个人结算信息" id="tab4">
						<ta:tabs id="jsinfo" fit="true">
							<ta:tab id="zyinfo" key="在院信息" >
								<ta:datagrid id="kc21List"  haveSn="true" fit="true" onRowDBClick="clickfn">
									<ta:datagridItem id="yka032" align="center" key="支付地点" width="100" collection="YKA032" showDetailed="true"/>
									<ta:datagridItem id="aka130" align="center" key="医疗支付类别" width="100" collection="AKA130" showDetailed="true"/>
									<ta:datagridItem id="aae030" align="center" key="开始日期" width="100" dataType="date" dataAlign="center" showDetailed="true"/>
									<ta:datagridItem id="akb021" align="center" key="医疗机构名称" width="180" showDetailed="true"/>
									<ta:datagridItem id="aae019" align="center" key="医疗发生费用" width="120" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="akc228" align="center" key="全自费金额" width="120" dataAlign="right" showDetailed="true"    dataType="number" sortable="true"/>
									<ta:datagridItem id="akc268" align="center" key="超限价自费金额" width="120" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="yka318" align="center" key="先行自付金额" width="120" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="yka319" align="center" key=" 符合范围部分" width="120" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="aaz217" align="center" key="就诊事件ID" width="130" hiddenColumn="true" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="cyinfo" key="结算信息" >
								<ta:datagrid id="kc24List"  haveSn="true" fit="true" onRowDBClick="clickfn">
									<ta:datagridItem id="yka032" align="center" key="支付地点" width="100" collection="YKA032" showDetailed="true"/>
									<ta:datagridItem id="aka130" align="center" key="医疗支付类别" width="100" collection="AKA130" showDetailed="true"/>
									<ta:datagridItem id="aae030" align="center" key="开始日期" width="100" dataType="date" dataAlign="center" showDetailed="true"/>
									<ta:datagridItem id="aae031" align="center" key="结束日期" width="100" dataType="date" dataAlign="center" showDetailed="true"/>
									<ta:datagridItem id="akb021" align="center" key="医疗机构名称" width="180" showDetailed="true"/>
									<ta:datagridItem id="akc264" align="center" key="医疗费总额" width="100" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="akc228" align="center" key="全自费金额" width="100" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="akb081" align="center" key="实际支付金额" width="110"  dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="ake034" align="center" key="个人帐户支出" width="110" dataAlign="right" showDetailed="true"   dataType="number" sortable="true"/>
									<ta:datagridItem id="ake039" align="center" key="基本医疗支出" width="110"  dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="ake029" align="center" key="大额医疗支出" width="110"  dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="ake035" align="center" key="公补医疗支出" width="110"  dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="ake041" align="center" key="居民医疗支出" width="110"  dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="ake042" align="center" key="老红军医疗支出" width="130"  dataAlign="right" showDetailed="true" dataType="number" sortable="true"/>
									<ta:datagridItem id="ake043" align="center" key="离休医疗支出" width="110" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="ake032" align="center" key="二乙医疗支出" width="110" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
									<ta:datagridItem id="yke055" align="center" key="厅级干部支出" width="110" dataAlign="right" showDetailed="true" dataType="number" sortable="true"/>
									<ta:datagridItem id="ake013" align="center" key="报销原因" width="130" collection="AKE013" showDetailed="true"/>
									<ta:datagridItem id="aae011" align="center" key="经办人" width="100" showDetailed="true"/>
									<ta:datagridItem id="ykc141" align="center" key="经办人姓名" width="100" showDetailed="true"/>
									<ta:datagridItem id="aae036" align="center" key="经办时间" width="160" dataType="datetime" dataAlign="center" showDetailed="true" sortable="true"/>
									<ta:datagridItem id="yab003" align="center" key="经办机构" width="150" collection="YAB003" showDetailed="true"/>
									<ta:datagridItem id="aac001" align="center" key="个人编号" width="100" hiddenColumn="true" showDetailed="true"/>
									<ta:datagridItem id="aac003" align="center" key="姓名" width="80" hiddenColumn="true" showDetailed="true"/>
									<ta:datagridItem id="aac002" align="center" key="身份证号" width="150" hiddenColumn="true" showDetailed="true"/>
									<ta:datagridItem id="aaz217" align="center" key="就诊事件ID" width="130" hiddenColumn="true" showDetailed="true"/>
									<ta:datagridItem id="aaz216" align="center" key="结算事件ID号" width="130" hiddenColumn="true" showDetailed="true"/>
								</ta:datagrid>
							</ta:tab>
						</ta:tabs>
					</ta:tab>
					<ta:tab key="个人账户信息" id="tab5">
						<ta:panel id="zhinfo" key="账户信息" fit="true">
						<ta:datagrid id="ac55k1List"  haveSn="true" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aae140" align="center" key="险种类型" width="100" showDetailed="true"  collection="YL140"/>
							<ta:datagridItem id="yka032" align="center" key="支付地点" width="100" collection="YKA032" showDetailed="true" sortable="true"/>
							<ta:datagridItem id="aka130" align="center" key="医疗类别" width="130" collection="AKA130" showDetailed="true" sortable="true"/>
							<ta:datagridItem id="akb021" align="center" key="医疗机构名称" width="160" showDetailed="true"/>
							<ta:datagridItem id="aaa097" align="center" key="收支类型" width="100" collection="AAA097" showDetailed="true"/>
							<ta:datagridItem id="yke132" align="center" key="收入" width="80" collection="AKE013" dataAlign="right" showDetailed="true" sortable="true"/>
							<ta:datagridItem id="yke134" align="center" key="支出" width="80" dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
							<ta:datagridItem id="aae240" align="center" key="余额" width="100"  dataAlign="right" showDetailed="true"  dataType="number" sortable="true"/>
							<ta:datagridItem id="aae036" align="center" key="经办时间" width="150"  dataAlign="center" showDetailed="true"  sortable="true"/>
						</ta:datagrid>
						</ta:panel>
					</ta:tab>
					<ta:tab key="个人基本信息" id="tab1" >
					<ta:panel id="fldryxx" key="人员信息" cols="3">
						<ta:text id="aac001_1" key="人员ID" readOnly="true" labelWidth="120" display="false"/>
						<ta:text id="aac003_1" key="姓名" readOnly="true" labelWidth="120" display="false"/>
						<ta:selectInput id="aac004" key="性别" readOnly="true" collection="AAC004" labelWidth="120"/>
						<ta:selectInput id="aac058" key="证件类型" readOnly="true" collection="AAC058" labelWidth="120"/>
						<ta:text id="aac002_1" key="证件号码" readOnly="true" labelWidth="120"  display="false" />
						<ta:text id="yke112" key="年龄" readOnly="true" labelWidth="120"/>
						<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120"/>
						<ta:date id="aac007" key="参加工作日期" readOnly="true" labelWidth="120"/>
						<ta:selectInput id="aac012" key="个人身份" readOnly="true" collection="AAC012" labelWidth="120"/>
						<ta:selectInput id="aja004" key="农民工标示" readOnly="true" collection="AJA004" labelWidth="120" display="false"/>
						<ta:selectInput id="yac011" key="国籍" readOnly="true" collection="YAC011" labelWidth="120" display="false"/>
						<ta:selectInput id="aac005" key="民族" readOnly="true" collection="AAC005" labelWidth="120"/>
						<ta:selectInput id="aac011" key="学历" readOnly="true" collection="AAC011" labelWidth="120"/>
						<ta:selectInput id="aac017" key="婚姻状况" readOnly="true" collection="AAC017" labelWidth="120"/>
						<ta:selectInput id="aac016" key="就业状态" readOnly="true" collection="AAC016" labelWidth="120"/>
						<ta:selectInput id="aac033" key="健康状况" readOnly="true" collection="AAC033" labelWidth="120" display="false"/>
						<ta:selectInput id="aab301" key="所属行政区代码" readOnly="true" collection="AAB301" labelWidth="120"/>
						<ta:text id="yac995"  key="医保老编号"  readOnly="true"  labelWidth="120"/>
						<ta:number id="aae240" key="个人账户余额" readOnly="true" labelStyle="color:blue" precision="2" labelWidth="120"/>
						<ta:selectInput id="akc021" key="人员性质" readOnly="true" collection="AKC021" labelWidth="120"/>
						<ta:text id="aae013" key="备注" readOnly="true" labelWidth="120" span="1"/>
					</ta:panel>
					<!--  
					<ta:panel id="fldry" key="荣誉信息" cols="3">
						<ta:selectInput id="aac014" key="专业技术职务等级" readOnly="true" collection="AAC014" labelWidth="120" />
						<ta:selectInput id="aac015" key="国家职业资格等级" readOnly="true" collection="AAC015" labelWidth="120" />
						<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120"/>
					</ta:panel>
					-->
					<ta:panel id="unitInfo" key="单位信息" cols="3">
						<ta:text id="aab001" key="单位编号" labelWidth="120" readOnly="true"/>
						<ta:text id="aab003" key="单位名称" labelWidth="120" span="2" readOnly="true"/>
					</ta:panel>
					<ta:panel id="fldlx" key="联系信息" cols="3">
						<ta:text id="aae004" key="联系人姓名" readOnly="true" labelWidth="120"/>
						<ta:text id="aae005" key="联系电话" readOnly="true" labelWidth="120"/>
						<ta:text id="yae107" key="移动电话" readOnly="true" labelWidth="120"/>
						<ta:text id="aae159" key="联系电子邮箱" readOnly="true" labelWidth="120"/>
						<ta:text id="aae007" key="邮政编码" readOnly="true" labelWidth="120"/>
						<ta:text id="aae006" key="地址" readOnly="true" labelWidth="120" span="1"/>
					</ta:panel>
					<ta:panel id="fldlx" key="户籍信息" cols="3">
						<ta:text id="aab401" key="户口簿编号" readOnly="true" labelWidth="120"/>
						<ta:selectInput id="aac009" key="户口性质" readOnly="true" collection="AAC009" labelWidth="120"/>
						<ta:text id="aac010" key="户口所在地址" readOnly="true" labelWidth="120"/>
						<ta:selectInput id="aac060" key="生存状态" readOnly="true" collection="AAC060" labelWidth="120" display="false"/>
						<ta:selectInput id="yac557" key="人员有效标志" readOnly="true" collection="YAC557" labelWidth="120" display="false"/>
						<ta:selectInput id="yae248" key="数据来源" readOnly="true" collection="YAE248" labelWidth="120" display="false"/>
					</ta:panel>
					</ta:tab>
					<ta:tab id="tab6" key="基本信息变更">
					<ta:datagrid id="datagrid2" haveSn="true" fit="true"
						forceFitColumns="true">
						<ta:datagridItem id="aac001" key="个人编号" align="center" width="80"
							sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="aac003" key="姓名" align="center" width="80"
							sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="yac104" key="变更类型" width="100" align="center"
							collection="YAC014" sortable="true" />
						<ta:datagridItem id="aae160" key="变更原因" width="100" align="center"
							collection="AAE160" dataAlign="true" sortable="true" />
						<ta:datagridItem id="aae035" key="变更日期" width="100" align="center"
							dataAlign="true" sortable="true" dataType="date" />
						<ta:datagridItem id="aae157" key="所在表" width="100" align="center"
							collection="AAE122" sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="yae141" key="所在表中文含义" width="140"
							align="center" sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="aae122" key="变更项目" width="100" align="center"
							collection="AAE122" sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="aae155" key="变更项目中文含义" width="140"
							align="center" sortable="true" />
						<ta:datagridItem id="aae123" key="变更前信息" width="100"
							align="center" sortable="true" />
						<ta:datagridItem id="aae124" key="变更后信息" width="100"
							align="center" sortable="true" />
						<ta:datagridItem id="aae011" key="经办人" width="100"
							collection="aae011" align="center" sortable="true" />
						<ta:datagridItem id="aae036" key="经办时间" width="100" align="center"
							dataAlign="true" sortable="true" />
						<ta:datagridItem id="yab003" key="经办所属机构" width="100"
							collection="aab301" align="center" sortable="true" />
						<ta:datagridItem id="aae013" key="备注" width="100" align="center"
							dataAlign="true" sortable="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab7" key="参保信息变更">
					<ta:datagrid id="datagrid3" haveSn="true" fit="true">
						<ta:datagridItem id="aac001" key="个人编号" align="center" width="80"
							sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="aac003" key="姓名" align="center" width="80"
							sortable="true" hiddenColumn="true" />
						<ta:datagridItem id="aae140" key="险种类型" width="100" align="center"
							collection="AAE140" sortable="true" />
						<ta:datagridItem id="aac050" key="变更类型" width="100" align="center"
							collection="AAC050" sortable="true" />
						<ta:datagridItem id="aae160" key="变更原因" width="150" align="center"
							collection="AAE160" dataAlign="true" sortable="true" />
						<ta:datagridItem id="aae035" key="变更日期" width="100" align="center"
							dataAlign="true" sortable="true" dataType="date" />
						<ta:datagridItem id="aae155" key="变更项目中文含义" width="140"
							align="center" sortable="true" />
						<ta:datagridItem id="aae123" key="变更前信息" width="100"
							align="center" sortable="true" />
						<ta:datagridItem id="aae124" key="变更后信息" width="100"
							align="center" sortable="true" />
						<ta:datagridItem id="aae016" key="复核标志" width="100"
							collection="AAE016" align="center" sortable="true" />
						<ta:datagridItem id="aae011" key="经办人" width="100"
							collection="aae011" align="center" sortable="true" />
						<ta:datagridItem id="aae036" key="经办时间" width="100" align="center"
							dataAlign="true" sortable="true" />
						<ta:datagridItem id="yab003" key="经办所属机构" width="100"
							collection="aab301" align="center" sortable="true" />
						<ta:datagridItem id="aae013" key="备注" width="100" align="center"
							dataAlign="true" sortable="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab8" key="生存状态变更信息">
				    <ta:datagrid id="ac26Grid" fit="true" forceFitColumns="true">
					    <ta:datagridItem id="aac001" key="人员编号" width="165"/> 
						<ta:datagridItem id="aac052" key="状态变更原因" width="165" />
						<ta:datagridItem id="aae138" key="状态变更日期" width="165" dataType="date"/>
						<ta:datagridItem id="aac053" key="死亡证明" width="165"/>
						<ta:datagridItem id="yac551" key="丧葬方式" width="155"/>
						<ta:datagridItem id="aac051" key="火化证号" width="165"/>
						<ta:datagridItem id="aae171" key="生存状态变更类型" width="165" collection="AAE171"/>
					</ta:datagrid>
				</ta:tab>		
			  </ta:tabs>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
	    $("body").taLayout();
    });
	
	 //人员窗口回调函数
    function callbackFunPerson(){
    	toQuery();
	}

	function clickfn(e, rowdata) 
	{
		var parameter = {"dto['aaz217']" : rowdata.aaz217};
		Base.openWindow('userwin', "明细信息", "<%=path%>/medicalbenefit/common/mxQueryAction!toQuery.do", parameter, "80%", "80%", null, null, true);
	}

	//点击查询
	function toQuery() 
	{
		var aac001 = Base.getValue('aac001');
		if(aac001 == '' || aac001 == null){
			Base.alert('个人ID不能为空!','warn');
			Base.focus('aac001');
			return;
		}
		Base.clearGridData('ac20List');//清空个人参保信息列表
		Base.clearGridData('kc24List');//清空个人结账信息列表
		Base.clearGridData('ac55k1List');//清空个人账户信息列表
		Base.clearGridData('ac43a1List_jb');//清空个人缴费信息列表
		Base.clearGridData('ac43a1List_jm');//清空个人缴费信息列表
		Base.clearGridData('ac43a1List_de');//清空个人缴费信息列表
		Base.clearGridData('ac43a1List_gwy');//清空个人缴费信息列表
		Base.clearGridData('ac43a1List_lx');//清空个人缴费信息列表
	    Base.clearData("tab1");
		Base.submit("aac001", "personMedicalInfoQueryAction!toQuery.do", null,
				null, false, null, null);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>