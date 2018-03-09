<!-- 事件流程记录 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<ta:panel key="事件流程总览" cols="3" scalable="false" expanded="false">
	<ta:selectInput id="aae016" key="复核标志" readOnly="true" collection="aae016" labelWidth="120" />
	<ta:text id="aae419" key="当前级次" readOnly="true" labelWidth="120" />
	<ta:text id="aae416" key="复核总级次" readOnly="true" labelWidth="120" />
</ta:panel>
<ta:panel key="事件流程明细" scalable="false" expanded="false" fit="true" heightDiff="-1">
	<ta:datagrid id="ae02Grid" enableColumnMove="false" snWidth="30" haveSn="true" forceFitColumns="true" fit="true">
		<ta:datagridItem id="yaz002" key="记录流水号" maxChart="5" align="center" dataAlign="center" />
		<ta:datagridItem id="aaz002" key="日志ID" maxChart="7" align="center" dataAlign="center" />
		<ta:datagridItem id="aaa121" key="业务类型" maxChart="11" collection="AAA121" align="center" dataAlign="center" />
		<ta:datagridItem id="yaa017" key="办理状态" maxChart="4" collection="YAA017" align="center" dataAlign="center" />
		<ta:datagridItem id="aaz010" key="当事人ID" maxChart="6" align="center" dataAlign="center" />
		<ta:datagridItem id="aae044" key="当事人名称" maxChart="9" align="center" dataAlign="center" showDetailed="true" />
		<ta:datagridItem id="aae011" key="经办人" maxChart="4" align="center" collection="AAE011" dataAlign="center" />
		<ta:datagridItem id="aae036" key="经办时间" maxChart="9" align="center" dataAlign="center" />
		<ta:datagridItem id="aae013" key="备注" maxChart="6" align="center" showDetailed="true" dataAlign="center" />
	</ta:datagrid>
</ta:panel>


