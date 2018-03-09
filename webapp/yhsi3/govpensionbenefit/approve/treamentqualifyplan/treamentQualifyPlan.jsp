<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentTerminate</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="认证计划[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="transProcess();" asToolBarItem="true" />
		<ta:button id="query" key="查询认证计划[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query();" asToolBarItem="true" />
		<ta:button id="resetbt" key="重置" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel cssStyle="margin:5px;" cols="3" key="检索条件">
			<ta:number id="aae001" key="认证年度" required="true" max="9999" min="2000" bpopTipMsg="此处输入年度，如:2013" />
			<ta:selectInput id="yae019" key="认证次数" data="[{'id':'1','name':'1'},{'id':'2','name':'2'},{'id':'3','name':'3'},{'id':'4','name':'4'}]" required="true" value="1" display="false" />
			<ta:text id="aab999" key="单位编号" labelWidth="120" bpopTipMsg="单位名称、单位代码、单位ID" onChange="sfwQuery(2)" display="false" />
			<ta:text id="aae044" key="单位名称" cssStyle="margin-top:8px" labelWidth="120" span="2" readOnly="true" display="false" />
			<ta:text id="aab001" key="单位ID" cssStyle="margin-top:8px" readOnly="true" display="false" />
			<ta:text id="yab003" key="经办机构" cssStyle="margin-top:8px" readOnly="true" display="false" />
			<ta:text id="aae140" key="险种" cssStyle="margin-top:8px" labelWidth="120" display="false" />
		</ta:panel>
		<ta:tabs height="420">
			<ta:tab key="认证计划" id="ac90List">
				<ta:panel id="ac90List" height="100px"  bodyStyle="margin:0px">
					<ta:datagrid id="ac90List" columnFilter="true" fit="true" haveSn="true">
						<ta:datagridItem id="aac002" key="身份证号" width="180">
						</ta:datagridItem>
						<ta:datagridItem id="aac003" key="姓名" width="130">
						</ta:datagridItem>
						<ta:datagridItem id="aae044" key="村名称" width="180">
						</ta:datagridItem>
						<ta:datagridItem id="mc" key="乡镇名称" width="180">
						</ta:datagridItem>
						<ta:datagridItem id="aae128" key="当前待遇" width="110" dataAlign="right">
						</ta:datagridItem>
						<ta:datagridItem id="aae116" key="待遇发放状态" width="120" collection="AAE116">
						</ta:datagridItem>
						<ta:datagridItem id="aae005" key="联系电话" width="180">
						</ta:datagridItem>
						<ta:datagridItem id="aae006" key="地址" width="180">
						</ta:datagridItem>
						<ta:dataGridToolPaging url="treamentQualifyPlanAction!query.do" resultType="java.util.HashMap" submitIds="yab003,aae001,yae019,aaa080,aab001" sqlStatementName="treamentqualifyplan.queryTreamentQualifyPlanAll" showExcel="true" showCount="true" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(2, "ab01", "aab999", 700, 200, 3, null, 1, false);
	});
	
	function sfwQuery(instance) {
		 if (instance == 1) 
	     {
		     suggestQuery(instance,"<%=path%>/process/comm/accpetBusinessAction!getAac001.do",{"dto['jstj']":Base.getValue("aac002")});
	     }
		 if (instance == 2) 
	     {
		     suggestQuery(instance,"<%=path%>/process/comm/suggestFrameworkAction!getAab001.do", {"dto['aab001']" : Base.getValue("aab999")});
	     }
	}

	function sfwSelectThis(instance, index) {
		try {
			if (sfw[instance].rowcount == 1) {
				if (sfw[instance].columns > 1 && sfw[instance].capture > 1) {
					sfw[instance].hiddenInput.value = sfw[instance].suggestions[sfw[instance].suggestionsIndex][sfw[instance].capture - 1];
				}
				if (!isNaN(index)) {
					sfw[instance].suggestionsIndex = index;
				}
				var selection = sfw[instance].suggestions[sfw[instance].suggestionsIndex];
				if (sfw[instance].columns > 1) {
					g_Suggest = selection;
					if (sfw[instance].what == "ac01") {
						getAc01Write(selection);
						selection = g_Suggest[0];
					}
					if (sfw[instance].what == "ab01") {
						Base.setValue("aab001", selection[1]);
						Base.setValue("aab999", selection[0]);
						Base.setValue("aae044", selection[2]);
						selection = g_Suggest[0];
					}
				}
				sfw[instance].inputContainer.value = selection;
				sfw[instance].previous = selection;
				sfwHideOutput(instance);
				try {
					if ("function" == typeof sfw[instance].callBackFun) {
						sfw[instance].callBackFun();
					} else {
						eval(sfw[instance].callBackFun);
					}
				} catch (e) {
					alert("\u6267\u884c\u56de\u8c03\u51fd\u6570: [" + callBackFun + "]\u65f6\u53d1\u751f\u5f02\u5e38:" + e.message);
				}
			}
		} catch (e) {
			fnCatch(e);
		}
	}
	
	//流程流转
	function transProcess() {
		Base.submit("form1,ac90List", "treamentQualifyPlanAction!transProcess.do");
	}
	
	function query() {
		Base.submit("form1", "treamentQualifyPlanAction!query.do");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
