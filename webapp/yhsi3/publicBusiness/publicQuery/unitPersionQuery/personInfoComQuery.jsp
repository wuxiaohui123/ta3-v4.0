<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人综合信息查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query"
			onClick="fnQuery()" asToolBarItem="true" />
		<ta:button key="打印[P]" hotKey="P" icon="xui-icon-print"
			onClick="fnPrint()" asToolBarItem="true" id="fnPrint" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset"
			type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="panel" key=">>个人综合信息" expanded="false" fit="true">
			<ta:panel id="pane0" key="个人信息" cols="3">
				<ta:box cols="2">
					<ta:text id="aac001" key="个人编号" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callRyRPC()"  bpopTipMsg="可输入公民身份号码、姓名、人员ID"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC()"/>
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="150" />
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
				<ta:selectInput id="aac004" key="性别" collection="AAC004"
					readOnly="true" labelWidth="120" />
			    <ta:selectInput id="aae140" key="险种类型" collection="AAE140" labelWidth="150" />
				<ta:selectInput id="yae589" collection="YAE589" key="冲销标志"
					labelWidth="150" value="1"/>
			</ta:panel>
			<ta:tabs id="tabs" height="390">
				<ta:tab id="tab1" key="基本信息">
					<ta:box id="box1" cols="3" fit="true">
					    <ta:text id="aaz501" key="银行卡号" readOnly="true" labelWidth="150" />
						<ta:text id="aac006" key="出生日期" readOnly="true" labelWidth="150" />
						<ta:text id="yke102" key="年龄" readOnly="true" labelWidth="150" />
						<ta:text id="aac007" key="参加工作日期" readOnly="true" labelWidth="150" />
						<ta:date id="aic162" key="养老离退休日期" readOnly="true" labelWidth="150" />
						<ta:date id="aic162_310" key="医疗离退休日期" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac012" key="个人身份" collection="AAC012"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac011" key="学历" collection="AAC011"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac005" key="民族" collection="AAC005"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac009" key="户口性质" collection="AAC009"
							readOnly="true" labelWidth="150" />
						<ta:text id="aac010" key="户口所在地" readOnly="true" labelWidth="150" />
						<ta:text id="aae004" key="联系人姓名" readOnly="true" labelWidth="150" />
						<ta:text id="aae005" key="联系人电话" readOnly="true" labelWidth="150" />
						<ta:text id="aae159" key="其它联系方式" readOnly="true" labelWidth="150" />
						<ta:text id="aae007" key="邮政编码" readOnly="true" labelWidth="150" />
						<ta:text id="aae006" key="地址" readOnly="true" labelWidth="150" />
						<ta:text id="aab401" key="户口簿编号" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac014" key="专业技术职务等级" collection="AAC014"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac015" key="国家职业资格等级" collection="AAC015"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac016" key="就业状态" collection="AAC016"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac020" key="行政职务" collection="AAC020"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac060" key="生存状态" collection="AAC060"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aja004" key="农民工标识" collection="AJA004"
							readOnly="true" labelWidth="150" />
						<ta:date id="aac049" key="首次参保年月" readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac008" key="人员参保状态" collection="AAC008"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="aac066" key="参保身份" collection="AAC066"
							readOnly="true" labelWidth="150" />
						<ta:selectInput id="yab139" key="参保人所在分中心" collection="YAB003"
							readOnly="true" labelWidth="150" />
						<ta:text id="yae107" key="移动电话" validType="mobile"
							labelWidth="150" readOnly="true" />
						<ta:selectInput id="yac011" key="国籍" collection="yac011"
							labelWidth="150" readOnly="true" />
						<ta:selectInput id="aac017" key="婚姻状况" collection="aac017"
							labelWidth="150" readOnly="true" />
						<ta:text id="yac566" key="突出贡献高级专家" labelWidth="150"
							readOnly="true" />
						<ta:selectInput id="aac058" key="身份证件类型" collection="aac058"
							labelWidth="150" readOnly="true" />
						<%-- 
							<ta:selectInput id="aac084" key="离退休标识" collection="aac084" labelWidth="150" readOnly="true" />
							--%>
						<ta:selectInput id="yac012" key="独生子女父母" collection="yac012"
							labelWidth="150" readOnly="true" />
						<ta:selectInput id="aac156" key="血型" collection="aac156"
							labelWidth="150" readOnly="true" />
						<ta:selectInput id="aac064" key="转业军人类别" collection="aac064"
							labelWidth="150" readOnly="true" />
						<ta:selectInput id="aac093" key="最高荣誉称号级别代码" collection="aac093"
							labelWidth="150" readOnly="true" />
						<ta:selectInput id="aac033" key="健康状况" collection="aac033"
							labelWidth="150" readOnly="true" />
						<ta:text id="yac565" key="单位内序号(工号)" labelWidth="150"
							readOnly="true" />
						<ta:selectInput id="yac030" key="在编人员标识" collection="yac030"
							labelWidth="150" readOnly="true" />
						<ta:text id="aae013" key="备注" labelWidth="150" readOnly="true" />
						<ta:text id="ydaz" key="是否异地安置" labelWidth="150" readOnly="true" />
					</ta:box>
				</ta:tab>
				<ta:tab id="tab2" key="参保信息">
					<ta:datagrid id="datagrid1" haveSn="true" fit="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center"
							maxChart="5" />
						<ta:datagridItem id="aae044" key="单位名称" align="center"
							maxChart="8" showDetailed="true" />
						<ta:datagridItem id="aac001" key="个人编号" align="center"
							maxChart="5" />
						<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="5" />
						<ta:datagridItem id="aae140" key="险种" align="center"
							collection="aae140" maxChart="8" />
						<ta:datagridItem id="aac008" key="参保状态" align="center"
							dataAlign="center" maxChart="4" collection="AAC008" />
						<ta:datagridItem id="yac084" key="离退休标识" align="center"
							dataAlign="center" maxChart="5" collection="YAC084" />
						<ta:datagridItem id="dyxs" key="待遇信息" align="center"
							dataAlign="center" maxChart="8" showDetailed="true"></ta:datagridItem>
						<ta:datagridItem id="aac049" key="首次参保年月" align="center"
							dataAlign="center" maxChart="5" />			
						<ta:datagridItem id="aac030" key="参保日期" align="center"
							dataAlign="center" maxChart="5" dataType="date" />
						<ta:datagridItem id="aae041" key="开始年月" align="center"
							dataAlign="center" maxChart="3" />
						<ta:datagridItem id="aae042" key="结束年月" align="center"
							dataAlign="center" maxChart="3" />
						<ta:datagridItem id="yae097" key="最大做账期号" align="center"
							dataAlign="center" maxChart="5" />
						<ta:datagridItem id="jfz" key="缴费至" align="center"
							dataAlign="center" maxChart="3" />
						<ta:datagridItem id="jfy" key="缴费月" align="center"
							dataAlign="center" maxChart="3" />
						<ta:datagridItem id="yaz289" key="缴费规则" align="center"
							collection="yaz289" maxChart="10" />
						<ta:datagridItem id="ykc005" key="人员类型" align="center"
							collection="YKC005" maxChart="10" />
						<ta:datagridItem id="ykc006" key="人员类别" align="center"
							collection="YKC006" maxChart="10" />
						<ta:datagridItem id="aac040" key="实时工资说明" align="center"
							maxChart="15" showDetailed="true" />
						<ta:datagridItem id="aaz136" key="基数规则" align="center"
							collection="aaz136" maxChart="10" />
						<ta:datagridItem id="yab139" key="参保所属机构" align="center"
							collection="aab301" width="100" />
						<ta:datagridItem id="aae044" key="单位名称" align="center"
							maxChart="15" />
						<ta:datagridItem id="aaz159" key="参保关系ID" align="center"
							collection="aab301" width="160" />
					</ta:datagrid>
				</ta:tab>
			
				<ta:tab id="tab3" key="基本信息变更">
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
						<ta:datagridItem id="aae036" key="经办时间" width="150" align="center"
							dataAlign="true" sortable="true" />
						<ta:datagridItem id="yab003" key="经办所属机构" width="100"
							collection="aab301" align="center" sortable="true" />
						<ta:datagridItem id="aae013" key="备注" width="100" align="center"
							dataAlign="true" sortable="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab4" key="参保信息变更">
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
						<ta:datagridItem id="aae036" key="经办时间" width="150" align="center"
							dataAlign="true" sortable="true" />
						<ta:datagridItem id="yab003" key="经办所属机构" width="100"
							collection="aab301" align="center" sortable="true" />
						<ta:datagridItem id="aae013" key="备注" width="100" align="center"
							dataAlign="true" sortable="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_error" key="生存状态变更信息">
				    <ta:datagrid id="ac26Grid" fit="true" forceFitColumns="true">
					    <ta:datagridItem id="aac001" key="人员编号" width="165"/> 
						<ta:datagridItem id="aac052" key="状态变更原因" width="165" />
						<ta:datagridItem id="aae138" key="状态变更日期" width="165" dataType="date"/>
						<ta:datagridItem id="aac053" key="死亡证明" width="165"/>
						<ta:datagridItem id="yac551" key="丧葬方式" width="155" collection="YAC551"/>
						<ta:datagridItem id="aac051" key="火化证号" width="165"/>
						<ta:datagridItem id="aae171" key="生存状态变更类型" width="165" collection="AAE171"/>
						<ta:datagridItem id="aae011" key="经办人" width="100" collection="aae011" align="center" sortable="true" />
						<ta:datagridItem id="aae036" key="经办时间" width="100"  align="center" sortable="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_st" key="视同信息">
					<ta:datagrid id="lsGzjlList" selectType="checkbox"  fit="true" forceFitColumns="true" haveSn="true" >				   
					    <ta:datagridItem id="aaz185" key="人员工作经历ID" width="100" align="center"  hiddenColumn="true" /> 	
						<ta:datagridItem id="aac001" key="个人编号" width="100" align="center"  hiddenColumn="true" /> 					
						<ta:datagridItem id="aae041" key="开始年月" maxChart="4" dataAlign="center" align="center" />
						<ta:datagridItem id="aae042" key="结束年月" maxChart="4" dataAlign="center" align="center" />
						<ta:datagridItem id="sty" key="视同月" width="100" dataAlign="center" align="center" totals="sum" tatalsTextShow="false"/>
						<ta:datagridItem id="ystj" key="视同月数统计" maxChart="6" dataAlign="center" align="center"/>
						<ta:datagridItem id="aab004" key="单位名称" width="150" align="center" />
						<ta:datagridItem id="aae140" key="险种" maxChart="5" align="center" collection="aae140"/>	
						<ta:datagridItem id="yac567" key="工作经历类型" width="160" align="center" collection="YAC567"/>				   					
						<ta:datagridItem id="aae013" key="原因" align="center" width="200" showDetailed="true" />			
						<ta:datagridItem id="aae014" key="经办人" width="100" collection="aae011" align="center" sortable="true" />
						<ta:datagridItem id="aae015" key="经办时间" width="100"  align="center" sortable="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab5" key="账户信息">
					<ta:box key="个人账户年度台账" fit="true">
						<ta:datagrid id="datagrid41" haveSn="true" heightDiff="100">
							<ta:datagridItem key="账户编号" id="aaz116" align="center"
								dataAlign="left" width="100" />
							<ta:datagridItem key="个人编号" id="aac001" align="center"
								dataAlign="left" width="80" />
							<ta:datagridItem key="姓名" id="aac003" align="center"
								dataAlign="left" width="100" />
							<ta:datagridItem key="帐户类型" id="aaa119" align="center"
								collection="AAA119" dataAlign="left" width="200" />
							<ta:datagridItem key="建帐原因" id="aac062" align="center"
								width="100" dataAlign="left" collection="AAC062" />
							<ta:datagridItem key="建帐年月" id="aae206" align="center" width="80"
								dataAlign="center" />
							<ta:datagridItem key="本息和" id="hj" align="center" maxChart="4"
								dataAlign="right" />
							<ta:datagridItem key="本金" id="aae238" align="center" width="80"
								dataAlign="right" />
							<ta:datagridItem key="利息" id="aae239" align="center" width="80"
								dataAlign="right" />
							<ta:datagridItem key="支出" id="aae357" align="center" width="80"
								dataAlign="right" />
							<ta:datagridItem key="余额" id="aae240" align="center" width="100"
								dataAlign="right" />
							<ta:datagridItem key="有效标志" id="aae100" align="center" width="80"
								collection="AAE100" dataAlign="left" />
							<ta:datagridItem key="终结日期" id="aae237" align="center" width="80"
								dataAlign="center" />
						</ta:datagrid>
						<ta:datagrid id="datagrid42" groupingBy="aaz116" haveSn="true">
							<ta:datagridItem key="账户编号" id="aaz116" align="center"
								dataAlign="left" />
							<ta:datagridItem key="个人编号" id="aac001" align="center"
								dataAlign="left" maxChart="6" />
							<ta:datagridItem key="年度" id="aae001" align="center"
								dataAlign="center" />
							<ta:datagridItem key="截止本年缴费月数" id="yueshu" align="center"
								dataAlign="center" maxChart="8" />
							<ta:datagridItem key="截至上年末累计存储额" id="aae252" align="center"
								dataAlign="right" maxChart="10" />
							<ta:datagridItem key="截至上年末单位划转累计本金" id="aae253" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末个人划转累计本金" id="aae254" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转累计利息" id="aae256" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末个人划转累计利息" id="aae257" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转本息在本年产生的利息" id="aae259"
								align="center" dataAlign="right" maxChart="19" />
							<ta:datagridItem key="截至上年末个人划转本息在本年产生的利息" id="aae260"
								align="center" dataAlign="right" maxChart="19" />
							<ta:datagridItem key="本年单位划转本金" id="aae262" align="center"
								dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年单位划转本金产生的利息" id="aae263" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="本年个人划转本金" id="aae264" align="center"
								dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年个人划转本金产生的利息" id="aae265" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转支出金额" id="aae285" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末个人划转支出金额" id="aae286" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="截至上年末单位划转支出扣减利息" id="aae288" align="center"
								dataAlign="right" maxChart="15" />
							<ta:datagridItem key="截至上年末个人划转支出扣减利息" id="aae289" align="center"
								dataAlign="right" maxChart="15" />
							<ta:datagridItem key="截至上年末单位划转支出扣减利息在本年产生的利息" id="aae291"
								align="center" dataAlign="right" maxChart="23" />
							<ta:datagridItem key="截至上年末个人划转支出扣减利息在本年产生的利息" id="aae292"
								align="center" dataAlign="right" maxChart="23" />
							<ta:datagridItem key="本年单位支出本金" id="aae294" align="center"
								dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年单位支出本金产生的利息" id="aae295" align="center"
								dataAlign="right" maxChart="13" />
							<ta:datagridItem key="本年个人支出本金" id="aae296" align="center"
								dataAlign="right" maxChart="8" />
							<ta:datagridItem key="本年个人支出本金产生的利息" id="aae297" align="center"
								dataAlign="right" maxChart="13" />
						</ta:datagrid>
					</ta:box>
				</ta:tab>
				<ta:tab id="tab6" key="缴费明细信息">
					<ta:datagrid id="datagrid5" forceFitColumns="true" columnFilter="true" haveSn="true" fit="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
				    <ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
				    <ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" sortable="true" maxChart="7"></ta:datagridItem>
				    <ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
				    <ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
				    <ta:datagridItem id="aac002" key="身份证号码" align="center" dataAlign="center" maxChart="10"></ta:datagridItem>
				    <ta:datagridItem id="yac084" key="离退休标志" align="center" collection="YAC084" sortable="true" maxChart="5"></ta:datagridItem>
				    <ta:datagridItem id="aaa115" key="应缴类型" align="center" collection="AAA115" sortable="true" maxChart="5" showDetailed="true"></ta:datagridItem>
				    <ta:datagridItem id="aae002" key="做账期号" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
				    <ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" sortable="true" maxChart="5"></ta:datagridItem>
				    <ta:datagridItem id="aae078" key="到帐标志" collection="AAE078" align="center" sortable="true" maxChart="4" />	  <%-- formatter="fnFormatterDZBZ" --%>
				    <ta:datagridItem id="aae201" key="实缴月数" maxChart="4"  align="center"  tatalsTextShow="false" totals="sum" formatter="fnFormatterJF"></ta:datagridItem>
				    <ta:datagridItem id="aac040" key="工资" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
				    <ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
				    <ta:datagridItem id="yjhj"  key="应缴合计" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				    <ta:datagridItem id="dwjfhj"  key="单位缴" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				    <ta:datagridItem id="dwjfbl"  key="单位缴费比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
		    	    <ta:datagridItem id="grjfhj"  key="个人缴" align="center" dataAlign="right" sortable="true" maxChart="6" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="grjfbl"  key="个人缴费比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
			    	<ta:datagridItem id="hjjf_yj"  key="已缴合计" align="center" dataAlign="right" sortable="true" maxChart="4" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="dwjfhj_yj"  key="单位已缴" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="grjfhj_yj"  key="个人已缴" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="yjli"  key="应缴利息" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="dwyjlx"  key="单位利息" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="gryjlx"  key="个人利息" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="znj" key="滞纳金" align="center" dataAlign="right" maxChart="5" totals="sum" tatalsTextShow="false"/>
			    	<ta:datagridItem id="znjts" key="计算滞纳金天数" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"/>	    	
			    	<ta:datagridItem id="hjhzh"  key="划账户合计" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="grhzhbl"  key="个人划账户比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
			    	<%-- 
			    	 <ta:datagridItem id="gryjlx" key="个人划账户利息" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"/>
			    	<ta:datagridItem id="dwyjlx" key="单位划账户利息" align="center" dataAlign="right" maxChart="7" totals="sum" tatalsTextShow="false"/>
			    	 --%>
			    	<ta:datagridItem id="dwhzhbl"  key="单位划账户比例" align="center" dataAlign="right" sortable="true" maxChart="7"></ta:datagridItem>
			    	<ta:datagridItem id="hjhzh_yj"  key="划账户已缴" align="center" dataAlign="right" sortable="true" maxChart="5" totals="sum" tatalsTextShow="false"></ta:datagridItem>
			    	<ta:datagridItem id="aae036" key="经办日期" maxChart="5"  align="center" dataType="date"></ta:datagridItem>
			    	<ta:datagridItem id="aae011" key="经办人" maxChart="4"  align="center"  collection="AAE011"></ta:datagridItem>
			    	<ta:datagridItem id="aae079" key="到账日期" align="center" sortable="true" maxChart="5" dataType="date"></ta:datagridItem>	
			    	<ta:datagridItem id="yae219" key="登帐日期" align="center" sortable="true" maxChart="5" dataType="date"></ta:datagridItem>	
			    	<ta:datagridItem id="yae218" key="登帐经办人" maxChart="4"  align="center"  collection="AAE011"></ta:datagridItem>
			    	<ta:datagridItem id="ykc005" key="参保类型" align="center"  collection="YKC005" maxChart="6"/>
			    	<ta:datagridItem id="" key="代扣大额" align="center" dataAlign="right"  maxChart="4"/>
			    	<ta:datagridItem id="yae589" key="冲销标志" align="center"  collection="YAE589"/>
			    	<ta:datagridItem id="yab139" key="参保所属机构" maxChart="10"  align="center"  collection="YAB003"></ta:datagridItem>
			    	<ta:datagridItem id="aae041" key="开始年月" maxChart="4"  align="center"></ta:datagridItem>
			    	<ta:datagridItem id="aae042" key="结束年月" maxChart="4"  align="center"></ta:datagridItem>
			    	<ta:datagridItem id="yae248" key="数据来源" maxChart="4"  align="center" collection="YAE248"></ta:datagridItem>	
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab7" key="核定信息">
					<ta:datagrid id="datagrid6" haveSn="true" fit="true">
						<ta:datagridItem id="yae518" key="核定ID" align="center"
							dataAlign="left" width="115" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="aab001" key="单位编号" align="center"
							dataAlign="left" width="70"></ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称" align="center"
							dataAlign="left" width="150"></ta:datagridItem>
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140"
							align="center" dataAlign="left" width="120"></ta:datagridItem>
						<ta:datagridItem id="yac084" key="离退休" align="center"
							dataAlign="left" width="60" collection="YAC084"></ta:datagridItem>
						<ta:datagridItem id="aaa115" key="核定类型" align="center"
							dataAlign="left" width="150" collection="AAA115"></ta:datagridItem>
						<ta:datagridItem id="aae002" key="做帐期号" align="center"
							dataAlign="center" width="65"></ta:datagridItem>
						<ta:datagridItem id="aae003" key="费款所属期" align="center"
							dataAlign="center" width="75"></ta:datagridItem>
						<ta:datagridItem id="aab119" key="人数" align="center"
							dataAlign="left" width="40"></ta:datagridItem>
						<ta:datagridItem id="aab084" key="工资" align="center"
							dataAlign="right" width="65"></ta:datagridItem>
						<ta:datagridItem id="yad001" key="金额" align="center"
							dataAlign="right" width="85" tatalsTextShow="false" totals="sum"></ta:datagridItem>
						<ta:datagridItem id="aae011" key="经办人员" align="center"
							dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间" align="center"
							dataAlign="center" width="150" sortable="true"></ta:datagridItem>
						<ta:datagridItem id="yab003" key="经办机构" align="center"
							dataAlign="left" collection="YAB003" width="100"></ta:datagridItem>
						<ta:datagridItem id="aae016" key="复核标志" align="center"
							dataAlign="left" collection="AAE016" width="80"></ta:datagridItem>
						<ta:datagridItem id="zjbz" key="征集标志" align="center"
							dataAlign="left" width="70"></ta:datagridItem>
						<ta:datagridItem id="aaz288" key="征集单ID" align="center"
							dataAlign="left" width="110" hiddenColumn="true"></ta:datagridItem>
						<ta:datagridItem id="yad005" key="业务处理标志" align="center"
							collection="YAD005" dataAlign="left" width="100"></ta:datagridItem>
						<ta:datagridItem id="yad006" key="财务处理标志" align="center"
							collection="YAD006" dataAlign="left" width="90"></ta:datagridItem>
						<ta:datagridItem id="aab191" key="到账日期" align="center"
							dataAlign="left" width="80"></ta:datagridItem>
						<ta:datagridItem id="aad008" key="实收凭证编号" align="center"
							dataAlign="left" width="120"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab8" key="征集信息">
					<ta:datagrid id="datagrid7" haveSn="true" fit="true"
						columnFilter="true">
						<ta:datagridItem id="aaz288" key="征集单ID" align="center"
							dataAlign="left" width="110"></ta:datagridItem>
						<ta:datagridItem id="aaz010" key="单位编号" align="center"
							dataAlign="left" width="70"></ta:datagridItem>
						<ta:datagridItem id="aae044" key="单位名称" align="center"
							dataAlign="left" width="150"></ta:datagridItem>
						<ta:datagridItem id="yad009" key="收支类型" align="center"
							dataAlign="left" width="70" collection="YAD009"></ta:datagridItem>
						<ta:datagridItem id="yad001" key="金额" align="center"
							dataAlign="right" width="100" tatalsTextShow="false" totals="sum"></ta:datagridItem>
						<ta:datagridItem id="yad005" key="业务处理标志" align="center"
							dataAlign="left" width="90" collection="YAD005"></ta:datagridItem>
						<ta:datagridItem id="yad006" key="财务处理金额" align="center"
							dataAlign="left" width="90" collection="YAD006"></ta:datagridItem>
						<ta:datagridItem id="aaz022" key="征集单批次" align="center"
							dataAlign="left" width="150"></ta:datagridItem>
						<ta:datagridItem id="aae011" key="经办人员" align="center"
							dataAlign="left" collection="AAE011" width="80"></ta:datagridItem>
						<ta:datagridItem id="aae036" key="经办时间" align="center"
							dataAlign="center" width="150" sortable="true"></ta:datagridItem>
						<ta:datagridItem id="yab003" key="经办机构" align="center"
							dataAlign="left" collection="AAB301" width="100"></ta:datagridItem>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab9" key="待转金信息">
					<ta:datagrid id="datagrid8" haveSn="true" fit="true"
						columnFilter="true">
						<ta:datagridItem id="detail" key="查看明细" width="70" align="center"
							icon="icon-search" click="queryDetail" />
						<ta:datagridItem id="aaz010" key="个人编号" width="100" align="center"
							sortable="true" />
						<ta:datagridItem id="yaa030" key="姓名" width="220" align="center"
							sortable="true" />
						<ta:datagridItem id="aae140" key="险种类型" width="140" align="center"
							sortable="true" collection="AAE140" />
						<ta:datagridItem id="aae341" key="筹资项目" width="140" align="center"
							sortable="true" collection="AAE341" />
						<ta:datagridItem id="aaa093" key="承担缴费主体类型" width="130"
							align="center" sortable="true" collection="AAA093" />
						<ta:datagridItem id="yae080" key="余额" width="100" align="center"
							formatter='MoneyFormatterNo$' totals="sum" tatalsTextShow="false"
							dataAlign="right" />
						<ta:datagridItem id="yae081" key="自动使用标志" width="100"
							align="center" sortable="true" collection="YAE081" />
					</ta:datagrid>
				</ta:tab>
				
					<ta:tab id="tbResident" key="父母信息">
					<ta:panel id="p3" expanded="true" scalable="false" cols="2">
						<ta:fieldset key="父">
							<ta:panel id="x1" expanded="false" scalable="false" cols="2"
								hasBorder="false">
								<ta:text id="aac001f" key="个人编号" labelWidth="80" readOnly="true" />
								<ta:text id="aac003f" key="姓名" maxLength="60" readOnly="true"
									labelWidth="80" />
								<ta:text id="aac002f" readOnly="true" key="证件号码" labelWidth="80" />
								<ta:selectInput id="aac004f" key="性别" collection="AAC004"
									labelWidth="80" readOnly="true" />
							</ta:panel>
						</ta:fieldset>
						<ta:fieldset key="母">
							<ta:panel id="x2" expanded="false" scalable="false" cols="2"
								hasBorder="false">
								<ta:text id="aac001m" key="个人编号" labelWidth="80" readOnly="true" />
								<ta:text id="aac003m" key="姓名" maxLength="60" readOnly="true"
									labelWidth="80" />
								<ta:text id="aac002m" readOnly="true" key="证件号码" labelWidth="80" />
								<ta:selectInput id="aac004m" key="性别" collection="AAC004"
									labelWidth="80" readOnly="true" />
							</ta:panel>
						</ta:fieldset>
						<ta:box cols="2" fit="true" id="b1" cssStyle="margin:5px;"
							span="2">
							<ta:panel id="pp1" expanded="false" height="200px"
								columnWidth="0.5"
								cssStyle="background-color:#ffffff;overflow:auto;">
								<ta:datagrid id="listf" fit="true">
									<ta:datagridItem id="aae140" key="险种类型" align="center"
										collection="AAE140" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aae041" key="开始年月" maxChart="4"
										align="center"></ta:datagridItem>
									<ta:datagridItem id="aae042" key="结束年月" maxChart="4"
										align="center"></ta:datagridItem>
									<ta:datagridItem id="dwjfhj" key="单位缴费合计" align="center"
										dataAlign="right" sortable="true" maxChart="6" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="grjfhj" key="个人缴费合计" align="center"
										dataAlign="right" sortable="true" maxChart="6" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="aac040" key="工资" align="center"
										dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
									<ta:datagridItem id="aae180" key="缴费基数" align="center"
										dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
									<ta:datagridItem id="aae003" key="对应费款所属期" align="center"
										dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
									<ta:datagridItem id="aae002" key="做账期号" align="center"
										dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
									<ta:datagridItem id="hjhzh" key="划账户合计" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="hjjf_yj" key="合计已缴" align="center"
										dataAlign="right" sortable="true" maxChart="4" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="dwjfhj_yj" key="单位已缴" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="grjfhj_yj" key="个人已缴" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="hjhzh_yj" key="划账户已缴" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="aab001" key="单位编号" align="center"
										dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aae044" key="单位名称" align="center"
										dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
									<ta:datagridItem id="aac001" key="个人编号" align="center"
										dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aac003" key="姓名" align="center"
										dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aae078" key="到帐标志" collection="AAE078"
										align="center" sortable="true" maxChart="4"></ta:datagridItem>
									<ta:datagridItem id="aae079" key="到账时间" align="center"
										sortable="true" maxChart="4" dataType="date"></ta:datagridItem>
									<ta:datagridItem id="aaa115" key="退收类型" collection="aaa115"
										maxChart="8" align="center" sortable="true"></ta:datagridItem>
									<ta:datagridItem id="aae201" key="缴费月数" maxChart="4"
										align="center" tatalsTextShow="false" totals="sum"></ta:datagridItem>
								</ta:datagrid>
							</ta:panel>
							<ta:panel id="pp2" expanded="false" height="200px"
								columnWidth="0.5"
								cssStyle="background-color:#ffffff;overflow:auto;">
								<ta:datagrid id="listm" fit="true">
									<ta:datagridItem id="aae140" key="险种类型" align="center"
										collection="AAE140" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aae041" key="开始年月" maxChart="4"
										align="center"></ta:datagridItem>
									<ta:datagridItem id="aae042" key="结束年月" maxChart="4"
										align="center"></ta:datagridItem>
									<ta:datagridItem id="dwjfhj" key="单位缴费合计" align="center"
										dataAlign="right" sortable="true" maxChart="6" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="grjfhj" key="个人缴费合计" align="center"
										dataAlign="right" sortable="true" maxChart="6" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="aac040" key="工资" align="center"
										dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
									<ta:datagridItem id="aae180" key="缴费基数" align="center"
										dataAlign="center" sortable="true" maxChart="4"></ta:datagridItem>
									<ta:datagridItem id="aae003" key="对应费款所属期" align="center"
										dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
									<ta:datagridItem id="aae002" key="做账期号" align="center"
										dataAlign="center" sortable="true" maxChart="7"></ta:datagridItem>
									<ta:datagridItem id="hjhzh" key="划账户合计" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="hjjf_yj" key="合计已缴" align="center"
										dataAlign="right" sortable="true" maxChart="4" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="dwjfhj_yj" key="单位已缴" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="grjfhj_yj" key="个人已缴" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="hjhzh_yj" key="划账户已缴" align="center"
										dataAlign="right" sortable="true" maxChart="5" totals="sum"
										tatalsTextShow="false"></ta:datagridItem>
									<ta:datagridItem id="aab001" key="单位编号" align="center"
										dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aae044" key="单位名称" align="center"
										dataAlign="center" sortable="true" maxChart="10"></ta:datagridItem>
									<ta:datagridItem id="aac001" key="个人编号" align="center"
										dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aac003" key="姓名" align="center"
										dataAlign="center" sortable="true" maxChart="6"></ta:datagridItem>
									<ta:datagridItem id="aae078" key="到帐标志" collection="AAE078"
										align="center" sortable="true" maxChart="4"></ta:datagridItem>
									<ta:datagridItem id="aae079" key="到账时间" align="center"
										sortable="true" maxChart="4" dataType="date"></ta:datagridItem>
									<ta:datagridItem id="aaa115" key="退收类型" collection="aaa115"
										maxChart="8" align="center" sortable="true"></ta:datagridItem>
									<ta:datagridItem id="aae201" key="缴费月数" maxChart="4"
										align="center" tatalsTextShow="false" totals="sum"></ta:datagridItem>
								</ta:datagrid>
							</ta:panel>
						</ta:box>
					</ta:panel>
				</ta:tab>
				<%--
				<ta:tab id="tab10" key="个人转入基金信息">
				    <ta:datagrid id="ad12Grid" fit="true" forceFitColumns="true"  haveSn="true" onRowDBClick="clickfn">
						<ta:datagridItem id="aae140" key="险种类型" align="center" width="150" collection="aae140" showDetailed="true" />
						<ta:datagridItem id="aad009" key="缴费凭证编号" align="center" width="100" showDetailed="true"/>
						<ta:datagridItem id="aac003" key="姓名" align="center" width="70" showDetailed="true"/>
						<ta:datagridItem id="aac002" key="证件号码" align="center" width="120" showDetailed="true"/>
						<ta:datagridItem id="yad003" key="金额" align="center" dataAlign="right" width="70" 
							formatter="fnMoneyFormatter" showDetailed="true" />
						<ta:datagridItem id="aae011" key="经办人" align="center" width="70" collection="aae011" showDetailed="true"/>
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" width="110" showDetailed="true"/>
						<ta:datagridItem id="aae013_r" key="备注" align="center" width="100" showDetailed="true"/>
						<ta:datagridItem id="aaz002" key="业务日志ID" align="center" width="100" hiddenColumn="true" />
                    </ta:datagrid>
				</ta:tab>
				 --%>
			</ta:tabs>
		</ta:panel>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
$(function() {
	$("body").taLayout();	
	Base.focus("aac001");
	Base.setDisabled("fnPrint");
	Base.hideObj("tab09");
	initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_getPerson, 0, false);
});

function callRyRPC(){
	sfwQueryUtil_newRPC(1,'getAac001_c',{"dto['inputString']":Base.getValue('aac001')});
}
function showRyRPC(){
	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do",null,1000,450,null,fn_setRyData,true);
}
function fn_setRyData(){
	fnQuery();  //调用功能界面业务方法
}

function fnFormatter(row, cell, value, columnDef,dataContext){
    var content = value;
    if(value=="0"){
        content = "<div style='color:red'>" + value + "</div>";
    }
    return content;
}

function fn_getPerson(){ 
	Base.setValue("aac001",g_Suggest[2]);
	Base.setValue("aac002",g_Suggest[0]);
	Base.setValue("aac003",g_Suggest[1]);
	fnQuery();
} 

function fnQuery(){
		Base.submit("panel", myPath()+"/process/publicBusiness/publicQuery/unitPersonQuery/personInfoComQueryAction!toQuery.do");
		
		Base.setGridColumnFormat("datagrid5", "aae078", function(row, cell, value, columnDef, dataContext){
                              if(value=="0"){
                                        return "<span style='color:red'>未足额到账</span>";
                                }else if(value=="1"){
                                        return "<span style='color:green'>已足额到账</span>";
                                 }else if(value=="2"){
                                       return "<span style='color:green'>中断</span>";
                                }
                       });
		}
	function fnPrint() {
		var aac001 = Base.getValue("aac001");
		if (aac001 == '' || aac001 == null) {
			alert("没有获取到人员编号");
			return;
		}
		var fileName = "CBYRZILBGZJTable.raq";
		var prm = "aac001=" + aac001;
		fnPrintComm(fileName, prm);
	}
	function queryDetail(rowData) {
		var paramData = {};
		paramData["dto['aaz010']"] = rowData.aaz010;
		paramData["dto['aae140']"] = rowData.aae140;
		paramData["dto['aae341']"] = rowData.aae341;
		paramData["dto['aaa093']"] = rowData.aaa093;
		Base.openWindow("detailWindow", ">>个人待转金信息",
				"unitUntransferFundsAction!queryDetail.do", paramData, 1000,
				500, null, null);
	}
	
	//根据弹出窗口选择人员
	function fnSetAc01(rowdata){
		Base.setValue("aac001",rowdata.aac001);
		Base.setValue("aac002",rowdata.aac002);
		Base.setValue("aac003",rowdata.aac003);
		Base.setValue("aac004",rowdata.aac004);
		fnQuery();
	}
	
	function fnFormatterJF(row, cell, value, columnDef, dataContext) {
	    if(dataContext.aae201=='0'){
	         return  "<span style='color:red;'>"+dataContext.aae201+"</span>";
	    }else{
	         return  "<span style='color:blue;'>"+dataContext.aae201+"</span>";
	    }
        
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>