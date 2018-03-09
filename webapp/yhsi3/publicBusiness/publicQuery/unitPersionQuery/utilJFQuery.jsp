<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>缴费情况统计查询</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="toolbar1">
		<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQueryInfo()" asToolBarItem="true" />
		<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('datagrid2');" asToolBarItem="true" />
		<ta:button key="打印[P]" hotKey="P" id="btnPrint" icon="xui-icon-spotPrint" onClick="fnPrint()" asToolBarItem="true" />
		<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fset1" key="查询条件" cols="3" scalable="false">
			<ta:date id="aae041" key="做账开始期号" labelWidth="120" showSelectPanel="true" issue="true" required="true" onChange="change(this)" />
			<ta:date id="aae042" key="做账结束期号" labelWidth="120" showSelectPanel="true" issue="true" required="true" onChange="change(this)" />
			<ta:selectInput id="aae140" key="险种类型" labelWidth="120" collection="AAE140" required="true" />
			<ta:selectInput id="lxqbz" key="是否显示龙圩区" data="[{'id':'0','name':'显示'},{'id':'1','name':'不显示'},{'id':'2','name':'只显示'}]" value="0" labelWidth="120" />
			<ta:selectInput id="yab003" key="经办机构" display="false" />
		</ta:panel>
		<ta:panel id="p1" key="缴费情况信息" fit="true">
			<ta:datagrid id="datagrid2" haveSn="true" fit="true" columnFilter="true" forceFitColumns="true" onRowDBClick="dbclick">
				<ta:datagridItem id="aab019" key="单位类型" align="center" dataAlign="left" hiddenColumn="true" />
				<ta:datagridItem id="yab019" key="特殊单位管理类型" align="center" dataAlign="left" hiddenColumn="true" />
				<ta:datagridItem id="aab019_1" key="单位类型" align="center" dataAlign="left" maxChart="8" />
				<ta:datagridItem id="aae041" key="做账开始期号" align="center" dataAlign="left" maxChart="5" />
				<ta:datagridItem id="aae042" key="做账结束期号" align="center" dataAlign="left" maxChart="5" />
				<ta:datagridItem id="dws" key="单位数" align="center" dataAlign="center" maxChart="3" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="cbrs" key="参保人数" align="center" dataAlign="center" maxChart="4" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bnjfjs" key="本期缴费基数" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bnjfrs" key="本期缴费人数" align="center" dataAlign="center" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bndwjn" key="本期单位缴纳" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bngrjn" key="本期个人缴纳" align="center" dataAlign="right" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bqxj" key="本期小计" align="center" dataAlign="right" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjjfrs" key="补缴人数" align="center" dataAlign="center" maxChart="4" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjdwjn" key="补缴单位缴纳" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjgrjn" key="补缴个人缴纳" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="bjxj" key="补缴小计" align="center" dataAlign="right" maxChart="8" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yjhj" key="应缴合计" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yjfhj" key="实缴合计" align="center" dataAlign="right" maxChart="6" totals="sum" tatalsTextShow="false" />
			</ta:datagrid>
		</ta:panel>
		<%@ include file="/yhsi3/comm/print.jsp"%>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	function fnQueryInfo() {
		Base.clearGridData("datagrid2");
		Base.submit("form1", "unitJFQueryAction!toQuery.do");
	}

	function change(o) {
		var id = o.id;
		var aae041 = parseInt(Base.getValue("aae041"));
		var aae042 = parseInt(Base.getValue("aae042"));
		var month = aae041 + 100;
		var hg = 1;
		if (aae041 == "" || aae042 == "") {
			return;
		}
		if (aae041 > aae042) {
			hg = 0;
			Base.alert("开始期号，不能大于结束期号！", "warn", function() {
				Base.focus(id);
			});
		} else {
			if (aae042 >= month) {
				hg = 0;
				Base.alert("间隔时间不能超过12个月！", "warn", function() {
					Base.focus(id);
				});
			}
		}

		if (hg == 0) {
			if (id == "aae041") {
				Base.setValue("aae041", "");
			} else {
				Base.setValue("aae042", "");
			}
		}
	}

	function dbclick(e, date) {
		var aab019 = date.aab019;
		var yab019 = date.yab019;
		var yab003 = Base.getValue("yab003");
		var aae140 = Base.getValue("aae140");
		var lxqbz = Base.getValue("lxqbz");
		var aae041 = date.aae041;
		var aae042 = date.aae042;
		Base.openWindow('userwin', "缴费详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitJFQueryAction!dbClick.do", {
			"dto['aab019']" : aab019,
			"dto['yab019']" : yab019,
			"dto['yab003']" : yab003,
			"dto['aae140']" : aae140,
			"dto['aae041']" : aae041,
			"dto['aae042']" : aae042,
			"dto['lxqbz']" : lxqbz
		}, "95%", "90%", null, null, true);
	}

	//输出excel表格信息
	function fnExpFile(gridId) {
		var yab003 = Base.getValue("yab003");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		var aae140 = Base.getValue("aae140");
		var lxqbz = Base.getValue("lxqbz");
		var bz;
		if (lxqbz == '1') {
			bz = "0";
		} else if (lxqbz == '2') {
			bz = "1";
		} else {
			bz = "";
		}
		$("#report1_printIFrame").attr("src", myPath() + "/reportServlet?action=3&file=jfqktj.raq&" + "srcType=file&columns=0&excelFormat=2003&" + "paramString=prm_yab003=" + encodeURI(yab003) + ";prm_aae041=" + encodeURI(aae041) + ";prm_aae042=" + encodeURI(aae042) + ";prm_aae140=" + encodeURI(aae140) + ";prm_bz=" + encodeURI(bz));
	}

	function fnPrint() {
		var yab003 = Base.getValue("yab003");
		var aae041 = Base.getValue("aae041");
		var aae042 = Base.getValue("aae042");
		var aae140 = Base.getValue("aae140");
		var lxqbz = Base.getValue("lxqbz");
		var bz;
		if (lxqbz == '1') {
			bz = "0";
		} else if (lxqbz == '2') {
			bz = "1";
		} else {
			bz = "";
		}
		var fileName = 'jfqktj.raq';
		var prm = "prm_yab003=" + yab003 + ";prm_aae041=" + encodeURI(aae041) + ";prm_aae042=" + encodeURI(aae042) + ";prm_aae140=" + aae140 + ";prm_bz=" + bz;
		fnPrintComm(fileName, prm);
	}

	$(function() {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>