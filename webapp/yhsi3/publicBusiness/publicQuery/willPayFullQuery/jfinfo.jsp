<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center">
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose"
				hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
				asToolBarItem="true" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:tabs fit="true">
		<ta:tab id="tab1" key="实缴明细">
			<ta:datagrid id="jflist" fit="true" groupingBy="aae078" haveSn="true">
				<ta:datagridItem id="aab001" key="单位编号" align="center"
					dataAlign="center" sortable="true" maxChart="4" />
				<ta:datagridItem id="aae044" key="单位名称" align="center"
					dataAlign="center" sortable="true" maxChart="10" />
				<ta:datagridItem id="aac001" key="个人编号" align="center"
					dataAlign="center" sortable="true" maxChart="5" />
				<ta:datagridItem id="aac003" key="姓名" align="center"
					dataAlign="center" sortable="true" maxChart="3" />
				<ta:datagridItem id="aae140" key="险种类型" align="center"
					collection="AAE140" sortable="true" maxChart="6" />
				<ta:datagridItem id="aae041" key="开始年月" maxChart="4" align="center" />
				<ta:datagridItem id="aae042" key="结束年月" maxChart="4" align="center" />
				<ta:datagridItem id="aac040" key="工资" align="center"
					dataAlign="center" sortable="true" maxChart="3" />
				<ta:datagridItem id="aae180" key="缴费基数" align="center"
					dataAlign="center" sortable="true" maxChart="4" />
				<ta:datagridItem id="aae003" key="费款所属期" align="center"
					dataAlign="center" sortable="true" maxChart="5" />
				<ta:datagridItem id="aae002" key="做账期号" align="center"
					dataAlign="center" sortable="true" maxChart="4" />
				<ta:datagridItem id="aae078" key="到帐标志" collection="AAE078"
					align="center" sortable="true" maxChart="4" />
				<ta:datagridItem id="aae079" key="到账时间" align="center"
					sortable="true" maxChart="4" dataType="date" />
				<ta:datagridItem id="aaa115" key="退收类型" collection="aaa115"
					maxChart="6" align="center" sortable="true" />
				<ta:datagridItem id="aae201" key="缴费月数" maxChart="4" align="center"
					tatalsTextShow="false" totals="sum" />
			</ta:datagrid>
		</ta:tab>
		<ta:tab id="tab2" key="视同缴费">
			<ta:datagrid id="stlist" forceFitColumns="true" fit="true"
				haveSn="true">
				<ta:datagridItem id="aaz185" key="人员工作经历ID" align="center"
					dataAlign="center" hiddenColumn="false" />
				<ta:datagridItem id="aab004" key="单位名称" align="center"
					dataAlign="center" width="200" />
				<ta:datagridItem id="yac567" key="工作类型" align="center"
					dataAlign="center" collection="YAC567" />
				<ta:datagridItem id="aae041" key="开始年月" align="center"
					dataAlign="center" />
				<ta:datagridItem id="aae042" key="终止年月" align="center"
					dataAlign="center" />
				<ta:datagridItem id="yae599" key="月数" align="center"
					dataAlign="center" />
				<ta:datagridItem id="aae140" key="险种" align="center"
					dataAlign="center" collection="AAE140"/>
				<ta:datagridItem id="aae013" key="原因" align="center"
					dataAlign="center" />
			</ta:datagrid>
		</ta:tab>
	</ta:tabs>
</body>
</html>
<%@ include file="/ta/incfooter.jsp"%>

