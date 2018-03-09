<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 关系转移接续申请表 -->
<ta:selectInput id="aae173" key="转移类型" required="true" labelWidth="200" collection="AAE173" readOnly="false" />
<ta:selectInput id="aac070" key="转移方向" required="true" labelWidth="200" collection="AAC070" readOnly="true" />
<ta:selectInput id="aae140" key="险种类型" labelWidth="200" collection="AAE140" readOnly="true" />
<ta:box cols="2">
	<ta:text id="yac256" key="原参保所在地区名称" maxLength="100" labelWidth="200" columnWidth="0.9" required="true" onChange="fnChangeYac256()" bpopTipMsg="输入原参保所在地区名称，行政区划代码" />
	<ta:buttonLayout align="left" columnWidth="0.1">
		<ta:button id="showYac256RPCBtn" key="?" onClick="showYac256RPC()" />
	</ta:buttonLayout>
</ta:box>
<ta:text id="yac519" key="原个人编号" required="true" labelWidth="200" maxLength="20" readOnly="false" />
<ta:text id="yac250" key="原参保地社保机构行政区划代码" required="true" labelWidth="200" readOnly="false" />
<ta:text id="yac251" key="原参保地社保机构名称" required="true" labelWidth="200" span="2" maxLength="50" readOnly="false" />
<ta:text id="yac252" key="原参保地社保机构联系电话" required="true" labelWidth="200" maxLength="25" readOnly="false" />
<ta:text id="yac253" key="原参保地社保机构地址" required="true" labelWidth="200" span="2" maxLength="100" readOnly="false" />
<ta:text id="yac254" key="原参保地社保机构邮政编码" required="true" labelWidth="200" validType="zipcode" maxLength="6" readOnly="false" />
<ta:text id="yae440" key="代办人姓名" labelWidth="200" maxLength="60" readOnly="false" />
<ta:text id="yae442" key="代办人电话" labelWidth="200" maxLength="50" readOnly="false" />
<ta:text id="yae441" key="代办人与转移人员关系" labelWidth="200" maxLength="20" readOnly="false" />
<ta:text id="yae443" key="代办人联系地址" labelWidth="200" span="2" maxLength="100" readOnly="false" />
<ta:text id="yae444" key="代办人邮编" labelWidth="200" validType="zipcode" maxLength="6" readOnly="false" />