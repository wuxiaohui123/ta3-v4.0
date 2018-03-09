<%@ page language="java" pageEncoding="UTF-8"%>
<ta:tab id="tab_110" key="企业养老" cssStyle="overflow:auto">
	<ta:panel id="cbxx_110" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="110_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="110_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('110')" />
		<ta:date id="110_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" required="true" issue="true" onChange="fnCheckZZQH ('110_aab050','110_yae097')" />
		<ta:selectInput id="110_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="110_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="110_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="110_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="aaz136" />
		<ta:selectInput id="110_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="yaz289" />
	</ta:panel>
	<ta:panel id="dwyhxx_110" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="110_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(2,'110')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_110" key="?" onClick="showDwBankRPC('110_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="110_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_110_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_110_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="110_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('110_yae106');" />
		<ta:selectInput id="110_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="sbyhxx_110" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="110_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(1)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_110" key="?" onClick="showSbjgBankRPC('110')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="110_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_110_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_110_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_120" key="机关养老" cssStyle="overflow:auto">
	<ta:panel id="cbxx_120" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="120_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="120_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('120')" />
		<ta:date id="120_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" required="true" issue="true" onChange="fnCheckZZQH ('120_aab050','120_yae097')" />
		<ta:selectInput id="120_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="120_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="120_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="120_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="120_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="yaz289" />
	</ta:panel>
	<ta:panel id="dwyhxx_120" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="120_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(4,'120')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_120" key="?" onClick="showDwBankRPC('120_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="120_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_120_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_120_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="120_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('120_yae106');" />
		<ta:selectInput id="120_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="sbyhxx_120" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="120_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(3)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_120" key="?" onClick="showSbjgBankRPC('120')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="120_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_120_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_120_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_210" key="失业" cssStyle="overflow:auto">
	<ta:panel id="fld_210" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="210_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="210_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('210')" />
		<ta:date id="210_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('210_aab050','210_yae097')" />
		<ta:selectInput id="210_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="210_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="210_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="210_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="210_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_syezs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="210_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(6,'210')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_210" key="?" onClick="showDwBankRPC('210_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="210_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_210_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_210_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="210_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('210_yae106');" />
		<ta:selectInput id="210_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_syezs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="210_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(5)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_210" key="?" onClick="showSbjgBankRPC('210')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="210_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_210_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_210_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_310" key="基本医疗" cssStyle="overflow:auto">
	<ta:panel id="fld_310" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="310_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="310_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('310')" />
		<ta:date id="310_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('310_aab050','310_yae097')" />
		<ta:selectInput id="310_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="310_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="310_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="310_akc022" key="医疗保险建帐类型" labelWidth="130" required="true" collection="AKC022" value="2" />
		<ta:selectInput id="310_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="310_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_czzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="310_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(8,'310')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_310" key="?" onClick="showDwBankRPC('310_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="310_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_310_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_310_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="310_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('310_yae106');" />
		<ta:selectInput id="310_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_czzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="310_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(7)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_310" key="?" onClick="showSbjgBankRPC('310')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="310_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_310_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_310_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_330" key="大额医疗" cssStyle="overflow:auto">
	<ta:panel id="fld_330" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="330_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="330_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('330')" />
		<ta:date id="330_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('330_aab050','330_yae097')" />
		<ta:selectInput id="330_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="330_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="330_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="330_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="330_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_czzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="330_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(14,'330')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_330" key="?" onClick="showDwBankRPC('330_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="330_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_330_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_330_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="330_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('330_yae106');" />
		<ta:selectInput id="330_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_czzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="330_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(13)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_330" key="?" onClick="showSbjgBankRPC('330')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="330_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_330_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_330_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_311" key="个账补充" cssStyle="overflow:auto">
	<ta:panel id="fld_311" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="311_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="311_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('311')" />
		<ta:date id="311_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('311_aab050','311_yae097')" />
		<ta:selectInput id="311_aab033" key="征收方式" labelWidth="130" collection="AAB033" required="true" onSelect="fnChangeRedStar" value="8" readOnly="true" filter="8" reverseFilter="true" />
		<ta:selectInput id="311_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="311_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<%--
		<ta:selectInput id="311_akc022" key="医疗保险建帐类型" labelWidth="130" required="true" collection="AKC022" value="2"/>
		 --%>
		<ta:selectInput id="311_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="311_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_czzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="311_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(8,'311')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_311" key="?" onClick="showDwBankRPC('311_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="311_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_311_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_311_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="311_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('311_yae106');" />
		<ta:selectInput id="311_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_czzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="311_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(7)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_311" key="?" onClick="showSbjgBankRPC('311')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="311_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_311_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_311_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_320" key="公务员补助" cssStyle="overflow:auto">
	<ta:panel id="fld_320" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="320_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="320_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('320')" />
		<ta:date id="320_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('320_aab050','320_yae097')" />
		<ta:selectInput id="320_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="320_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="320_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="320_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="320_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_czzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="320_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(16,'320')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_320" key="?" onClick="showDwBankRPC('320_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="320_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_320_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_320_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="320_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('320_yae106');" />
		<ta:selectInput id="320_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_czzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="320_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(15)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_320" key="?" onClick="showSbjgBankRPC('320')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="320_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_320_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_320_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_370" key="企业补充" cssStyle="overflow:auto">
	<ta:panel id="fld_370" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="370_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="370_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('370')" />
		<ta:date id="370_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('370_aab050','370_yae097')" />
		<ta:selectInput id="370_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="370_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="370_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="370_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="370_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_czzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="370_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(18,'370')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_370" key="?" onClick="showDwBankRPC('370_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="370_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_370_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_370_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="370_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('370_yae106');" />
		<ta:selectInput id="370_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_czzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="370_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(17)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_370" key="?" onClick="showSbjgBankRPC('370')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="370_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_370_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_370_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_340" key="离休二乙" cssStyle="overflow:auto">
	<ta:panel id="fld_340" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="340_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="340_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('340')" />
		<ta:date id="340_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" issue="true" required="true" onChange="fnCheckZZQH ('340_aab050','340_yae097')" />
		<ta:selectInput id="340_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="340_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="340_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="340_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="340_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_czzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="340_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(20,'340')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_340" key="?" onClick="showDwBankRPC('340_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="340_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_340_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_340_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="340_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('340_yae106');" />
		<ta:selectInput id="340_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_czzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="340_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(19)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_340" key="?" onClick="showSbjgBankRPC('340')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="340_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_340_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_340_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_410" key="工伤" cssStyle="overflow:auto">
	<ta:panel id="fld_410" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="410_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="410_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('410')" />
		<ta:date id="410_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" required="true" issue="true" onChange="fnCheckZZQH ('410_aab050','410_yae097')" />
		<ta:selectInput id="410_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="410_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="410_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="410_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="410_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_gszs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="410_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(10,'410')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_410" key="?" onClick="showDwBankRPC('410_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="410_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_410_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_410_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="410_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('410_yae106');" />
		<ta:selectInput id="410_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_gszs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="410_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(9)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_410" key="?" onClick="showSbjgBankRPC('410')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="410_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_410_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_410_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>

<ta:tab id="tab_510" key="生育" cssStyle="overflow:auto">
	<ta:panel id="fld_510" key="参保信息" cols="3" expanded="false" scalable="false">
		<ta:selectInput id="510_aae140" key="险种类型" labelWidth="130" collection="AAE140" readOnly="true" display="false" />
		<ta:date id="510_aab050" key="参保日期" showSelectPanel="true" labelWidth="130" required="true" onBlur="fnIssue('510')" />
		<ta:date id="510_yae097" key="最大做账期号" showSelectPanel="true" labelWidth="130" required="true" issue="true" onChange="fnCheckZZQH ('510_aab050','510_yae097')" />
		<ta:selectInput id="510_aab033" key="征收方式" labelWidth="130" filter="6" collection="AAB033" required="true" onSelect="fnChangeRedStar" />
		<ta:selectInput id="510_aab051" key="单位参保状态" labelWidth="130" collection="AAB051" display="false" />
		<ta:selectInput id="510_aab066" key="单位暂停缴费状态" labelWidth="130" collection="AAB066" value="0" />
		<ta:selectInput id="510_aaz136" key="基数核定规则" labelWidth="130" required="true" collection="AAZ136" />
		<ta:selectInput id="510_yaz289" key="征缴规则" labelWidth="130" span="2" required="true" collection="YAZ289" />
	</ta:panel>
	<ta:panel id="fld_syzs1" key="单位银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="510_aaz065" key="开户银行账号ID" labelWidth="130" maxLength="20" onChange="callDwBankRPC(12,'510')" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showyhRPCBtn_510" key="?" onClick="showDwBankRPC('510_')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:text id="510_aae044" key="开户银行名称" labelWidth="130" readOnly="true" maxLength="60" />
		<ta:text id="dw_510_aae010" key="银行账号" labelWidth="130" validType="number" maxLength="40" />
		<ta:text id="dw_510_aae009" key="银行户名" labelWidth="130" maxLength="60" />
		<ta:text id="510_yae106" key="协议号" labelWidth="130" maxLength="20" onChange="fnXyh('510_yae106');" />
		<ta:selectInput id="510_yaf011" key="银行同城异地标志" labelWidth="130" collection="YAF011" value="1" />
	</ta:panel>
	<ta:panel id="fld_syzs" key="社保机构银行帐号" cols="2" expanded="false" scalable="false">
		<ta:box cols="2">
			<ta:text id="510_yaf010" key="社保机构银行帐号ID" labelWidth="130" maxLength="20" onChange="callSbjgBankRPC(11)" columnWidth="0.9" />
			<ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-10px">
				<ta:button id="showSbjgyhRPCBtn_510" key="?" onClick="showSbjgBankRPC('510')" />
			</ta:buttonLayout>
		</ta:box>
		<ta:selectInput id="510_aaf002" key="金融行业机构编码" labelWidth="130" readOnly="true" collection="AAF002" allowInputOtherText="true" />
		<ta:text id="sb_510_aae010" key="社保机构银行账号" labelWidth="130" maxLength="60" readOnly="true" />
		<ta:text id="sb_510_aae009" key="社保机构银行户名" labelWidth="130" maxLength="60" readOnly="true" />
	</ta:panel>
</ta:tab>
<script type="text/javascript">
	$(document).ready(function() {
		//企业养老
		initializeSuggestFramework(1, null, '110_yaf010', 600, 200, 5, fnSelect1, 0, false);
		initializeSuggestFramework(2, null, '110_aaz065', 400, 80, 2, fnSelect2, 0, false);
		//机关养老       
		initializeSuggestFramework(3, null, '120_yaf010', 600, 200, 5, fnSelect3, 0, false);
		initializeSuggestFramework(4, null, '120_aaz065', 400, 80, 2, fnSelect4, 0, false);
		//失业保险
		initializeSuggestFramework(5, null, '210_yaf010', 600, 200, 5, fnSelect5, 0, false);
		initializeSuggestFramework(6, null, '210_aaz065', 400, 80, 2, fnSelect6, 0, false);
		//医疗保险
		initializeSuggestFramework(7, null, '310_yaf010', 600, 200, 5, fnSelect7, 0, false);
		initializeSuggestFramework(8, null, '310_aaz065', 400, 80, 2, fnSelect8, 0, false);
		//工伤保险
		initializeSuggestFramework(9, null, '410_yaf010', 600, 200, 5, fnSelect9, 0, false);
		initializeSuggestFramework(10, null, '410_aaz065', 400, 80, 2, fnSelect10, 0, false);
		//生育保险
		initializeSuggestFramework(11, null, '510_yaf010', 600, 200, 5, fnSelect11, 0, false);
		initializeSuggestFramework(12, null, '510_aaz065', 400, 80, 2, fnSelect12, 0, false);

		//大额补助
		initializeSuggestFramework(13, null, '330_yaf010', 600, 200, 5, fnSelect13, 0, false);
		initializeSuggestFramework(14, null, '330_aaz065', 400, 80, 2, fnSelect14, 0, false);
		//公务员补充
		initializeSuggestFramework(15, null, '320_yaf010', 600, 200, 5, fnSelect15, 0, false);
		initializeSuggestFramework(16, null, '320_aaz065', 400, 80, 2, fnSelect16, 0, false);
		//企业补充
		initializeSuggestFramework(17, null, '370_yaf010', 600, 200, 5, fnSelect17, 0, false);
		initializeSuggestFramework(18, null, '370_aaz065', 400, 80, 2, fnSelect18, 0, false);
		//离休
		initializeSuggestFramework(19, null, '340_yaf010', 600, 200, 5, fnSelect19, 0, false);
		initializeSuggestFramework(20, null, '340_aaz065', 400, 80, 2, fnSelect20, 0, false);
		//二乙
		initializeSuggestFramework(21, null, '350_yaf010', 600, 200, 5, fnSelect21, 0, false);
		initializeSuggestFramework(22, null, '350_aaz065', 400, 80, 2, fnSelect22, 0, false);
	});

	function callSbjgBankRPC(instance) {
		if (instance == 1) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("110_yaf010"),
				"dto['aae140']" : "110"
			});
		} else if (instance == 3) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("120_yaf010"),
				"dto['aae140']" : "120"
			});
		} else if (instance == 5) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("210_yaf010"),
				"dto['aae140']" : "210"
			});
		} else if (instance == 7) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("310_yaf010"),
				"dto['aae140']" : "310"
			});
		} else if (instance == 9) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("410_yaf010"),
				"dto['aae140']" : "410"
			});
		} else if (instance == 11) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("510_yaf010"),
				"dto['aae140']" : "510"
			});
		} else if (instance == 13) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("330_yaf010"),
				"dto['aae140']" : "330"
			});
		} else if (instance == 15) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("320_yaf010"),
				"dto['aae140']" : "320"
			});
		} else if (instance == 17) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("370_yaf010"),
				"dto['aae140']" : "370"
			});
		} else if (instance == 19) {
			suggestQuery(instance, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
				"dto['inputString']" : Base.getValue("340_yaf010"),
				"dto['aae140']" : "340"
			});
		}
	}

	//社保账号信息
	function sbzhxx(id) {
		Base.setValue(id + "_aaf002", g_Suggest[1]);
		Base.setValue("sb_" + id + "_aae009", g_Suggest[4]);
		Base.setValue("sb_" + id + "_aae010", g_Suggest[3]);
		Base.setReadOnly(id + "_aaf002");
		Base.setDisabled("sb_" + id + "_aae009");
		Base.setDisabled("sb_" + id + "_aae010");
		Base.focus(id + "_aaz065");
	}

	//单位银行信息
	function dwyhxx(id) {
		Base.setValue(id + "_aae044", g_Suggest[1]);
		Base.setValue(id + "_aaz065", g_Suggest[0]);
		Base.setDisabled(id + "_aae044");
		Base.focus("dw_" + id + "_aae010");
		// 获取是否已填写社保银行信息
		var sb_yaf010 = Base.getValue(id + "_yaf010");
		// 为空则直接通过单位的aaf002获取社保银行信息
		if (sb_yaf010 == "") {
			Base.submit('', 'registerEmployerInfoAction!querySocBankInfo.do', {
				"dto['aae140']" : id,
				"dto['aaf002']" : g_Suggest[2]
			});
		}
	}

	//基本养老 社保机构账号信息
	function fnSelect1() {
		sbzhxx("110");
	}

	//基本养老 单位银行信息
	function fnSelect2() {
		dwyhxx("110");
	}
	//机关养老 社保机构账号信息	
	function fnSelect3() {
		sbzhxx("120");
	}
	//机关养老 单位银行信息
	function fnSelect4() {
		dwyhxx("120");
	}
	//失业保险 社保机构账号信息
	function fnSelect5() {
		sbzhxx("210");
	}
	//失业保险 单位银行信息
	function fnSelect6() {
		dwyhxx("210");
	}
	//医疗保险 社保机构账号信息
	function fnSelect7() {
		sbzhxx("310");
	}
	//医疗保险 单位银行信息
	function fnSelect8() {
		dwyhxx("310");
	}
	//工伤保险 社保机构账号信息
	function fnSelect9() {
		sbzhxx("410");
	}
	//工伤保险 单位银行信息
	function fnSelect10() {
		dwyhxx("410");
	}
	//生育保险 社保机构账号信息
	function fnSelect11() {
		sbzhxx("510");
	}
	//生育保险 单位银行信息
	function fnSelect12() {
		dwyhxx("510");
	}

	//大额补充 社保机构账号信息
	function fnSelect13() {
		sbzhxx("330");
	}
	//大额补充 单位银行信息
	function fnSelect14() {
		dwyhxx("330");
	}
	//公务员补充 社保机构账号信息
	function fnSelect15() {
		sbzhxx("320");
	}
	//公务员补充 单位银行信息
	function fnSelect16() {
		dwyhxx("320");
	}
	//企业补充 社保机构账号信息
	function fnSelect17() {
		sbzhxx("370");
	}
	//企业补充 单位银行信息
	function fnSelect18() {
		dwyhxx("370");
	}
	//离休 社保机构账号信息
	function fnSelect19() {
		sbzhxx("340");
	}
	//离休 单位银行信息
	function fnSelect20() {
		dwyhxx("340");
	}
	//二乙 社保机构账号信息
	function fnSelect21() {
		sbzhxx("340");
	}
	//二乙 单位银行信息
	function fnSelect22() {
		dwyhxx("340");
	}
	//社保机构银行信息
	function showSbjgBankRPC(param) {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow05.do", {
			"dto['aae140']" : param
		}, 1000, 450, null, function() {
			Base.setReadOnly(param + "_aaf002");
			Base.setDisabled("sb_" + param + "_aae009");
			Base.setDisabled("sb_" + param + "_aae010");
			Base.focus(param + "_aaz065");
		}, true);
	}
	//单位银行信息
	function showDwBankRPC(param) {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow04.do", {
			"dto['aae140']" : param
		}, 1000, 450, null, function() {
			var id = param.substring(0, 3);
			Base.setDisabled(id + "_aae044");
			Base.focus("dw_" + id + "_aae010");
			// 获取是否已填写社保银行信息
			var sb_yaf010 = Base.getValue(id + "_yaf010");
			// 为空则直接通过单位的aaf002获取社保银行信息
			if (sb_yaf010 == "") {
				Base.submit('', 'registerEmployerInfoAction!querySocBankInfo.do', {
					"dto['aae140']" : id,
					"dto['aaf002']" : Base.getValue(id + "_aaf002")
				});
			}
		}, true);
	}
	function callDwBankRPC(instance, id) {
		sfwQueryUtil_newRPC(instance, "getBankString", {
			"dto['inputString']" : Base.getValue(id + "_aaz065")
		});
	}
</script>