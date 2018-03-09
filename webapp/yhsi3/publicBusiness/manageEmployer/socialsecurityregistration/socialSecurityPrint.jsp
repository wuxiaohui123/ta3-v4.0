<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社会保险证打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body>
		<ta:pageloading />
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:toolbar id="ButtonLayout1">
				<ta:button id="btnQuery" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery()" asToolBarItem="true"/>
				<ta:button id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData()" asToolBarItem="true"/>
				<ta:button id="btnPrint" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint()" asToolBarItem="true"/>
				<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true"/>
			</ta:toolbar>
			<ta:panel id="flst1" key="单位基本信息" cols="3" >
				<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
			</ta:panel>
			<ta:panel id="flst3" key="登记证信息" cols="3" >
				<ta:text id="aab023" key="主管部门或主管机构" readOnly="true" labelWidth="120" />
				<ta:text id="aae045" key="法人代表人" readOnly="true" labelWidth="120" />
				<ta:text id="aae053" key="组织机构代码" readOnly="true" labelWidth="120" />
				<ta:text id="aae006" key="地址" span="3" readOnly="true" labelWidth="120" />
			</ta:panel>
			<ta:panel id="flst2" key="发放方式" cols="3" >
				<ta:selectInput id="aab059" key="发放方式" labelWidth="130" collection="AAB059" span="1" required="true" selectFirstValue="true" />
				<ta:text id="aab002" key="社会保险登记证编号" maxLength="50" labelWidth="120" />
				<ta:text id="yab139" key="经办机构" display="false" />
			</ta:panel>
			<ta:tabs id="tabs" fit="true">
				<ta:tab id="tab_cb" key="单位参保信息">
					<ta:datagrid id="dg_cb" haveSn="true" forceFitColumns="true" fit="true">
						<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="10" showDetailed="true"/>
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" maxChart="11"/>
						<ta:datagridItem id="aab050" key="参保日期" align="center" dataAlign="center" maxChart="6" dataType="date"/>
						<ta:datagridItem id="aab051" key="参保状态" collection="AAB051" align="center" dataAlign="left" maxChart="4"/>
						<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" maxChart="6"/>
						<ta:datagridItem id="aaz136" key="基数核定规则ID" align="center" dataAlign="left" maxChart="10" collection="AAZ136" showDetailed="true"/>
						<ta:datagridItem id="yaz289" key="缴费核定规则ID" align="center" dataAlign="left" maxChart="14" collection="YAZ289" showDetailed="true"/>
						<ta:datagridItem id="yab139" key="参保所属机构" collection="YAB003" align="center" dataAlign="left" maxChart="10" showDetailed="true"/>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_djz" key="登记证信息">
					<ta:datagrid id="dg_djz" haveSn="true" forceFitColumns="true" fit="true">
						<ta:datagridItem id="aaz057" key="发放事件ID" sortable="true" align="center" dataAlign="left" maxChart="5"/>
						<ta:datagridItem id="aab002" key="登记证编码" align="center" dataAlign="left" maxChart="5"/>
						<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="5"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="9" showDetailed="true"/>
						<ta:datagridItem id="aab059" key="发放类型" collection="AAB059" align="center" dataAlign="left" maxChart="4"/>
						<ta:datagridItem id="aab036" key="发证日期" align="center" dataAlign="center" maxChart="9" sortable="true"/>
						<ta:datagridItem id="aab038" key="登记证有效期限" align="center" dataAlign="left" maxChart="9"/>
						<ta:datagridItem id="aab057" key="登记证状态" collection="AAB057" align="center" dataAlign="left" maxChart="5"/>
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" maxChart="4" collection="AAE011" showDetailed="true"/>
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="9"/>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_nj" key="登记证年检信息">
					<ta:datagrid id="dg_nj" groupingBy="aaz057" fit="true" forceFitColumns="true">
						<ta:datagridItem id="aaz057" key="发放事件ID" align="center" dataAlign="left" maxChart="6"/>
						<ta:datagridItem id="aaz058" key="年检信息ID" align="center" dataAlign="left" maxChart="6"/>
						<ta:datagridItem id="aab001" key="单位ID" align="center" dataAlign="left" maxChart="6"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="12"/>
						<ta:datagridItem id="aae001" key="年度" align="center" dataAlign="center" maxChart="4" sortable="true"/>
						<ta:datagridItem id="aab341" key="年检情况" align="center" dataAlign="left" maxChart="6" collection="AAB341"/>
						<ta:datagridItem id="aae011" key="经办人" align="center" dataAlign="left" maxChart="4" collection="AAE011"/>
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center" maxChart="10"/>
						<ta:datagridItem id="aae013" key="备注" align="center" dataAlign="left" maxChart="10" showDetailed="true"/>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_sbdjz" key="登记证打印信息">
					<ta:datagrid id="dg_sbdjzInfo" haveSn="true" forceFitColumns="true" fit="true">
						<%@ include file="/yhsi3/commonJSP/ad15Info.jsp"%>
					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
		</ta:form>
		<%@ include file="/yhsi3/comm/print.jsp"%>
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fn_getAb01, 1, false);
        Base.setDisabled("btnSave,btnPrint");
        Base.focus("aab001");
    });

    //回调函数 
    function fn_getAb01() {
        if (g_Suggest != "") {
            Base.setValue("aab001", g_Suggest[1]);
            Base.clearGridData("dg_cb");
            Base.clearGridData("dg_djz");
            Base.clearGridData("dg_nj");
            Base.activeTab("tab_cb");
            Base.setDisabled("btnSave");
            Base.submit("aab001", "socialSecurityPrintAction!toQuery.do");
        }
    }

    //查询单位基本信息和参保信息
    function fnQuery() {
        Base.clearGridData("dg_cb");
        Base.clearGridData("dg_djz");
        Base.clearGridData("dg_nj");
        Base.setDisabled("btnSave");
        Base.focus("aab002");
        var aab001 = Base.getValue("aab001");
        if (aab001 == '' || aab001 == null) {
            alert("单位编号不能为空，请确认！");
            return;
        }
        Base.submit("aab001", "socialSecurityPrintAction!toQuery.do");
    }
    
    //保存
    function submitData() {
        var aab059 = Base.getValue("aab059");
        if (aab059 == '' || aab059 == null) {
            Base.alert("发放方式不能为空");
            return;
        }
        Base.submit("form1", "socialSecurityPrintAction!toSave.do");
    }
    
    //打印
    function fnPrint() {
        var aab001 = Base.getValue("aab001");
        if (aab001 == '' || aab001 == null) {
            Base.alert("没有获取到单位编号，请联系管理员！");
            return;
        }
        var aab002 = Base.getValue("aab002");
        if (aab002 == '' || aab002 == null) {
            Base.alert("没有获取到单位社会保险证编码，请联系管理员！");
            return;
        }
        var yab139 = Base.getValue("yab139");
        if (yab139 == '' || yab139 == null) {
            Base.alert("没有获取到经办机构，请联系管理员！");
            return;
        }
        Base.clearGridData("dg_sbdjzInfo");
        var fileName = "wzSocialSecurityPrint.raq";
        var prm = "yab139=" + yab139 + ";aab001=" + aab001;
        Base.submit(null, "socialSecurityPrintAction!toSavePrint.do", {
            "dto['aaz010']": aab001,
            "dto['yad174']": aab002
        },
        null, null,
        function fnSuccess() {
            fnPrintComm(fileName, prm);
            Base.setDisabled("btnPrint");
        },
        function fnFail() {
            Base.alert("打印有误，请联系管理员");
        });
    }
    //打开新的窗口
	function showDwRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,function(){
			//Base.clearData("aab001");
			//Base.setValue("aab001", parent.getValue("aab001"));
            Base.clearGridData("dg_cb");
            Base.clearGridData("dg_djz");
            Base.clearGridData("dg_nj");
            Base.activeTab("tab_cb");
            Base.setDisabled("btnSave");
            Base.submit("aab001", "socialSecurityPrintAction!toQuery.do");
		},true);
	}
    //RPC方法调用
	function callRPC(){
		sfwQueryUtil_newRPC(2,"getAb01String",{"dto['inputString']":Base.getValue("aab001")});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>